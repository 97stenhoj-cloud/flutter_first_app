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
  String get locked => 'Premium Category';

  @override
  String get lockedMessage =>
      'This is a premium category. Upgrade to unlock all categories and remove ads!';

  @override
  String get previewAvailable => 'Preview: First 5 questions available';

  @override
  String get upgradeNow => 'Upgrade Now';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Maybe Later';

  @override
  String get getPremium => 'Get Premium';

  @override
  String get premiumTitle => 'Unlock Everything';

  @override
  String get premiumDescription =>
      'Get unlimited access to all categories across all modes, remove ads, and enjoy unlimited Pandora sessions.';

  @override
  String get premiumPriceMonthly => '49 DKK/month';

  @override
  String get premiumPriceYearly => '399 DKK/year';

  @override
  String get saveWithYearly => 'Save 189 DKK with yearly!';

  @override
  String get monthly => 'Monthly';

  @override
  String get yearly => 'Yearly';

  @override
  String get billedMonthly => 'Billed monthly';

  @override
  String get billedYearly => 'Billed annually';

  @override
  String get premiumFeature1 => '✓ All 21 premium categories unlocked';

  @override
  String get premiumFeature2 => '✓ No ads forever';

  @override
  String get premiumFeature3 => '✓ Unlimited questions in all categories';

  @override
  String get premiumFeature4 => '✓ Pandora: Unlimited players & questions';

  @override
  String get premiumFeature5 => '✓ Support ongoing development';

  @override
  String get subscribePremium => 'Subscribe to Premium';

  @override
  String get subscribe => 'Subscribe';

  @override
  String get cancel => 'Cancel';

  @override
  String get subscriptionActivated =>
      'Premium activated! All categories unlocked.';

  @override
  String get premiumActivated => 'Premium Activated!';

  @override
  String get demoNote => 'Demo: Subscription will reset on app restart';

  @override
  String get freeTier => 'Free Tier';

  @override
  String get freeTierDesc =>
      '3 categories per mode (30 questions each)\n5-question previews of premium categories\nAds every 7 questions';

  @override
  String get currentPlan => 'Current Plan';

  @override
  String get limitReached => 'Limit Reached';

  @override
  String get freeCategoryLimit =>
      'You\'ve reached the 30-question limit for free categories. Upgrade to Premium for unlimited access!';

  @override
  String get previewLimit =>
      'You\'ve seen all 5 preview questions. Upgrade to Premium to continue!';

  @override
  String get pandoraFreeLimit => 'Free Limit';

  @override
  String get pandoraFreeLimitMessage =>
      'Free hosts can have max 6 players and 12 questions. Upgrade to Premium for unlimited!';

  @override
  String get pandoraUpgradeMessage =>
      'You\'ve reached 12 questions. Upgrade to Premium to continue playing!';

  @override
  String get pandoraMaxPlayers =>
      'Maximum 6 players reached (Free limit). Upgrade to Premium for unlimited players!';

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
  String get goAdFree => 'Go Ad-Free with Premium';

  @override
  String get removeAdsForever => 'Remove Ads Forever';

  @override
  String get adNotReady => 'Ad not ready. Continuing without ad.';

  @override
  String get adLoadingContinue => 'Ad Loading... Continue';

  @override
  String get pricePerMonth => '49 DKK/month or 399 DKK/year';

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
      'Sign in to sync your subscription across devices and unlock premium content';

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
  String get subscriptionStatus => 'Subscription Status';

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
      'Each mode has multiple categories with unique question packs. 3 free categories per mode (30 questions each), with 5-question previews of premium categories.';

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
      'Unlock all 24 categories with Premium:\n\n• Monthly: 49 DKK/month\n• Yearly: 399 DKK/year (save 189 DKK!)\n\n✓ All categories unlocked\n✓ No ads\n✓ Unlimited questions\n✓ Unlimited Pandora sessions';

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
  String get favorites => 'Favorites';

  @override
  String get pandoraHostCreatePin => 'Host creates session and shares PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'Players join (max 6 free, unlimited premium)';

  @override
  String get pandoraHostSetsTimer => 'Host sets question timer (1-15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Everyone submits questions (max 12 free)';

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
  String get everyoneSubmitsMin5 =>
      'Everyone submits questions (min 5, max 12 free)';

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
  String get createCustomDeck => 'Create Custom Deck';

  @override
  String get deckName => 'Deck Name';

  @override
  String get enterDeckName => 'Enter deck name';

  @override
  String get create => 'Create';

  @override
  String get deckCreated => 'Deck created!';

  @override
  String get failedToCreateDeck => 'Failed to create deck';

  @override
  String get deleteDeck => 'Delete Deck?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Are you sure you want to delete \"$deckName\"? This will delete all questions in this deck.';
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

  @override
  String get deckDescLoveTalks =>
      'Explore romance, chemistry, and connection through heartfelt questions that celebrate your relationship. From \"how we met\" moments to what makes you feel most loved, these cards deepen emotional intimacy.';

  @override
  String get deckDescDeepTalks =>
      'These cards dive into values, vulnerability, and what it means to grow together. They help partners reflect on independence, communication, and shared purpose.';

  @override
  String get deckDescSpicyTalks =>
      'Flirty, bold, and intimate — these cards invite couples to explore desire, fantasies, and passion together. Every question is crafted to spark honest, exciting conversations about what turns you on and brings you closer.';

  @override
  String get deckDescDoYouDareTalks =>
      'A fearless deck that blends emotional honesty with hot-button topics like trust, religion, money, and personal boundaries — all designed to reveal what really matters to you both. *Note:* Some questions are raw and unfiltered — play with openness, empathy, and respect.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspired by the five love languages, this deck helps partners express affection in the ways that truly resonate. Discover how words, actions, and gestures make your connection stronger.';

  @override
  String get deckDescSillyTalks =>
      'Pure fun and laughter! These quirky, light-hearted questions uncover your weirdest habits and funniest thoughts. Perfect for friends, family, or couples who don\'t take life too seriously.';

  @override
  String get deckDescCarTalks =>
      'Perfect for road trips — these cards turn driving time into great conversation. Expect funny, creative, and nostalgic questions about travel, adventure, and quirks.';

  @override
  String get deckDescCozyTalks =>
      'Warm, relaxed conversations perfect for cozy evenings. These questions create comfortable, heartfelt moments of connection.';

  @override
  String get deckDescPartyNight =>
      'High-energy questions designed for fun group settings. Perfect for parties and social gatherings with friends.';

  @override
  String get deckDescUnpopularOpinions =>
      'The deck that challenges you to say what everyone thinks but no one admits. From influencer culture to social norms — these cards spark honest debates and surprising perspectives. Perfect for friends with opinions.';

  @override
  String get deckDescPlotTwists =>
      'This deck throws you right into life\'s funniest and hardest \"what would you do?\" moments. Quick thinking, gut feelings, and laughter guaranteed! Perfect for group nights full of surprises and laughs.';

  @override
  String get deckDescAfterDark =>
      'Step into the dark side of conversation with questions that send chills down your spine. From creepy coincidences to survival scenarios — perfect for late nights with a thrill.';

  @override
  String get deckDescHistoryTalks =>
      'A nostalgic blend of personal memories and family moments. These questions inspire stories, laughter, and rediscovering your roots. Perfect for family gatherings or cozy evenings.';

  @override
  String get deckDescTinyTalks =>
      'Designed for parents and little ones! These simple, playful questions help children express themselves while parents learn how they think. Perfect for ages 3–9.';

  @override
  String get deckDescGoodOldDays =>
      'Journey back in time with questions about cherished memories, past experiences, and how things used to be. Perfect for all ages.';

  @override
  String get deckDescWouldYouRather =>
      'Classic dilemma questions that spark debates and reveal preferences. Choose between two options and discover what matters most.';

  @override
  String get createNewDeck => 'Create New Deck';

  @override
  String get sessionPin => 'Session PIN';

  @override
  String get joinSession => 'Join Session';

  @override
  String get questionSubmitted => 'Question Submitted';

  @override
  String get sessionCancelled => 'Session Cancelled';

  @override
  String get yourQuestion => 'Your Question';

  @override
  String get reactionBreakdown => 'Reaction Breakdown';

  @override
  String get deckNameHint => 'Deck name';

  @override
  String get deckCreatedSuccess => 'Deck created!';

  @override
  String get cancelSession => 'Cancel Session?';

  @override
  String get cancelSessionConfirm =>
      'This will cancel the session for all players. Are you sure?';

  @override
  String get no => 'No';

  @override
  String get yesCancel => 'Yes, Cancel';

  @override
  String get hostQuestionCollection => 'Host - Question Collection';

  @override
  String get questionCollection => 'Question Collection';

  @override
  String get endSessionButton => 'End Session';

  @override
  String get noActiveSubscription => 'No Active Subscription';

  @override
  String get premium => 'Premium';

  @override
  String notEnoughQuestions(Object count) {
    return 'Not enough questions. Minimum 5 required. (Currently: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Premium Feature';

  @override
  String get questionNavigationPremium =>
      'Question navigation is a premium feature. Subscribe to unlock the ability to jump to any question!';

  @override
  String get customDecks => 'Custom Decks';

  @override
  String get noDecksYetMessage => 'No decks yet';

  @override
  String get createFirstDeckMessage => 'Tap + to create your first deck';

  @override
  String get signInRequired => 'Sign In Required';

  @override
  String get signInToUsePersonal =>
      'Please sign in to use Personal mode and create custom question decks.';

  @override
  String get collaborativeQuestionGame => 'Collaborative Question Game';

  @override
  String get hostPandoraSession => 'Host Pandora Session';

  @override
  String get joinPandoraGame => 'Join a Game';

  @override
  String get yourDisplayName => 'Your Display Name';

  @override
  String get enterYourName => 'Enter your name';

  @override
  String get selectQuestion => 'Select Question';

  @override
  String get joinTime => 'Time to Join';

  @override
  String get participants => 'Participants';

  @override
  String get loading => 'Loading...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Need at least 2 players ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Continue to Timer Setup';

  @override
  String get setQuestionTimer => 'Set Question Timer';

  @override
  String get questionCollectionTime => 'Question Collection Time';

  @override
  String get minutes => 'minutes';

  @override
  String get sessionWillEnd =>
      'Session will end automatically if you don\'t continue within 5 minutes';

  @override
  String get startQuestionCollection => 'Start Question Collection';

  @override
  String questionsSubmitted(int count) {
    return '$count questions submitted';
  }

  @override
  String get writeQuestionHere => 'Write your question here...';

  @override
  String get whoIsThisFor => 'Who is this for?';

  @override
  String get everyone => 'Everyone';

  @override
  String get specific => 'Specific';

  @override
  String get submitQuestion => 'Submit Question';

  @override
  String needMoreQuestions(int count) {
    return 'Need $count more questions';
  }

  @override
  String get startGame => 'Start Game';

  @override
  String get selectPlayer => 'Select a player';
}
