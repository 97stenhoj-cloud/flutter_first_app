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
  String get premiumPriceMonthly => '€6.99/month';

  @override
  String get premiumPriceYearly => '€59.99/year';

  @override
  String get saveWithYearly => 'Save €23.89 with yearly!';

  @override
  String get monthly => 'Monthly';

  @override
  String get yearly => 'Yearly';

  @override
  String get billedMonthly => 'Billed monthly';

  @override
  String get billedYearly => 'Billed annually';

  @override
  String get premiumFeature1 => 'Everything in Basic';

  @override
  String get premiumFeature2 => '🔥 Spark Mode: AI-powered questions';

  @override
  String get premiumFeature3 => '150 AI questions per month';

  @override
  String get premiumFeature4 => 'Generate 5-25 questions at once';

  @override
  String get premiumFeature5 => 'Custom sliders (Energy, Depth, Spice)';

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
  String get pricePerMonth => '€6.99/month or €59.99/year';

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
      'Select from five unique conversation experiences:\n\n• Couple - Intimate questions to deepen your romantic connection\n• Friends - Fun and engaging topics perfect for your squad\n• Family - Warm, wholesome conversations for all ages\n• Personal - Create your own custom question decks (Premium)\n• Pandora - Collaborative multiplayer game with real-time questions';

  @override
  String get pickCategory => '2. Pick a Category';

  @override
  String get pickCategoryDesc =>
      'Each mode offers multiple categories with curated question packs:\n\n• Free: 3 categories per mode (30 questions each)\n• Premium Preview: First 5 questions of premium categories\n• Premium: 24+ categories (75 questions each)\n• Personal: Create unlimited custom decks with your own questions';

  @override
  String get startTalking => '3. Start Playing';

  @override
  String get startTalkingDesc =>
      'Questions appear full screen for immersive conversations. Take turns reading and answering honestly - there are no wrong answers! The goal is meaningful connection and fun.\n\nFor Pandora mode: All players submit questions anonymously, then everyone answers together in real-time.';

  @override
  String get navigateQuestions => '4. Navigate Questions';

  @override
  String get navigateQuestionsDesc =>
      '• Swipe in any direction or tap arrows to move through questions\n• Tap the ❤️ heart icon to save favorites\n• Premium: Tap the question list icon (top right) to jump to any question\n• Tap the home button to return to the main menu anytime';

  @override
  String get premiumFeatures => '5. Premium Features';

  @override
  String get premiumFeaturesDesc =>
      'Unlock the full Connect experience:\n\n• Monthly: €6.99/month\n• Yearly: €59.99/year (Save 29%!)\n\n✓ All 24+ premium categories across all modes\n✓ 75 questions per category (vs 30 free)\n✓ No ads forever\n✓ Pandora: Unlimited players & questions\n✓ Personal: Create unlimited custom decks\n✓ Question navigation - jump to any question\n✓ Support ongoing development';

  @override
  String get proTips => 'Pro Tips';

  @override
  String get proTipsDesc =>
      '• Create a comfortable, distraction-free environment\n• Listen actively and be fully present\n• Share honestly and encourage others to do the same\n• Respect boundaries - it\'s okay to skip questions\n• Use favorites ❤️ to save questions you love\n• Try different modes for different occasions\n• Pandora is perfect for parties and group gatherings\n• Have fun and enjoy connecting!';

  @override
  String get aboutCredits => 'About / Credits';

  @override
  String get developedBy => 'Developed by TechyKoala';

  @override
  String get learnMore => 'Learn more about us and upcoming apps';

  @override
  String get visitWebsite => 'Visit techykoala.com';

  @override
  String get madeWithLove => 'Made with ❤️ for meaningful conversations';

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
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count questions',
      one: '1 question',
      zero: '0 questions',
    );
    return '$_temp0';
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
  String get premium => 'PREMIUM';

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

  @override
  String get unsubscribe => 'Unsubscribe';

  @override
  String get unsubscribeConfirm => 'Cancel Premium Subscription?';

  @override
  String get unsubscribeWarning =>
      'You will lose access to all premium features including unlimited questions, all categories, ad-free experience, and unlimited Pandora players. You can resubscribe anytime.';

  @override
  String get yesUnsubscribe => 'Yes, Unsubscribe';

  @override
  String get unsubscribeSuccess =>
      'Successfully unsubscribed. Premium features have been disabled.';

  @override
  String get unsubscribeError => 'Failed to unsubscribe';

  @override
  String get questions => 'questions';

  @override
  String get preview => 'preview';

  @override
  String get userId => 'User ID';

  @override
  String get subscription => 'Subscription';

  @override
  String get questionsCount75 => '75 questions';

  @override
  String get questionsCount30 => '30 questions';

  @override
  String get questionsCount5Preview => '5 questions preview';

  @override
  String get unlockFullDeck => 'Unlock 75 questions';

  @override
  String get renameDeck => 'Rename Deck';

  @override
  String get deckRenamed => 'Deck renamed successfully';

  @override
  String get failedToRenameDeck => 'Failed to rename deck';

  @override
  String get shuffleQuestions => 'Shuffle Questions';

  @override
  String get resetOrder => 'Reset Order';

  @override
  String get questionsShuffled => 'Questions shuffled!';

  @override
  String get orderReset => 'Order reset to original';

  @override
  String get readyToPlay => 'Ready to play';

  @override
  String get longPressReorder => 'Long press and drag to reorder questions';

  @override
  String get noFavoritesYet => 'No favorites yet';

  @override
  String get heartQuestionsDuringGameplay =>
      'Tap the heart ❤️ on question cards during gameplay to save them here!';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Add at least $count questions to start playing!';
  }

  @override
  String get heartQuestionsInfo =>
      'Heart questions during gameplay to add them to your Favorites!';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Add at least $count questions to play this deck';
  }

  @override
  String get removeFromFavorites => 'Remove from favorites';

  @override
  String get unlockEverything => 'Unlock Everything';

  @override
  String get premiumSubtitle =>
      'Get unlimited access to all categories, remove ads forever, and unlock premium features';

  @override
  String get save32Percent => 'SAVE 29%';

  @override
  String get priceMonthly => '€6.99/month';

  @override
  String get priceYearly => '€59.99/year';

  @override
  String get billedAnnually => 'Billed annually';

  @override
  String get equivalentMonthly => 'Only €5/month';

  @override
  String get feature24Categories =>
      '24+ premium categories unlocked across all modes';

  @override
  String get feature75Questions =>
      '75 questions per category (vs 30 in free tier)';

  @override
  String get featureNoAds => 'No ads forever - uninterrupted gameplay';

  @override
  String get featureUnlimitedPlayers =>
      'Pandora mode: Unlimited players & questions';

  @override
  String get featureQuestionNavigation =>
      'Navigate & jump to any question during play';

  @override
  String get featureSupportDevelopment =>
      'Support ongoing development & new features';

  @override
  String get error => 'Error';

  @override
  String get premiumActivatedMessage =>
      'Premium activated! All categories unlocked.';

  @override
  String get featurePersonalDecks =>
      'Personal mode: Create unlimited custom decks with your own questions';

  @override
  String get premiumPersonal =>
      'Personal mode with custom decks is a premium feature. Upgrade to Premium to create and play your own custom question decks!';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Are you sure you want to delete \"$deckName\"? This will delete all questions in this deck.';
  }

  @override
  String needMore(int count) {
    return 'Need $count';
  }

  @override
  String get editQuestions => 'Edit Questions';

  @override
  String get addMore => 'Add More';

  @override
  String useMyConnectEmail(String email) {
    return 'Use my Connect email: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Free users can have max 6 players. Upgrade to Premium for unlimited players!';

  @override
  String get freemiumQuestionLimit =>
      'Free users can submit max 12 questions. Upgrade to Premium for unlimited questions!';

  @override
  String get yourQuestions => 'Your questions';

  @override
  String waitingForHost(int count) {
    return 'Waiting for host... ($count players)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Upgrade to Premium for Unlimited Players';

  @override
  String get kickPlayer => 'Kick Player';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Are you sure you want to kick $playerName?';
  }

  @override
  String get kick => 'Kick';

  @override
  String playerKicked(String playerName) {
    return '$playerName has been kicked';
  }

  @override
  String get failedToKickPlayer => 'Failed to kick player';

  @override
  String get cancelSessionForAll =>
      'This will cancel the session for all players. Are you sure?';

  @override
  String get youWereKicked => 'You were removed from the session';

  @override
  String get you => 'You';

  @override
  String get loginRequiredForPandora => 'Login required to play Pandora';

  @override
  String get login => 'Login';

  @override
  String get loginRequiredNote =>
      'Login required to play Pandora (track players properly)';

  @override
  String get timeIsUp => 'Time\'s Up!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Not enough questions were submitted ($current/$minimum minimum).';
  }

  @override
  String get sessionQuestionLimit => 'Session Question Limit Reached';

  @override
  String get sessionQuestionLimitMessage =>
      'This session has reached the 12-question limit (Free host). Upgrade to Premium for unlimited questions!';

  @override
  String sessionQuestionCount(int current) {
    return 'Session: $current/12 questions';
  }

  @override
  String get pleaseEnterQuestion => 'Please enter a question';

  @override
  String get rateThisDeck => 'Rate this deck';

  @override
  String get yourRating => 'Your rating';

  @override
  String get skip => 'Skip';

  @override
  String get submit => 'Submit';

  @override
  String get thankYouForFeedback => 'Thank you for your feedback!';

  @override
  String get failedToSubmitRating => 'Failed to submit rating';

  @override
  String get tapStarsToRate => 'Tap stars to rate';

  @override
  String get downloadForOffline => 'Download for Offline';

  @override
  String get downloading => 'Downloading...';

  @override
  String get downloadedLanguages => 'Downloaded Languages';

  @override
  String get languageNotDownloaded => 'Language Not Downloaded';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'You haven\'t downloaded $languageName for offline use.\n\nGo to Settings > Profile > \"Download for Offline\" while connected to internet.';
  }

  @override
  String get offlineLanguageError =>
      'This language hasn\'t been downloaded for offline use. Go to Settings > Profile > \"Download for Offline\" while connected to internet.';

  @override
  String get downloadComplete => 'Download Complete!';

  @override
  String get downloadCompleteMessage =>
      'All content has been downloaded for offline use.';

  @override
  String get addedToFavorites => 'Added to Favorites!';

  @override
  String get removedFromFavorites => 'Removed from favorites';

  @override
  String get errorSavingFavorite => 'Error saving favorite';

  @override
  String get internetRequired => 'Internet Required';

  @override
  String get internetRequiredMessage =>
      'Some features require an internet connection. Premium users can download content for offline use in Settings.';

  @override
  String get goPremium => 'Go Premium';

  @override
  String get pleaseEnterPin => 'Please enter a 6-digit PIN';

  @override
  String errorOccurred(String error) {
    return 'Error: $error';
  }

  @override
  String get errorCreatingSession => 'Error creating session';

  @override
  String get sessionTimedOut => 'Session timed out - host did not set timer';

  @override
  String get errorStarting => 'Error starting';

  @override
  String get errorLoadingParticipants => 'Error loading participants';

  @override
  String get sessionCancelledByHost => 'Session cancelled by host';

  @override
  String needAtLeast5Questions(int count) {
    return 'Need at least 5 questions to start! (Currently: $count)';
  }

  @override
  String get errorStartingGame => 'Error starting game';

  @override
  String get questionsAsked => 'Questions Asked';

  @override
  String get totalReactions => 'Total Reactions';

  @override
  String get mostLovedQuestion => 'Most Loved Question';

  @override
  String get mostFunQuestion => 'Most Fun Question';

  @override
  String get mostShockingQuestion => 'Most Shocking Question';

  @override
  String get mostLitQuestion => 'Most Lit Question';

  @override
  String get hotSeatAward => 'Hot Seat Award';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Error: Could not identify player. Please rejoin the session.';

  @override
  String get createAiDeck => 'Create AI Deck';

  @override
  String get whatIsTheOccasion => 'What is the occasion?';

  @override
  String get occasionHint => 'e.g., Birthday party, Team building, Date night';

  @override
  String get whatIsTheMood => 'What\'s the mood?';

  @override
  String get lighthearted => 'Lighthearted';

  @override
  String get serious => 'Serious';

  @override
  String get mixed => 'Mixed';

  @override
  String get depthOfQuestions => 'Depth of questions?';

  @override
  String get surfaceLevel => 'Surface level';

  @override
  String get deep => 'Deep';

  @override
  String get level => 'Level';

  @override
  String get sizeOfGroup => 'Size of group?';

  @override
  String get people => 'people';

  @override
  String get anyOtherRemarks => 'Any other remarks? (optional)';

  @override
  String get remarksHint =>
      'e.g., Family friendly, include some funny questions';

  @override
  String get generateQuestions => 'Generate Questions';

  @override
  String get aiDeckPremiumMessage =>
      'AI deck generation is a premium feature. Upgrade to create unlimited AI-powered conversation decks!';

  @override
  String get pleaseEnterOccasion => 'Please enter the occasion';

  @override
  String errorGeneratingQuestions(String error) {
    return 'Error generating questions: $error';
  }

  @override
  String get generatingAiQuestions => 'Generating AI questions...';

  @override
  String get generatingMoreQuestions => 'Generating more questions...';

  @override
  String get batchComplete => 'Batch Complete!';

  @override
  String questionsInDeckMessage(int count) {
    return 'You have $count questions in your deck. Generate 10 more?';
  }

  @override
  String questionsInDeck(int kept, int max) {
    return '$kept/$max';
  }

  @override
  String questionProgress(int current, int total) {
    return '$current/$total';
  }

  @override
  String batchNumber(int number) {
    return 'Batch #$number';
  }

  @override
  String get imDone => 'I\'m Done';

  @override
  String get generateMore => 'Generate More';

  @override
  String get maxQuestionsReached => 'Max Questions (50)';

  @override
  String get namYourDeck => 'Name Your Deck';

  @override
  String get goBack => 'Go Back';

  @override
  String get swipeInstructions => 'Swipe right to keep • Swipe left to discard';

  @override
  String get discussionPoint => 'Discussion Point';

  @override
  String get sparkMode => 'Spark Mode';

  @override
  String get sparkModeSubtitle => 'AI-Powered Conversation Starters';

  @override
  String get sparkPremiumRequired => 'Spark Mode - Premium Feature';

  @override
  String get sparkPremiumMessage =>
      'Spark Mode is available for Premium and Premium+ subscribers. Generate AI-powered conversation starters tailored to your occasion!';

  @override
  String sparkQuestionsRemaining(int remaining, int limit) {
    return '$remaining of $limit questions remaining';
  }

  @override
  String get howManyQuestions => 'How many questions?';

  @override
  String sparkQuestions(int count) {
    return '$count Questions';
  }

  @override
  String generateSparkQuestions(int count) {
    return 'Generate $count Questions';
  }

  @override
  String get sparkLimitReached => 'Monthly Limit Reached';

  @override
  String sparkLimitMessage(int remaining, int requested) {
    return 'You only have $remaining Spark questions remaining this month. You\'re trying to generate $requested questions.\n\nUpgrade to Premium+ for 400 questions per month!';
  }

  @override
  String get expiresIn24Hours => 'Expires in 24 hours';

  @override
  String get alreadyInFavorites => 'Already in Favorites';

  @override
  String addedToDeck(String deckName) {
    return 'Added to $deckName!';
  }

  @override
  String get questionAlreadyInDeck => 'Question already in this deck';

  @override
  String get addToDeck => 'Add to Deck';

  @override
  String get favorite => 'Favorite';

  @override
  String get chooseDeck => 'Choose a deck to add this question to:';

  @override
  String get noDecksFound => 'No Decks Found';

  @override
  String get noDecksMessage =>
      'You don\'t have any custom decks yet. Would you like to create one?';

  @override
  String get createDeck => 'Create Deck';

  @override
  String get createAndAdd => 'Create & Add';

  @override
  String get pleaseEnterDeckName => 'Please enter a deck name';

  @override
  String get tierBasic => 'Basic';

  @override
  String get tierPremium => 'Premium';

  @override
  String get tierPremiumPlus => 'Premium+';

  @override
  String get tierFree => 'Free';

  @override
  String get choosePlan => 'Choose Your Plan';

  @override
  String get choosePlanSubtitle =>
      'Unlock premium features and AI-powered conversations';

  @override
  String get mostPopular => 'MOST POPULAR';

  @override
  String get perMonth => 'per month';

  @override
  String get forever => 'Forever';

  @override
  String get continueWithBasic => 'Continue with Basic (Free)';

  @override
  String subscribeTo(String tier) {
    return 'Subscribe to $tier';
  }

  @override
  String get cancelAnytime => 'Cancel anytime. No hidden fees.';

  @override
  String get basicTierTitle => 'Basic';

  @override
  String get basicTierPrice => '€6.99';

  @override
  String get basicTierDescription => 'Access all game modes except Spark';

  @override
  String get basicFeature1 =>
      'All game modes (Couple, Friends, Family, Personal, Pandora)';

  @override
  String get basicFeature2 => 'Access to all 24+ categories';

  @override
  String get basicFeature3 => 'Custom personal decks';

  @override
  String get basicFeature4 => 'No ads';

  @override
  String get basicFeature5 => 'Question navigation';

  @override
  String get premiumTierTitle => 'Premium';

  @override
  String get premiumTierPrice => '€11.99';

  @override
  String get premiumTierDescription => 'Everything in Basic + Spark AI';

  @override
  String get premiumFeature6 => 'Save favorites to personal decks';

  @override
  String get premiumPlusTierTitle => 'Premium+';

  @override
  String get premiumPlusTierPrice => '€19.99';

  @override
  String get premiumPlusTierDescription => 'Maximum AI power';

  @override
  String get premiumPlusFeature1 => 'Everything in Premium';

  @override
  String get premiumPlusFeature2 => '🚀 400 AI questions per month';

  @override
  String get premiumPlusFeature3 => '2.5x more Spark questions';

  @override
  String get premiumPlusFeature4 => 'Perfect for frequent use';

  @override
  String get premiumPlusFeature5 => 'Priority support';
}
