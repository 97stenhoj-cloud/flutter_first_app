// lib/core/config/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static final String supabaseUrl = _Env.supabaseUrl;

  @EnviedField(varName: 'SUPABASE_ANON_KEY', obfuscate: true)
  static final String supabaseAnonKey = _Env.supabaseAnonKey;

  @EnviedField(varName: 'GOOGLE_WEB_CLIENT_ID', obfuscate: true)
  static final String googleWebClientId = _Env.googleWebClientId;

  @EnviedField(varName: 'REVENUECAT_IOS_KEY', obfuscate: true)
  static final String revenueCatIosKey = _Env.revenueCatIosKey;

  @EnviedField(varName: 'REVENUECAT_ANDROID_KEY', obfuscate: true)
  static final String revenueCatAndroidKey = _Env.revenueCatAndroidKey;
}