import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'MAPS_Key', obfuscate: true)
  static final String mapsAPIKey = _Env.mapsAPIKey;
}