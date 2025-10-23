import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('da'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('pt'),
    Locale('ro'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get appTitle;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @howToPlay.
  ///
  /// In en, this message translates to:
  /// **'How to Play'**
  String get howToPlay;

  /// No description provided for @chooseGameMode.
  ///
  /// In en, this message translates to:
  /// **'Choose your game mode'**
  String get chooseGameMode;

  /// No description provided for @family.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get family;

  /// No description provided for @couple.
  ///
  /// In en, this message translates to:
  /// **'Couple'**
  String get couple;

  /// No description provided for @friends.
  ///
  /// In en, this message translates to:
  /// **'Friends'**
  String get friends;

  /// No description provided for @chooseCategory.
  ///
  /// In en, this message translates to:
  /// **'Choose a Category'**
  String get chooseCategory;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'Locked Category'**
  String get locked;

  /// No description provided for @lockedMessage.
  ///
  /// In en, this message translates to:
  /// **'This category is locked. Upgrade to premium to unlock all categories!'**
  String get lockedMessage;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @mayBeLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get mayBeLater;

  /// No description provided for @chooseSubscription.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Subscription'**
  String get chooseSubscription;

  /// No description provided for @subscriptionDescription.
  ///
  /// In en, this message translates to:
  /// **'Unlock premium categories and get access to exclusive question packs'**
  String get subscriptionDescription;

  /// No description provided for @chooseBundleOne.
  ///
  /// In en, this message translates to:
  /// **'Choose 1 category bundle'**
  String get chooseBundleOne;

  /// No description provided for @chooseBundleTwo.
  ///
  /// In en, this message translates to:
  /// **'Choose 2 category bundles'**
  String get chooseBundleTwo;

  /// No description provided for @chooseBundleThree.
  ///
  /// In en, this message translates to:
  /// **'All 3 category bundles'**
  String get chooseBundleThree;

  /// No description provided for @perMonth.
  ///
  /// In en, this message translates to:
  /// **'/month'**
  String get perMonth;

  /// No description provided for @bestValue.
  ///
  /// In en, this message translates to:
  /// **'BEST VALUE'**
  String get bestValue;

  /// No description provided for @unlockAllBundles.
  ///
  /// In en, this message translates to:
  /// **'Unlock All Bundles'**
  String get unlockAllBundles;

  /// No description provided for @selectYourBundle.
  ///
  /// In en, this message translates to:
  /// **'Select Your Bundle'**
  String get selectYourBundle;

  /// No description provided for @selectBundles.
  ///
  /// In en, this message translates to:
  /// **'Select {count} Bundle{plural}'**
  String selectBundles(Object count, Object plural);

  /// No description provided for @premiumCategories.
  ///
  /// In en, this message translates to:
  /// **'4 premium categories'**
  String get premiumCategories;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @subscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscribe;

  /// No description provided for @subscriptionActivated.
  ///
  /// In en, this message translates to:
  /// **'Subscription activated! {bundles} unlocked.'**
  String subscriptionActivated(Object bundles);

  /// No description provided for @demoNote.
  ///
  /// In en, this message translates to:
  /// **'Demo: Unlocks will reset on app restart'**
  String get demoNote;

  /// No description provided for @swipeOrTap.
  ///
  /// In en, this message translates to:
  /// **'Swipe or tap arrows'**
  String get swipeOrTap;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @advertisement.
  ///
  /// In en, this message translates to:
  /// **'Advertisement'**
  String get advertisement;

  /// No description provided for @watchAdMessage.
  ///
  /// In en, this message translates to:
  /// **'Watch a short ad to continue, or go ad-free with premium!'**
  String get watchAdMessage;

  /// No description provided for @watchAd.
  ///
  /// In en, this message translates to:
  /// **'Watch Ad'**
  String get watchAd;

  /// No description provided for @goAdFree.
  ///
  /// In en, this message translates to:
  /// **'Go Ad-Free - 59 DKK/month'**
  String get goAdFree;

  /// No description provided for @removeAdsForever.
  ///
  /// In en, this message translates to:
  /// **'Remove Ads Forever'**
  String get removeAdsForever;

  /// No description provided for @chooseOneBundle.
  ///
  /// In en, this message translates to:
  /// **'Choose 1 bundle to unlock and remove all ads'**
  String get chooseOneBundle;

  /// No description provided for @noAdsForever.
  ///
  /// In en, this message translates to:
  /// **'No Ads Forever'**
  String get noAdsForever;

  /// No description provided for @premiumActivated.
  ///
  /// In en, this message translates to:
  /// **'Premium activated! Ads removed. {bundle} bundle unlocked.'**
  String premiumActivated(Object bundle);

  /// No description provided for @adNotReady.
  ///
  /// In en, this message translates to:
  /// **'Ad not ready. Continuing without ad.'**
  String get adNotReady;

  /// No description provided for @adLoadingContinue.
  ///
  /// In en, this message translates to:
  /// **'Ad Loading... Continue'**
  String get adLoadingContinue;

  /// No description provided for @pricePerMonth.
  ///
  /// In en, this message translates to:
  /// **'59 DKK/month'**
  String get pricePerMonth;

  /// No description provided for @noQuestionsFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'No questions found for {category} in {mode} mode'**
  String noQuestionsFoundMessage(Object category, Object mode);

  /// No description provided for @errorLoadingQuestions.
  ///
  /// In en, this message translates to:
  /// **'Error loading questions. Please check your connection.'**
  String get errorLoadingQuestions;

  /// No description provided for @failedToLoadQuestions.
  ///
  /// In en, this message translates to:
  /// **'Failed to load questions: {error}'**
  String failedToLoadQuestions(Object error);

  /// No description provided for @madeForWife.
  ///
  /// In en, this message translates to:
  /// **'Made for my beautiful wife'**
  String get madeForWife;

  /// No description provided for @otiLia.
  ///
  /// In en, this message translates to:
  /// **'Otilia Stenhøj'**
  String get otiLia;

  /// No description provided for @withLoveAndConversations.
  ///
  /// In en, this message translates to:
  /// **'With love and conversations'**
  String get withLoveAndConversations;

  /// No description provided for @howManyPlayers.
  ///
  /// In en, this message translates to:
  /// **'How many players?'**
  String get howManyPlayers;

  /// No description provided for @players.
  ///
  /// In en, this message translates to:
  /// **'Players'**
  String get players;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageChanged.
  ///
  /// In en, this message translates to:
  /// **'Language changed to {language}'**
  String languageChanged(Object language);

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @notSignedIn.
  ///
  /// In en, this message translates to:
  /// **'Not Signed In'**
  String get notSignedIn;

  /// No description provided for @signInSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign In / Sign Up'**
  String get signInSignUp;

  /// No description provided for @signInToSync.
  ///
  /// In en, this message translates to:
  /// **'Sign in to sync your subscriptions across devices and unlock premium content'**
  String get signInToSync;

  /// No description provided for @signOutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get signOutConfirm;

  /// No description provided for @signedOutSuccess.
  ///
  /// In en, this message translates to:
  /// **'Signed out successfully'**
  String get signedOutSuccess;

  /// No description provided for @accountInformation.
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get accountInformation;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @memberSince.
  ///
  /// In en, this message translates to:
  /// **'Member Since'**
  String get memberSince;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not available'**
  String get notAvailable;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @activeSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Active Subscriptions'**
  String get activeSubscriptions;

  /// No description provided for @bundlesUnlocked.
  ///
  /// In en, this message translates to:
  /// **'{count} Bundle{plural} Unlocked'**
  String bundlesUnlocked(Object count, Object plural);

  /// No description provided for @bundle.
  ///
  /// In en, this message translates to:
  /// **'{name} Bundle'**
  String bundle(Object name);

  /// No description provided for @premiumMember.
  ///
  /// In en, this message translates to:
  /// **'Premium Member'**
  String get premiumMember;

  /// No description provided for @freeAccount.
  ///
  /// In en, this message translates to:
  /// **'Free Account'**
  String get freeAccount;

  /// No description provided for @welcomeToConnect.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Connect!'**
  String get welcomeToConnect;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @skipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get skipForNow;

  /// No description provided for @byContining.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our Terms of Service and Privacy Policy'**
  String get byContining;

  /// No description provided for @googleSignInFailed.
  ///
  /// In en, this message translates to:
  /// **'Google Sign In failed. Please try again.'**
  String get googleSignInFailed;

  /// No description provided for @appleSignInFailed.
  ///
  /// In en, this message translates to:
  /// **'Apple Sign In failed. Please try again.'**
  String get appleSignInFailed;

  /// No description provided for @noCategoriesFound.
  ///
  /// In en, this message translates to:
  /// **'No categories found'**
  String get noCategoriesFound;

  /// No description provided for @selectBundlePlural.
  ///
  /// In en, this message translates to:
  /// **'Select the category bundle{plural} you want to unlock'**
  String selectBundlePlural(Object plural);

  /// No description provided for @getAccessAllBundles.
  ///
  /// In en, this message translates to:
  /// **'Get access to all premium categories in all 3 bundles!'**
  String get getAccessAllBundles;

  /// No description provided for @subscriptionActivatedFull.
  ///
  /// In en, this message translates to:
  /// **'Subscription activated! {bundles} unlocked.'**
  String subscriptionActivatedFull(Object bundles);

  /// No description provided for @aboutCredits.
  ///
  /// In en, this message translates to:
  /// **'About / Credits'**
  String get aboutCredits;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @displayName.
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get displayName;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Sign Up'**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign In'**
  String get alreadyHaveAccount;

  /// No description provided for @chooseYourMode.
  ///
  /// In en, this message translates to:
  /// **'1. Choose Your Mode'**
  String get chooseYourMode;

  /// No description provided for @chooseYourModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Select from three conversation styles:\n\n• Family - Warm, wholesome conversations perfect for all ages\n• Couple - Intimate and romantic questions to deepen your connection\n• Friends - Fun and entertaining topics for your squad'**
  String get chooseYourModeDesc;

  /// No description provided for @pickCategory.
  ///
  /// In en, this message translates to:
  /// **'2. Pick a Category'**
  String get pickCategory;

  /// No description provided for @pickCategoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Each mode has multiple categories with unique question packs. Free categories are unlocked, while premium categories require a subscription.'**
  String get pickCategoryDesc;

  /// No description provided for @startTalking.
  ///
  /// In en, this message translates to:
  /// **'3. Start Talking'**
  String get startTalking;

  /// No description provided for @startTalkingDesc.
  ///
  /// In en, this message translates to:
  /// **'Questions appear full screen. Take turns reading and answering them honestly. There are no wrong answers - the goal is meaningful conversation!'**
  String get startTalkingDesc;

  /// No description provided for @navigateQuestions.
  ///
  /// In en, this message translates to:
  /// **'4. Navigate Questions'**
  String get navigateQuestions;

  /// No description provided for @navigateQuestionsDesc.
  ///
  /// In en, this message translates to:
  /// **'• Swipe right or tap \"Next\" for the next question\n• Swipe left or tap \"Previous\" to revisit questions\n• Tap the home button to return to the main menu anytime'**
  String get navigateQuestionsDesc;

  /// No description provided for @premiumFeatures.
  ///
  /// In en, this message translates to:
  /// **'5. Premium Features'**
  String get premiumFeatures;

  /// No description provided for @premiumFeaturesDesc.
  ///
  /// In en, this message translates to:
  /// **'Unlock exclusive question categories with a subscription:\n\n• 1 Bundle (4 categories) - 59 DKK/month\n• 2 Bundles (8 categories) - 109 DKK/month\n• 3 Bundles (12 categories) - 149 DKK/month'**
  String get premiumFeaturesDesc;

  /// No description provided for @proTips.
  ///
  /// In en, this message translates to:
  /// **'Pro Tips'**
  String get proTips;

  /// No description provided for @proTipsDesc.
  ///
  /// In en, this message translates to:
  /// **'• Create a comfortable, distraction-free environment\n• Listen actively and be present\n• Share honestly and encourage others to do the same\n• Respect boundaries - skip questions if needed\n• Have fun and enjoy connecting!'**
  String get proTipsDesc;

  /// No description provided for @personal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get personal;

  /// No description provided for @personalDesc.
  ///
  /// In en, this message translates to:
  /// **'Create your own custom question decks'**
  String get personalDesc;

  /// No description provided for @gameComplete.
  ///
  /// In en, this message translates to:
  /// **'Game Complete!'**
  String get gameComplete;

  /// No description provided for @noMoreQuestions.
  ///
  /// In en, this message translates to:
  /// **'You\'ve gone through all the questions in this deck!'**
  String get noMoreQuestions;

  /// No description provided for @playAgain.
  ///
  /// In en, this message translates to:
  /// **'Play Again'**
  String get playAgain;

  /// No description provided for @mainMenu.
  ///
  /// In en, this message translates to:
  /// **'Main Menu'**
  String get mainMenu;

  /// No description provided for @thanksForPlaying.
  ///
  /// In en, this message translates to:
  /// **'Thanks for Playing!'**
  String get thanksForPlaying;

  /// No description provided for @hopeYouHadFun.
  ///
  /// In en, this message translates to:
  /// **'Hope you had fun! 🎉'**
  String get hopeYouHadFun;

  /// No description provided for @backToMenu.
  ///
  /// In en, this message translates to:
  /// **'Back to Menu'**
  String get backToMenu;

  /// No description provided for @leaveGame.
  ///
  /// In en, this message translates to:
  /// **'Leave Game?'**
  String get leaveGame;

  /// No description provided for @leaveGameMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to leave? The game will continue for other players.'**
  String get leaveGameMessage;

  /// No description provided for @leave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get leave;

  /// No description provided for @noQuestionsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No questions available'**
  String get noQuestionsAvailable;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'da',
    'de',
    'en',
    'es',
    'pt',
    'ro',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
