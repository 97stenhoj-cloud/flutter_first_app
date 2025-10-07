// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Iniciar';

  @override
  String get settings => 'Configurações';

  @override
  String get howToPlay => 'Como Jogar';

  @override
  String get chooseGameMode => 'Escolha seu modo de jogo';

  @override
  String get family => 'Família';

  @override
  String get couple => 'Casal';

  @override
  String get friends => 'Amigos';

  @override
  String get chooseCategory => 'Escolha uma Categoria';

  @override
  String get locked => 'Categoria Bloqueada';

  @override
  String get lockedMessage =>
      'Esta categoria está bloqueada. Atualize para premium para desbloquear todas as categorias!';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Talvez Depois';

  @override
  String get chooseSubscription => 'Escolha Sua Assinatura';

  @override
  String get subscriptionDescription =>
      'Desbloqueie categorias premium e tenha acesso a pacotes de perguntas exclusivos';

  @override
  String get chooseBundleOne => 'Escolha 1 pacote de categorias';

  @override
  String get chooseBundleTwo => 'Escolha 2 pacotes de categorias';

  @override
  String get chooseBundleThree => 'Todos os 3 pacotes de categorias';

  @override
  String get perMonth => '/mês';

  @override
  String get bestValue => 'MELHOR VALOR';

  @override
  String get unlockAllBundles => 'Desbloquear Todos os Pacotes';

  @override
  String get selectYourBundle => 'Selecione Seu Pacote';

  @override
  String selectBundles(Object count, Object plural) {
    return 'Selecione $count Pacote$plural';
  }

  @override
  String get premiumCategories => '4 categorias premium';

  @override
  String get cancel => 'Cancelar';

  @override
  String get subscribe => 'Assinar';

  @override
  String subscriptionActivated(Object bundles) {
    return 'Assinatura ativada! $bundles desbloqueado.';
  }

  @override
  String get demoNote =>
      'Demo: Os desbloqueios serão redefinidos ao reiniciar o app';

  @override
  String get swipeOrTap => 'Deslize ou toque nas setas';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Próximo';

  @override
  String get advertisement => 'Anúncio';

  @override
  String get watchAdMessage =>
      'Assista a um anúncio curto para continuar, ou fique sem anúncios com premium!';

  @override
  String get watchAd => 'Assistir Anúncio';

  @override
  String get goAdFree => 'Sem Anúncios - 59 DKK/mês';

  @override
  String get removeAdsForever => 'Remover Anúncios Para Sempre';

  @override
  String get chooseOneBundle =>
      'Escolha 1 pacote para desbloquear e remover todos os anúncios';

  @override
  String get noAdsForever => 'Sem Anúncios Para Sempre';

  @override
  String premiumActivated(Object bundle) {
    return 'Premium ativado! Anúncios removidos. Pacote $bundle desbloqueado.';
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
}
