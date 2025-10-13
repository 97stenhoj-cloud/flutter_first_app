// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Start';

  @override
  String get settings => 'Einstellungen';

  @override
  String get howToPlay => 'Spielanleitung';

  @override
  String get chooseGameMode => 'Wähle deinen Spielmodus';

  @override
  String get family => 'Familie';

  @override
  String get couple => 'Paar';

  @override
  String get friends => 'Freunde';

  @override
  String get chooseCategory => 'Wähle eine Kategorie';

  @override
  String get locked => 'Gesperrte Kategorie';

  @override
  String get lockedMessage =>
      'Diese Kategorie ist gesperrt. Upgraden Sie auf Premium, um alle Kategorien freizuschalten!';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Vielleicht später';

  @override
  String get chooseSubscription => 'Wähle dein Abonnement';

  @override
  String get subscriptionDescription =>
      'Schalte Premium-Kategorien frei und erhalte Zugang zu exklusiven Fragensammlungen';

  @override
  String get chooseBundleOne => 'Wähle 1 Kategorienpaket';

  @override
  String get chooseBundleTwo => 'Wähle 2 Kategorienpakete';

  @override
  String get chooseBundleThree => 'Alle 3 Kategorienpakete';

  @override
  String get perMonth => '/Monat';

  @override
  String get bestValue => 'BESTES ANGEBOT';

  @override
  String get unlockAllBundles => 'Alle Pakete freischalten';

  @override
  String get selectYourBundle => 'Wähle dein Paket';

  @override
  String selectBundles(Object count, Object plural) {
    return 'Wähle $count Paket$plural';
  }

  @override
  String get premiumCategories => '4 Premium-Kategorien';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get subscribe => 'Abonnieren';

  @override
  String subscriptionActivated(Object bundles) {
    return 'Abonnement aktiviert! $bundles freigeschaltet.';
  }

  @override
  String get demoNote =>
      'Demo: Freischaltungen werden beim Neustart der App zurückgesetzt';

  @override
  String get swipeOrTap => 'Wische oder tippe auf die Pfeile';

  @override
  String get previous => 'Zurück';

  @override
  String get next => 'Weiter';

  @override
  String get advertisement => 'Werbung';

  @override
  String get watchAdMessage =>
      'Schaue dir eine kurze Werbung an, um fortzufahren, oder nutze Premium werbefrei!';

  @override
  String get watchAd => 'Werbung ansehen';

  @override
  String get goAdFree => 'Werbefrei nutzen - 59 DKK/Monat';

  @override
  String get removeAdsForever => 'Werbung für immer entfernen';

  @override
  String get chooseOneBundle =>
      'Wähle 1 Paket zum Freischalten und Entfernen aller Werbung';

  @override
  String get noAdsForever => 'Keine Werbung mehr';

  @override
  String premiumActivated(Object bundle) {
    return 'Premium aktiviert! Werbung entfernt. $bundle Paket freigeschaltet.';
  }

  @override
  String get adNotReady => 'Werbung nicht bereit. Fahre ohne Werbung fort.';

  @override
  String get adLoadingContinue => 'Werbung lädt... Fortfahren';

  @override
  String get pricePerMonth => '59 DKK/Monat';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Keine Fragen für $category im $mode-Modus gefunden';
  }

  @override
  String get errorLoadingQuestions =>
      'Fehler beim Laden der Fragen. Bitte überprüfe deine Verbindung.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Fragen konnten nicht geladen werden: $error';
  }

  @override
  String get madeForWife => 'Gemacht für meine wundervolle Frau';

  @override
  String get otiLia => 'Otilia Stenhøj';

  @override
  String get withLoveAndConversations => 'Mit Liebe und Gesprächen';

  @override
  String get howManyPlayers => 'Wie viele Spieler?';

  @override
  String get players => 'Spieler';

  @override
  String get continueButton => 'Weiter';

  @override
  String get language => 'Sprache';

  @override
  String languageChanged(Object language) {
    return 'Sprache geändert zu $language';
  }

  @override
  String get profile => 'Profil';

  @override
  String get signOut => 'Abmelden';

  @override
  String get notSignedIn => 'Nicht angemeldet';

  @override
  String get signInSignUp => 'Anmelden / Registrieren';

  @override
  String get signInToSync =>
      'Melde dich an, um deine Abonnements geräteübergreifend zu synchronisieren und Premium-Inhalte freizuschalten';

  @override
  String get signOutConfirm => 'Möchtest du dich wirklich abmelden?';

  @override
  String get signedOutSuccess => 'Erfolgreich abgemeldet';

  @override
  String get accountInformation => 'Kontoinformationen';

  @override
  String get email => 'E-Mail';

  @override
  String get memberSince => 'Mitglied seit';

  @override
  String get notAvailable => 'Nicht verfügbar';

  @override
  String get unknown => 'Unbekannt';

  @override
  String get activeSubscriptions => 'Aktive Abonnements';

  @override
  String bundlesUnlocked(Object count, Object plural) {
    return '$count Paket$plural freigeschaltet';
  }

  @override
  String bundle(Object name) {
    return '$name Paket';
  }

  @override
  String get premiumMember => 'Premium-Mitglied';

  @override
  String get freeAccount => 'Kostenloses Konto';

  @override
  String get welcomeToConnect => 'Willkommen bei Connect!';

  @override
  String get continueWithApple => 'Mit Apple fortfahren';

  @override
  String get continueWithGoogle => 'Mit Google fortfahren';

  @override
  String get skipForNow => 'Jetzt überspringen';

  @override
  String get byContining =>
      'Indem du fortfährst, stimmst du unseren Nutzungsbedingungen und Datenschutzrichtlinien zu';

  @override
  String get googleSignInFailed =>
      'Google-Anmeldung fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get appleSignInFailed =>
      'Apple-Anmeldung fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get noCategoriesFound => 'Keine Kategorien gefunden';

  @override
  String selectBundlePlural(Object plural) {
    return 'Wähle das/die Kategorienpaket$plural, das/die du freischalten möchtest';
  }

  @override
  String get getAccessAllBundles =>
      'Erhalte Zugang zu allen Premium-Kategorien in allen 3 Paketen!';

  @override
  String subscriptionActivatedFull(Object bundles) {
    return 'Abonnement aktiviert! $bundles freigeschaltet.';
  }

  @override
  String get aboutCredits => 'Über / Credits';

  @override
  String get welcomeBack => 'Willkommen zurück!';

  @override
  String get createAccount => 'Konto erstellen';

  @override
  String get displayName => 'Anzeigename';

  @override
  String get password => 'Passwort';

  @override
  String get signIn => 'Anmelden';

  @override
  String get signUp => 'Registrieren';

  @override
  String get dontHaveAccount => 'Noch kein Konto? Registrieren';

  @override
  String get alreadyHaveAccount => 'Bereits ein Konto? Anmelden';

  @override
  String get chooseYourMode => '1. Wähle deinen Modus';

  @override
  String get chooseYourModeDesc =>
      'Wähle aus drei Gesprächsstilen:\n\n• Familie - Herzliche, gemütliche Gespräche perfekt für alle Altersgruppen\n• Paar - Intime und romantische Fragen, um eure Verbindung zu vertiefen\n• Freunde - Lustige und unterhaltsame Themen für euch und eure Freunde';

  @override
  String get pickCategory => '2. Wähle eine Kategorie';

  @override
  String get pickCategoryDesc =>
      'Jeder Modus hat mehrere Kategorien mit einzigartigen Fragensammlungen. Kostenlose Kategorien sind freigeschaltet, Premium-Kategorien erfordern ein Abonnement.';

  @override
  String get startTalking => '3. Beginne zu sprechen';

  @override
  String get startTalkingDesc =>
      'Fragen erscheinen im Vollbildmodus. Wechselt euch beim Lesen und ehrlichen Beantworten ab. Es gibt keine falschen Antworten - das Ziel ist ein bedeutungsvolles Gespräch!';

  @override
  String get navigateQuestions => '4. Navigiere durch die Fragen';

  @override
  String get navigateQuestionsDesc =>
      '• Wische nach rechts oder tippe auf \"Weiter\" für die nächste Frage\n• Wische nach links oder tippe auf \"Zurück\", um Fragen erneut zu sehen\n• Tippe jederzeit auf die Home-Taste, um zum Hauptmenü zurückzukehren';

  @override
  String get premiumFeatures => '5. Premium-Funktionen';

  @override
  String get premiumFeaturesDesc =>
      'Schalte exklusive Fragenkategorien mit einem Abonnement frei:\n\n• 1 Paket (4 Kategorien) - 59 DKK/Monat\n• 2 Pakete (8 Kategorien) - 109 DKK/Monat\n• 3 Pakete (12 Kategorien) - 149 DKK/Monat';

  @override
  String get proTips => 'Profi-Tipps';

  @override
  String get proTipsDesc =>
      '• Schaffe eine komfortable, ablenkungsfreie Umgebung\n• Höre aktiv zu und sei präsent\n• Teile ehrlich und ermutige andere, dasselbe zu tun\n• Respektiere Grenzen - überspringe Fragen bei Bedarf\n• Hab Spaß und genieße die Verbindung!';

  @override
  String get personal => 'Personal';

  @override
  String get personalDesc => 'Create your own custom question decks';

  @override
  String get gameComplete => 'Game Complete!';

  @override
  String get noMoreQuestions =>
      'You\'ve gone through all the questions in this deck!';

  @override
  String get playAgain => 'Play Again';

  @override
  String get mainMenu => 'Main Menu';
}
