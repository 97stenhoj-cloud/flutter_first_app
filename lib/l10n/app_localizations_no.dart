// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Start';

  @override
  String get settings => 'Innstillinger';

  @override
  String get howToPlay => 'Slik spiller du';

  @override
  String get chooseGameMode => 'Velg spillmodus';

  @override
  String get family => 'Familie';

  @override
  String get couple => 'Par';

  @override
  String get friends => 'Venner';

  @override
  String get chooseCategory => 'Velg en kategori';

  @override
  String get locked => 'Premium-kategori';

  @override
  String get lockedMessage =>
      'Dette er en premiumkategori. Oppgrader for å låse opp alle kategorier og fjerne annonser!';

  @override
  String get previewAvailable =>
      'Forhåndsvisning: de 5 første spørsmålene er tilgjengelige';

  @override
  String get upgradeNow => 'Oppgrader nå';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Kanskje senere';

  @override
  String get getPremium => 'Få Premium';

  @override
  String get premiumTitle => 'Lås opp alt';

  @override
  String get premiumDescription =>
      'Få ubegrenset tilgang til alle kategorier i alle modi, fjern annonser og nyt ubegrensede Pandora-økter.';

  @override
  String get premiumPriceMonthly => '€6,99/måned';

  @override
  String get premiumPriceYearly => '€59,99/år';

  @override
  String get saveWithYearly => 'Spar €23,89 med årlig abonnement!';

  @override
  String get monthly => 'Månedlig';

  @override
  String get yearly => 'Årlig';

  @override
  String get billedMonthly => 'Faktureres månedlig';

  @override
  String get billedYearly => 'Faktureres årlig';

  @override
  String get premiumFeature1 => '✓ Alle 21 premiumkategorier låst opp';

  @override
  String get premiumFeature2 => '✓ Ingen annonser – for alltid';

  @override
  String get premiumFeature3 => '✓ 75 spørsmål i alle kategorier';

  @override
  String get premiumFeature4 =>
      '✓ Pandora: Ubegrenset antall spillere og spørsmål';

  @override
  String get premiumFeature5 => '✓ Støtt videre utvikling';

  @override
  String get subscribePremium => 'Abonner på Premium';

  @override
  String get subscribe => 'Abonner';

  @override
  String get cancel => 'Avbryt';

  @override
  String get subscriptionActivated =>
      'Premium er aktivert! Alle kategorier er låst opp.';

  @override
  String get premiumActivated => 'Premium aktivert!';

  @override
  String get demoNote =>
      'Demo: Abonnementet tilbakestilles når appen startes på nytt';

  @override
  String get freeTier => 'Gratisversjon';

  @override
  String get freeTierDesc =>
      '3 kategorier per modus (30 spørsmål hver)\n5-spørsmåls forhåndsvisning av premiumkategorier\nAnnonser hver 7. spørsmål';

  @override
  String get currentPlan => 'Nåværende plan';

  @override
  String get limitReached => 'Grense nådd';

  @override
  String get freeCategoryLimit =>
      'Du har nådd grensen på 30 spørsmål i gratiskategorier. Oppgrader til Premium for ubegrenset tilgang!';

  @override
  String get previewLimit =>
      'Du har sett alle 5 forhåndsvisningsspørsmålene. Oppgrader til Premium for å fortsette!';

  @override
  String get pandoraFreeLimit => 'Grense for gratisversjon';

  @override
  String get pandoraFreeLimitMessage =>
      'Gratisverter kan ha maks 6 spillere og 12 spørsmål. Oppgrader til Premium for å fjerne begrensningene!';

  @override
  String get pandoraUpgradeMessage =>
      'Du har nådd 12 spørsmål. Oppgrader til Premium for å fortsette å spille!';

  @override
  String get pandoraMaxPlayers =>
      'Maks 6 spillere nådd (gratisgrense). Oppgrader til Premium for ubegrenset antall spillere!';

  @override
  String get swipeOrTap => 'Sveip eller trykk på pilene';

  @override
  String get previous => 'Forrige';

  @override
  String get next => 'Neste';

  @override
  String get advertisement => 'Annonse';

  @override
  String get watchAdMessage =>
      'Se en kort annonse for å fortsette, eller spill uten annonser med Premium!';

  @override
  String get watchAd => 'Se annonse';

  @override
  String get goAdFree => 'Spill uten annonser med Premium';

  @override
  String get removeAdsForever => 'Fjern annonser for alltid';

  @override
  String get adNotReady => 'Annonsen er ikke klar. Fortsetter uten annonse.';

  @override
  String get adLoadingContinue => 'Laster annonse ... Fortsett';

  @override
  String get pricePerMonth => '€6,99/måned eller €59,99/år';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Fant ingen spørsmål for $category i $mode-modus';
  }

  @override
  String get errorLoadingQuestions =>
      'Feil ved innlasting av spørsmål. Sjekk tilkoblingen din.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Kunne ikke laste inn spørsmål: $error';
  }

  @override
  String get howManyPlayers => 'Hvor mange spillere?';

  @override
  String get players => 'Spillere';

  @override
  String get continueButton => 'Fortsett';

  @override
  String get language => 'Språk';

  @override
  String languageChanged(Object language) {
    return 'Språk endret til $language';
  }

  @override
  String get profile => 'Profil';

  @override
  String get signOut => 'Logg ut';

  @override
  String get notSignedIn => 'Ikke logget inn';

  @override
  String get signInSignUp => 'Logg inn / Registrer deg';

  @override
  String get signInToSync =>
      'Logg inn for å synkronisere abonnementet ditt på tvers av enheter og låse opp premium-innhold';

  @override
  String get signOutConfirm => 'Er du sikker på at du vil logge ut?';

  @override
  String get signedOutSuccess => 'Du er logget ut';

  @override
  String get accountInformation => 'Kontoinformasjon';

  @override
  String get email => 'E-post';

  @override
  String get memberSince => 'Medlem siden';

  @override
  String get notAvailable => 'Ikke tilgjengelig';

  @override
  String get unknown => 'Ukjent';

  @override
  String get subscriptionStatus => 'Abonnementsstatus';

  @override
  String get premiumMember => 'Premium-medlem';

  @override
  String get freeAccount => 'Gratis konto';

  @override
  String get welcomeToConnect => 'Velkommen til Connect!';

  @override
  String get continueWithApple => 'Fortsett med Apple';

  @override
  String get continueWithGoogle => 'Fortsett med Google';

  @override
  String get skipForNow => 'Hopp over for nå';

  @override
  String get byContining =>
      'Ved å fortsette godtar du våre vilkår for bruk og personvernerklæring';

  @override
  String get googleSignInFailed =>
      'Innlogging med Google mislyktes. Prøv igjen.';

  @override
  String get appleSignInFailed => 'Innlogging med Apple mislyktes. Prøv igjen.';

  @override
  String get noCategoriesFound => 'Ingen kategorier funnet';

  @override
  String get welcomeBack => 'Velkommen tilbake!';

  @override
  String get createAccount => 'Opprett konto';

  @override
  String get displayName => 'Visningsnavn';

  @override
  String get password => 'Passord';

  @override
  String get signIn => 'Logg inn';

  @override
  String get signUp => 'Registrer deg';

  @override
  String get dontHaveAccount => 'Har du ikke konto? Registrer deg';

  @override
  String get alreadyHaveAccount => 'Har du allerede konto? Logg inn';

  @override
  String get chooseYourMode => '1. Velg modus';

  @override
  String get chooseYourModeDesc =>
      'Velg mellom fem unike samtaleopplevelser:\n\n• Par – Intime spørsmål som styrker det romantiske forholdet\n• Venner – Morsomme og engasjerende temaer, perfekte for vennegjengen\n• Familie – Varme, trygge samtaler for alle aldre\n• Personlig – Lag dine egne, tilpassede spørsmålsstokker (Premium)\n• Pandora – Samarbeidsbasert flerspiller-spill med spørsmål i sanntid';

  @override
  String get pickCategory => '2. Velg kategori';

  @override
  String get pickCategoryDesc =>
      'Hver modus har flere kategorier med nøye utvalgte spørsmålspakker:\n\n• Gratis: 3 kategorier per modus (30 spørsmål hver)\n• Premium-forhåndsvisning: de 5 første spørsmålene i premiumkategorier\n• Premium: 24+ kategorier (75 spørsmål hver)\n• Personlig: lag ubegrenset mange egne stokker med dine egne spørsmål';

  @override
  String get startTalking => '3. Start å spille';

  @override
  String get startTalkingDesc =>
      'Spørsmål vises i fullskjerm for å gjøre samtalen mer fokusert. Ta tur med å lese og svare ærlig – det finnes ingen feil svar! Målet er ekte kontakt og moro.\n\nI Pandora-modus: Alle spillerne sender inn spørsmål anonymt, og så svarer alle sammen i sanntid.';

  @override
  String get navigateQuestions => '4. Naviger mellom spørsmål';

  @override
  String get navigateQuestionsDesc =>
      '• Sveip i hvilken som helst retning eller trykk på pilene for å bytte spørsmål\n• Trykk på hjerte-ikonet ❤️ for å lagre favoritter\n• Premium: Trykk på spørsmålslister-ikonet (oppe til høyre) for å hoppe til hvilket som helst spørsmål\n• Trykk på hjem-knappen for å gå tilbake til hovedmenyen når som helst';

  @override
  String get premiumFeatures => '5. Premium-fordeler';

  @override
  String get premiumFeaturesDesc =>
      'Lås opp hele Connect-opplevelsen:\n\n• Månedlig: €6,99/måned\n• Årlig: €59,99/år (spar 29 %!)\n\n✓ Alle 24+ premiumkategorier i alle modi\n✓ 75 spørsmål per kategori (mot 30 i gratisversjonen)\n✓ Ingen annonser – for alltid\n✓ Pandora: Ubegrenset antall spillere og spørsmål\n✓ Personlig: Lag ubegrenset mange egne stokker\n✓ Spørsmålsnavigasjon – hopp til hvilket som helst spørsmål\n✓ Støtt videre utvikling';

  @override
  String get proTips => 'Profftips';

  @override
  String get proTipsDesc =>
      '• Skap et behagelig miljø uten distraksjoner\n• Lytt aktivt og vær til stede\n• Del ærlig og oppmuntre andre til å gjøre det samme\n• Respekter grenser – det er helt greit å hoppe over spørsmål\n• Bruk favoritter ❤️ for å lagre spørsmål du liker\n• Prøv ulike modi til ulike anledninger\n• Pandora passer perfekt til fester og spillkvelder i gruppe\n• Ha det gøy og nyt å knytte bånd!';

  @override
  String get aboutCredits => 'Om / Kreditering';

  @override
  String get developedBy => 'Utviklet av TechyKoala';

  @override
  String get learnMore => 'Lær mer om oss og kommende apper';

  @override
  String get visitWebsite => 'Besøk techykoala.com';

  @override
  String get madeWithLove => 'Laget med ❤️ for meningsfulle samtaler';

  @override
  String get personal => 'Personlig';

  @override
  String get personalDesc => 'Lag dine egne, tilpassede spørsmålsstokker';

  @override
  String get gameComplete => 'Spill ferdig!';

  @override
  String get noMoreQuestions =>
      'Du har gått gjennom alle spørsmålene i denne stokken!';

  @override
  String get playAgain => 'Spill igjen';

  @override
  String get mainMenu => 'Hovedmeny';

  @override
  String get thanksForPlaying => 'Takk for at du spilte!';

  @override
  String get hopeYouHadFun => 'Vi håper du koste deg! 🎉';

  @override
  String get backToMenu => 'Tilbake til menyen';

  @override
  String get leaveGame => 'Forlat spillet?';

  @override
  String get leaveGameMessage =>
      'Er du sikker på at du vil forlate? Spillet fortsetter for de andre spillerne.';

  @override
  String get leave => 'Forlat';

  @override
  String get noQuestionsAvailable => 'Ingen spørsmål tilgjengelig';

  @override
  String get showLess => 'Vis mindre';

  @override
  String get readMore => 'Les mer';

  @override
  String get tapToPlay => 'Trykk for å spille';

  @override
  String get favorites => 'Favoritter';

  @override
  String get pandoraHostCreatePin =>
      'Verten oppretter en økt og deler PIN-koden';

  @override
  String get pandoraPlayersJoinMax =>
      'Spillere blir med (maks 6 gratis, ubegrenset med Premium)';

  @override
  String get pandoraHostSetsTimer =>
      'Verten setter tidsgrense per spørsmål (1–15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Alle sender inn spørsmål (maks 12 gratis)';

  @override
  String get pandoraHostControls => 'Verten styrer fremdriften i spillet';

  @override
  String get pandoraQuestionsDeleted => 'Spørsmål slettes etter spillet';

  @override
  String get pandoraHost => 'Vert';

  @override
  String get pandoraJoinGame => 'Bli med i spillet';

  @override
  String get pandoraPandoraBox => 'Pandoras eske';

  @override
  String get pleaseEnterName => 'Skriv inn navnet ditt';

  @override
  String get hostSuffix => '(Vert)';

  @override
  String get playersJoinWithNames => 'Spillere blir med med navnene sine';

  @override
  String get everyoneSubmitsMin5 =>
      'Alle sender inn spørsmål (minst 5, maks 12 gratis)';

  @override
  String get createSession => 'Opprett økt';

  @override
  String get creating => 'Oppretter...';

  @override
  String get yourName => 'Navnet ditt';

  @override
  String get enterDisplayName => 'Skriv inn visningsnavnet ditt';

  @override
  String get howItWorks => 'Slik fungerer det';

  @override
  String get pinCopied => 'PIN kopiert til utklippstavlen!';

  @override
  String get endSession => 'Avslutte økten?';

  @override
  String get endSessionConfirm =>
      'Er du sikker på at du vil avslutte denne Pandora-økten?';

  @override
  String get createCustomDeck => 'Lag tilpasset stokk';

  @override
  String get deckName => 'Navn på stokk';

  @override
  String get enterDeckName => 'Skriv inn navn på stokk';

  @override
  String get create => 'Opprett';

  @override
  String get deckCreated => 'Stokk opprettet!';

  @override
  String get failedToCreateDeck => 'Kunne ikke opprette stokk';

  @override
  String get deleteDeck => 'Slette stokk?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Er du sikker på at du vil slette «$deckName»? Dette vil slette alle spørsmålene i denne stokken.';
  }

  @override
  String get delete => 'Slett';

  @override
  String get deckDeleted => 'Stokk slettet';

  @override
  String get failedToDeleteDeck => 'Kunne ikke slette stokk';

  @override
  String get myDecks => 'Mine stokker';

  @override
  String get noDecksYet => 'Ingen stokker ennå';

  @override
  String get createFirstDeck => 'Lag din første tilpassede stokk!';

  @override
  String questionsCount(Object count) {
    return '$count spørsmål';
  }

  @override
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count spørsmål',
      one: '1 spørsmål',
      zero: '0 spørsmål',
    );
    return '$_temp0';
  }

  @override
  String get questionAdded => 'Spørsmål lagt til!';

  @override
  String get failedToAddQuestion => 'Kunne ikke legge til spørsmål';

  @override
  String get editQuestion => 'Rediger spørsmål';

  @override
  String get enterYourQuestion => 'Skriv inn spørsmålet ditt';

  @override
  String get save => 'Lagre';

  @override
  String get questionUpdated => 'Spørsmål oppdatert!';

  @override
  String get failedToUpdateQuestion => 'Kunne ikke oppdatere spørsmål';

  @override
  String get deleteQuestion => 'Slett spørsmål';

  @override
  String get deleteQuestionConfirm =>
      'Er du sikker på at du vil slette dette spørsmålet?';

  @override
  String get questionDeleted => 'Spørsmål slettet';

  @override
  String get failedToDeleteQuestion => 'Kunne ikke slette spørsmål';

  @override
  String get addQuestion => 'Legg til spørsmål';

  @override
  String get typeQuestionHere => 'Skriv spørsmålet ditt her...';

  @override
  String get add => 'Legg til';

  @override
  String get noQuestionsYet => 'Ingen spørsmål ennå';

  @override
  String get addFirstQuestion => 'Legg til ditt første spørsmål!';

  @override
  String get deckDescLoveTalks =>
      'Utforsk romantikk, kjemi og nærhet gjennom spørsmål som feirer forholdet deres. Fra «hvordan vi møttes»-øyeblikk til hva som får deg til å føle deg mest elsket, gjør disse kortene den emosjonelle intimiteten dypere.';

  @override
  String get deckDescDeepTalks =>
      'Disse kortene går i dybden på verdier, sårbarhet og hva det betyr å vokse sammen. De hjelper partnere å reflektere over selvstendighet, kommunikasjon og felles retning.';

  @override
  String get deckDescSpicyTalks =>
      'Flørtete, dristige og intime – disse kortene inviterer par til å utforske begjær, fantasier og lidenskap sammen. Hvert spørsmål er laget for å starte ærlige, pirrende samtaler om hva som tenner dere og bringer dere nærmere.';

  @override
  String get deckDescDoYouDareTalks =>
      'En fryktløs stokk som kombinerer følelsesmessig ærlighet med sensitive temaer som tillit, religion, penger og personlige grenser – alt for å avdekke hva som virkelig betyr noe for dere begge. *Merk:* Noen spørsmål er rå og ufiltret – spill med åpenhet, empati og respekt.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspirert av de fem kjærlighetsspråkene hjelper denne stokken partnere å uttrykke kjærlighet på måter som virkelig oppleves. Oppdag hvordan ord, handlinger og små gester kan styrke forbindelsen.';

  @override
  String get deckDescSillyTalks =>
      'Ren moro og masse latter! Disse lette og sprø spørsmålene avslører de rareste vanene og morsomste tankene deres. Perfekt for venner, familie eller par som ikke tar livet for alvorlig.';

  @override
  String get deckDescCarTalks =>
      'Perfekt til bilturer – disse kortene gjør kjøretiden om til gode samtaler. Forvent morsomme, kreative og nostalgiske spørsmål om reiser, eventyr og særheter.';

  @override
  String get deckDescCozyTalks =>
      'Varme og rolige samtaler, perfekte for koselige kvelder. Spørsmålene skaper trygge, nære øyeblikk.';

  @override
  String get deckDescPartyNight =>
      'Spørsmål fulle av energi, laget for grupper. Perfekt for fester og sosiale kvelder med venner.';

  @override
  String get deckDescUnpopularOpinions =>
      'Stokken som utfordrer deg til å si det alle tenker, men ingen sier høyt. Fra influencer-kultur til sosiale normer – disse kortene skaper ærlige diskusjoner og overraskende perspektiver. Perfekt for venner med sterke meninger.';

  @override
  String get deckDescPlotTwists =>
      'Denne stokken kaster dere rett inn i livets morsomste og vanskeligste «hva ville du gjort hvis...?»-situasjoner. Kjappe valg, magefølelse og mye latter garantert! Perfekt for gruppespill fulle av overraskelser.';

  @override
  String get deckDescAfterDark =>
      'Gå over i samtalenes mørkere side med spørsmål som gir gåsehud. Fra creepy tilfeldigheter til overlevelsesscenarier – perfekt for sene kvelder med et lite snev av skrekk.';

  @override
  String get deckDescHistoryTalks =>
      'En nostalgisk blanding av personlige minner og familiestunder. Disse spørsmålene inspirerer til historier, latter og gjenoppdagelse av røttene dine. Perfekt for familiesammenkomster eller rolige kvelder.';

  @override
  String get deckDescTinyTalks =>
      'Laget for foreldre og småbarn! Enkle, lekne spørsmål hjelper barn å uttrykke seg, mens foreldre får innblikk i hvordan de tenker. Perfekt for alderen 3–9 år.';

  @override
  String get deckDescGoodOldDays =>
      'Reis tilbake i tid med spørsmål om kjære minner, tidligere opplevelser og hvordan ting pleide å være. Passer for alle aldre.';

  @override
  String get deckDescWouldYouRather =>
      'Klassiske dilemma-spørsmål som skaper diskusjon og avslører preferanser. Velg mellom to alternativer og finn ut hva som betyr mest.';

  @override
  String get createNewDeck => 'Lag ny stokk';

  @override
  String get sessionPin => 'Økt-PIN';

  @override
  String get joinSession => 'Bli med i økt';

  @override
  String get questionSubmitted => 'Spørsmål sendt';

  @override
  String get sessionCancelled => 'Økt avbrutt';

  @override
  String get yourQuestion => 'Spørsmålet ditt';

  @override
  String get reactionBreakdown => 'Oversikt over reaksjoner';

  @override
  String get deckNameHint => 'Navn på stokk';

  @override
  String get deckCreatedSuccess => 'Stokk opprettet!';

  @override
  String get cancelSession => 'Avbryt økt?';

  @override
  String get cancelSessionConfirm =>
      'Dette vil avbryte økten for alle spillerne. Er du sikker?';

  @override
  String get no => 'Nei';

  @override
  String get yesCancel => 'Ja, avbryt';

  @override
  String get hostQuestionCollection => 'Vert – innsamling av spørsmål';

  @override
  String get questionCollection => 'Innsamling av spørsmål';

  @override
  String get endSessionButton => 'Avslutt økt';

  @override
  String get noActiveSubscription => 'Ingen aktiv abonnement';

  @override
  String get premium => 'PREMIUM';

  @override
  String notEnoughQuestions(Object count) {
    return 'For få spørsmål. Minst 5 kreves. (For øyeblikket: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Premium-funksjon';

  @override
  String get questionNavigationPremium =>
      'Spørsmålsnavigasjon er en premium-funksjon. Abonner for å låse opp muligheten til å hoppe til hvilket som helst spørsmål!';

  @override
  String get customDecks => 'Tilpassede stokker';

  @override
  String get noDecksYetMessage => 'Ingen stokker ennå';

  @override
  String get createFirstDeckMessage => 'Trykk på + for å lage din første stokk';

  @override
  String get signInRequired => 'Innlogging påkrevd';

  @override
  String get signInToUsePersonal =>
      'Logg inn for å bruke Personlig-modus og lage egne spørsmålsstokker.';

  @override
  String get collaborativeQuestionGame => 'Samarbeidsspill med spørsmål';

  @override
  String get hostPandoraSession => 'Vær vert for en Pandora-økt';

  @override
  String get joinPandoraGame => 'Bli med i et spill';

  @override
  String get yourDisplayName => 'Visningsnavnet ditt';

  @override
  String get enterYourName => 'Skriv inn navnet ditt';

  @override
  String get selectQuestion => 'Velg spørsmål';

  @override
  String get joinTime => 'Tid til å bli med';

  @override
  String get participants => 'Deltakere';

  @override
  String get loading => 'Laster...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Trenger minst 2 spillere ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Fortsett til tidsinnstilling';

  @override
  String get setQuestionTimer => 'Sett tidsgrense for spørsmål';

  @override
  String get questionCollectionTime => 'Tid for å samle inn spørsmål';

  @override
  String get minutes => 'minutter';

  @override
  String get sessionWillEnd =>
      'Økten avsluttes automatisk hvis du ikke fortsetter innen 5 minutter';

  @override
  String get startQuestionCollection => 'Start innsamling av spørsmål';

  @override
  String questionsSubmitted(int count) {
    return '$count spørsmål sendt inn';
  }

  @override
  String get writeQuestionHere => 'Skriv spørsmålet ditt her...';

  @override
  String get whoIsThisFor => 'Hvem er dette spørsmålet til?';

  @override
  String get everyone => 'Alle';

  @override
  String get specific => 'En bestemt person';

  @override
  String get submitQuestion => 'Send inn spørsmål';

  @override
  String needMoreQuestions(int count) {
    return 'Trenger $count flere spørsmål';
  }

  @override
  String get startGame => 'Start spill';

  @override
  String get selectPlayer => 'Velg en spiller';

  @override
  String get unsubscribe => 'Avslutt abonnement';

  @override
  String get unsubscribeConfirm => 'Avslutte Premium-abonnement?';

  @override
  String get unsubscribeWarning =>
      'Du mister tilgangen til alle Premium-funksjoner, inkludert ubegrensede spørsmål, alle kategorier, annonsefri opplevelse og ubegrensede Pandora-spillere. Du kan tegne abonnement igjen når som helst.';

  @override
  String get yesUnsubscribe => 'Ja, avslutt';

  @override
  String get unsubscribeSuccess =>
      'Abonnement avsluttet. Premium-funksjoner er deaktivert.';

  @override
  String get unsubscribeError => 'Kunne ikke avslutte abonnementet';

  @override
  String get questions => 'spørsmål';

  @override
  String get preview => 'forhåndsvisning';

  @override
  String get userId => 'Bruker-ID';

  @override
  String get subscription => 'Abonnement';

  @override
  String get questionsCount75 => '75 spørsmål';

  @override
  String get questionsCount30 => '30 spørsmål';

  @override
  String get questionsCount5Preview => '5 spørsmål i forhåndsvisning';

  @override
  String get unlockFullDeck => 'Lås opp 75 spørsmål';

  @override
  String get renameDeck => 'Gi stokk nytt navn';

  @override
  String get deckRenamed => 'Stokken har fått nytt navn';

  @override
  String get failedToRenameDeck => 'Kunne ikke gi stokken nytt navn';

  @override
  String get shuffleQuestions => 'Stokk om spørsmålene';

  @override
  String get resetOrder => 'Tilbakestill rekkefølge';

  @override
  String get questionsShuffled => 'Spørsmålene er stokket om!';

  @override
  String get orderReset => 'Rekkefølgen er tilbakestilt til originalen';

  @override
  String get readyToPlay => 'Klar til å spille';

  @override
  String get longPressReorder =>
      'Trykk og hold for å dra og endre rekkefølgen på spørsmålene';

  @override
  String get noFavoritesYet => 'Ingen favoritter ennå';

  @override
  String get heartQuestionsDuringGameplay =>
      'Trykk på hjertet ❤️ på spørsmålskortene under spillet for å lagre dem her!';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Legg til minst $count spørsmål for å begynne å spille!';
  }

  @override
  String get heartQuestionsInfo =>
      'Merk spørsmål med hjerte under spillet for å legge dem i favorittene dine!';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Legg til minst $count spørsmål for å spille denne stokken';
  }

  @override
  String get removeFromFavorites => 'Fjern fra favoritter';

  @override
  String get unlockEverything => 'Lås opp alt';

  @override
  String get premiumSubtitle =>
      'Få ubegrenset tilgang til alle kategorier, fjern annonser for alltid og lås opp premium-funksjoner';

  @override
  String get save32Percent => 'SPAR 29 %';

  @override
  String get priceMonthly => '€6,99/måned';

  @override
  String get priceYearly => '€59,99/år';

  @override
  String get billedAnnually => 'Faktureres årlig';

  @override
  String get equivalentMonthly => 'Bare €5/måned';

  @override
  String get feature24Categories =>
      '24+ premiumkategorier låst opp i alle modi';

  @override
  String get feature75Questions =>
      '75 spørsmål per kategori (mot 30 i gratisnivået)';

  @override
  String get featureNoAds => 'Ingen annonser – uavbrutt spilling';

  @override
  String get featureUnlimitedPlayers =>
      'Pandora-modus: ubegrenset antall spillere og spørsmål';

  @override
  String get featureQuestionNavigation =>
      'Naviger og hopp til hvilket som helst spørsmål under spillet';

  @override
  String get featureSupportDevelopment =>
      'Støtt videre utvikling og nye funksjoner';

  @override
  String get error => 'Feil';

  @override
  String get premiumActivatedMessage =>
      'Premium aktivert! Alle kategorier er låst opp.';

  @override
  String get featurePersonalDecks =>
      'Personlig-modus: lag ubegrenset mange egne stokker med dine egne spørsmål';

  @override
  String get premiumPersonal =>
      'Personlig-modus med egne stokker er en premium-funksjon. Oppgrader til Premium for å lage og spille med dine egne spørsmålsstokker!';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Er du sikker på at du vil slette «$deckName»? Dette vil slette alle spørsmålene i denne stokken.';
  }

  @override
  String needMore(int count) {
    return 'Mangler $count';
  }

  @override
  String get editQuestions => 'Rediger spørsmål';

  @override
  String get addMore => 'Legg til flere';

  @override
  String useMyConnectEmail(String email) {
    return 'Bruk Connect-eposten min: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Gratisbrukere kan ha maks 6 spillere. Oppgrader til Premium for ubegrenset antall spillere!';

  @override
  String get freemiumQuestionLimit =>
      'Gratisbrukere kan sende inn maks 12 spørsmål. Oppgrader til Premium for ubegrenset antall spørsmål!';

  @override
  String get yourQuestions => 'Spørsmålene dine';

  @override
  String waitingForHost(int count) {
    return 'Venter på verten ... ($count spillere)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Oppgrader til Premium for ubegrenset antall spillere';

  @override
  String get kickPlayer => 'Spark ut spiller';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Er du sikker på at du vil sparke ut «$playerName» fra økten?';
  }

  @override
  String get kick => 'Spark ut';

  @override
  String playerKicked(String playerName) {
    return '$playerName ble sparket ut av økten';
  }

  @override
  String get failedToKickPlayer => 'Kunne ikke sparke ut spiller';

  @override
  String get cancelSessionForAll =>
      'Dette vil avbryte økten for alle spillerne. Er du sikker?';

  @override
  String get youWereKicked => 'Du ble fjernet fra økten';

  @override
  String get you => 'Du';

  @override
  String get loginRequiredForPandora =>
      'Innlogging kreves for å spille Pandora';

  @override
  String get login => 'Logg inn';

  @override
  String get loginRequiredNote =>
      'Innlogging kreves for å spille Pandora (for å kunne holde oversikt over spillerne)';

  @override
  String get timeIsUp => 'Tiden er ute!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Det ble ikke sendt inn nok spørsmål ($current/$minimum minimum).';
  }

  @override
  String get sessionQuestionLimit => 'Grense for spørsmål i økten er nådd';

  @override
  String get sessionQuestionLimitMessage =>
      'Denne økten har nådd grensen på 12 spørsmål (gratis vert). Oppgrader til Premium for ubegrenset antall spørsmål!';

  @override
  String sessionQuestionCount(int current) {
    return 'Økt: $current/12 spørsmål';
  }

  @override
  String get pleaseEnterQuestion => 'Skriv inn et spørsmål';

  @override
  String get rateThisDeck => 'Vurder denne stokken';

  @override
  String get yourRating => 'Din vurdering';

  @override
  String get skip => 'Hopp over';

  @override
  String get submit => 'Send';

  @override
  String get thankYouForFeedback => 'Takk for tilbakemeldingen!';

  @override
  String get failedToSubmitRating => 'Kunne ikke sende vurderingen';

  @override
  String get tapStarsToRate => 'Trykk på stjernene for å vurdere';

  @override
  String get downloadForOffline => 'Last ned for frakoblet bruk';

  @override
  String get downloading => 'Laster ned...';

  @override
  String get downloadedLanguages => 'Nedlastede språk';

  @override
  String get languageNotDownloaded => 'Språk ikke nedlastet';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'Du har ikke lastet ned $languageName for frakoblet bruk.\n\nGå til Innstillinger > Profil > \"Last ned for frakoblet bruk\" mens du er koblet til internett.';
  }

  @override
  String get offlineLanguageError =>
      'Dette språket er ikke lastet ned for frakoblet bruk. Gå til Innstillinger > Profil > \"Last ned for frakoblet bruk\" mens du er koblet til internett.';

  @override
  String get downloadComplete => 'Nedlasting fullført!';

  @override
  String get downloadCompleteMessage =>
      'Alt innhold er lastet ned for frakoblet bruk.';

  @override
  String get addedToFavorites => 'Lagt til i favoritter';

  @override
  String get removedFromFavorites => 'Fjernet fra favoritter';

  @override
  String get errorSavingFavorite => 'Feil ved lagring av favoritt';

  @override
  String get internetRequired => 'Internett påkrevd';

  @override
  String get internetRequiredMessage =>
      'Noen funksjoner krever internettilkobling. Premium-brukere kan laste ned innhold for frakoblet bruk i Innstillinger.';

  @override
  String get goPremium => 'Få Premium';

  @override
  String get pleaseEnterPin => 'Skriv inn en 6-sifret PIN';

  @override
  String errorOccurred(String error) {
    return 'Feil: $error';
  }

  @override
  String get errorCreatingSession => 'Feil ved opprettelse av økt';

  @override
  String get sessionTimedOut => 'Økten utløp - verten satte ikke tidsfrist';

  @override
  String get errorStarting => 'Feil ved oppstart';

  @override
  String get errorLoadingParticipants => 'Feil ved lasting av deltakere';

  @override
  String get sessionCancelledByHost => 'Økten ble avbrutt av verten';

  @override
  String needAtLeast5Questions(int count) {
    return 'Trenger minst 5 spørsmål for å starte! (For øyeblikket: $count)';
  }

  @override
  String get errorStartingGame => 'Feil ved oppstart av spill';

  @override
  String get questionsAsked => 'Spørsmål stilt';

  @override
  String get totalReactions => 'Totale reaksjoner';

  @override
  String get mostLovedQuestion => 'Mest elskede spørsmål';

  @override
  String get mostFunQuestion => 'Morsomste spørsmål';

  @override
  String get mostShockingQuestion => 'Mest sjokkerende spørsmål';

  @override
  String get mostLitQuestion => 'Mest fete spørsmål';

  @override
  String get hotSeatAward => 'Hot Seat-pris';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Feil: Kunne ikke identifisere spiller. Bli med i økten på nytt.';

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
  String questionsInDeck(
    int kept,
    int max,
    Object behalten,
    Object beholdt,
    Object maks,
  ) {
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
