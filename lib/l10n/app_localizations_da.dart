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
  String get howToPlay => 'Sådan spiller du';

  @override
  String get chooseGameMode => 'Vælg din spiltilstand';

  @override
  String get family => 'Familie';

  @override
  String get couple => 'Par';

  @override
  String get friends => 'Venner';

  @override
  String get chooseCategory => 'Vælg en kategori';

  @override
  String get locked => 'Låst kategori';

  @override
  String get lockedMessage =>
      'Denne kategori er låst. Opgrader til premium for at låse alle kategorier op!';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Måske senere';

  @override
  String get chooseSubscription => 'Vælg dit abonnement';

  @override
  String get subscriptionDescription =>
      'Lås premium kategorier op og få adgang til eksklusive spørgsmålspakker';

  @override
  String get chooseBundleOne => 'Vælg 1 kategoripakke';

  @override
  String get chooseBundleTwo => 'Vælg 2 kategoripakker';

  @override
  String get chooseBundleThree => 'Alle 3 kategoripakker';

  @override
  String get perMonth => '/måned';

  @override
  String get bestValue => 'BEDSTE VÆRDI';

  @override
  String get unlockAllBundles => 'Lås alle pakker op';

  @override
  String get selectYourBundle => 'Vælg din pakke';

  @override
  String selectBundles(Object count, Object plural) {
    return 'Vælg $count pakke$plural';
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
  String get demoNote => 'Demo: Oplåsninger nulstilles ved genstart af appen';

  @override
  String get swipeOrTap => 'Swipe eller tryk på pile';

  @override
  String get previous => 'Forrige';

  @override
  String get next => 'Næste';

  @override
  String get advertisement => 'Reklame';

  @override
  String get watchAdMessage =>
      'Se en kort reklame for at fortsætte, eller gå reklamefri med premium!';

  @override
  String get watchAd => 'Se reklame';

  @override
  String get goAdFree => 'Gå reklamefri - 59 DKK/måned';

  @override
  String get removeAdsForever => 'Fjern reklamer for evigt';

  @override
  String get chooseOneBundle =>
      'Vælg 1 pakke for at låse op og fjerne alle reklamer';

  @override
  String get noAdsForever => 'Ingen reklamer nogensinde';

  @override
  String premiumActivated(Object bundle) {
    return 'Premium aktiveret! Reklamer fjernet. $bundle pakke låst op.';
  }

  @override
  String get adNotReady => 'Reklame ikke klar. Fortsætter uden reklame.';

  @override
  String get adLoadingContinue => 'Reklame indlæser... Fortsæt';

  @override
  String get pricePerMonth => '59 DKK/måned';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Ingen spørgsmål fundet for $category i $mode tilstand';
  }

  @override
  String get errorLoadingQuestions =>
      'Fejl ved indlæsning af spørgsmål. Tjek venligst din forbindelse.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Kunne ikke indlæse spørgsmål: $error';
  }

  @override
  String get madeForWife => 'Lavet til min smukke kone';

  @override
  String get otiLia => 'Otilia Stenhøj';

  @override
  String get withLoveAndConversations => 'Med kærlighed og samtaler';

  @override
  String get howManyPlayers => 'Hvor mange spillere?';

  @override
  String get players => 'Spillere';

  @override
  String get continueButton => 'Fortsæt';

  @override
  String get language => 'Sprog';

  @override
  String languageChanged(Object language) {
    return 'Sprog ændret til $language';
  }

  @override
  String get profile => 'Profil';

  @override
  String get signOut => 'Log ud';

  @override
  String get notSignedIn => 'Ikke logget ind';

  @override
  String get signInSignUp => 'Log ind / Tilmeld';

  @override
  String get signInToSync =>
      'Log ind for at synkronisere dine abonnementer på tværs af enheder og låse premium indhold op';

  @override
  String get signOutConfirm => 'Er du sikker på, at du vil logge ud?';

  @override
  String get signedOutSuccess => 'Logget ud med succes';

  @override
  String get accountInformation => 'Kontooplysninger';

  @override
  String get email => 'E-mail';

  @override
  String get memberSince => 'Medlem siden';

  @override
  String get notAvailable => 'Ikke tilgængelig';

  @override
  String get unknown => 'Ukendt';

  @override
  String get activeSubscriptions => 'Aktive abonnementer';

  @override
  String bundlesUnlocked(Object count, Object plural) {
    return '$count pakke$plural låst op';
  }

  @override
  String bundle(Object name) {
    return '$name pakke';
  }

  @override
  String get premiumMember => 'Premium medlem';

  @override
  String get freeAccount => 'Gratis konto';

  @override
  String get welcomeToConnect => 'Velkommen til Connect!';

  @override
  String get continueWithApple => 'Fortsæt med Apple';

  @override
  String get continueWithGoogle => 'Fortsæt med Google';

  @override
  String get skipForNow => 'Spring over for nu';

  @override
  String get byContining =>
      'Ved at fortsætte accepterer du vores servicevilkår og privatlivspolitik';

  @override
  String get googleSignInFailed =>
      'Google login mislykkedes. Prøv venligst igen.';

  @override
  String get appleSignInFailed =>
      'Apple login mislykkedes. Prøv venligst igen.';

  @override
  String get noCategoriesFound => 'Ingen kategorier fundet';

  @override
  String selectBundlePlural(Object plural) {
    return 'Vælg de kategoripakke$plural du vil låse op';
  }

  @override
  String get getAccessAllBundles =>
      'Få adgang til alle premium kategorier i alle 3 pakker!';

  @override
  String subscriptionActivatedFull(Object bundles) {
    return 'Abonnement aktiveret! $bundles låst op.';
  }

  @override
  String get aboutCredits => 'Om / Credits';

  @override
  String get welcomeBack => 'Velkommen tilbage!';

  @override
  String get createAccount => 'Opret konto';

  @override
  String get displayName => 'Visningsnavn';

  @override
  String get password => 'Adgangskode';

  @override
  String get signIn => 'Log ind';

  @override
  String get signUp => 'Tilmeld';

  @override
  String get dontHaveAccount => 'Har du ikke en konto? Tilmeld';

  @override
  String get alreadyHaveAccount => 'Har du allerede en konto? Log ind';

  @override
  String get chooseYourMode => '1. Vælg din tilstand';

  @override
  String get chooseYourModeDesc =>
      'Vælg mellem tre samtalestile:\n\n• Familie - Varme, hjertelige samtaler perfekt til alle aldre\n• Par - Intime og romantiske spørgsmål for at fordybe jeres forbindelse\n• Venner - Sjove og underholdende emner til jer og vennerne';

  @override
  String get pickCategory => '2. Vælg en kategori';

  @override
  String get pickCategoryDesc =>
      'Hver tilstand har flere kategorier med unikke spørgsmålspakker. Gratis kategorier er låst op, mens premium kategorier kræver et abonnement.';

  @override
  String get startTalking => '3. Begynd at snakke';

  @override
  String get startTalkingDesc =>
      'Spørgsmål vises på fuld skærm. Skiftes til at læse og svare på dem ærligt. Der er ingen forkerte svar - målet er meningsfuld samtale!';

  @override
  String get navigateQuestions => '4. Naviger spørgsmål';

  @override
  String get navigateQuestionsDesc =>
      '• Swipe til højre eller tryk på \"Næste\" for næste spørgsmål\n• Swipe til venstre eller tryk på \"Forrige\" for at gense spørgsmål\n• Tryk på hjem-knappen for at vende tilbage til hovedmenuen når som helst';

  @override
  String get premiumFeatures => '5. Premium funktioner';

  @override
  String get premiumFeaturesDesc =>
      'Lås eksklusive spørgsmålskategorier op med et abonnement:\n\n• 1 pakke (4 kategorier) - 59 DKK/måned\n• 2 pakker (8 kategorier) - 109 DKK/måned\n• 3 pakker (12 kategorier) - 149 DKK/måned';

  @override
  String get proTips => 'Pro tips';

  @override
  String get proTipsDesc =>
      '• Skab et komfortabelt, distraktionsfrit miljø\n• Lyt aktivt og vær tilstede\n• Del ærligt og opfordr andre til at gøre det samme\n• Respekter grænser - spring spørgsmål over hvis nødvendigt\n• Hav det sjovt og nyd at forbinde!';

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
}
