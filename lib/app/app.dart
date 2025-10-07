import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../features/game/presentation/pages/video_intro_page.dart';
import '../core/utils/theme_notifier.dart';

class TalkingGameApp extends StatefulWidget {
  const TalkingGameApp({super.key});

  @override
  State<TalkingGameApp> createState() => _TalkingGameAppState();
}

class _TalkingGameAppState extends State<TalkingGameApp> {
  final themeNotifier = ThemeNotifier();

  @override
  void initState() {
    super.initState();
    themeNotifier.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    themeNotifier.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themeNotifier: themeNotifier,
      child: MaterialApp(
        title: 'Talking Game',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
            brightness: themeNotifier.isDarkMode ? Brightness.dark : Brightness.light,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(
            themeNotifier.isDarkMode ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
          ),
        ),
        home: const VideoIntroPage(),
      ),
    );
  }
}