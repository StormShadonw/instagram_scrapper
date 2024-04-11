import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instagram_scrapper/models/comments_response.dart';
import 'package:instagram_scrapper/models/followers_response.dart';
import 'package:instagram_scrapper/models/likes_response.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Scrapper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 97, 12, 112)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Instagram Scrapper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _instgramUser = TextEditingController();
  TextEditingController _instagramPost = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool liked = false;
  bool followed = false;
  bool comented = false;
  bool _isLoading = false;

  @override
  void initState() {
    _instgramUser = TextEditingController.fromValue(
        const TextEditingValue(text: "jorgelopezh31"));
    _instagramPost = TextEditingController.fromValue(
        const TextEditingValue(text: "C5giplCMP01"));
    super.initState();
  }

  Future<void> validateLikes(Dio dio) async {
    final response = await dio.get(
        'https://instagram-scraper-api2.p.rapidapi.com/v1/likes',
        queryParameters: {
          "code_or_id_or_url": _instagramPost.value.text,
        });
    var likeResponse =
        LikesResponse.fromJson(response.data as Map<String, dynamic>);
    if (likeResponse.data != null) {
      if (likeResponse.data!.items!
          .any((element) => element.username! == _instgramUser.value.text)) {
        setState(() {
          liked = true;
        });
      }
    }
  }

  Future<CommentsResponse> validateComments(Dio dio) async {
    final response = await dio.get(
        'https://instagram-scraper-api2.p.rapidapi.com/v1/comments',
        queryParameters: {
          "code_or_id_or_url": _instagramPost.value.text,
        });
    var likeResponse =
        CommentsResponse.fromJson(response.data as Map<String, dynamic>);
    if (likeResponse.data != null) {
      if (likeResponse.data!.items!.any(
          (element) => element.user!.username! == _instgramUser.value.text)) {
        setState(() {
          comented = true;
        });
      }
    }
    return likeResponse;
  }

  Future<void> validateFollowed(
      Dio dio, CommentsResponse _commentsResponse) async {
    final response = await dio.get(
        'https://instagram-scraper-api2.p.rapidapi.com/v1/followers',
        queryParameters: {
          "username_or_id_or_url":
              _commentsResponse.data!.additionalData!.caption!.user!.username!,
          "amount": 1000,
        });
    var likeResponse =
        FollowersResponse.fromJson(response.data as Map<String, dynamic>);
    if (likeResponse.data != null) {
      if (likeResponse.data!.items!
          .any((element) => element.username! == _instgramUser.value.text)) {
        setState(() {
          followed = true;
        });
      }
    }
  }

  Future<void> validate() async {
    try {
      setState(() {
        liked = false;
        comented = false;
        followed = false;
      });
      if (_form.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        final dio = Dio();
        dio.options.headers['X-RapidAPI-Key'] =
            'f4c2ad54c1mshd1d71560a007e79p14955ajsnec9360071e01';
        dio.options.headers['X-RapidAPI-Host'] =
            'instagram-scraper-api2.p.rapidapi.com';

        await validateLikes(dio);
        var commentsResponse = await validateComments(dio);
        await validateFollowed(dio, commentsResponse);

        setState(() {
          _isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _isLoading
            ? const CircularProgressIndicator.adaptive()
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _form,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          controller: _instgramUser,
                          onChanged: (value) {
                            setState(() {
                              liked = false;
                              comented = false;
                              followed = false;
                            });
                          },
                          decoration: const InputDecoration(
                            label: Text("Usuario de instagram"),
                          ),
                        ),
                        TextFormField(
                          controller: _instagramPost,
                          onChanged: (value) {
                            setState(() {
                              liked = false;
                              comented = false;
                              followed = false;
                            });
                          },
                          decoration: const InputDecoration(
                            label: Text("Post de instagram"),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 25,
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () => validate(),
                            icon: const Icon(Icons.check),
                            label: const Text("Validar"),
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                              horizontal: 55,
                              vertical: 10,
                            )),
                          ),
                        ),
                        CheckboxListTile.adaptive(
                          value: liked,
                          title: const Text("Me gusta"),
                          onChanged: (value) {
                            setState(() {
                              liked = value ?? false;
                            });
                          },
                          enabled: false,
                        ),
                        CheckboxListTile.adaptive(
                          value: comented,
                          title: const Text("Comentario"),
                          onChanged: (value) {
                            setState(() {
                              comented = value ?? false;
                            });
                          },
                          enabled: false,
                        ),
                        CheckboxListTile.adaptive(
                          value: followed,
                          title: const Text("Siguiendo"),
                          onChanged: (value) {
                            setState(() {
                              followed = value ?? false;
                            });
                          },
                          enabled: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
