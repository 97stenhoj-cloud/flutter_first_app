import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/game/presentation/pages/main_menu_page.dart';
import 'l10n/app_localizations.dart';
import 'core/utils/language_manager.dart';
import 'core/utils/theme_notifier.dart';
import 'core/config/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  
  // Initialize Supabase with Realtime configuration
  await Supabase.initialize(
    url: Env.supabaseUrl,              // CHANGED
    anonKey: Env.supabaseAnonKey,      // CHANGED
    realtimeClientOptions: const RealtimeClientOptions(
      eventsPerSecond: 10,
      logLevel: RealtimeLogLevel.info,
    ),
  );
  
  debugPrint('✅ Supabase initialized with Realtime enabled');
  
  // Initialize LanguageManager to load saved language
  await LanguageManager().initialize();
  
  runApp(const TalkingGameApp());
}

class TalkingGameApp extends StatefulWidget {
  const TalkingGameApp({super.key});

  @override
  State<TalkingGameApp> createState() => _TalkingGameAppState();
}

class _TalkingGameAppState extends State<TalkingGameApp> {
  final themeNotifier = ThemeNotifier();
  final languageManager = LanguageManager();

  @override
  void initState() {
    super.initState();
    languageManager.addListener(_onLanguageChanged);
    themeNotifier.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    languageManager.removeListener(_onLanguageChanged);
    themeNotifier.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onLanguageChanged() {
    setState(() {});
  }

  void _onThemeChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themeNotifier: themeNotifier,
      child: MaterialApp(
        title: 'Connect',
        debugShowCheckedModeBanner: false,
        
        // Only use manual locale if user has selected one
        locale: languageManager.hasManuallySelectedLanguage 
            ? languageManager.currentLocale 
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
          Locale('pt'), // Portuguese
          Locale('ro'), // Romanian
        ],
        
        // Fallback to English if device language not supported
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          // If user has manually selected a language, use that
          if (languageManager.hasManuallySelectedLanguage) {
            return languageManager.currentLocale;
          }
          
          // Otherwise, use device locale
          if (deviceLocale == null) {
            return const Locale('en');
          }
          
          debugPrint('🌍 Device locale: ${deviceLocale.languageCode}');
          
          // Check if device language is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == deviceLocale.languageCode) {
              debugPrint('✅ Using device language: ${deviceLocale.languageCode}');
              return supportedLocale;
            }
          }
          
          // Default to English if not supported
          debugPrint('⚠️ Device language not supported, using English');
          return const Locale('en');
        },
        
        theme: ThemeData(
          useMaterial3: true,
          brightness: themeNotifier.isDarkMode ? Brightness.dark : Brightness.light,
        ),
        home: MainMenuPage(),
      ),
    );
  }
}