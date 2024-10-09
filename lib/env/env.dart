import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'MAPS_Key')
  static const String mapsAPIKey = _Env.mapsAPIKey;
}