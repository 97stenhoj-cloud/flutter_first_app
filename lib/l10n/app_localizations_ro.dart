// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Start';

  @override
  String get settings => 'Setări';

  @override
  String get howToPlay => 'Cum Să Joci';

  @override
  String get chooseGameMode => 'Alege modul de joc';

  @override
  String get family => 'Familie';

  @override
  String get couple => 'Cuplu';

  @override
  String get friends => 'Prieteni';

  @override
  String get chooseCategory => 'Alege o Categorie';

  @override
  String get locked => 'Categorie Blocată';

  @override
  String get lockedMessage =>
      'Această categorie este blocată. Treci la premium pentru a debloca toate categoriile!';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Poate Mai Târziu';

  @override
  String get chooseSubscription => 'Alege Abonamentul Tău';

  @override
  String get subscriptionDescription =>
      'Deblochează categorii premium și obține acces la pachete de întrebări exclusive';

  @override
  String get chooseBundleOne => 'Alege 1 pachet de categorii';

  @override
  String get chooseBundleTwo => 'Alege 2 pachete de categorii';

  @override
  String get chooseBundleThree => 'Toate cele 3 pachete de categorii';

  @override
  String get perMonth => '/lună';

  @override
  String get bestValue => 'CEA MAI BUNĂ VALOARE';

  @override
  String get unlockAllBundles => 'Deblochează Toate Pachetele';

  @override
  String get selectYourBundle => 'Selectează Pachetul Tău';

  @override
  String selectBundles(Object count, Object plural) {
    return 'Selectează $count Pachet$plural';
  }

  @override
  String get premiumCategories => '4 categorii premium';

  @override
  String get cancel => 'Anulează';

  @override
  String get subscribe => 'Abonează-te';

  @override
  String subscriptionActivated(Object bundles) {
    return 'Abonament activat! $bundles deblocat.';
  }

  @override
  String get demoNote =>
      'Demo: Deblocările vor fi resetate la repornirea aplicației';

  @override
  String get swipeOrTap => 'Glisează sau apasă săgețile';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Următor';

  @override
  String get advertisement => 'Publicitate';

  @override
  String get watchAdMessage =>
      'Urmărește o reclamă scurtă pentru a continua, sau elimină reclamele cu premium!';

  @override
  String get watchAd => 'Vizionează Reclama';

  @override
  String get goAdFree => 'Fără Reclame - 59 DKK/lună';

  @override
  String get removeAdsForever => 'Elimină Reclamele Pentru Totdeauna';

  @override
  String get chooseOneBundle =>
      'Alege 1 pachet pentru a debloca și elimina toate reclamele';

  @override
  String get noAdsForever => 'Fără Reclame Pentru Totdeauna';

  @override
  String premiumActivated(Object bundle) {
    return 'Premium activat! Reclame eliminate. Pachet $bundle deblocat.';
  }
}
