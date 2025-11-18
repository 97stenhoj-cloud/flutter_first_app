import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/game/presentation/pages/main_menu_page.dart';
import 'l10n/app_localizations.dart';
import 'core/config/env.dart';
import 'core/providers/theme_provider.dart';
import 'core/providers/locale_provider.dart';
import 'core/providers/unlock_provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  
  // Initialize Supabase with auth persistence and Realtime configuration
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
    authOptions: FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,  // Secure PKCE flow for mobile
      autoRefreshToken: true,            // Auto-refresh expired tokens
    ),
    realtimeClientOptions: const RealtimeClientOptions(
      eventsPerSecond: 10,
      logLevel: RealtimeLogLevel.info,
    ),
  );

  runApp(
    const ProviderScope(
      child: TalkingGameApp(),
    ),
  );
}

class TalkingGameApp extends ConsumerWidget {
  const TalkingGameApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    final localeState = ref.watch(localeProvider);

    return MaterialApp(
      title: 'Connect',
      debugShowCheckedModeBanner: false,

      // Only use manual locale if user has selected one
      locale: localeState.hasManuallySelectedLanguage
          ? localeState.currentLocale
          : null, // Let system decide

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('en'), // English
        Locale('da'), // Danish
        Locale('de'), // German
        Locale('es'), // Spanish
        Locale('fr'), // French
        Locale('it'), // Italian
        Locale('nb'), // Norwegian Bokmål
        Locale('nl'), // Dutch
        Locale('pl'), // Polish
        Locale('pt'), // Portuguese
        Locale('ro'), // Romanian
        Locale('sv'), // Swedish
      ],

      // Fallback to English if device language not supported
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        // If user has manually selected a language, use that
        if (localeState.hasManuallySelectedLanguage) {
          return localeState.currentLocale;
        }

        // Otherwise, use device locale
        if (deviceLocale == null) {
          return const Locale('en');
        }

        // Check if device language is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == deviceLocale.languageCode) {
            return supportedLocale;
          }
        }

        // Default to English if not supported
        return const Locale('en');
      },

      theme: ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: const MainMenuPage(),
    );
  }
}
