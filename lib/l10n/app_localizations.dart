import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
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
    Locale('fr'),
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

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'Show Less'**
  String get showLess;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get readMore;

  /// No description provided for @tapToPlay.
  ///
  /// In en, this message translates to:
  /// **'Tap to Play'**
  String get tapToPlay;

  /// No description provided for @coupleBundle.
  ///
  /// In en, this message translates to:
  /// **'Couple Bundle'**
  String get coupleBundle;

  /// No description provided for @friendsBundle.
  ///
  /// In en, this message translates to:
  /// **'Friends Bundle'**
  String get friendsBundle;

  /// No description provided for @familyBundle.
  ///
  /// In en, this message translates to:
  /// **'Family Bundle'**
  String get familyBundle;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @pandoraHostCreatePin.
  ///
  /// In en, this message translates to:
  /// **'Host creates session and shares PIN'**
  String get pandoraHostCreatePin;

  /// No description provided for @pandoraPlayersJoinMax.
  ///
  /// In en, this message translates to:
  /// **'Players join (max 15 min)'**
  String get pandoraPlayersJoinMax;

  /// No description provided for @pandoraHostSetsTimer.
  ///
  /// In en, this message translates to:
  /// **'Host sets question timer (1-15 min)'**
  String get pandoraHostSetsTimer;

  /// No description provided for @pandoraEveryoneSubmits.
  ///
  /// In en, this message translates to:
  /// **'Everyone submits questions'**
  String get pandoraEveryoneSubmits;

  /// No description provided for @pandoraHostControls.
  ///
  /// In en, this message translates to:
  /// **'Host controls game progression'**
  String get pandoraHostControls;

  /// No description provided for @pandoraQuestionsDeleted.
  ///
  /// In en, this message translates to:
  /// **'Questions deleted after game'**
  String get pandoraQuestionsDeleted;

  /// No description provided for @pandoraHost.
  ///
  /// In en, this message translates to:
  /// **'Host'**
  String get pandoraHost;

  /// No description provided for @pandoraJoinGame.
  ///
  /// In en, this message translates to:
  /// **'Join Game'**
  String get pandoraJoinGame;

  /// No description provided for @pandoraPandoraBox.
  ///
  /// In en, this message translates to:
  /// **'Pandora Box'**
  String get pandoraPandoraBox;

  /// No description provided for @pleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get pleaseEnterName;

  /// No description provided for @hostSuffix.
  ///
  /// In en, this message translates to:
  /// **'(Host)'**
  String get hostSuffix;

  /// No description provided for @playersJoinWithNames.
  ///
  /// In en, this message translates to:
  /// **'Players join with their names'**
  String get playersJoinWithNames;

  /// No description provided for @everyoneSubmitsMin5.
  ///
  /// In en, this message translates to:
  /// **'Everyone submits questions (min 5)'**
  String get everyoneSubmitsMin5;

  /// No description provided for @createSession.
  ///
  /// In en, this message translates to:
  /// **'Create Session'**
  String get createSession;

  /// No description provided for @creating.
  ///
  /// In en, this message translates to:
  /// **'Creating...'**
  String get creating;

  /// No description provided for @yourName.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get yourName;

  /// No description provided for @enterDisplayName.
  ///
  /// In en, this message translates to:
  /// **'Enter your display name'**
  String get enterDisplayName;

  /// No description provided for @howItWorks.
  ///
  /// In en, this message translates to:
  /// **'How It Works'**
  String get howItWorks;

  /// No description provided for @pinCopied.
  ///
  /// In en, this message translates to:
  /// **'PIN copied to clipboard!'**
  String get pinCopied;

  /// No description provided for @endSession.
  ///
  /// In en, this message translates to:
  /// **'End Session?'**
  String get endSession;

  /// No description provided for @endSessionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to end this Pandora session?'**
  String get endSessionConfirm;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @sessionPin.
  ///
  /// In en, this message translates to:
  /// **'Session PIN'**
  String get sessionPin;

  /// No description provided for @sharePin.
  ///
  /// In en, this message translates to:
  /// **'Share this PIN with players'**
  String get sharePin;

  /// No description provided for @waitingForPlayers.
  ///
  /// In en, this message translates to:
  /// **'Waiting for players...'**
  String get waitingForPlayers;

  /// No description provided for @startGame.
  ///
  /// In en, this message translates to:
  /// **'Start Game'**
  String get startGame;

  /// No description provided for @lobby.
  ///
  /// In en, this message translates to:
  /// **'Lobby'**
  String get lobby;

  /// No description provided for @hostLabel.
  ///
  /// In en, this message translates to:
  /// **' (Host)'**
  String get hostLabel;

  /// No description provided for @selectTimer.
  ///
  /// In en, this message translates to:
  /// **'Select Timer'**
  String get selectTimer;

  /// No description provided for @timerQuestion.
  ///
  /// In en, this message translates to:
  /// **'How long should players have to submit questions?'**
  String get timerQuestion;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @startCollectingQuestions.
  ///
  /// In en, this message translates to:
  /// **'Start Collecting Questions'**
  String get startCollectingQuestions;

  /// No description provided for @sessionCancelled.
  ///
  /// In en, this message translates to:
  /// **'Session cancelled'**
  String get sessionCancelled;

  /// No description provided for @questionCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Question cannot be empty'**
  String get questionCannotBeEmpty;

  /// No description provided for @questionSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Question submitted!'**
  String get questionSubmitted;

  /// No description provided for @failedToSubmit.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit question'**
  String get failedToSubmit;

  /// No description provided for @notEnoughQuestions.
  ///
  /// In en, this message translates to:
  /// **'Not enough questions. Minimum 5 required. (Currently: {count})'**
  String notEnoughQuestions(Object count);

  /// No description provided for @submitQuestions.
  ///
  /// In en, this message translates to:
  /// **'Submit Questions'**
  String get submitQuestions;

  /// No description provided for @submitMinimum5.
  ///
  /// In en, this message translates to:
  /// **'Submit at least 5 questions to start the game'**
  String get submitMinimum5;

  /// No description provided for @yourQuestion.
  ///
  /// In en, this message translates to:
  /// **'Your Question'**
  String get yourQuestion;

  /// No description provided for @enterQuestionHere.
  ///
  /// In en, this message translates to:
  /// **'Enter your question here...'**
  String get enterQuestionHere;

  /// No description provided for @forEveryone.
  ///
  /// In en, this message translates to:
  /// **'For Everyone'**
  String get forEveryone;

  /// No description provided for @forSpecificPerson.
  ///
  /// In en, this message translates to:
  /// **'For Specific Person'**
  String get forSpecificPerson;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @questionsRemaining.
  ///
  /// In en, this message translates to:
  /// **'{count} questions remaining'**
  String questionsRemaining(Object count);

  /// No description provided for @questionRemaining.
  ///
  /// In en, this message translates to:
  /// **'{count} question remaining'**
  String questionRemaining(Object count);

  /// No description provided for @startGameExclamation.
  ///
  /// In en, this message translates to:
  /// **'Start Game!'**
  String get startGameExclamation;

  /// No description provided for @cancelSession.
  ///
  /// In en, this message translates to:
  /// **'Cancel Session'**
  String get cancelSession;

  /// No description provided for @timeRemaining.
  ///
  /// In en, this message translates to:
  /// **'Time Remaining'**
  String get timeRemaining;

  /// No description provided for @pleaseEnterPin.
  ///
  /// In en, this message translates to:
  /// **'Please enter a PIN'**
  String get pleaseEnterPin;

  /// No description provided for @sessionNotFound.
  ///
  /// In en, this message translates to:
  /// **'Session not found'**
  String get sessionNotFound;

  /// No description provided for @sessionEnded.
  ///
  /// In en, this message translates to:
  /// **'Session has ended'**
  String get sessionEnded;

  /// No description provided for @sessionStarted.
  ///
  /// In en, this message translates to:
  /// **'Session has already started'**
  String get sessionStarted;

  /// No description provided for @failedToJoin.
  ///
  /// In en, this message translates to:
  /// **'Failed to join session'**
  String get failedToJoin;

  /// No description provided for @joinSession.
  ///
  /// In en, this message translates to:
  /// **'Join Session'**
  String get joinSession;

  /// No description provided for @joining.
  ///
  /// In en, this message translates to:
  /// **'Joining...'**
  String get joining;

  /// No description provided for @enterPin.
  ///
  /// In en, this message translates to:
  /// **'Enter 6-digit PIN'**
  String get enterPin;

  /// No description provided for @join.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get join;

  /// No description provided for @reactionBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Reaction Breakdown'**
  String get reactionBreakdown;

  /// No description provided for @laugh.
  ///
  /// In en, this message translates to:
  /// **'Laugh'**
  String get laugh;

  /// No description provided for @shock.
  ///
  /// In en, this message translates to:
  /// **'Shock'**
  String get shock;

  /// No description provided for @heart.
  ///
  /// In en, this message translates to:
  /// **'Heart'**
  String get heart;

  /// No description provided for @fire.
  ///
  /// In en, this message translates to:
  /// **'Fire'**
  String get fire;

  /// No description provided for @mostLaughs.
  ///
  /// In en, this message translates to:
  /// **'Most Laughs'**
  String get mostLaughs;

  /// No description provided for @mostShocked.
  ///
  /// In en, this message translates to:
  /// **'Most Shocked'**
  String get mostShocked;

  /// No description provided for @mostHearts.
  ///
  /// In en, this message translates to:
  /// **'Most Hearts'**
  String get mostHearts;

  /// No description provided for @sessionComplete.
  ///
  /// In en, this message translates to:
  /// **'Session Complete!'**
  String get sessionComplete;

  /// No description provided for @thanksForPlayingPandora.
  ///
  /// In en, this message translates to:
  /// **'Thanks for playing Pandora Box!'**
  String get thanksForPlayingPandora;

  /// No description provided for @returnToMenu.
  ///
  /// In en, this message translates to:
  /// **'Return to Menu'**
  String get returnToMenu;

  /// No description provided for @failedToCreateDeck.
  ///
  /// In en, this message translates to:
  /// **'Failed to create deck'**
  String get failedToCreateDeck;

  /// No description provided for @createNewDeck.
  ///
  /// In en, this message translates to:
  /// **'Create New Deck'**
  String get createNewDeck;

  /// No description provided for @deckName.
  ///
  /// In en, this message translates to:
  /// **'Deck Name'**
  String get deckName;

  /// No description provided for @enterDeckName.
  ///
  /// In en, this message translates to:
  /// **'Enter deck name'**
  String get enterDeckName;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @deleteDeck.
  ///
  /// In en, this message translates to:
  /// **'Delete Deck'**
  String get deleteDeck;

  /// No description provided for @deleteDeckConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"? This will delete all questions in this deck.'**
  String deleteDeckConfirm(Object name);

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deckDeleted.
  ///
  /// In en, this message translates to:
  /// **'Deck deleted'**
  String get deckDeleted;

  /// No description provided for @failedToDeleteDeck.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete deck'**
  String get failedToDeleteDeck;

  /// No description provided for @myDecks.
  ///
  /// In en, this message translates to:
  /// **'My Decks'**
  String get myDecks;

  /// No description provided for @noDecksYet.
  ///
  /// In en, this message translates to:
  /// **'No decks yet'**
  String get noDecksYet;

  /// No description provided for @createFirstDeck.
  ///
  /// In en, this message translates to:
  /// **'Create your first custom deck!'**
  String get createFirstDeck;

  /// No description provided for @questionsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} questions'**
  String questionsCount(Object count);

  /// No description provided for @questionCount.
  ///
  /// In en, this message translates to:
  /// **'{count} question'**
  String questionCount(Object count);

  /// No description provided for @questionAdded.
  ///
  /// In en, this message translates to:
  /// **'Question added!'**
  String get questionAdded;

  /// No description provided for @failedToAddQuestion.
  ///
  /// In en, this message translates to:
  /// **'Failed to add question'**
  String get failedToAddQuestion;

  /// No description provided for @editQuestion.
  ///
  /// In en, this message translates to:
  /// **'Edit Question'**
  String get editQuestion;

  /// No description provided for @enterYourQuestion.
  ///
  /// In en, this message translates to:
  /// **'Enter your question'**
  String get enterYourQuestion;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @questionUpdated.
  ///
  /// In en, this message translates to:
  /// **'Question updated!'**
  String get questionUpdated;

  /// No description provided for @failedToUpdateQuestion.
  ///
  /// In en, this message translates to:
  /// **'Failed to update question'**
  String get failedToUpdateQuestion;

  /// No description provided for @deleteQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete Question'**
  String get deleteQuestion;

  /// No description provided for @deleteQuestionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this question?'**
  String get deleteQuestionConfirm;

  /// No description provided for @questionDeleted.
  ///
  /// In en, this message translates to:
  /// **'Question deleted'**
  String get questionDeleted;

  /// No description provided for @failedToDeleteQuestion.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete question'**
  String get failedToDeleteQuestion;

  /// No description provided for @addQuestion.
  ///
  /// In en, this message translates to:
  /// **'Add Question'**
  String get addQuestion;

  /// No description provided for @typeQuestionHere.
  ///
  /// In en, this message translates to:
  /// **'Type your question here...'**
  String get typeQuestionHere;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @noQuestionsYet.
  ///
  /// In en, this message translates to:
  /// **'No questions yet'**
  String get noQuestionsYet;

  /// No description provided for @addFirstQuestion.
  ///
  /// In en, this message translates to:
  /// **'Add your first question!'**
  String get addFirstQuestion;

  /// No description provided for @deckDescLoveTalks.
  ///
  /// In en, this message translates to:
  /// **'Explore romance, chemistry, and connection through heartfelt questions that celebrate your relationship. From \"how we met\" moments to what makes you feel most loved, these cards deepen emotional intimacy.'**
  String get deckDescLoveTalks;

  /// No description provided for @deckDescDeepTalks.
  ///
  /// In en, this message translates to:
  /// **'These cards dive into values, vulnerability, and what it means to grow together. They help partners reflect on independence, communication, and shared purpose.'**
  String get deckDescDeepTalks;

  /// No description provided for @deckDescSpicyTalks.
  ///
  /// In en, this message translates to:
  /// **'Flirty, bold, and intimate — these cards invite couples to explore desire, fantasies, and passion together. Every question is crafted to spark honest, exciting conversations about what turns you on and brings you closer.'**
  String get deckDescSpicyTalks;

  /// No description provided for @deckDescDoYouDareTalks.
  ///
  /// In en, this message translates to:
  /// **'A fearless deck that blends emotional honesty with hot-button topics like trust, religion, money, and personal boundaries — all designed to reveal what really matters to you both. *Note:* Some questions are raw and unfiltered — play with openness, empathy, and respect.'**
  String get deckDescDoYouDareTalks;

  /// No description provided for @deckDescLoveLanguagesTalks.
  ///
  /// In en, this message translates to:
  /// **'Inspired by the five love languages, this deck helps partners express affection in the ways that truly resonate. Discover how words, actions, and gestures make your connection stronger.'**
  String get deckDescLoveLanguagesTalks;

  /// No description provided for @deckDescSillyTalks.
  ///
  /// In en, this message translates to:
  /// **'Pure fun and laughter! These quirky, light-hearted questions uncover your weirdest habits and funniest thoughts. Perfect for friends, family, or couples who don\'t take life too seriously.'**
  String get deckDescSillyTalks;

  /// No description provided for @deckDescCarTalks.
  ///
  /// In en, this message translates to:
  /// **'Perfect for road trips — these cards turn driving time into great conversation. Expect funny, creative, and nostalgic questions about travel, adventure, and quirks.'**
  String get deckDescCarTalks;

  /// No description provided for @deckDescUnpopularOpinions.
  ///
  /// In en, this message translates to:
  /// **'The deck that challenges you to say what everyone thinks but no one admits. From influencer culture to social norms — these cards spark honest debates and surprising perspectives. Perfect for friends with opinions.'**
  String get deckDescUnpopularOpinions;

  /// No description provided for @deckDescPlotTwists.
  ///
  /// In en, this message translates to:
  /// **'This deck throws you right into life\'s funniest and hardest \"what would you do?\" moments. Quick thinking, gut feelings, and laughter guaranteed! Perfect for group nights full of surprises and laughs.'**
  String get deckDescPlotTwists;

  /// No description provided for @deckDescAfterDark.
  ///
  /// In en, this message translates to:
  /// **'Step into the dark side of conversation with questions that send chills down your spine. From creepy coincidences to survival scenarios — perfect for late nights with a thrill.'**
  String get deckDescAfterDark;

  /// No description provided for @deckDescHistoryTalks.
  ///
  /// In en, this message translates to:
  /// **'A nostalgic blend of personal memories and family moments. These questions inspire stories, laughter, and rediscovering your roots. Perfect for family gatherings or cozy evenings.'**
  String get deckDescHistoryTalks;

  /// No description provided for @deckDescTinyTalks.
  ///
  /// In en, this message translates to:
  /// **'Made for parents and their little ones! These simple, playful questions help kids express themselves while parents learn how they think. Perfect for ages 3-9.'**
  String get deckDescTinyTalks;

  /// No description provided for @deckDescGoodOldDays.
  ///
  /// In en, this message translates to:
  /// **'A nostalgic journey through the past — from childhood memories to life\'s changes. These cards inspire stories, laughs, and gratitude. Perfect for grandparents to share memories.'**
  String get deckDescGoodOldDays;

  /// No description provided for @deckDescWouldYouRather.
  ///
  /// In en, this message translates to:
  /// **'A family-friendly version of the classic \"Would you rather...\" game. Filled with fun and imaginative choices that make everyone think, laugh, and defend their choices.'**
  String get deckDescWouldYouRather;

  /// No description provided for @deckDescCozyTalks.
  ///
  /// In en, this message translates to:
  /// **'Warm and easygoing questions that make you feel right at home. They spark comforting chats about small joys, memories, and what makes you smile.'**
  String get deckDescCozyTalks;

  /// No description provided for @deckDescPartyNight.
  ///
  /// In en, this message translates to:
  /// **'Your go-to ice-breaker deck for fun nights with friends. These lively questions spark laughter, stories, and playful debates — from party fails to who\'s the biggest flirt on the dance floor. Perfect for loosening up the mood and keeping the good times rolling.'**
  String get deckDescPartyNight;
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
    'fr',
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
    case 'fr':
      return AppLocalizationsFr();
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
