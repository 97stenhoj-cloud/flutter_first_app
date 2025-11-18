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
  String get locked => 'Premiumkategori';

  @override
  String get lockedMessage =>
      'Dette er en premiumkategori. Opgrader for at låse alle kategorier op og fjerne reklamer!';

  @override
  String get previewAvailable =>
      'Forhåndsvisning: De første 5 spørgsmål er tilgængelige';

  @override
  String get upgradeNow => 'Opgrader nu';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Måske senere';

  @override
  String get getPremium => 'Få Premium';

  @override
  String get premiumTitle => 'Lås alt op';

  @override
  String get premiumDescription =>
      'Få ubegrænset adgang til alle kategorier i alle tilstande, fjern reklamer, og nyd ubegrænsede Pandora-sessioner.';

  @override
  String get premiumPriceMonthly => '€6,99/måned';

  @override
  String get premiumPriceYearly => '€59,99/år';

  @override
  String get saveWithYearly => 'Spar €23,89 med årlig betaling!';

  @override
  String get monthly => 'Månedlig';

  @override
  String get yearly => 'Årlig';

  @override
  String get billedMonthly => 'Faktureres månedligt';

  @override
  String get billedYearly => 'Faktureres årligt';

  @override
  String get premiumFeature1 => '✓ Alle 21 premiumkategorier låst op';

  @override
  String get premiumFeature2 => '✓ Ingen reklamer for evigt';

  @override
  String get premiumFeature3 => '✓ 75 spørgsmål i alle kategorier';

  @override
  String get premiumFeature4 => '✓ Pandora: Ubegrænsede spillere og spørgsmål';

  @override
  String get premiumFeature5 => '✓ Støt løbende udvikling';

  @override
  String get subscribePremium => 'Abonnér på Premium';

  @override
  String get subscribe => 'Abonnér';

  @override
  String get cancel => 'Annuller';

  @override
  String get subscriptionActivated =>
      'Premium aktiveret! Alle kategorier er låst op.';

  @override
  String get premiumActivated => 'Premium aktiveret!';

  @override
  String get demoNote => 'Demo: Abonnement nulstilles ved genstart af appen';

  @override
  String get freeTier => 'Gratis niveau';

  @override
  String get freeTierDesc =>
      '3 kategorier per tilstand (30 spørgsmål hver)\n5-spørgsmåls forhåndsvisninger af premiumkategorier\nReklamer hvert 7. spørgsmål';

  @override
  String get currentPlan => 'Nuværende plan';

  @override
  String get limitReached => 'Grænse nået';

  @override
  String get freeCategoryLimit =>
      'Du har nået grænsen på 30 spørgsmål i gratis kategorier. Opgrader til Premium for ubegrænset adgang!';

  @override
  String get previewLimit =>
      'Du har set alle 5 forhåndsvisningsspørgsmål. Opgrader til Premium for at fortsætte!';

  @override
  String get pandoraFreeLimit => 'Gratis grænse';

  @override
  String get pandoraFreeLimitMessage =>
      'Gratis værter kan have maks. 6 spillere og 12 spørgsmål. Opgrader til Premium for ubegrænset adgang!';

  @override
  String get pandoraUpgradeMessage =>
      'Du har nået 12 spørgsmål. Opgrader til Premium for at fortsætte med at spille!';

  @override
  String get pandoraMaxPlayers =>
      'Maksimalt 6 spillere nået (gratis grænse). Opgrader til Premium for ubegrænsede spillere!';

  @override
  String get swipeOrTap => 'Swipe eller tryk på pilene';

  @override
  String get previous => 'Forrige';

  @override
  String get next => 'Næste';

  @override
  String get advertisement => 'Reklame';

  @override
  String get watchAdMessage =>
      'Se en kort reklame for at fortsætte, eller gå reklamefri med Premium!';

  @override
  String get watchAd => 'Se reklame';

  @override
  String get goAdFree => 'Gå reklamefri med Premium';

  @override
  String get removeAdsForever => 'Fjern reklamer for evigt';

  @override
  String get adNotReady => 'Reklame ikke klar. Fortsætter uden reklame.';

  @override
  String get adLoadingContinue => 'Indlæser reklame... fortsætter';

  @override
  String get pricePerMonth => '€6,99/måned eller €59,99/år';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Ingen spørgsmål fundet for $category i tilstand $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Fejl ved indlæsning af spørgsmål. Tjek din forbindelse.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Kunne ikke indlæse spørgsmål: $error';
  }

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
  String get signInSignUp => 'Log ind / Opret konto';

  @override
  String get signInToSync =>
      'Log ind for at synkronisere dit abonnement på tværs af enheder og låse premiumindhold op';

  @override
  String get signOutConfirm => 'Er du sikker på, at du vil logge ud?';

  @override
  String get signedOutSuccess => 'Logget ud';

  @override
  String get accountInformation => 'Kontooplysninger';

  @override
  String get email => 'Email';

  @override
  String get memberSince => 'Medlem siden';

  @override
  String get notAvailable => 'Ikke tilgængelig';

  @override
  String get unknown => 'Ukendt';

  @override
  String get subscriptionStatus => 'Abonnementsstatus';

  @override
  String get premiumMember => 'Premium-medlem';

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
  String get googleSignInFailed => 'Google-login mislykkedes. Prøv igen.';

  @override
  String get appleSignInFailed => 'Apple-login mislykkedes. Prøv igen.';

  @override
  String get noCategoriesFound => 'Ingen kategorier fundet';

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
  String get signUp => 'Opret konto';

  @override
  String get dontHaveAccount => 'Har du ikke en konto? Opret en';

  @override
  String get alreadyHaveAccount => 'Har du allerede en konto? Log ind';

  @override
  String get chooseYourMode => '1. Vælg din tilstand';

  @override
  String get chooseYourModeDesc =>
      'Vælg mellem fem unikke samtaleoplevelser:\n\n• Par – Intime spørgsmål, der styrker jeres romantiske forbindelse\n• Venner – Sjove og engagerende emner, perfekte til vennegruppen\n• Familie – Varme, hyggelige samtaler for alle aldre\n• Personlig – Lav dine egne tilpassede spørgsmålsæt (Premium)\n• Pandora – Samarbejdende multiplayer-spil med spørgsmål i realtid';

  @override
  String get pickCategory => '2. Vælg en kategori';

  @override
  String get pickCategoryDesc =>
      'Hver tilstand har flere kategorier med kuraterede spørgsmåls-pakker:\n\n• Gratis: 3 kategorier per tilstand (30 spørgsmål hver)\n• Premium forhåndsvisning: De første 5 spørgsmål fra premiumkategorier\n• Premium: 24+ kategorier (75 spørgsmål hver)\n• Personlig: Opret ubegrænsede tilpassede sæt med dine egne spørgsmål';

  @override
  String get startTalking => '3. Start spillet';

  @override
  String get startTalkingDesc =>
      'Spørgsmål vises i fuld skærm for fordybende samtaler. Skift til at læse og svare ærligt – der er ingen forkerte svar! Målet er meningsfuld forbindelse og sjov.\n\nI Pandora-tilstand: Alle spillere indsender spørgsmål anonymt, og alle svarer sammen i realtid.';

  @override
  String get navigateQuestions => '4. Navigér mellem spørgsmål';

  @override
  String get navigateQuestionsDesc =>
      '• Swipe i en vilkårlig retning eller tryk på pilene for at skifte spørgsmål\n• Tryk på ❤️ for at gemme favoritter\n• Premium: Tryk på spørgs­målslisten (øverst til højre) for at hoppe til et vilkårligt spørgsmål\n• Tryk på hjem-knappen for at vende tilbage til hovedmenuen når som helst';

  @override
  String get premiumFeatures => '5. Premiumfunktioner';

  @override
  String get premiumFeaturesDesc =>
      'Lås den fulde Connect-oplevelse op:\n\n• Månedligt: €6,99/måned\n• Årligt: €59,99/år (spar 29 %!)\n\n✓ Alle 24+ premiumkategorier i alle tilstande\n✓ 75 spørgsmål per kategori (vs 30 gratis)\n✓ Ingen reklamer for evigt\n✓ Pandora: Ubegrænsede spillere og spørgsmål\n✓ Personlig: Opret ubegrænsede tilpassede sæt\n✓ Spørgsmålsnavigation – hop til ethvert spørgsmål\n✓ Støt løbende udvikling';

  @override
  String get proTips => 'Pro tips';

  @override
  String get proTipsDesc =>
      '• Skab en behagelig, forstyrrelsesfri atmosfære\n• Lyt aktivt og vær nærværende\n• Del ærligt og opmuntr andre til det samme\n• Respekter grænser – det er okay at springe spørgsmål over\n• Brug favoritter ❤️ til at gemme spørgsmål, du kan lide\n• Prøv forskellige tilstande til forskellige lejligheder\n• Pandora er perfekt til fester og gruppehygge\n• Hav det sjovt og nyd forbindelsen!';

  @override
  String get aboutCredits => 'Om / Credits';

  @override
  String get developedBy => 'Udviklet af TechyKoala';

  @override
  String get learnMore => 'Lær mere om os og kommende apps';

  @override
  String get visitWebsite => 'Besøg techykoala.com';

  @override
  String get madeWithLove => 'Lavet med ❤️ til meningsfulde samtaler';

  @override
  String get personal => 'Personlig';

  @override
  String get personalDesc => 'Lav dine egne tilpassede spørgsmålsæt';

  @override
  String get gameComplete => 'Spillet er færdigt!';

  @override
  String get noMoreQuestions => 'Du har gennemgået alle spørgsmål i dette sæt!';

  @override
  String get playAgain => 'Spil igen';

  @override
  String get mainMenu => 'Hovedmenu';

  @override
  String get thanksForPlaying => 'Tak fordi du spillede!';

  @override
  String get hopeYouHadFun => 'Vi håber, du havde det sjovt! 🎉';

  @override
  String get backToMenu => 'Tilbage til menu';

  @override
  String get leaveGame => 'Forlad spil?';

  @override
  String get leaveGameMessage =>
      'Er du sikker på, at du vil forlade? Spillet fortsætter for de andre spillere.';

  @override
  String get leave => 'Forlad';

  @override
  String get noQuestionsAvailable => 'Ingen spørgsmål tilgængelige';

  @override
  String get showLess => 'Vis mindre';

  @override
  String get readMore => 'Læs mere';

  @override
  String get tapToPlay => 'Tryk for at spille';

  @override
  String get favorites => 'Favoritter';

  @override
  String get pandoraHostCreatePin => 'Vært opretter session og deler PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'Spillere deltager (maks. 6 gratis, ubegrænset med Premium)';

  @override
  String get pandoraHostSetsTimer => 'Vært sætter spørgetimer (1–15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Alle indsender spørgsmål (maks. 12 gratis)';

  @override
  String get pandoraHostControls => 'Værten styrer spillets forløb';

  @override
  String get pandoraQuestionsDeleted => 'Spørgsmål slettes efter spillet';

  @override
  String get pandoraHost => 'Vært';

  @override
  String get pandoraJoinGame => 'Deltag i spil';

  @override
  String get pandoraPandoraBox => 'Pandoras boks';

  @override
  String get pleaseEnterName => 'Indtast dit navn';

  @override
  String get hostSuffix => '(Vært)';

  @override
  String get playersJoinWithNames => 'Spillere deltager med deres navne';

  @override
  String get everyoneSubmitsMin5 =>
      'Alle indsender spørgsmål (min. 5, maks. 12 gratis)';

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
  String get pinCopied => 'PIN kopieret til udklipsholder!';

  @override
  String get endSession => 'Afslut session?';

  @override
  String get endSessionConfirm =>
      'Er du sikker på, at du vil afslutte denne Pandora-session?';

  @override
  String get createCustomDeck => 'Opret tilpasset sæt';

  @override
  String get deckName => 'Sætnavn';

  @override
  String get enterDeckName => 'Indtast sætnavn';

  @override
  String get create => 'Opret';

  @override
  String get deckCreated => 'Sæt oprettet!';

  @override
  String get failedToCreateDeck => 'Kunne ikke oprette sæt';

  @override
  String get deleteDeck => 'Slet sæt?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Er du sikker på, at du vil slette \"$deckName\"? Dette vil slette alle spørgsmål i dette sæt.';
  }

  @override
  String get delete => 'Slet';

  @override
  String get deckDeleted => 'Sæt slettet';

  @override
  String get failedToDeleteDeck => 'Kunne ikke slette sæt';

  @override
  String get myDecks => 'Mine sæt';

  @override
  String get noDecksYet => 'Ingen sæt endnu';

  @override
  String get createFirstDeck => 'Opret dit første tilpassede sæt!';

  @override
  String questionsCount(Object count) {
    return '$count spørgsmål';
  }

  @override
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count spørgsmål',
      one: '1 spørgsmål',
      zero: '0 spørgsmål',
    );
    return '$_temp0';
  }

  @override
  String get questionAdded => 'Spørgsmål tilføjet!';

  @override
  String get failedToAddQuestion => 'Kunne ikke tilføje spørgsmål';

  @override
  String get editQuestion => 'Redigér spørgsmål';

  @override
  String get enterYourQuestion => 'Indtast dit spørgsmål';

  @override
  String get save => 'Gem';

  @override
  String get questionUpdated => 'Spørgsmål opdateret!';

  @override
  String get failedToUpdateQuestion => 'Kunne ikke opdatere spørgsmål';

  @override
  String get deleteQuestion => 'Slet spørgsmål';

  @override
  String get deleteQuestionConfirm =>
      'Er du sikker på, at du vil slette dette spørgsmål?';

  @override
  String get questionDeleted => 'Spørgsmål slettet';

  @override
  String get failedToDeleteQuestion => 'Kunne ikke slette spørgsmål';

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
      'Udforsk romantik, kemi og forbindelse gennem hjertelige spørgsmål, der fejrer jeres forhold. Fra \"sådan mødtes vi\"-øjeblikke til hvad der får dig til at føle dig mest elsket, hjælper disse kort med at styrke den følelsesmæssige intimitet.';

  @override
  String get deckDescDeepTalks =>
      'Disse kort dykker ned i værdier, sårbarhed og hvad det betyder at vokse sammen. De hjælper jer med at reflektere over uafhængighed, kommunikation og fælles retning.';

  @override
  String get deckDescSpicyTalks =>
      'Flirtende, modige og intime — disse kort inviterer par til at udforske begær, fantasier og passion sammen. Hvert spørgsmål er skabt til at tænde ærlige og spændende samtaler om det, der bringer jer tættere.';

  @override
  String get deckDescDoYouDareTalks =>
      'Et frygtløst sæt, der blander følelsesmæssig ærlighed med svære temaer som tillid, religion, økonomi og personlige grænser — designet til at afsløre, hvad der virkelig betyder noget for jer begge. *Bemærk:* Nogle spørgsmål er rå og ufiltrerede — spil med åbenhed, empati og respekt.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspireret af de fem kærlighedssprog hjælper dette sæt jer med at udtrykke kærlighed på måder, der virkelig rammer plet. Opdag hvordan ord, handlinger og små gestus kan styrke jeres forbindelse.';

  @override
  String get deckDescSillyTalks =>
      'Ren sjov og latter! Disse skøre og lette spørgsmål afslører jeres mærkeligste vaner og sjoveste tanker. Perfekt til venner, familie eller par, der ikke tager alting alt for alvorligt.';

  @override
  String get deckDescCarTalks =>
      'Perfekt til køreture — disse kort forvandler transporttid til gode samtaler. Forvent sjove, kreative og nostalgiske spørgsmål om rejser, eventyr og små særheder.';

  @override
  String get deckDescCozyTalks =>
      'Varme og afslappede spørgsmål, perfekte til hyggelige aftener. Skab rolige, nærværende og hjertelige stunder sammen.';

  @override
  String get deckDescPartyNight =>
      'Energifyldte spørgsmål designet til sjove gruppesituationer. Perfekt til fester og sociale sammenkomster med venner.';

  @override
  String get deckDescUnpopularOpinions =>
      'Sættet, der udfordrer dig til at sige det, alle tænker, men ingen siger højt. Fra influencerkultur til sociale normer — disse kort skaber ærlige debatter og overraskende synspunkter. Perfekt til venner med holdninger.';

  @override
  String get deckDescPlotTwists =>
      'Dette sæt kaster dig direkte ind i livets sjoveste og sværeste \"hvad ville du gøre?\"-situationer. Hurtige beslutninger, mavefornemmelser og masser af grin garanteret!';

  @override
  String get deckDescAfterDark =>
      'Træd ind i samtalens mørkere hjørner med spørgsmål, der giver dig gåsehud. Fra uhyggelige tilfældigheder til overlevelsesscenarier — perfekt til sene aftener med lidt ekstra spænding.';

  @override
  String get deckDescHistoryTalks =>
      'En nostalgisk blanding af personlige minder og familieøjeblikke. Disse spørgsmål inviterer til historier, grin og gensyn med jeres rødder. Perfekt til familiesammenkomster eller hyggelige aftener.';

  @override
  String get deckDescTinyTalks =>
      'Designet til forældre og små børn! Enkle, legende spørgsmål, der hjælper børn med at udtrykke sig, mens forældre lærer mere om, hvordan de tænker. Perfekt til 3–9 år.';

  @override
  String get deckDescGoodOldDays =>
      'Rejs tilbage i tiden med spørgsmål om gode minder, tidligere oplevelser og hvordan ting plejede at være. Perfekt til alle aldre.';

  @override
  String get deckDescWouldYouRather =>
      'Klassiske dilemma-spørgsmål, der sætter gang i debat og afslører præferencer. Vælg mellem to muligheder og opdag, hvad der betyder mest for jer.';

  @override
  String get createNewDeck => 'Opret nyt sæt';

  @override
  String get sessionPin => 'Sessions-PIN';

  @override
  String get joinSession => 'Deltag i session';

  @override
  String get questionSubmitted => 'Spørgsmål sendt';

  @override
  String get sessionCancelled => 'Session annulleret';

  @override
  String get yourQuestion => 'Dit spørgsmål';

  @override
  String get reactionBreakdown => 'Oversigt over reaktioner';

  @override
  String get deckNameHint => 'Sætnavn';

  @override
  String get deckCreatedSuccess => 'Sæt oprettet!';

  @override
  String get cancelSession => 'Annuller session?';

  @override
  String get cancelSessionConfirm =>
      'Dette vil annullere sessionen for alle spillere. Er du sikker?';

  @override
  String get no => 'Nej';

  @override
  String get yesCancel => 'Ja, annullér';

  @override
  String get hostQuestionCollection => 'Vært – spørgs­målsindsamling';

  @override
  String get questionCollection => 'Spørgs­målsindsamling';

  @override
  String get endSessionButton => 'Afslut session';

  @override
  String get noActiveSubscription => 'Intet aktivt abonnement';

  @override
  String get premium => 'PREMIUM';

  @override
  String notEnoughQuestions(Object count) {
    return 'Ikke nok spørgsmål. Minimum 5 krævet. (Nuværende: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Premiumfunktion';

  @override
  String get questionNavigationPremium =>
      'Spørgsmålsnavigation er en premiumfunktion. Abonnér for at låse op for at kunne hoppe til ethvert spørgsmål!';

  @override
  String get customDecks => 'Tilpassede sæt';

  @override
  String get noDecksYetMessage => 'Ingen sæt endnu';

  @override
  String get createFirstDeckMessage =>
      'Tryk på + for at oprette dit første sæt';

  @override
  String get signInRequired => 'Login påkrævet';

  @override
  String get signInToUsePersonal =>
      'Log ind for at bruge Personlig tilstand og oprette tilpassede spørgsmålsæt.';

  @override
  String get collaborativeQuestionGame => 'Samarbejds-baseret spørgsmålsspil';

  @override
  String get hostPandoraSession => 'Vær vært for Pandora-session';

  @override
  String get joinPandoraGame => 'Deltag i et spil';

  @override
  String get yourDisplayName => 'Dit visningsnavn';

  @override
  String get enterYourName => 'Indtast dit navn';

  @override
  String get selectQuestion => 'Vælg spørgsmål';

  @override
  String get joinTime => 'Tid til at deltage';

  @override
  String get participants => 'Deltagere';

  @override
  String get loading => 'Indlæser...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Kræver mindst 2 spillere ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Fortsæt til tidsindstilling';

  @override
  String get setQuestionTimer => 'Indstil spørgetimer';

  @override
  String get questionCollectionTime => 'Tid til spørgs­målsindsamling';

  @override
  String get minutes => 'minutter';

  @override
  String get sessionWillEnd =>
      'Sessionen afsluttes automatisk, hvis du ikke fortsætter inden for 5 minutter';

  @override
  String get startQuestionCollection => 'Start spørgs­målsindsamling';

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
  String get specific => 'Specifik person';

  @override
  String get submitQuestion => 'Indsend spørgsmål';

  @override
  String needMoreQuestions(int count) {
    return 'Mangler $count spørgsmål';
  }

  @override
  String get startGame => 'Start spil';

  @override
  String get selectPlayer => 'Vælg spiller';

  @override
  String get unsubscribe => 'Opsig abonnement';

  @override
  String get unsubscribeConfirm => 'Opsig Premium-abonnement?';

  @override
  String get unsubscribeWarning =>
      'Du mister adgang til alle premiumfunktioner, inkl. ubegrænsede spørgsmål, alle kategorier, reklamefri oplevelse og ubegrænsede Pandora-spillere. Du kan altid abonnere igen.';

  @override
  String get yesUnsubscribe => 'Ja, opsig';

  @override
  String get unsubscribeSuccess =>
      'Abonnement opsagt. Premiumfunktioner er deaktiveret.';

  @override
  String get unsubscribeError => 'Kunne ikke opsige abonnement';

  @override
  String get questions => 'spørgsmål';

  @override
  String get preview => 'forhåndsvisning';

  @override
  String get userId => 'Bruger-ID';

  @override
  String get subscription => 'Abonnement';

  @override
  String get questionsCount75 => '75 spørgsmål';

  @override
  String get questionsCount30 => '30 spørgsmål';

  @override
  String get questionsCount5Preview => '5 spørgsmål i forhåndsvisning';

  @override
  String get unlockFullDeck => 'Lås 75 spørgsmål op';

  @override
  String get renameDeck => 'Omdøb sæt';

  @override
  String get deckRenamed => 'Sæt omdøbt';

  @override
  String get failedToRenameDeck => 'Kunne ikke omdøbe sæt';

  @override
  String get shuffleQuestions => 'Bland spørgsmål';

  @override
  String get resetOrder => 'Nulstil rækkefølge';

  @override
  String get questionsShuffled => 'Spørgsmål blandet!';

  @override
  String get orderReset => 'Rækkefølge nulstillet til original';

  @override
  String get readyToPlay => 'Klar til at spille';

  @override
  String get longPressReorder =>
      'Tryk og hold nede for at trække og omarrangere spørgsmål';

  @override
  String get noFavoritesYet => 'Ingen favoritter endnu';

  @override
  String get heartQuestionsDuringGameplay =>
      'Tryk på hjertet ❤️ på kortene under spillet for at gemme spørgsmål her!';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Tilføj mindst $count spørgsmål for at starte spillet!';
  }

  @override
  String get heartQuestionsInfo =>
      'Hjertemarkér spørgsmål under spillet for at tilføje dem til dine favoritter!';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Tilføj mindst $count spørgsmål for at spille dette sæt';
  }

  @override
  String get removeFromFavorites => 'Fjern fra favoritter';

  @override
  String get unlockEverything => 'Lås alt op';

  @override
  String get premiumSubtitle =>
      'Få ubegrænset adgang til alle kategorier, fjern reklamer for evigt og lås premiumfunktioner op';

  @override
  String get save32Percent => 'SPAR 29 %';

  @override
  String get priceMonthly => '€6,99/måned';

  @override
  String get priceYearly => '€59,99/år';

  @override
  String get billedAnnually => 'Faktureres årligt';

  @override
  String get equivalentMonthly => 'Kun €5/måned';

  @override
  String get feature24Categories =>
      '24+ premiumkategorier låst op i alle tilstande';

  @override
  String get feature75Questions =>
      '75 spørgsmål per kategori (vs 30 i gratis niveau)';

  @override
  String get featureNoAds => 'Ingen reklamer for evigt – uafbrudt spil';

  @override
  String get featureUnlimitedPlayers =>
      'Pandora-tilstand: Ubegrænsede spillere og spørgsmål';

  @override
  String get featureQuestionNavigation =>
      'Navigér og hop til ethvert spørgsmål under spillet';

  @override
  String get featureSupportDevelopment =>
      'Støt løbende udvikling og nye funktioner';

  @override
  String get error => 'Fejl';

  @override
  String get premiumActivatedMessage =>
      'Premium aktiveret! Alle kategorier er låst op.';

  @override
  String get featurePersonalDecks =>
      'Personlig tilstand: Opret ubegrænsede tilpassede sæt med dine egne spørgsmål';

  @override
  String get premiumPersonal =>
      'Personlig tilstand med tilpassede sæt er en premiumfunktion. Opgrader til Premium for at oprette og spille dine egne spørgsmålsæt!';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Er du sikker på, at du vil slette \"$deckName\"? Dette vil slette alle spørgsmål i dette sæt.';
  }

  @override
  String needMore(int count) {
    return 'Mangler $count';
  }

  @override
  String get editQuestions => 'Redigér spørgsmål';

  @override
  String get addMore => 'Tilføj flere';

  @override
  String useMyConnectEmail(String email) {
    return 'Brug min Connect-email: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Gratis brugere kan have maks. 6 spillere. Opgrader til Premium for ubegrænsede spillere!';

  @override
  String get freemiumQuestionLimit =>
      'Gratis brugere kan indsende maks. 12 spørgsmål. Opgrader til Premium for ubegrænsede spørgsmål!';

  @override
  String get yourQuestions => 'Dine spørgsmål';

  @override
  String waitingForHost(int count) {
    return 'Venter på vært... ($count spillere)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Opgrader til Premium for ubegrænsede spillere';

  @override
  String get kickPlayer => 'Fjern spiller';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Er du sikker på, at du vil fjerne $playerName?';
  }

  @override
  String get kick => 'Fjern';

  @override
  String playerKicked(String playerName) {
    return '$playerName er blevet fjernet';
  }

  @override
  String get failedToKickPlayer => 'Kunne ikke fjerne spiller';

  @override
  String get cancelSessionForAll =>
      'Dette vil annullere sessionen for alle spillere. Er du sikker?';

  @override
  String get youWereKicked => 'Du blev fjernet fra sessionen';

  @override
  String get you => 'Dig';

  @override
  String get loginRequiredForPandora =>
      'Login er påkrævet for at spille Pandora';

  @override
  String get login => 'Login';

  @override
  String get loginRequiredNote =>
      'Login er påkrævet for at spille Pandora (for at kunne holde styr på spillere korrekt)';

  @override
  String get timeIsUp => 'Tiden er gået!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Der blev ikke indsendt nok spørgsmål ($current/$minimum minimum).';
  }

  @override
  String get sessionQuestionLimit => 'Grænse for spørgsmål i session nået';

  @override
  String get sessionQuestionLimitMessage =>
      'Denne session har nået grænsen på 12 spørgsmål (gratis vært). Opgrader til Premium for ubegrænsede spørgsmål!';

  @override
  String sessionQuestionCount(int current) {
    return 'Session: $current/12 spørgsmål';
  }

  @override
  String get pleaseEnterQuestion => 'Indtast et spørgsmål';

  @override
  String get rateThisDeck => 'Bedøm dette sæt';

  @override
  String get yourRating => 'Din bedømmelse';

  @override
  String get skip => 'Spring over';

  @override
  String get submit => 'Send';

  @override
  String get thankYouForFeedback => 'Tak for din feedback!';

  @override
  String get failedToSubmitRating => 'Kunne ikke sende bedømmelse';

  @override
  String get tapStarsToRate => 'Tryk på stjernerne for at bedømme';

  @override
  String get downloadForOffline => 'Download til offline';

  @override
  String get downloading => 'Downloader...';

  @override
  String get downloadedLanguages => 'Downloadede sprog';

  @override
  String get languageNotDownloaded => 'Sprog ikke downloadet';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'Du har ikke downloadet $languageName til offline brug.\n\nGå til Indstillinger > Profil > \"Download til offline\" mens du er tilsluttet internettet.';
  }

  @override
  String get offlineLanguageError =>
      'Dette sprog er ikke downloadet til offline brug. Gå til Indstillinger > Profil > \"Download til offline\" mens du er tilsluttet internettet.';

  @override
  String get downloadComplete => 'Download færdig!';

  @override
  String get downloadCompleteMessage =>
      'Alt indhold er downloadet til offline brug.';

  @override
  String get addedToFavorites => 'Tilføjet til favoritter';

  @override
  String get removedFromFavorites => 'Fjernet fra favoritter';

  @override
  String get errorSavingFavorite => 'Fejl ved lagring af favorit';

  @override
  String get internetRequired => 'Internet påkrævet';

  @override
  String get internetRequiredMessage =>
      'Nogle funktioner kræver en internetforbindelse. Premium-brugere kan downloade indhold til offline brug under Indstillinger.';

  @override
  String get goPremium => 'Få Premium';

  @override
  String get pleaseEnterPin => 'Indtast venligst en 6-cifret PIN';

  @override
  String errorOccurred(String error) {
    return 'Fejl: $error';
  }

  @override
  String get errorCreatingSession => 'Fejl ved oprettelse af session';

  @override
  String get sessionTimedOut =>
      'Session udløbet – værten indstillede ikke timer';

  @override
  String get errorStarting => 'Fejl ved start';

  @override
  String get errorLoadingParticipants => 'Fejl ved indlæsning af deltagere';

  @override
  String get sessionCancelledByHost => 'Session annulleret af værten';

  @override
  String needAtLeast5Questions(int count) {
    return 'Mindst 5 spørgsmål påkrævet for at starte! (Nuværende: $count)';
  }

  @override
  String get errorStartingGame => 'Fejl ved start af spil';

  @override
  String get questionsAsked => 'Stillede spørgsmål';

  @override
  String get totalReactions => 'Samlede reaktioner';

  @override
  String get mostLovedQuestion => 'Mest elskede spørgsmål';

  @override
  String get mostFunQuestion => 'Sjoveste spørgsmål';

  @override
  String get mostShockingQuestion => 'Mest chokerende spørgsmål';

  @override
  String get mostLitQuestion => 'Mest lit spørgsmål';

  @override
  String get hotSeatAward => 'Hot Seat-pris';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Fejl: Kunne ikke identificere spilleren. Tilmeld dig venligst sessionen igen.';

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
