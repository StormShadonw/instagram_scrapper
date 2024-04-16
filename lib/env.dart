// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'RapidAPIKey', obfuscate: true)
  static String RapidAPIKey = _Env.RapidAPIKey;
  @EnviedField(varName: 'RapidApiHost', obfuscate: true)
  static String RapidApiHost = _Env.RapidApiHost;
}
