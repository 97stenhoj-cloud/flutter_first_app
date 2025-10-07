// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Start';

  @override
  String get settings => 'Settings';

  @override
  String get howToPlay => 'How to Play';

  @override
  String get chooseGameMode => 'Choose your game mode';

  @override
  String get family => 'Family';

  @override
  String get couple => 'Couple';

  @override
  String get friends => 'Friends';

  @override
  String get chooseCategory => 'Choose a Category';

  @override
  String get locked => 'Locked Category';

  @override
  String get lockedMessage =>
      'This category is locked. Upgrade to premium to unlock all categories!';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Maybe Later';

  @override
  String get chooseSubscription => 'Choose Your Subscription';

  @override
  String get subscriptionDescription =>
      'Unlock premium categories and get access to exclusive question packs';

  @override
  String get chooseBundleOne => 'Choose 1 category bundle';

  @override
  String get chooseBundleTwo => 'Choose 2 category bundles';

  @override
  String get chooseBundleThree => 'All 3 category bundles';

  @override
  String get perMonth => '/month';

  @override
  String get bestValue => 'BEST VALUE';

  @override
  String get unlockAllBundles => 'Unlock All Bundles';

  @override
  String get selectYourBundle => 'Select Your Bundle';

  @override
  String selectBundles(Object count, Object plural) {
    return 'Select $count Bundle$plural';
  }

  @override
  String get premiumCategories => '4 premium categories';

  @override
  String get cancel => 'Cancel';

  @override
  String get subscribe => 'Subscribe';

  @override
  String subscriptionActivated(Object bundles) {
    return 'Subscription activated! $bundles unlocked.';
  }

  @override
  String get demoNote => 'Demo: Unlocks will reset on app restart';

  @override
  String get swipeOrTap => 'Swipe or tap arrows';

  @override
  String get previous => 'Previous';

  @override
  String get next => 'Next';

  @override
  String get advertisement => 'Advertisement';

  @override
  String get watchAdMessage =>
      'Watch a short ad to continue, or go ad-free with premium!';

  @override
  String get watchAd => 'Watch Ad';

  @override
  String get goAdFree => 'Go Ad-Free - 59 DKK/month';

  @override
  String get removeAdsForever => 'Remove Ads Forever';

  @override
  String get chooseOneBundle => 'Choose 1 bundle to unlock and remove all ads';

  @override
  String get noAdsForever => 'No Ads Forever';

  @override
  String premiumActivated(Object bundle) {
    return 'Premium activated! Ads removed. $bundle bundle unlocked.';
  }
}
