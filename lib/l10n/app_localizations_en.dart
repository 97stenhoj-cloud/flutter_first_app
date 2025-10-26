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

  @override
  String get adNotReady => 'Ad not ready. Continuing without ad.';

  @override
  String get adLoadingContinue => 'Ad Loading... Continue';

  @override
  String get pricePerMonth => '59 DKK/month';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'No questions found for $category in $mode mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Error loading questions. Please check your connection.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Failed to load questions: $error';
  }

  @override
  String get madeForWife => 'Made for my beautiful wife';

  @override
  String get otiLia => 'Otilia Stenhøj';

  @override
  String get withLoveAndConversations => 'With love and conversations';

  @override
  String get howManyPlayers => 'How many players?';

  @override
  String get players => 'Players';

  @override
  String get continueButton => 'Continue';

  @override
  String get language => 'Language';

  @override
  String languageChanged(Object language) {
    return 'Language changed to $language';
  }

  @override
  String get profile => 'Profile';

  @override
  String get signOut => 'Sign Out';

  @override
  String get notSignedIn => 'Not Signed In';

  @override
  String get signInSignUp => 'Sign In / Sign Up';

  @override
  String get signInToSync =>
      'Sign in to sync your subscriptions across devices and unlock premium content';

  @override
  String get signOutConfirm => 'Are you sure you want to sign out?';

  @override
  String get signedOutSuccess => 'Signed out successfully';

  @override
  String get accountInformation => 'Account Information';

  @override
  String get email => 'Email';

  @override
  String get memberSince => 'Member Since';

  @override
  String get notAvailable => 'Not available';

  @override
  String get unknown => 'Unknown';

  @override
  String get activeSubscriptions => 'Active Subscriptions';

  @override
  String bundlesUnlocked(Object count, Object plural) {
    return '$count Bundle$plural Unlocked';
  }

  @override
  String bundle(Object name) {
    return '$name Bundle';
  }

  @override
  String get premiumMember => 'Premium Member';

  @override
  String get freeAccount => 'Free Account';

  @override
  String get welcomeToConnect => 'Welcome to Connect!';

  @override
  String get continueWithApple => 'Continue with Apple';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get skipForNow => 'Skip for now';

  @override
  String get byContining =>
      'By continuing, you agree to our Terms of Service and Privacy Policy';

  @override
  String get googleSignInFailed => 'Google Sign In failed. Please try again.';

  @override
  String get appleSignInFailed => 'Apple Sign In failed. Please try again.';

  @override
  String get noCategoriesFound => 'No categories found';

  @override
  String selectBundlePlural(Object plural) {
    return 'Select the category bundle$plural you want to unlock';
  }

  @override
  String get getAccessAllBundles =>
      'Get access to all premium categories in all 3 bundles!';

  @override
  String subscriptionActivatedFull(Object bundles) {
    return 'Subscription activated! $bundles unlocked.';
  }

  @override
  String get aboutCredits => 'About / Credits';

  @override
  String get welcomeBack => 'Welcome Back!';

  @override
  String get createAccount => 'Create Account';

  @override
  String get displayName => 'Display Name';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get dontHaveAccount => 'Don\'t have an account? Sign Up';

  @override
  String get alreadyHaveAccount => 'Already have an account? Sign In';

  @override
  String get chooseYourMode => '1. Choose Your Mode';

  @override
  String get chooseYourModeDesc =>
      'Select from three conversation styles:\n\n• Family - Warm, wholesome conversations perfect for all ages\n• Couple - Intimate and romantic questions to deepen your connection\n• Friends - Fun and entertaining topics for your squad';

  @override
  String get pickCategory => '2. Pick a Category';

  @override
  String get pickCategoryDesc =>
      'Each mode has multiple categories with unique question packs. Free categories are unlocked, while premium categories require a subscription.';

  @override
  String get startTalking => '3. Start Talking';

  @override
  String get startTalkingDesc =>
      'Questions appear full screen. Take turns reading and answering them honestly. There are no wrong answers - the goal is meaningful conversation!';

  @override
  String get navigateQuestions => '4. Navigate Questions';

  @override
  String get navigateQuestionsDesc =>
      '• Swipe right or tap \"Next\" for the next question\n• Swipe left or tap \"Previous\" to revisit questions\n• Tap the home button to return to the main menu anytime';

  @override
  String get premiumFeatures => '5. Premium Features';

  @override
  String get premiumFeaturesDesc =>
      'Unlock exclusive question categories with a subscription:\n\n• 1 Bundle (4 categories) - 59 DKK/month\n• 2 Bundles (8 categories) - 109 DKK/month\n• 3 Bundles (12 categories) - 149 DKK/month';

  @override
  String get proTips => 'Pro Tips';

  @override
  String get proTipsDesc =>
      '• Create a comfortable, distraction-free environment\n• Listen actively and be present\n• Share honestly and encourage others to do the same\n• Respect boundaries - skip questions if needed\n• Have fun and enjoy connecting!';

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

  @override
  String get thanksForPlaying => 'Thanks for Playing!';

  @override
  String get hopeYouHadFun => 'Hope you had fun! 🎉';

  @override
  String get backToMenu => 'Back to Menu';

  @override
  String get leaveGame => 'Leave Game?';

  @override
  String get leaveGameMessage =>
      'Are you sure you want to leave? The game will continue for other players.';

  @override
  String get leave => 'Leave';

  @override
  String get noQuestionsAvailable => 'No questions available';

  @override
  String get showLess => 'Show Less';

  @override
  String get readMore => 'Read More';

  @override
  String get tapToPlay => 'Tap to Play';

  @override
  String get coupleBundle => 'Couple Bundle';

  @override
  String get friendsBundle => 'Friends Bundle';

  @override
  String get familyBundle => 'Family Bundle';

  @override
  String get favorites => 'Favorites';

  @override
  String get pandoraHostCreatePin => 'Host creates session and shares PIN';

  @override
  String get pandoraPlayersJoinMax => 'Players join (max 15 min)';

  @override
  String get pandoraHostSetsTimer => 'Host sets question timer (1-15 min)';

  @override
  String get pandoraEveryoneSubmits => 'Everyone submits questions';

  @override
  String get pandoraHostControls => 'Host controls game progression';

  @override
  String get pandoraQuestionsDeleted => 'Questions deleted after game';

  @override
  String get pandoraHost => 'Host';

  @override
  String get pandoraJoinGame => 'Join Game';

  @override
  String get pandoraPandoraBox => 'Pandora Box';

  @override
  String get pleaseEnterName => 'Please enter your name';

  @override
  String get hostSuffix => '(Host)';

  @override
  String get playersJoinWithNames => 'Players join with their names';

  @override
  String get everyoneSubmitsMin5 => 'Everyone submits questions (min 5)';

  @override
  String get createSession => 'Create Session';

  @override
  String get creating => 'Creating...';

  @override
  String get yourName => 'Your Name';

  @override
  String get enterDisplayName => 'Enter your display name';

  @override
  String get howItWorks => 'How It Works';

  @override
  String get pinCopied => 'PIN copied to clipboard!';

  @override
  String get endSession => 'End Session?';

  @override
  String get endSessionConfirm =>
      'Are you sure you want to end this Pandora session?';

  @override
  String get end => 'End';

  @override
  String get sessionPin => 'Session PIN';

  @override
  String get sharePin => 'Share this PIN with players';

  @override
  String get waitingForPlayers => 'Waiting for players...';

  @override
  String get startGame => 'Start Game';

  @override
  String get lobby => 'Lobby';

  @override
  String get hostLabel => ' (Host)';

  @override
  String get selectTimer => 'Select Timer';

  @override
  String get timerQuestion =>
      'How long should players have to submit questions?';

  @override
  String get minutes => 'minutes';

  @override
  String get startCollectingQuestions => 'Start Collecting Questions';

  @override
  String get sessionCancelled => 'Session cancelled';

  @override
  String get questionCannotBeEmpty => 'Question cannot be empty';

  @override
  String get questionSubmitted => 'Question submitted!';

  @override
  String get failedToSubmit => 'Failed to submit question';

  @override
  String notEnoughQuestions(Object count) {
    return 'Not enough questions. Minimum 5 required. (Currently: $count)';
  }

  @override
  String get submitQuestions => 'Submit Questions';

  @override
  String get submitMinimum5 => 'Submit at least 5 questions to start the game';

  @override
  String get yourQuestion => 'Your Question';

  @override
  String get enterQuestionHere => 'Enter your question here...';

  @override
  String get forEveryone => 'For Everyone';

  @override
  String get forSpecificPerson => 'For Specific Person';

  @override
  String get submit => 'Submit';

  @override
  String questionsRemaining(Object count) {
    return '$count questions remaining';
  }

  @override
  String questionRemaining(Object count) {
    return '$count question remaining';
  }

  @override
  String get startGameExclamation => 'Start Game!';

  @override
  String get cancelSession => 'Cancel Session';

  @override
  String get timeRemaining => 'Time Remaining';

  @override
  String get pleaseEnterPin => 'Please enter a PIN';

  @override
  String get sessionNotFound => 'Session not found';

  @override
  String get sessionEnded => 'Session has ended';

  @override
  String get sessionStarted => 'Session has already started';

  @override
  String get failedToJoin => 'Failed to join session';

  @override
  String get joinSession => 'Join Session';

  @override
  String get joining => 'Joining...';

  @override
  String get enterPin => 'Enter 6-digit PIN';

  @override
  String get join => 'Join';

  @override
  String get reactionBreakdown => 'Reaction Breakdown';

  @override
  String get laugh => 'Laugh';

  @override
  String get shock => 'Shock';

  @override
  String get heart => 'Heart';

  @override
  String get fire => 'Fire';

  @override
  String get mostLaughs => 'Most Laughs';

  @override
  String get mostShocked => 'Most Shocked';

  @override
  String get mostHearts => 'Most Hearts';

  @override
  String get sessionComplete => 'Session Complete!';

  @override
  String get thanksForPlayingPandora => 'Thanks for playing Pandora Box!';

  @override
  String get returnToMenu => 'Return to Menu';

  @override
  String get failedToCreateDeck => 'Failed to create deck';

  @override
  String get createNewDeck => 'Create New Deck';

  @override
  String get deckName => 'Deck Name';

  @override
  String get enterDeckName => 'Enter deck name';

  @override
  String get create => 'Create';

  @override
  String get deleteDeck => 'Delete Deck';

  @override
  String deleteDeckConfirm(Object name) {
    return 'Are you sure you want to delete \"$name\"? This will delete all questions in this deck.';
  }

  @override
  String get delete => 'Delete';

  @override
  String get deckDeleted => 'Deck deleted';

  @override
  String get failedToDeleteDeck => 'Failed to delete deck';

  @override
  String get myDecks => 'My Decks';

  @override
  String get noDecksYet => 'No decks yet';

  @override
  String get createFirstDeck => 'Create your first custom deck!';

  @override
  String questionsCount(Object count) {
    return '$count questions';
  }

  @override
  String questionCount(Object count) {
    return '$count question';
  }

  @override
  String get questionAdded => 'Question added!';

  @override
  String get failedToAddQuestion => 'Failed to add question';

  @override
  String get editQuestion => 'Edit Question';

  @override
  String get enterYourQuestion => 'Enter your question';

  @override
  String get save => 'Save';

  @override
  String get questionUpdated => 'Question updated!';

  @override
  String get failedToUpdateQuestion => 'Failed to update question';

  @override
  String get deleteQuestion => 'Delete Question';

  @override
  String get deleteQuestionConfirm =>
      'Are you sure you want to delete this question?';

  @override
  String get questionDeleted => 'Question deleted';

  @override
  String get failedToDeleteQuestion => 'Failed to delete question';

  @override
  String get addQuestion => 'Add Question';

  @override
  String get typeQuestionHere => 'Type your question here...';

  @override
  String get add => 'Add';

  @override
  String get noQuestionsYet => 'No questions yet';

  @override
  String get addFirstQuestion => 'Add your first question!';
}
