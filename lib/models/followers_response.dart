class FollowersResponse {
  Data? data;
  String? paginationToken;

  FollowersResponse({this.data, this.paginationToken});

  FollowersResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    paginationToken = json['pagination_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['pagination_token'] = this.paginationToken;
    return data;
  }
}

class Data {
  int? count;
  List<Items>? items;
  int? total;

  Data({this.count, this.items, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Items {
  String? fullName;
  String? id;
  bool? isPrivate;
  bool? isVerified;
  String? profilePicUrl;
  String? username;

  Items(
      {this.fullName,
      this.id,
      this.isPrivate,
      this.isVerified,
      this.profilePicUrl,
      this.username});

  Items.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    id = json['id'];
    isPrivate = json['is_private'];
    isVerified = json['is_verified'];
    profilePicUrl = json['profile_pic_url'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['id'] = this.id;
    data['is_private'] = this.isPrivate;
    data['is_verified'] = this.isVerified;
    data['profile_pic_url'] = this.profilePicUrl;
    data['username'] = this.username;
    return data;
  }
}
