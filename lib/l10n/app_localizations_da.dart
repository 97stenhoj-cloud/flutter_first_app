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
  String get locked => 'Premium Kategori';

  @override
  String get lockedMessage =>
      'Dette er en premium kategori. Opgrader for at låse alle kategorier op og fjerne annoncer!';

  @override
  String get previewAvailable =>
      'Forhåndsvisning: Første 5 spørgsmål tilgængelige';

  @override
  String get upgradeNow => 'Opgrader Nu';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Måske Senere';

  @override
  String get getPremium => 'Få Premium';

  @override
  String get premiumTitle => 'Lås Alt Op';

  @override
  String get premiumDescription =>
      'Få ubegrænset adgang til alle kategorier på tværs af alle tilstande, fjern annoncer og nyd ubegrænsede Pandora-sessioner.';

  @override
  String get premiumPriceMonthly => '49 DKK/måned';

  @override
  String get premiumPriceYearly => '399 DKK/år';

  @override
  String get saveWithYearly => 'Spar 189 DKK med årligt!';

  @override
  String get monthly => 'Månedligt';

  @override
  String get yearly => 'Årligt';

  @override
  String get billedMonthly => 'Faktureret månedligt';

  @override
  String get billedYearly => 'Faktureret årligt';

  @override
  String get premiumFeature1 => '✓ Alle 24 premium kategorier låst op';

  @override
  String get premiumFeature2 => '✓ Ingen annoncer for altid';

  @override
  String get premiumFeature3 => '✓ 75 spørgsmål i alle kategorier';

  @override
  String get premiumFeature4 => '✓ Pandora: Ubegrænsede spillere og spørgsmål';

  @override
  String get premiumFeature5 => '✓ Støt løbende udvikling';

  @override
  String get subscribePremium => 'Abonner på Premium';

  @override
  String get subscribe => 'Abonner';

  @override
  String get cancel => 'Annuller';

  @override
  String get subscriptionActivated =>
      'Premium aktiveret! Alle kategorier låst op.';

  @override
  String get premiumActivated => 'Premium Aktiveret!';

  @override
  String get demoNote => 'Demo: Abonnement nulstilles ved genstart af app';

  @override
  String get freeTier => 'Gratis Niveau';

  @override
  String get freeTierDesc =>
      '3 kategorier pr. tilstand (30 spørgsmål hver)\n5-spørgsmåls forhåndsvisning af premiumkategorier\nReklamer for hver 7. spørgsmål';

  @override
  String get currentPlan => 'Nuværende Plan';

  @override
  String get limitReached => 'Grænse Nået';

  @override
  String get freeCategoryLimit =>
      'Du har nået 30-spørgsmåls grænsen for gratis kategorier. Opgrader til Premium for ubegrænset adgang!';

  @override
  String get previewLimit =>
      'Du har set alle 5 forhåndsvisningsspørgsmål. Opgrader til Premium for at fortsætte!';

  @override
  String get pandoraFreeLimit => 'Gratis Grænse';

  @override
  String get pandoraFreeLimitMessage =>
      'Gratis værter kan have maks 6 spillere og 12 spørgsmål. Opgrader til Premium for ubegrænset!';

  @override
  String get pandoraUpgradeMessage =>
      'Du har nået 12 spørgsmål. Opgrader til Premium for at fortsætte med at spille!';

  @override
  String get pandoraMaxPlayers =>
      'Maksimum 6 spillere nået (Gratis grænse). Opgrader til Premium for ubegrænsede spillere!';

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
  String get watchAd => 'Se Annonce';

  @override
  String get goAdFree => 'Gå Uden Annoncer med Premium';

  @override
  String get removeAdsForever => 'Fjern Annoncer For Altid';

  @override
  String get adNotReady => 'Annonce ikke klar. Fortsætter uden annonce.';

  @override
  String get adLoadingContinue => 'Annonce indlæses... Fortsæt';

  @override
  String get pricePerMonth => '49 DKK/måned eller 399 DKK/år';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Ingen spørgsmål fundet for $category i $mode tilstand';
  }

  @override
  String get errorLoadingQuestions =>
      'Fejl ved indlæsning af spørgsmål. Tjek venligst din forbindelse.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Kunne ikke indlæse spørgsmål';
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
    return 'Sproget er ændret til $language';
  }

  @override
  String get profile => 'Profil';

  @override
  String get signOut => 'Log Ud';

  @override
  String get notSignedIn => 'Ikke Logget Ind';

  @override
  String get signInSignUp => 'Log Ind / Tilmeld';

  @override
  String get signInToSync =>
      'Log ind for at synkronisere dit abonnement på tværs af enheder og låse op for premium indhold';

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
  String get subscriptionStatus => 'Abonnementsstatus';

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
  String get aboutCredits => 'Om / Credits';

  @override
  String get welcomeBack => 'Velkommen Tilbage!';

  @override
  String get createAccount => 'Opret Konto';

  @override
  String get displayName => 'Visningsnavn';

  @override
  String get password => 'Adgangskode';

  @override
  String get signIn => 'Log Ind';

  @override
  String get signUp => 'Tilmeld Dig';

  @override
  String get dontHaveAccount => 'Har du ikke en konto? Tilmeld dig';

  @override
  String get alreadyHaveAccount => 'Har du allerede en konto? Log ind';

  @override
  String get chooseYourMode => '1. Vælg Din Tilstand';

  @override
  String get chooseYourModeDesc =>
      'Vælg mellem tre samtalestile:\n\n• Familie - Varme, sunde samtaler perfekt for alle aldre\n• Par - Intime og romantiske spørgsmål til at uddybe jeres forbindelse\n• Venner - Sjove og underholdende emner til din gruppe';

  @override
  String get pickCategory => '2. Vælg en Kategori';

  @override
  String get pickCategoryDesc =>
      'Hver tilstand har flere kategorier med unikke spørgsmålspakker. 3 gratis kategorier per tilstand (30 spørgsmål hver), med 5-spørgsmåls forhåndsvisninger af premium kategorier.';

  @override
  String get startTalking => '3. Begynd at Tale';

  @override
  String get startTalkingDesc =>
      'Spørgsmål vises i fuld skærm. Skift til at læse og besvare dem ærligt. Der er ingen forkerte svar - målet er meningsfuld samtale!';

  @override
  String get navigateQuestions => '4. Naviger Spørgsmål';

  @override
  String get navigateQuestionsDesc =>
      '• Swipe til højre eller tryk på \"Næste\" for næste spørgsmål\n• Swipe til venstre eller tryk på \"Forrige\" for at gense spørgsmål\n• Tryk på hjem-knappen for at vende tilbage til hovedmenuen når som helst';

  @override
  String get premiumFeatures => '5. Premium Funktioner';

  @override
  String get premiumFeaturesDesc =>
      'Lås alle 24 kategorier op med Premium:\n\n• Månedligt: 49 DKK/måned\n• Årligt: 399 DKK/år (spar 189 DKK!)\n\n✓ Alle kategorier låst op\n✓ Ingen annoncer\n✓ Ubegrænsede spørgsmål\n✓ Ubegrænsede Pandora-sessioner';

  @override
  String get proTips => 'Pro Tips';

  @override
  String get proTipsDesc =>
      '• Skab et komfortabelt, distraktionsfrit miljø\n• Lyt aktivt og vær til stede\n• Del ærligt og opfordr andre til at gøre det samme\n• Respekter grænser - spring spørgsmål over hvis nødvendigt\n• Hav det sjovt og nyd at skabe forbindelse!';

  @override
  String get personal => 'Personligt';

  @override
  String get personalDesc => 'Opret dine egne tilpassede spørgsmålskort';

  @override
  String get gameComplete => 'Spil Fuldført!';

  @override
  String get noMoreQuestions =>
      'Du har gennemgået alle spørgsmålene i denne bunke!';

  @override
  String get playAgain => 'Spil Igen';

  @override
  String get mainMenu => 'Hovedmenu';

  @override
  String get thanksForPlaying => 'Tak For at Spille!';

  @override
  String get hopeYouHadFun => 'Håber du havde det sjovt! 🎉';

  @override
  String get backToMenu => 'Tilbage til Menu';

  @override
  String get leaveGame => 'Forlade Spillet?';

  @override
  String get leaveGameMessage =>
      'Er du sikker på, at du vil forlade? Spillet fortsætter for andre spillere.';

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
  String get favorites => 'Favoritter';

  @override
  String get pandoraHostCreatePin => 'Værten opretter session og deler PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'Spillere deltager (maks 6 gratis, ubegrænset premium)';

  @override
  String get pandoraHostSetsTimer => 'Værten sætter spørgsmålstimer (1-15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Alle indsender spørgsmål (maks 12 gratis)';

  @override
  String get pandoraHostControls => 'Værten styrer spillets progression';

  @override
  String get pandoraQuestionsDeleted => 'Spørgsmål slettes efter spillet';

  @override
  String get pandoraHost => 'Vært';

  @override
  String get pandoraJoinGame => 'Deltag i Spil';

  @override
  String get pandoraPandoraBox => 'Pandora Boks';

  @override
  String get pleaseEnterName => 'Indtast venligst dit navn';

  @override
  String get hostSuffix => '(Vært)';

  @override
  String get playersJoinWithNames => 'Spillere deltager med deres navne';

  @override
  String get everyoneSubmitsMin5 =>
      'Alle indsender spørgsmål (min 5, maks 12 gratis)';

  @override
  String get createSession => 'Opret Session';

  @override
  String get creating => 'Opretter...';

  @override
  String get yourName => 'Dit Navn';

  @override
  String get enterDisplayName => 'Indtast dit visningsnavn';

  @override
  String get howItWorks => 'Sådan Fungerer Det';

  @override
  String get pinCopied => 'PIN kopieret til udklipsholderen!';

  @override
  String get endSession => 'Afslut session';

  @override
  String get endSessionConfirm =>
      'Er du sikker på, at du vil afslutte denne Pandora-session?';

  @override
  String get createCustomDeck => 'Opret Tilpasset Kortsæt';

  @override
  String get deckName => 'Kortsætnavn';

  @override
  String get enterDeckName => 'Indtast kortsætnavn';

  @override
  String get create => 'Opret';

  @override
  String get deckCreated => 'Kortsæt oprettet!';

  @override
  String get failedToCreateDeck => 'Kunne ikke oprette kortsæt';

  @override
  String get deleteDeck => 'Slet Kortsæt?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Er du sikker på, at du vil slette \"$deckName\"? Dette vil slette alle spørgsmål i dette kortlæg.';
  }

  @override
  String get delete => 'Slet';

  @override
  String get deckDeleted => 'Kortsæt slettet';

  @override
  String get failedToDeleteDeck => 'Kunne ikke slette kortsæt';

  @override
  String get myDecks => 'Mine Kortsæt';

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
  String get editQuestion => 'Rediger Spørgsmål';

  @override
  String get enterYourQuestion => 'Indtast dit spørgsmål';

  @override
  String get save => 'Gem';

  @override
  String get questionUpdated => 'Spørgsmål opdateret!';

  @override
  String get failedToUpdateQuestion => 'Kunne ikke opdatere spørgsmål';

  @override
  String get deleteQuestion => 'Slet Spørgsmål';

  @override
  String get deleteQuestionConfirm =>
      'Er du sikker på, at du vil slette dette spørgsmål?';

  @override
  String get questionDeleted => 'Spørgsmål slettet';

  @override
  String get failedToDeleteQuestion => 'Kunne ikke slette spørgsmål';

  @override
  String get addQuestion => 'Tilføj Spørgsmål';

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
  String get deckDescCozyTalks =>
      'Varme, afslappede samtaler perfekt til hyggelige aftener. Disse spørgsmål skaber behagelige, hjertevarme øjeblikke af forbindelse.';

  @override
  String get deckDescPartyNight =>
      'Højenergi spørgsmål designet til sjove gruppesituationer. Perfekt til fester og sociale sammenkomster med venner.';

  @override
  String get deckDescUnpopularOpinions =>
      'Sættet der udfordrer dig til at sige, hvad alle tænker, men ingen indrømmer. Fra influencer-kultur til sociale normer – disse kort skaber ærlige debatter og overraskende perspektiver. Perfekt til venner med meninger.';

  @override
  String get deckDescPlotTwists =>
      'Denne bunke kaster dig direkte ind i livets sjoveste og sværeste \"hvad ville du gøre?\"-øjeblikke. Hurtig tænkning, mavefornemmelser og latter garanteret! Perfekt til gruppeaftener fulde af overraskelser og grin.';

  @override
  String get deckDescAfterDark =>
      'Træd ind i samtalens mørke side med spørgsmål, der sender kuldegysninger ned ad ryggen. Fra uhyggelige tilfældigheder til overlevelsesscenarier – perfekt til sene nætter med spænding.';

  @override
  String get deckDescHistoryTalks =>
      'En nostalgisk blanding af personlige minder og familiemomenter. Disse spørgsmål inspirerer historier, latter og genopdagelse af dine rødder. Perfekt til familiesammenkomster eller hyggelige aftener.';

  @override
  String get deckDescTinyTalks =>
      'Designet til forældre og deres små! Disse enkle, legende spørgsmål hjælper børn med at udtrykke sig, mens forældre lærer, hvordan de tænker. Perfekt til 3-9 år.';

  @override
  String get deckDescGoodOldDays =>
      'Rejs tilbage i tiden med spørgsmål om elskede minder, tidligere oplevelser og hvordan tingene plejede at være. Perfekt for alle aldre.';

  @override
  String get deckDescWouldYouRather =>
      'Klassiske dilemma-spørgsmål, der skaber debatter og afslører præferencer. Vælg mellem to muligheder og opdag, hvad der betyder mest.';

  @override
  String get createNewDeck => 'Opret Nyt Kortsæt';

  @override
  String get sessionPin => 'Session PIN';

  @override
  String get joinSession => 'Deltag i Session';

  @override
  String get questionSubmitted => 'Spørgsmål Indsendt';

  @override
  String get sessionCancelled => 'Session Annulleret';

  @override
  String get yourQuestion => 'Dit spørgsmål';

  @override
  String get reactionBreakdown => 'Reaktionsanalyse';

  @override
  String get deckNameHint => 'Kortlæg navn';

  @override
  String get deckCreatedSuccess => 'Kortlæg oprettet!';

  @override
  String get cancelSession => 'Afbryd session?';

  @override
  String get cancelSessionConfirm =>
      'Dette vil afbryde sessionen for alle spillere. Er du sikker?';

  @override
  String get no => 'Nej';

  @override
  String get yesCancel => 'Ja, afbryd';

  @override
  String get hostQuestionCollection => 'Vært - Indsamling af spørgsmål';

  @override
  String get questionCollection => 'Spørgsmålsindsamling';

  @override
  String get endSessionButton => 'Afslut session';

  @override
  String get noActiveSubscription => 'Intet aktivt abonnement';

  @override
  String get premium => 'Premium';

  @override
  String notEnoughQuestions(Object count) {
    return 'Not enough questions. Minimum 5 required. (Currently: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Premium Funktion';

  @override
  String get questionNavigationPremium =>
      'Spørgsmålsnavigation er en premium funktion. Abonner for at låse op for muligheden for at hoppe til ethvert spørgsmål!';

  @override
  String get customDecks => 'Tilpassede Bunker';

  @override
  String get noDecksYetMessage => 'Ingen bunker endnu';

  @override
  String get createFirstDeckMessage => 'Tryk + for at oprette din første bunke';

  @override
  String get signInRequired => 'Log Ind Påkrævet';

  @override
  String get signInToUsePersonal =>
      'Log venligst ind for at bruge Personlig tilstand og oprette tilpassede spørgsmålsbunker.';

  @override
  String get collaborativeQuestionGame => 'Samarbejdsspil med Spørgsmål';

  @override
  String get hostPandoraSession => 'Vært Pandora Session';

  @override
  String get joinPandoraGame => 'Deltag i et Spil';

  @override
  String get yourDisplayName => 'Dit Visningsnavn';

  @override
  String get enterYourName => 'Indtast dit navn';

  @override
  String get selectQuestion => 'Vælg Spørgsmål';

  @override
  String get joinTime => 'Tid til at Deltage';

  @override
  String get participants => 'Deltagere';

  @override
  String get loading => 'Indlæser...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Mindst 2 spillere nødvendige ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Fortsæt til Timer Opsætning';

  @override
  String get setQuestionTimer => 'Indstil spørgsmålstimer';

  @override
  String get questionCollectionTime => 'Tid til indsamling af spørgsmål';

  @override
  String get minutes => 'minutter';

  @override
  String get sessionWillEnd =>
      'Sessionen afsluttes automatisk, hvis du ikke fortsætter inden for 5 minutter';

  @override
  String get startQuestionCollection => 'Start indsamling af spørgsmål';

  @override
  String questionsSubmitted(int count) {
    return '$count spørgsmål indsendt';
  }

  @override
  String get writeQuestionHere => 'Skriv dit spørgsmål her...';

  @override
  String get whoIsThisFor => 'Hvem er dette til?';

  @override
  String get everyone => 'Alle';

  @override
  String get specific => 'Specifik';

  @override
  String get submitQuestion => 'Indsend spørgsmål';

  @override
  String needMoreQuestions(int count) {
    return 'Mangler $count flere spørgsmål';
  }

  @override
  String get startGame => 'Start spil';

  @override
  String get selectPlayer => 'Vælg en spiller';

  @override
  String get unsubscribe => 'Afmeld';

  @override
  String get unsubscribeConfirm => 'Opsig Premium-abonnement?';

  @override
  String get unsubscribeWarning =>
      'Du mister adgang til alle premiumfunktioner, inklusive ubegrænsede spørgsmål, alle kategorier, reklamefri oplevelse og ubegrænsede Pandora-spillere. Du kan tilmelde dig igen når som helst.';

  @override
  String get yesUnsubscribe => 'Ja, afmeld';

  @override
  String get unsubscribeSuccess =>
      'Afmeldt med succes. Premiumfunktioner er deaktiveret.';

  @override
  String get unsubscribeError => 'Kunne ikke afmelde';

  @override
  String get questions => 'spørgsmål';

  @override
  String get preview => 'forhåndsvisning';

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
}
