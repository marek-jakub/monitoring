import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'supabase_URL', obfuscate: true)
  static final String supabaseURL = _Env.supabaseURL;

  @EnviedField(varName: 'supabase_API_key', obfuscate: true)
  static final String supabaseAPI = _Env.supabaseAPI;
}
