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
  /// **'Premium Category'**
  String get locked;

  /// No description provided for @lockedMessage.
  ///
  /// In en, this message translates to:
  /// **'This is a premium category. Upgrade to unlock all categories and remove ads!'**
  String get lockedMessage;

  /// No description provided for @previewAvailable.
  ///
  /// In en, this message translates to:
  /// **'Preview: First 5 questions available'**
  String get previewAvailable;

  /// No description provided for @upgradeNow.
  ///
  /// In en, this message translates to:
  /// **'Upgrade Now'**
  String get upgradeNow;

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

  /// No description provided for @getPremium.
  ///
  /// In en, this message translates to:
  /// **'Get Premium'**
  String get getPremium;

  /// No description provided for @premiumTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock Everything'**
  String get premiumTitle;

  /// No description provided for @premiumDescription.
  ///
  /// In en, this message translates to:
  /// **'Get unlimited access to all categories across all modes, remove ads, and enjoy unlimited Pandora sessions.'**
  String get premiumDescription;

  /// No description provided for @premiumPriceMonthly.
  ///
  /// In en, this message translates to:
  /// **'49 DKK/month'**
  String get premiumPriceMonthly;

  /// No description provided for @premiumPriceYearly.
  ///
  /// In en, this message translates to:
  /// **'399 DKK/year'**
  String get premiumPriceYearly;

  /// No description provided for @saveWithYearly.
  ///
  /// In en, this message translates to:
  /// **'Save 189 DKK with yearly!'**
  String get saveWithYearly;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @yearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get yearly;

  /// No description provided for @billedMonthly.
  ///
  /// In en, this message translates to:
  /// **'Billed monthly'**
  String get billedMonthly;

  /// No description provided for @billedYearly.
  ///
  /// In en, this message translates to:
  /// **'Billed annually'**
  String get billedYearly;

  /// No description provided for @premiumFeature1.
  ///
  /// In en, this message translates to:
  /// **'✓ All 21 premium categories unlocked'**
  String get premiumFeature1;

  /// No description provided for @premiumFeature2.
  ///
  /// In en, this message translates to:
  /// **'✓ No ads forever'**
  String get premiumFeature2;

  /// No description provided for @premiumFeature3.
  ///
  /// In en, this message translates to:
  /// **'✓ 75 questions in all categories'**
  String get premiumFeature3;

  /// No description provided for @premiumFeature4.
  ///
  /// In en, this message translates to:
  /// **'✓ Pandora: Unlimited players & questions'**
  String get premiumFeature4;

  /// No description provided for @premiumFeature5.
  ///
  /// In en, this message translates to:
  /// **'✓ Support ongoing development'**
  String get premiumFeature5;

  /// No description provided for @subscribePremium.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to Premium'**
  String get subscribePremium;

  /// No description provided for @subscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscribe;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @subscriptionActivated.
  ///
  /// In en, this message translates to:
  /// **'Premium activated! All categories unlocked.'**
  String get subscriptionActivated;

  /// No description provided for @premiumActivated.
  ///
  /// In en, this message translates to:
  /// **'Premium Activated!'**
  String get premiumActivated;

  /// No description provided for @demoNote.
  ///
  /// In en, this message translates to:
  /// **'Demo: Subscription will reset on app restart'**
  String get demoNote;

  /// No description provided for @freeTier.
  ///
  /// In en, this message translates to:
  /// **'Free Tier'**
  String get freeTier;

  /// No description provided for @freeTierDesc.
  ///
  /// In en, this message translates to:
  /// **'3 categories per mode (30 questions each)\n5-question previews of premium categories\nAds every 7 questions'**
  String get freeTierDesc;

  /// No description provided for @currentPlan.
  ///
  /// In en, this message translates to:
  /// **'Current Plan'**
  String get currentPlan;

  /// No description provided for @limitReached.
  ///
  /// In en, this message translates to:
  /// **'Limit Reached'**
  String get limitReached;

  /// No description provided for @freeCategoryLimit.
  ///
  /// In en, this message translates to:
  /// **'You\'ve reached the 30-question limit for free categories. Upgrade to Premium for unlimited access!'**
  String get freeCategoryLimit;

  /// No description provided for @previewLimit.
  ///
  /// In en, this message translates to:
  /// **'You\'ve seen all 5 preview questions. Upgrade to Premium to continue!'**
  String get previewLimit;

  /// No description provided for @pandoraFreeLimit.
  ///
  /// In en, this message translates to:
  /// **'Free Limit'**
  String get pandoraFreeLimit;

  /// No description provided for @pandoraFreeLimitMessage.
  ///
  /// In en, this message translates to:
  /// **'Free hosts can have max 6 players and 12 questions. Upgrade to Premium for unlimited!'**
  String get pandoraFreeLimitMessage;

  /// No description provided for @pandoraUpgradeMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'ve reached 12 questions. Upgrade to Premium to continue playing!'**
  String get pandoraUpgradeMessage;

  /// No description provided for @pandoraMaxPlayers.
  ///
  /// In en, this message translates to:
  /// **'Maximum 6 players reached (Free limit). Upgrade to Premium for unlimited players!'**
  String get pandoraMaxPlayers;

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
  /// **'Go Ad-Free with Premium'**
  String get goAdFree;

  /// No description provided for @removeAdsForever.
  ///
  /// In en, this message translates to:
  /// **'Remove Ads Forever'**
  String get removeAdsForever;

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
  /// **'49 DKK/month or 399 DKK/year'**
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
  /// **'Sign in to sync your subscription across devices and unlock premium content'**
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

  /// No description provided for @subscriptionStatus.
  ///
  /// In en, this message translates to:
  /// **'Subscription Status'**
  String get subscriptionStatus;

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
  /// **'Each mode has multiple categories with unique question packs. 3 free categories per mode (30 questions each), with 5-question previews of premium categories.'**
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
  /// **'Unlock all 24 categories with Premium:\n\n• Monthly: 49 DKK/month\n• Yearly: 399 DKK/year (save 189 DKK!)\n\n✓ All categories unlocked\n✓ No ads\n✓ Unlimited questions\n✓ Unlimited Pandora sessions'**
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
  /// **'Players join (max 6 free, unlimited premium)'**
  String get pandoraPlayersJoinMax;

  /// No description provided for @pandoraHostSetsTimer.
  ///
  /// In en, this message translates to:
  /// **'Host sets question timer (1-15 min)'**
  String get pandoraHostSetsTimer;

  /// No description provided for @pandoraEveryoneSubmits.
  ///
  /// In en, this message translates to:
  /// **'Everyone submits questions (max 12 free)'**
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
  /// **'Everyone submits questions (min 5, max 12 free)'**
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

  /// No description provided for @createCustomDeck.
  ///
  /// In en, this message translates to:
  /// **'Create Custom Deck'**
  String get createCustomDeck;

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

  /// No description provided for @deckCreated.
  ///
  /// In en, this message translates to:
  /// **'Deck created!'**
  String get deckCreated;

  /// No description provided for @failedToCreateDeck.
  ///
  /// In en, this message translates to:
  /// **'Failed to create deck'**
  String get failedToCreateDeck;

  /// No description provided for @deleteDeck.
  ///
  /// In en, this message translates to:
  /// **'Delete Deck?'**
  String get deleteDeck;

  /// No description provided for @deleteDeckConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{deckName}\"? This will delete all questions in this deck.'**
  String deleteDeckConfirm(Object deckName);

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
  /// **'{count, plural, =0{0 questions} =1{1 question} other{{count} questions}}'**
  String questionCount(int count);

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

  /// No description provided for @deckDescCozyTalks.
  ///
  /// In en, this message translates to:
  /// **'Warm, relaxed conversations perfect for cozy evenings. These questions create comfortable, heartfelt moments of connection.'**
  String get deckDescCozyTalks;

  /// No description provided for @deckDescPartyNight.
  ///
  /// In en, this message translates to:
  /// **'High-energy questions designed for fun group settings. Perfect for parties and social gatherings with friends.'**
  String get deckDescPartyNight;

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
  /// **'Designed for parents and little ones! These simple, playful questions help children express themselves while parents learn how they think. Perfect for ages 3–9.'**
  String get deckDescTinyTalks;

  /// No description provided for @deckDescGoodOldDays.
  ///
  /// In en, this message translates to:
  /// **'Journey back in time with questions about cherished memories, past experiences, and how things used to be. Perfect for all ages.'**
  String get deckDescGoodOldDays;

  /// No description provided for @deckDescWouldYouRather.
  ///
  /// In en, this message translates to:
  /// **'Classic dilemma questions that spark debates and reveal preferences. Choose between two options and discover what matters most.'**
  String get deckDescWouldYouRather;

  /// No description provided for @createNewDeck.
  ///
  /// In en, this message translates to:
  /// **'Create New Deck'**
  String get createNewDeck;

  /// No description provided for @sessionPin.
  ///
  /// In en, this message translates to:
  /// **'Session PIN'**
  String get sessionPin;

  /// No description provided for @joinSession.
  ///
  /// In en, this message translates to:
  /// **'Join Session'**
  String get joinSession;

  /// No description provided for @questionSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Question Submitted'**
  String get questionSubmitted;

  /// No description provided for @sessionCancelled.
  ///
  /// In en, this message translates to:
  /// **'Session Cancelled'**
  String get sessionCancelled;

  /// No description provided for @yourQuestion.
  ///
  /// In en, this message translates to:
  /// **'Your Question'**
  String get yourQuestion;

  /// No description provided for @reactionBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Reaction Breakdown'**
  String get reactionBreakdown;

  /// No description provided for @deckNameHint.
  ///
  /// In en, this message translates to:
  /// **'Deck name'**
  String get deckNameHint;

  /// No description provided for @deckCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Deck created!'**
  String get deckCreatedSuccess;

  /// No description provided for @cancelSession.
  ///
  /// In en, this message translates to:
  /// **'Cancel Session?'**
  String get cancelSession;

  /// No description provided for @cancelSessionConfirm.
  ///
  /// In en, this message translates to:
  /// **'This will cancel the session for all players. Are you sure?'**
  String get cancelSessionConfirm;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yesCancel.
  ///
  /// In en, this message translates to:
  /// **'Yes, Cancel'**
  String get yesCancel;

  /// No description provided for @hostQuestionCollection.
  ///
  /// In en, this message translates to:
  /// **'Host - Question Collection'**
  String get hostQuestionCollection;

  /// No description provided for @questionCollection.
  ///
  /// In en, this message translates to:
  /// **'Question Collection'**
  String get questionCollection;

  /// No description provided for @endSessionButton.
  ///
  /// In en, this message translates to:
  /// **'End Session'**
  String get endSessionButton;

  /// No description provided for @noActiveSubscription.
  ///
  /// In en, this message translates to:
  /// **'No Active Subscription'**
  String get noActiveSubscription;

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'PREMIUM'**
  String get premium;

  /// No description provided for @notEnoughQuestions.
  ///
  /// In en, this message translates to:
  /// **'Not enough questions. Minimum 5 required. (Currently: {count})'**
  String notEnoughQuestions(Object count);

  /// No description provided for @premiumFeatureTitle.
  ///
  /// In en, this message translates to:
  /// **'Premium Feature'**
  String get premiumFeatureTitle;

  /// No description provided for @questionNavigationPremium.
  ///
  /// In en, this message translates to:
  /// **'Question navigation is a premium feature. Subscribe to unlock the ability to jump to any question!'**
  String get questionNavigationPremium;

  /// No description provided for @customDecks.
  ///
  /// In en, this message translates to:
  /// **'Custom Decks'**
  String get customDecks;

  /// No description provided for @noDecksYetMessage.
  ///
  /// In en, this message translates to:
  /// **'No decks yet'**
  String get noDecksYetMessage;

  /// No description provided for @createFirstDeckMessage.
  ///
  /// In en, this message translates to:
  /// **'Tap + to create your first deck'**
  String get createFirstDeckMessage;

  /// No description provided for @signInRequired.
  ///
  /// In en, this message translates to:
  /// **'Sign In Required'**
  String get signInRequired;

  /// No description provided for @signInToUsePersonal.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to use Personal mode and create custom question decks.'**
  String get signInToUsePersonal;

  /// No description provided for @collaborativeQuestionGame.
  ///
  /// In en, this message translates to:
  /// **'Collaborative Question Game'**
  String get collaborativeQuestionGame;

  /// No description provided for @hostPandoraSession.
  ///
  /// In en, this message translates to:
  /// **'Host Pandora Session'**
  String get hostPandoraSession;

  /// No description provided for @joinPandoraGame.
  ///
  /// In en, this message translates to:
  /// **'Join a Game'**
  String get joinPandoraGame;

  /// No description provided for @yourDisplayName.
  ///
  /// In en, this message translates to:
  /// **'Your Display Name'**
  String get yourDisplayName;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @selectQuestion.
  ///
  /// In en, this message translates to:
  /// **'Select Question'**
  String get selectQuestion;

  /// No description provided for @joinTime.
  ///
  /// In en, this message translates to:
  /// **'Time to Join'**
  String get joinTime;

  /// No description provided for @participants.
  ///
  /// In en, this message translates to:
  /// **'Participants'**
  String get participants;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @needAtLeastPlayers.
  ///
  /// In en, this message translates to:
  /// **'Need at least 2 players ({current}/2)'**
  String needAtLeastPlayers(int current);

  /// No description provided for @continueToTimerSetup.
  ///
  /// In en, this message translates to:
  /// **'Continue to Timer Setup'**
  String get continueToTimerSetup;

  /// No description provided for @setQuestionTimer.
  ///
  /// In en, this message translates to:
  /// **'Set Question Timer'**
  String get setQuestionTimer;

  /// No description provided for @questionCollectionTime.
  ///
  /// In en, this message translates to:
  /// **'Question Collection Time'**
  String get questionCollectionTime;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @sessionWillEnd.
  ///
  /// In en, this message translates to:
  /// **'Session will end automatically if you don\'t continue within 5 minutes'**
  String get sessionWillEnd;

  /// No description provided for @startQuestionCollection.
  ///
  /// In en, this message translates to:
  /// **'Start Question Collection'**
  String get startQuestionCollection;

  /// No description provided for @questionsSubmitted.
  ///
  /// In en, this message translates to:
  /// **'{count} questions submitted'**
  String questionsSubmitted(int count);

  /// No description provided for @writeQuestionHere.
  ///
  /// In en, this message translates to:
  /// **'Write your question here...'**
  String get writeQuestionHere;

  /// No description provided for @whoIsThisFor.
  ///
  /// In en, this message translates to:
  /// **'Who is this for?'**
  String get whoIsThisFor;

  /// No description provided for @everyone.
  ///
  /// In en, this message translates to:
  /// **'Everyone'**
  String get everyone;

  /// No description provided for @specific.
  ///
  /// In en, this message translates to:
  /// **'Specific'**
  String get specific;

  /// No description provided for @submitQuestion.
  ///
  /// In en, this message translates to:
  /// **'Submit Question'**
  String get submitQuestion;

  /// No description provided for @needMoreQuestions.
  ///
  /// In en, this message translates to:
  /// **'Need {count} more questions'**
  String needMoreQuestions(int count);

  /// No description provided for @startGame.
  ///
  /// In en, this message translates to:
  /// **'Start Game'**
  String get startGame;

  /// No description provided for @selectPlayer.
  ///
  /// In en, this message translates to:
  /// **'Select a player'**
  String get selectPlayer;

  /// No description provided for @unsubscribe.
  ///
  /// In en, this message translates to:
  /// **'Unsubscribe'**
  String get unsubscribe;

  /// No description provided for @unsubscribeConfirm.
  ///
  /// In en, this message translates to:
  /// **'Cancel Premium Subscription?'**
  String get unsubscribeConfirm;

  /// No description provided for @unsubscribeWarning.
  ///
  /// In en, this message translates to:
  /// **'You will lose access to all premium features including unlimited questions, all categories, ad-free experience, and unlimited Pandora players. You can resubscribe anytime.'**
  String get unsubscribeWarning;

  /// No description provided for @yesUnsubscribe.
  ///
  /// In en, this message translates to:
  /// **'Yes, Unsubscribe'**
  String get yesUnsubscribe;

  /// No description provided for @unsubscribeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Successfully unsubscribed. Premium features have been disabled.'**
  String get unsubscribeSuccess;

  /// No description provided for @unsubscribeError.
  ///
  /// In en, this message translates to:
  /// **'Failed to unsubscribe'**
  String get unsubscribeError;

  /// No description provided for @questions.
  ///
  /// In en, this message translates to:
  /// **'questions'**
  String get questions;

  /// No description provided for @preview.
  ///
  /// In en, this message translates to:
  /// **'preview'**
  String get preview;

  /// No description provided for @userId.
  ///
  /// In en, this message translates to:
  /// **'User ID'**
  String get userId;

  /// No description provided for @subscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get subscription;

  /// No description provided for @questionsCount75.
  ///
  /// In en, this message translates to:
  /// **'75 questions'**
  String get questionsCount75;

  /// No description provided for @questionsCount30.
  ///
  /// In en, this message translates to:
  /// **'30 questions'**
  String get questionsCount30;

  /// No description provided for @questionsCount5Preview.
  ///
  /// In en, this message translates to:
  /// **'5 questions preview'**
  String get questionsCount5Preview;

  /// No description provided for @unlockFullDeck.
  ///
  /// In en, this message translates to:
  /// **'Unlock 75 questions'**
  String get unlockFullDeck;

  /// No description provided for @renameDeck.
  ///
  /// In en, this message translates to:
  /// **'Rename Deck'**
  String get renameDeck;

  /// No description provided for @deckRenamed.
  ///
  /// In en, this message translates to:
  /// **'Deck renamed successfully'**
  String get deckRenamed;

  /// No description provided for @failedToRenameDeck.
  ///
  /// In en, this message translates to:
  /// **'Failed to rename deck'**
  String get failedToRenameDeck;

  /// No description provided for @shuffleQuestions.
  ///
  /// In en, this message translates to:
  /// **'Shuffle Questions'**
  String get shuffleQuestions;

  /// No description provided for @resetOrder.
  ///
  /// In en, this message translates to:
  /// **'Reset Order'**
  String get resetOrder;

  /// No description provided for @questionsShuffled.
  ///
  /// In en, this message translates to:
  /// **'Questions shuffled!'**
  String get questionsShuffled;

  /// No description provided for @orderReset.
  ///
  /// In en, this message translates to:
  /// **'Order reset to original'**
  String get orderReset;

  /// No description provided for @readyToPlay.
  ///
  /// In en, this message translates to:
  /// **'Ready to play'**
  String get readyToPlay;

  /// No description provided for @longPressReorder.
  ///
  /// In en, this message translates to:
  /// **'Long press and drag to reorder questions'**
  String get longPressReorder;

  /// No description provided for @noFavoritesYet.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get noFavoritesYet;

  /// No description provided for @heartQuestionsDuringGameplay.
  ///
  /// In en, this message translates to:
  /// **'Tap the heart ❤️ on question cards during gameplay to save them here!'**
  String get heartQuestionsDuringGameplay;

  /// No description provided for @addAtLeastQuestions.
  ///
  /// In en, this message translates to:
  /// **'Add at least {count} questions to start playing!'**
  String addAtLeastQuestions(Object count);

  /// No description provided for @heartQuestionsInfo.
  ///
  /// In en, this message translates to:
  /// **'Heart questions during gameplay to add them to your Favorites!'**
  String get heartQuestionsInfo;

  /// No description provided for @addAtLeastQuestionsToPlay.
  ///
  /// In en, this message translates to:
  /// **'Add at least {count} questions to play this deck'**
  String addAtLeastQuestionsToPlay(Object count);

  /// No description provided for @removeFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get removeFromFavorites;

  /// No description provided for @unlockEverything.
  ///
  /// In en, this message translates to:
  /// **'Unlock Everything'**
  String get unlockEverything;

  /// No description provided for @premiumSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get unlimited access to all categories, remove ads forever, and unlock premium features'**
  String get premiumSubtitle;

  /// No description provided for @save32Percent.
  ///
  /// In en, this message translates to:
  /// **'SAVE 32%'**
  String get save32Percent;

  /// No description provided for @priceMonthly.
  ///
  /// In en, this message translates to:
  /// **'49 DKK/month'**
  String get priceMonthly;

  /// No description provided for @priceYearly.
  ///
  /// In en, this message translates to:
  /// **'399 DKK/year'**
  String get priceYearly;

  /// No description provided for @billedAnnually.
  ///
  /// In en, this message translates to:
  /// **'Billed annually'**
  String get billedAnnually;

  /// No description provided for @equivalentMonthly.
  ///
  /// In en, this message translates to:
  /// **'Only 33 DKK/month'**
  String get equivalentMonthly;

  /// No description provided for @feature24Categories.
  ///
  /// In en, this message translates to:
  /// **'24+ premium categories unlocked across all modes'**
  String get feature24Categories;

  /// No description provided for @feature75Questions.
  ///
  /// In en, this message translates to:
  /// **'75 questions per category (vs 30 in free tier)'**
  String get feature75Questions;

  /// No description provided for @featureNoAds.
  ///
  /// In en, this message translates to:
  /// **'No ads forever - uninterrupted gameplay'**
  String get featureNoAds;

  /// No description provided for @featureUnlimitedPlayers.
  ///
  /// In en, this message translates to:
  /// **'Pandora mode: Unlimited players & questions'**
  String get featureUnlimitedPlayers;

  /// No description provided for @featureQuestionNavigation.
  ///
  /// In en, this message translates to:
  /// **'Navigate & jump to any question during play'**
  String get featureQuestionNavigation;

  /// No description provided for @featureSupportDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Support ongoing development & new features'**
  String get featureSupportDevelopment;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @premiumActivatedMessage.
  ///
  /// In en, this message translates to:
  /// **'Premium activated! All categories unlocked.'**
  String get premiumActivatedMessage;

  /// No description provided for @featurePersonalDecks.
  ///
  /// In en, this message translates to:
  /// **'Personal mode: Create unlimited custom decks with your own questions'**
  String get featurePersonalDecks;

  /// No description provided for @premiumPersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal mode with custom decks is a premium feature. Upgrade to Premium to create and play your own custom question decks!'**
  String get premiumPersonal;

  /// No description provided for @deleteDeckConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{deckName}\"? This will delete all questions in this deck.'**
  String deleteDeckConfirmation(String deckName);

  /// No description provided for @needMore.
  ///
  /// In en, this message translates to:
  /// **'Need {count}'**
  String needMore(int count);

  /// No description provided for @editQuestions.
  ///
  /// In en, this message translates to:
  /// **'Edit Questions'**
  String get editQuestions;

  /// No description provided for @addMore.
  ///
  /// In en, this message translates to:
  /// **'Add More'**
  String get addMore;

  /// No description provided for @useMyConnectEmail.
  ///
  /// In en, this message translates to:
  /// **'Use my Connect email: {email}'**
  String useMyConnectEmail(String email);

  /// No description provided for @freemiumPlayerLimit.
  ///
  /// In en, this message translates to:
  /// **'Free users can have max 6 players. Upgrade to Premium for unlimited players!'**
  String get freemiumPlayerLimit;

  /// No description provided for @freemiumQuestionLimit.
  ///
  /// In en, this message translates to:
  /// **'Free users can submit max 12 questions. Upgrade to Premium for unlimited questions!'**
  String get freemiumQuestionLimit;

  /// No description provided for @yourQuestions.
  ///
  /// In en, this message translates to:
  /// **'Your questions'**
  String get yourQuestions;

  /// No description provided for @waitingForHost.
  ///
  /// In en, this message translates to:
  /// **'Waiting for host... ({count} players)'**
  String waitingForHost(int count);

  /// No description provided for @upgradeForUnlimitedPlayers.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium for Unlimited Players'**
  String get upgradeForUnlimitedPlayers;

  /// No description provided for @kickPlayer.
  ///
  /// In en, this message translates to:
  /// **'Kick Player'**
  String get kickPlayer;

  /// No description provided for @kickPlayerConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to kick {playerName}?'**
  String kickPlayerConfirm(String playerName);

  /// No description provided for @kick.
  ///
  /// In en, this message translates to:
  /// **'Kick'**
  String get kick;

  /// No description provided for @playerKicked.
  ///
  /// In en, this message translates to:
  /// **'{playerName} has been kicked'**
  String playerKicked(String playerName);

  /// No description provided for @failedToKickPlayer.
  ///
  /// In en, this message translates to:
  /// **'Failed to kick player'**
  String get failedToKickPlayer;

  /// No description provided for @cancelSessionForAll.
  ///
  /// In en, this message translates to:
  /// **'This will cancel the session for all players. Are you sure?'**
  String get cancelSessionForAll;

  /// No description provided for @youWereKicked.
  ///
  /// In en, this message translates to:
  /// **'You were removed from the session'**
  String get youWereKicked;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @loginRequiredForPandora.
  ///
  /// In en, this message translates to:
  /// **'Login required to play Pandora'**
  String get loginRequiredForPandora;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginRequiredNote.
  ///
  /// In en, this message translates to:
  /// **'Login required to play Pandora (track players properly)'**
  String get loginRequiredNote;
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
