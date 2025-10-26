import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/game/presentation/pages/main_menu_page.dart';
import 'l10n/app_localizations.dart';
import 'core/utils/language_manager.dart';
import 'core/utils/theme_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  
  // Initialize Supabase with Realtime configuration
  await Supabase.initialize(
    url: 'https://tpjsebutbieghpmvpktv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwanNlYnV0YmllZ2hwbXZwa3R2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk2NDU4MDksImV4cCI6MjA3NTIyMTgwOX0.mj023O_wAvgjBjgGGXJ5uDR4iITV4NMjOIWDbOMjOIk',
    realtimeClientOptions: const RealtimeClientOptions(
      eventsPerSecond: 10,
      logLevel: RealtimeLogLevel.info, // Enable logging to debug
    ),
  );
  
  debugPrint('✅ Supabase initialized with Realtime enabled');
  
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
        locale: languageManager.currentLocale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('da'),
          Locale('de'),
          Locale('es'),
          Locale('fr'),
          Locale('pt'),
          Locale('ro'),
        ],
        theme: ThemeData(
          useMaterial3: true,
          brightness: themeNotifier.isDarkMode ? Brightness.dark : Brightness.light,
        ),
        home: MainMenuPage(),
      ),
    );
  }
}