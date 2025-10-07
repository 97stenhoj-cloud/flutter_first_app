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
  String get howToPlay => 'Wie Man Spielt';

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
      'Diese Kategorie ist gesperrt. Upgrade auf Premium, um alle Kategorien freizuschalten!';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Vielleicht Später';

  @override
  String get chooseSubscription => 'Wähle Dein Abonnement';

  @override
  String get subscriptionDescription =>
      'Schalte Premium-Kategorien frei und erhalte Zugang zu exklusiven Fragenpaketen';

  @override
  String get chooseBundleOne => 'Wähle 1 Kategoriepaket';

  @override
  String get chooseBundleTwo => 'Wähle 2 Kategoriepakete';

  @override
  String get chooseBundleThree => 'Alle 3 Kategoriepakete';

  @override
  String get perMonth => '/Monat';

  @override
  String get bestValue => 'BESTER WERT';

  @override
  String get unlockAllBundles => 'Alle Pakete Freischalten';

  @override
  String get selectYourBundle => 'Wähle Dein Paket';

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
  String get swipeOrTap => 'Wischen oder auf Pfeile tippen';

  @override
  String get previous => 'Zurück';

  @override
  String get next => 'Weiter';

  @override
  String get advertisement => 'Werbung';

  @override
  String get watchAdMessage =>
      'Schaue eine kurze Werbung, um fortzufahren, oder werde werbefrei mit Premium!';

  @override
  String get watchAd => 'Werbung Ansehen';

  @override
  String get goAdFree => 'Werbefrei Werden - 59 DKK/Monat';

  @override
  String get removeAdsForever => 'Werbung Für Immer Entfernen';

  @override
  String get chooseOneBundle =>
      'Wähle 1 Paket zum Freischalten und Entfernen aller Werbung';

  @override
  String get noAdsForever => 'Keine Werbung Für Immer';

  @override
  String premiumActivated(Object bundle) {
    return 'Premium aktiviert! Werbung entfernt. $bundle Paket freigeschaltet.';
  }
}
