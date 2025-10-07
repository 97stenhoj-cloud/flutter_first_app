// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Start';

  @override
  String get settings => 'Indstillinger';

  @override
  String get howToPlay => 'Sådan Spiller Du';

  @override
  String get chooseGameMode => 'Vælg din spiltilstand';

  @override
  String get family => 'Familie';

  @override
  String get couple => 'Par';

  @override
  String get friends => 'Venner';

  @override
  String get chooseCategory => 'Vælg en Kategori';

  @override
  String get locked => 'Låst Kategori';

  @override
  String get lockedMessage =>
      'Denne kategori er låst. Opgrader til premium for at låse alle kategorier op!';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Måske Senere';

  @override
  String get chooseSubscription => 'Vælg Dit Abonnement';

  @override
  String get subscriptionDescription =>
      'Lås premium kategorier op og få adgang til eksklusive spørgsmålspakker';

  @override
  String get chooseBundleOne => 'Vælg 1 kategoribundt';

  @override
  String get chooseBundleTwo => 'Vælg 2 kategoribundter';

  @override
  String get chooseBundleThree => 'Alle 3 kategoribundter';

  @override
  String get perMonth => '/måned';

  @override
  String get bestValue => 'BEDSTE VÆRDI';

  @override
  String get unlockAllBundles => 'Lås Alle Bundter Op';

  @override
  String get selectYourBundle => 'Vælg Dit Bundt';

  @override
  String selectBundles(Object count, Object plural) {
    return 'Vælg $count Bundt$plural';
  }

  @override
  String get premiumCategories => '4 premium kategorier';

  @override
  String get cancel => 'Annuller';

  @override
  String get subscribe => 'Abonner';

  @override
  String subscriptionActivated(Object bundles) {
    return 'Abonnement aktiveret! $bundles låst op.';
  }

  @override
  String get demoNote => 'Demo: Oplåsninger nulstilles ved genstart af app';

  @override
  String get swipeOrTap => 'Swipe eller tryk på pile';

  @override
  String get previous => 'Forrige';

  @override
  String get next => 'Næste';

  @override
  String get advertisement => 'Annonce';

  @override
  String get watchAdMessage =>
      'Se en kort annonce for at fortsætte, eller bliv reklamefri med premium!';

  @override
  String get watchAd => 'Se Annonce';

  @override
  String get goAdFree => 'Bliv Reklamefri - 59 DKK/måned';

  @override
  String get removeAdsForever => 'Fjern Annoncer For Evigt';

  @override
  String get chooseOneBundle =>
      'Vælg 1 bundt for at låse op og fjerne alle annoncer';

  @override
  String get noAdsForever => 'Ingen Annoncer For Evigt';

  @override
  String premiumActivated(Object bundle) {
    return 'Premium aktiveret! Annoncer fjernet. $bundle bundt låst op.';
  }
}
