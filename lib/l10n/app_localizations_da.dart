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
      'Lås premium kategorier op og få adgang til eksklusive spørgepakker';

  @override
  String get chooseBundleOne => 'Vælg 1 kategori bundle';

  @override
  String get chooseBundleTwo => 'Vælg 2 kategori bundles';

  @override
  String get chooseBundleThree => 'Alle 3 kategori bundles';

  @override
  String get perMonth => '/måned';

  @override
  String get bestValue => 'BEDSTE VÆRDI';

  @override
  String get unlockAllBundles => 'Lås alle Bundles op';

  @override
  String get selectYourBundle => 'Vælg din Bundle';

  @override
  String selectBundles(Object count, Object plural) {
    return 'Vælg $count Bundle$plural';
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
  String get demoNote => 'Demo: Låsninger nulstilles ved genstart af appen';

  @override
  String get swipeOrTap => 'Stryg eller tryk på pilene';

  @override
  String get previous => 'Forrige';

  @override
  String get next => 'Næste';

  @override
  String get advertisement => 'Annonce';

  @override
  String get watchAdMessage =>
      'Se en kort annonce for at fortsætte, eller gå uden annoncer med premium!';

  @override
  String get watchAd => 'Se annonce';

  @override
  String get goAdFree => 'Gå uden annoncer - 59 DKK/måned';

  @override
  String get removeAdsForever => 'Fjern annoncer for altid';

  @override
  String get chooseOneBundle =>
      'Vælg 1 bundle for at låse op og fjerne alle annoncer';

  @override
  String get noAdsForever => 'Ingen annoncer for altid';

  @override
  String premiumActivated(Object bundle) {
    return 'Premium aktiveret! Annoncer fjernet. $bundle bundle låst op.';
  }

  @override
  String get adNotReady => 'Annonce ikke klar. Fortsætter uden annonce.';

  @override
  String get adLoadingContinue => 'Annoncer indlæses... Fortsæt';

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
  String get madeForWife => 'Lavede til min smukke kone';

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
    return 'Sproget er ændret til $language';
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
      'Log ind for at synkronisere dine abonnementer på tværs af enheder og låse op for premium indhold';

  @override
  String get signOutConfirm => 'Er du sikker på, at du vil logge ud?';

  @override
  String get signedOutSuccess => 'Logget ud med succes';

  @override
  String get accountInformation => 'Kontooplysninger';

  @override
  String get email => 'E-mail';

  @override
  String get memberSince => 'Medlem Siden';

  @override
  String get notAvailable => 'Ikke tilgængelig';

  @override
  String get unknown => 'Ukendt';

  @override
  String get activeSubscriptions => 'Aktive Abonnementer';

  @override
  String bundlesUnlocked(Object count, Object plural) {
    return '$count Bundle$plural Låst Op';
  }

  @override
  String bundle(Object name) {
    return '$name Bundle';
  }

  @override
  String get premiumMember => 'Premium Medlem';

  @override
  String get freeAccount => 'Gratis Konto';

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
      'Ved at fortsætte accepterer du vores Servicevilkår og Privatlivspolitik';

  @override
  String get googleSignInFailed => 'Google Login fejlede. Prøv venligst igen.';

  @override
  String get appleSignInFailed => 'Apple Login fejlede. Prøv venligst igen.';

  @override
  String get noCategoriesFound => 'Ingen kategorier fundet';

  @override
  String selectBundlePlural(Object plural) {
    return 'Vælg den kategori bundle$plural, du ønsker at låse op for';
  }

  @override
  String get getAccessAllBundles =>
      'Få adgang til alle premium kategorier i alle 3 bundles!';

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
  String get signUp => 'Tilmeld dig';

  @override
  String get dontHaveAccount => 'Har du ikke en konto? Tilmeld dig';

  @override
  String get alreadyHaveAccount => 'Har du allerede en konto? Log ind';

  @override
  String get chooseYourMode => '1. Vælg din tilstand';

  @override
  String get chooseYourModeDesc => 'Vælg mellem tre samtalestile:';

  @override
  String get pickCategory => '2. Vælg en kategori';

  @override
  String get pickCategoryDesc =>
      'Hver tilstand har flere kategorier med unikke spørgsmålspakker. Gratis kategorier er låst op, mens premium kategorier kræver et abonnement.';

  @override
  String get startTalking => '3. Begynd at tale';

  @override
  String get startTalkingDesc =>
      'Spørgsmål vises i fuld skærm. Skift til at læse og besvare dem ærligt. Der er ingen forkerte svar - målet er meningsfuld samtale!';

  @override
  String get navigateQuestions => '4. Naviger spørgsmål';

  @override
  String get navigateQuestionsDesc =>
      '• Swipe til højre eller tryk på \"Næste\" for næste spørgsmål';

  @override
  String get premiumFeatures => '5. Premium funktioner';

  @override
  String get premiumFeaturesDesc =>
      'Lås op for eksklusive spørgsmålskategorier med et abonnement:';

  @override
  String get proTips => 'Pro Tips';

  @override
  String get proTipsDesc => '• Skab et komfortabelt, distraktionsfrit miljø';

  @override
  String get personal => 'Personligt';

  @override
  String get personalDesc => 'Opret dine egne tilpassede spørgsmålskort';

  @override
  String get gameComplete => 'Spillet er fuldført!';

  @override
  String get noMoreQuestions =>
      'Du har gennemgået alle spørgsmålene i denne bunke!';

  @override
  String get playAgain => 'Spil igen';

  @override
  String get mainMenu => 'Hovedmenu';

  @override
  String get thanksForPlaying => 'Tak for at spille!';

  @override
  String get hopeYouHadFun => 'Håber du havde det sjovt! 🎉';

  @override
  String get backToMenu => 'Tilbage til Menu';

  @override
  String get leaveGame => 'Forlade Spillet?';

  @override
  String get leaveGameMessage =>
      'Er du sikker på, at du vil forlade? Spillet fortsætter for de andre spillere.';

  @override
  String get leave => 'Forlade';

  @override
  String get noQuestionsAvailable => 'Ingen spørgsmål tilgængelige';

  @override
  String get showLess => 'Vis Mindre';

  @override
  String get readMore => 'Læs Mere';

  @override
  String get tapToPlay => 'Tryk for at Spille';

  @override
  String get coupleBundle => 'Par Bundle';

  @override
  String get friendsBundle => 'Venner Bundle';

  @override
  String get familyBundle => 'Familie Bundle';

  @override
  String get favorites => 'Favoritter';

  @override
  String get pandoraHostCreatePin => 'Værten opretter session og deler PIN';

  @override
  String get pandoraPlayersJoinMax => 'Spillere deltager (maks 15 min)';

  @override
  String get pandoraHostSetsTimer => 'Værten sætter spørgsmålstimer (1-15 min)';

  @override
  String get pandoraEveryoneSubmits => 'Alle indsender spørgsmål';

  @override
  String get pandoraHostControls => 'Værten styrer spillets progression';

  @override
  String get pandoraQuestionsDeleted => 'Spørgsmål slettes efter spillet';

  @override
  String get pandoraHost => 'Vært';

  @override
  String get pandoraJoinGame => 'Deltag i spil';

  @override
  String get pandoraPandoraBox => 'Pandoraæske';

  @override
  String get pleaseEnterName => 'Indtast venligst dit navn';

  @override
  String get hostSuffix => '(Vært)';

  @override
  String get playersJoinWithNames => 'Spillere deltager med deres navne';

  @override
  String get everyoneSubmitsMin5 => 'Alle indsender spørgsmål (min. 5)';

  @override
  String get createSession => 'Opret session';

  @override
  String get creating => 'Opretter...';

  @override
  String get yourName => 'Dit navn';

  @override
  String get enterDisplayName => 'Indtast dit visningsnavn';

  @override
  String get howItWorks => 'Sådan fungerer det';

  @override
  String get pinCopied => 'PIN kopieret til udklipsholderen!';

  @override
  String get endSession => 'Afslut session?';

  @override
  String get endSessionConfirm =>
      'Er du sikker på, at du vil afslutte denne Pandora-session?';

  @override
  String get end => 'Afslut';

  @override
  String get sessionPin => 'Session PIN';

  @override
  String get sharePin => 'Del denne PIN med spillerne';

  @override
  String get waitingForPlayers => 'Venter på spillere...';

  @override
  String get startGame => 'Start spil';

  @override
  String get lobby => 'Lobby';

  @override
  String get hostLabel => '(Vært)';

  @override
  String get selectTimer => 'Vælg timer';

  @override
  String get timerQuestion =>
      'Hvor lang tid skal spillerne have til at indsende spørgsmål?';

  @override
  String get minutes => 'minutter';

  @override
  String get startCollectingQuestions => 'Begynd at samle spørgsmål';

  @override
  String get sessionCancelled => 'Session annulleret';

  @override
  String get questionCannotBeEmpty => 'Spørgsmålet kan ikke være tomt';

  @override
  String get questionSubmitted => 'Spørgsmål indsendt!';

  @override
  String get failedToSubmit => 'Kunne ikke indsende spørgsmål';

  @override
  String notEnoughQuestions(Object count) {
    return 'Ikke nok spørgsmål. Minimum 5 kræves. (Aktuelt: $count)';
  }

  @override
  String get submitQuestions => 'Indsend spørgsmål';

  @override
  String get submitMinimum5 =>
      'Indsend mindst 5 spørgsmål for at starte spillet';

  @override
  String get yourQuestion => 'Dit spørgsmål';

  @override
  String get enterQuestionHere => 'Indtast dit spørgsmål her...';

  @override
  String get forEveryone => 'For Alle';

  @override
  String get forSpecificPerson => 'For En Bestemt Person';

  @override
  String get submit => 'Indsend';

  @override
  String questionsRemaining(Object count) {
    return '$count spørgsmål tilbage';
  }

  @override
  String questionRemaining(Object count) {
    return '$count spørgsmål tilbage';
  }

  @override
  String get startGameExclamation => 'Start Spillet!';

  @override
  String get cancelSession => 'Afbryd Session';

  @override
  String get timeRemaining => 'Tid tilbage';

  @override
  String get pleaseEnterPin => 'Indtast venligst en PIN';

  @override
  String get sessionNotFound => 'Session ikke fundet';

  @override
  String get sessionEnded => 'Sessionen er slut';

  @override
  String get sessionStarted => 'Sessionen er allerede startet';

  @override
  String get failedToJoin => 'Kunne ikke deltage i sessionen';

  @override
  String get joinSession => 'Deltag i session';

  @override
  String get joining => 'Deltager...';

  @override
  String get enterPin => 'Indtast 6-cifret PIN';

  @override
  String get join => 'Deltag';

  @override
  String get reactionBreakdown => 'Reaktionsanalyse';

  @override
  String get laugh => 'Grin';

  @override
  String get shock => 'Chok';

  @override
  String get heart => 'Hjerte';

  @override
  String get fire => 'Ild';

  @override
  String get mostLaughs => 'Flest grin';

  @override
  String get mostShocked => 'Flest chokerede';

  @override
  String get mostHearts => 'Flest hjerter';

  @override
  String get sessionComplete => 'Session afsluttet!';

  @override
  String get thanksForPlayingPandora => 'Tak for at spille Pandora Box!';

  @override
  String get returnToMenu => 'Tilbage til menuen';

  @override
  String get failedToCreateDeck => 'Kunne ikke oprette kortsæt';

  @override
  String get createNewDeck => 'Opret nyt kortsæt';

  @override
  String get deckName => 'Kortsætnavn';

  @override
  String get enterDeckName => 'Indtast kortsætnavn';

  @override
  String get create => 'Opret';

  @override
  String get deleteDeck => 'Slet kortsæt';

  @override
  String deleteDeckConfirm(Object name) {
    return 'Er du sikker på, at du vil slette \"$name\"? Dette vil slette alle spørgsmål i dette kortsæt.';
  }

  @override
  String get delete => 'Slet';

  @override
  String get deckDeleted => 'Kortsæt slettet';

  @override
  String get failedToDeleteDeck => 'Kunne ikke slette kortsættet';

  @override
  String get myDecks => 'Mine kortsæt';

  @override
  String get noDecksYet => 'Ingen kortsæt endnu';

  @override
  String get createFirstDeck => 'Opret dit første tilpassede kortsæt!';

  @override
  String questionsCount(Object count) {
    return '$count spørgsmål';
  }

  @override
  String questionCount(Object count) {
    return '$count spørgsmål';
  }

  @override
  String get questionAdded => 'Spørgsmål tilføjet!';

  @override
  String get failedToAddQuestion => 'Kunne ikke tilføje spørgsmål';

  @override
  String get editQuestion => 'Rediger spørgsmål';

  @override
  String get enterYourQuestion => 'Indtast dit spørgsmål';

  @override
  String get save => 'Gem';

  @override
  String get questionUpdated => 'Spørgsmål opdateret!';

  @override
  String get failedToUpdateQuestion => 'Kunne ikke opdatere spørgsmålet';

  @override
  String get deleteQuestion => 'Slet spørgsmål';

  @override
  String get deleteQuestionConfirm =>
      'Er du sikker på, at du vil slette dette spørgsmål?';

  @override
  String get questionDeleted => 'Spørgsmål slettet';

  @override
  String get failedToDeleteQuestion => 'Kunne ikke slette spørgsmålet';

  @override
  String get addQuestion => 'Tilføj spørgsmål';

  @override
  String get typeQuestionHere => 'Skriv dit spørgsmål her...';

  @override
  String get add => 'Tilføj';

  @override
  String get noQuestionsYet => 'Ingen spørgsmål endnu';

  @override
  String get addFirstQuestion => 'Tilføj dit første spørgsmål!';

  @override
  String get deckDescLoveTalks =>
      'Udforsk romantik, kemi og forbindelse gennem hjertevarme spørgsmål, der fejrer jeres forhold. Fra \"hvordan vi mødtes\"-øjeblikke til hvad der får dig til at føle dig mest elsket – disse kort uddyber den følelsesmæssige intimitet.';

  @override
  String get deckDescDeepTalks =>
      'Disse kort går i dybden med værdier, sårbarhed og hvad det betyder at vokse sammen. De hjælper partnere med at reflektere over uafhængighed, kommunikation og fælles formål.';

  @override
  String get deckDescSpicyTalks =>
      'Frække, modige og intime — disse kort inviterer par til at udforske begær, fantasier og passion sammen. Hvert spørgsmål er designet til at skabe ærlige, spændende samtaler om, hvad der tænder jer, og bringer jer tættere på hinanden.';

  @override
  String get deckDescDoYouDareTalks =>
      'Et frygtløst sæt, der blander følelsesmæssig ærlighed med svære emner som tillid, religion, penge og grænser – alt sammen for at afsløre, hvad der virkelig betyder noget for jer begge. *Bemærk:* Nogle spørgsmål er rå og ufiltrerede – leg med åbenhed, empati og respekt.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspireret af de fem kærlighedssprog hjælper dette sæt partnere med at udtrykke hengivenhed på måder, der virkelig resonerer. Opdag, hvordan ord, handlinger og gestus kan styrke forbindelsen.';

  @override
  String get deckDescSillyTalks =>
      'Ren sjov og latter! Disse skøre, lette spørgsmål afdækker dine mærkeligste vaner og sjoveste tanker. Perfekt til venner, familie eller par, der ikke tager livet for seriøst.';

  @override
  String get deckDescCarTalks =>
      'Perfekt til roadtrips – disse kort gør køreturen til en sjov samtale. Forvent sjove, kreative og nostalgiske spørgsmål om rejser, eventyr og små særheder.';

  @override
  String get deckDescUnpopularOpinions =>
      'Sættet der udfordrer dig til at sige, hvad alle tænker, men ingen indrømmer. Fra influencer-kultur til sociale normer – disse kort skaber ærlige debatter og overraskende perspektiver.';

  @override
  String get deckDescPlotTwists =>
      'Denne bunke kaster dig direkte ind i livets sjoveste og sværeste \"hvad ville du gøre?\"-øjeblikke. Hurtig tænkning, mavefornemmelser og latter venter! Perfekt til gruppenætter fulde af overraskelser og grin.';

  @override
  String get deckDescAfterDark =>
      'Gå ind i samtalens mørke side med spørgsmål, der får det til at løbe koldt ned ad ryggen. Fra uhyggelige sammenfald til overlevelsesscenarier – perfekt til sene aftener med et gys.';

  @override
  String get deckDescHistoryTalks =>
      'En nostalgisk blanding af personlige minder og familieøjeblikke. Disse spørgsmål inspirerer til historier, latter og genopdagelse af rødder. Perfekt til familiesammenkomster eller hyggelige aftener.';

  @override
  String get deckDescTinyTalks =>
      'Lavet til forældre og deres små! Disse enkle, sjove spørgsmål hjælper børn med at udtrykke sig, mens forældrene lærer mere om, hvordan de tænker. Perfekt til alderen 3-9 år.';

  @override
  String get deckDescGoodOldDays =>
      'En nostalgisk rejse gennem fortiden — fra barndomsminder til livets forandringer. Disse kort inspirerer til historier, grin og taknemmelighed. Perfekt for bedsteforældre til at dele minder.';

  @override
  String get deckDescWouldYouRather =>
      'En familievenlig version af det klassiske \"Vil du helst…\"-spil. Fyldt med sjove og fantasifulde valg, der får alle til at tænke, grine og forsvare deres valg.';

  @override
  String get deckDescCozyTalks =>
      'Varme og afslappede spørgsmål, der får dig til at føle dig hjemme. De skaber trøstende samtaler om små glæder, minder og hvad der får dig til at smile.';

  @override
  String get deckDescPartyNight =>
      'Dit go-to spil til sjove aftener med venner! Disse livlige spørgsmål fremkalder latter, historier og legende debatter — fra festfiaskoer til hvem der er den største flirt på dansegulvet. Perfekt til at løsne stemningen og holde gang i festen.';
}
