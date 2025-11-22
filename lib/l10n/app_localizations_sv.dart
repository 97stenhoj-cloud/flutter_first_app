// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Starta';

  @override
  String get settings => 'Inställningar';

  @override
  String get howToPlay => 'Så spelar du';

  @override
  String get chooseGameMode => 'Välj spelläge';

  @override
  String get family => 'Familj';

  @override
  String get couple => 'Par';

  @override
  String get friends => 'Vänner';

  @override
  String get chooseCategory => 'Välj en kategori';

  @override
  String get locked => 'Premiumkategori';

  @override
  String get lockedMessage =>
      'Det här är en premiumkategori. Uppgradera för att låsa upp alla kategorier och ta bort annonser!';

  @override
  String get previewAvailable =>
      'Förhandsvisning: de 5 första frågorna är tillgängliga';

  @override
  String get upgradeNow => 'Uppgradera nu';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Kanske senare';

  @override
  String get getPremium => 'Skaffa Premium';

  @override
  String get premiumTitle => 'Lås upp allt';

  @override
  String get premiumDescription =>
      'Få obegränsad tillgång till alla kategorier i alla lägen, ta bort annonser och njut av obegränsade Pandora-sessioner.';

  @override
  String get premiumPriceMonthly => '€6,99/månad';

  @override
  String get premiumPriceYearly => '€59,99/år';

  @override
  String get saveWithYearly => 'Spara €23,89 med årsabonnemang!';

  @override
  String get monthly => 'Månadsvis';

  @override
  String get yearly => 'Årsvis';

  @override
  String get billedMonthly => 'Debiteras månadsvis';

  @override
  String get billedYearly => 'Debiteras årsvis';

  @override
  String get premiumFeature1 => '✓ Alla 21 premiumkategorier upplåsta';

  @override
  String get premiumFeature2 => '✓ Inga annonser – för alltid';

  @override
  String get premiumFeature3 => '✓ Obegränsat antal frågor i alla kategorier';

  @override
  String get premiumFeature4 =>
      '✓ Pandora: Obegränsat antal spelare och frågor';

  @override
  String get premiumFeature5 => '✓ Stöd fortsatt utveckling';

  @override
  String get subscribePremium => 'Prenumerera på Premium';

  @override
  String get subscribe => 'Prenumerera';

  @override
  String get cancel => 'Avbryt';

  @override
  String get subscriptionActivated =>
      'Premium aktiverat! Alla kategorier är upplåsta.';

  @override
  String get premiumActivated => 'Premium aktiverat!';

  @override
  String get demoNote =>
      'Demo: Prenumerationen återställs när appen startas om';

  @override
  String get freeTier => 'Gratisnivå';

  @override
  String get freeTierDesc =>
      '3 kategorier per läge (30 frågor vardera)\n5-frågers förhandsvisning av premiumkategorier\nAnnons var 7:e fråga';

  @override
  String get currentPlan => 'Nuvarande plan';

  @override
  String get limitReached => 'Gräns uppnådd';

  @override
  String get freeCategoryLimit =>
      'Du har nått gränsen på 30 frågor i gratiskategorier. Uppgradera till Premium för obegränsad åtkomst!';

  @override
  String get previewLimit =>
      'Du har sett alla 5 förhandsvisningsfrågor. Uppgradera till Premium för att fortsätta!';

  @override
  String get pandoraFreeLimit => 'Gratisgräns';

  @override
  String get pandoraFreeLimitMessage =>
      'Gratisvärdar kan ha max 6 spelare och 12 frågor. Uppgradera till Premium för obegränsat!';

  @override
  String get pandoraUpgradeMessage =>
      'Du har nått 12 frågor. Uppgradera till Premium för att fortsätta spela!';

  @override
  String get pandoraMaxPlayers =>
      'Max 6 spelare uppnått (gratisgräns). Uppgradera till Premium för obegränsat antal spelare!';

  @override
  String get swipeOrTap => 'Svep eller tryck på pilarna';

  @override
  String get previous => 'Föregående';

  @override
  String get next => 'Nästa';

  @override
  String get advertisement => 'Annons';

  @override
  String get watchAdMessage =>
      'Titta på en kort annons för att fortsätta, eller spela utan annonser med Premium!';

  @override
  String get watchAd => 'Titta på annons';

  @override
  String get goAdFree => 'Spela utan annonser med Premium';

  @override
  String get removeAdsForever => 'Ta bort annonser för alltid';

  @override
  String get adNotReady => 'Annonsen är inte redo. Fortsätter utan annons.';

  @override
  String get adLoadingContinue => 'Laddar annons... Fortsätt';

  @override
  String get pricePerMonth => '€6,99/månad eller €59,99/år';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Inga frågor hittades för $category i läget $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Fel vid inladdning av frågor. Kontrollera din anslutning.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Det gick inte att ladda frågor: $error';
  }

  @override
  String get howManyPlayers => 'Hur många spelare?';

  @override
  String get players => 'Spelare';

  @override
  String get continueButton => 'Fortsätt';

  @override
  String get language => 'Språk';

  @override
  String languageChanged(Object language) {
    return 'Språket ändrades till $language';
  }

  @override
  String get profile => 'Profil';

  @override
  String get signOut => 'Logga ut';

  @override
  String get notSignedIn => 'Inte inloggad';

  @override
  String get signInSignUp => 'Logga in / Skapa konto';

  @override
  String get signInToSync =>
      'Logga in för att synka din prenumeration mellan enheter och låsa upp premiuminnehåll';

  @override
  String get signOutConfirm => 'Är du säker på att du vill logga ut?';

  @override
  String get signedOutSuccess => 'Du har loggats ut';

  @override
  String get accountInformation => 'Kontoinformation';

  @override
  String get email => 'E-post';

  @override
  String get memberSince => 'Medlem sedan';

  @override
  String get notAvailable => 'Inte tillgängligt';

  @override
  String get unknown => 'Okänt';

  @override
  String get subscriptionStatus => 'Prenumerationsstatus';

  @override
  String get premiumMember => 'Premiumanvändare';

  @override
  String get freeAccount => 'Gratiskonto';

  @override
  String get welcomeToConnect => 'Välkommen till Connect!';

  @override
  String get continueWithApple => 'Fortsätt med Apple';

  @override
  String get continueWithGoogle => 'Fortsätt med Google';

  @override
  String get skipForNow => 'Hoppa över för nu';

  @override
  String get byContining =>
      'Genom att fortsätta godkänner du våra användarvillkor och vår sekretesspolicy';

  @override
  String get googleSignInFailed =>
      'Inloggning med Google misslyckades. Försök igen.';

  @override
  String get appleSignInFailed =>
      'Inloggning med Apple misslyckades. Försök igen.';

  @override
  String get noCategoriesFound => 'Inga kategorier hittades';

  @override
  String get welcomeBack => 'Välkommen tillbaka!';

  @override
  String get createAccount => 'Skapa konto';

  @override
  String get displayName => 'Visningsnamn';

  @override
  String get password => 'Lösenord';

  @override
  String get signIn => 'Logga in';

  @override
  String get signUp => 'Skapa konto';

  @override
  String get dontHaveAccount => 'Har du inget konto? Skapa konto';

  @override
  String get alreadyHaveAccount => 'Har du redan ett konto? Logga in';

  @override
  String get chooseYourMode => '1. Välj läge';

  @override
  String get chooseYourModeDesc =>
      'Välj mellan fem unika samtalsupplevelser:\n\n• Par – Intima frågor som fördjupar er relation\n• Vänner – Roliga, engagerande ämnen perfekta för ditt gäng\n• Familj – Varma, trygga samtal för alla åldrar\n• Personligt – Skapa dina egna, anpassade frågekortlekar (Premium)\n• Pandora – Samarbetsbaserat flerspelarspel med frågor i realtid';

  @override
  String get pickCategory => '2. Välj kategori';

  @override
  String get pickCategoryDesc =>
      'Varje läge har flera kategorier med noga utvalda frågepaket:\n\n• Gratis: 3 kategorier per läge (30 frågor vardera)\n• Premiumförhandsvisning: de 5 första frågorna i premiumkategorier\n• Premium: 24+ kategorier (75 frågor vardera)\n• Personligt: skapa obegränsat antal egna kortlekar med dina egna frågor';

  @override
  String get startTalking => '3. Börja spela';

  @override
  String get startTalkingDesc =>
      'Frågorna visas i fullskärm för fördjupade samtal. Turas om att läsa och svara ärligt – det finns inga fel svar! Målet är meningsfull kontakt och att ha kul.\n\nI Pandora-läget: Alla spelare skickar in frågor anonymt och svarar sedan tillsammans i realtid.';

  @override
  String get navigateQuestions => '4. Navigera mellan frågor';

  @override
  String get navigateQuestionsDesc =>
      '• Svep i valfri riktning eller tryck på pilarna för att byta fråga\n• Tryck på hjärtikonen ❤️ för att spara favoriter\n• Premium: Tryck på frågelisteikonen (uppe till höger) för att hoppa till valfri fråga\n• Tryck på hemknappen för att när som helst gå tillbaka till huvudmenyn';

  @override
  String get premiumFeatures => '5. Premiumfunktioner';

  @override
  String get premiumFeaturesDesc =>
      'Lås upp hela Connect-upplevelsen:\n\n• Månadsvis: €6,99/månad\n• Årsvis: €59,99/år (spara 29 %!)\n\n✓ Alla 24+ premiumkategorier i alla lägen\n✓ 75 frågor per kategori (jämfört med 30 i gratisnivån)\n✓ Inga annonser – för alltid\n✓ Pandora: Obegränsat antal spelare och frågor\n✓ Personligt: skapa obegränsat antal egna kortlekar\n✓ Frågenavigering – hoppa till valfri fråga\n✓ Stöd fortsatt utveckling';

  @override
  String get proTips => 'Tips';

  @override
  String get proTipsDesc =>
      '• Skapa en bekväm miljö utan distraktioner\n• Lyssna aktivt och var närvarande\n• Dela ärligt och uppmuntra andra att göra detsamma\n• Respektera gränser – det är okej att hoppa över frågor\n• Använd favoriter ❤️ för att spara frågor du gillar\n• Testa olika lägen vid olika tillfällen\n• Pandora passar perfekt för fester och spelkvällar\n• Ha roligt och njut av att knyta band!';

  @override
  String get aboutCredits => 'Om / Tack';

  @override
  String get developedBy => 'Utvecklad av TechyKoala';

  @override
  String get learnMore => 'Läs mer om oss och kommande appar';

  @override
  String get visitWebsite => 'Besök techykoala.com';

  @override
  String get madeWithLove => 'Gjort med ❤️ för meningsfulla samtal';

  @override
  String get personal => 'Personligt';

  @override
  String get personalDesc => 'Skapa dina egna, anpassade frågekortlekar';

  @override
  String get gameComplete => 'Spelet är klart!';

  @override
  String get noMoreQuestions =>
      'Du har gått igenom alla frågor i den här kortleken!';

  @override
  String get playAgain => 'Spela igen';

  @override
  String get mainMenu => 'Huvudmeny';

  @override
  String get thanksForPlaying => 'Tack för att du spelade!';

  @override
  String get hopeYouHadFun => 'Vi hoppas att du hade kul! 🎉';

  @override
  String get backToMenu => 'Tillbaka till menyn';

  @override
  String get leaveGame => 'Lämna spelet?';

  @override
  String get leaveGameMessage =>
      'Är du säker på att du vill lämna? Spelet fortsätter för de andra spelarna.';

  @override
  String get leave => 'Lämna';

  @override
  String get noQuestionsAvailable => 'Inga frågor tillgängliga';

  @override
  String get showLess => 'Visa mindre';

  @override
  String get readMore => 'Visa mer';

  @override
  String get tapToPlay => 'Tryck för att spela';

  @override
  String get favorites => 'Favoriter';

  @override
  String get pandoraHostCreatePin =>
      'Värden skapar en session och delar PIN-kod';

  @override
  String get pandoraPlayersJoinMax =>
      'Spelare går med (max 6 gratis, obegränsat med Premium)';

  @override
  String get pandoraHostSetsTimer =>
      'Värden ställer in tid per fråga (1–15 min)';

  @override
  String get pandoraEveryoneSubmits => 'Alla skickar in frågor (max 12 gratis)';

  @override
  String get pandoraHostControls => 'Värden styr spelets gång';

  @override
  String get pandoraQuestionsDeleted => 'Frågorna raderas efter spelet';

  @override
  String get pandoraHost => 'Värd';

  @override
  String get pandoraJoinGame => 'Gå med i spel';

  @override
  String get pandoraPandoraBox => 'Pandoras ask';

  @override
  String get pleaseEnterName => 'Ange ditt namn';

  @override
  String get hostSuffix => '(Värd)';

  @override
  String get playersJoinWithNames => 'Spelare går med med sina namn';

  @override
  String get everyoneSubmitsMin5 =>
      'Alla skickar in frågor (minst 5, max 12 gratis)';

  @override
  String get createSession => 'Skapa session';

  @override
  String get creating => 'Skapar...';

  @override
  String get yourName => 'Ditt namn';

  @override
  String get enterDisplayName => 'Ange visningsnamn';

  @override
  String get howItWorks => 'Så fungerar det';

  @override
  String get pinCopied => 'PIN-koden kopierad!';

  @override
  String get endSession => 'Avsluta session?';

  @override
  String get endSessionConfirm =>
      'Är du säker på att du vill avsluta den här Pandora-sessionen?';

  @override
  String get createCustomDeck => 'Skapa egen kortlek';

  @override
  String get deckName => 'Kortleksnamn';

  @override
  String get enterDeckName => 'Ange kortleksnamn';

  @override
  String get create => 'Skapa';

  @override
  String get deckCreated => 'Kortlek skapad!';

  @override
  String get failedToCreateDeck => 'Det gick inte att skapa kortlek';

  @override
  String get deleteDeck => 'Ta bort kortlek?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Är du säker på att du vill ta bort \"$deckName\"? Detta tar bort alla frågor i den här kortleken.';
  }

  @override
  String get delete => 'Ta bort';

  @override
  String get deckDeleted => 'Kortlek borttagen';

  @override
  String get failedToDeleteDeck => 'Det gick inte att ta bort kortlek';

  @override
  String get myDecks => 'Mina kortlekar';

  @override
  String get noDecksYet => 'Inga kortlekar ännu';

  @override
  String get createFirstDeck => 'Skapa din första egna kortlek!';

  @override
  String questionsCount(Object count) {
    return '$count frågor';
  }

  @override
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count frågor',
      one: '1 fråga',
      zero: '0 frågor',
    );
    return '$_temp0';
  }

  @override
  String get questionAdded => 'Fråga tillagd!';

  @override
  String get failedToAddQuestion => 'Det gick inte att lägga till fråga';

  @override
  String get editQuestion => 'Redigera fråga';

  @override
  String get enterYourQuestion => 'Ange din fråga';

  @override
  String get save => 'Spara';

  @override
  String get questionUpdated => 'Fråga uppdaterad!';

  @override
  String get failedToUpdateQuestion => 'Det gick inte att uppdatera fråga';

  @override
  String get deleteQuestion => 'Ta bort fråga';

  @override
  String get deleteQuestionConfirm =>
      'Är du säker på att du vill ta bort den här frågan?';

  @override
  String get questionDeleted => 'Fråga borttagen';

  @override
  String get failedToDeleteQuestion => 'Det gick inte att ta bort fråga';

  @override
  String get addQuestion => 'Lägg till fråga';

  @override
  String get typeQuestionHere => 'Skriv din fråga här...';

  @override
  String get add => 'Lägg till';

  @override
  String get noQuestionsYet => 'Inga frågor ännu';

  @override
  String get addFirstQuestion => 'Lägg till din första fråga!';

  @override
  String get deckDescLoveTalks =>
      'Utforska romantik, kemi och närhet genom frågor som firar er relation. Från \"hur vi träffades\" till vad som får dig att känna dig mest älskad – de här korten fördjupar den känslomässiga intimiteten.';

  @override
  String get deckDescDeepTalks =>
      'De här korten går på djupet med värderingar, sårbarhet och vad det innebär att växa tillsammans. De hjälper partners att reflektera över självständighet, kommunikation och gemensamma mål.';

  @override
  String get deckDescSpicyTalks =>
      'Flörtigt, vågat och intimt – de här korten bjuder in par att utforska begär, fantasier och passion tillsammans. Varje fråga är skapad för att starta ärliga, kittlande samtal om vad som tänder er och för er närmare.';

  @override
  String get deckDescDoYouDareTalks =>
      'En orädd kortlek som kombinerar känslomässig ärlighet med känsliga ämnen som tillit, religion, pengar och personliga gränser – allt för att avslöja vad som verkligen betyder något för er båda. *Obs:* Vissa frågor är råa och ofiltrerade – spela med öppenhet, empati och respekt.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspirerad av de fem kärleksspråken hjälper den här kortleken partners att uttrycka kärlek på sätt som verkligen känns. Upptäck hur ord, handlingar och gester kan stärka er relation.';

  @override
  String get deckDescSillyTalks =>
      'Ren lek och massor av skratt! De här lätta och knasiga frågorna plockar fram era konstigaste vanor och roligaste tankar. Perfekt för vänner, familj eller par som inte tar livet för allvarligt.';

  @override
  String get deckDescCarTalks =>
      'Perfekt för bilresor – de här korten gör restiden till bra samtalstid. Förvänta dig roliga, kreativa och nostalgiska frågor om resor, äventyr och egenheter.';

  @override
  String get deckDescCozyTalks =>
      'Varma, avslappnade samtal perfekta för mysiga kvällar. De här frågorna skapar lugna, hjärtliga stunder av närhet.';

  @override
  String get deckDescPartyNight =>
      'Energifyllda frågor designade för gruppstämning. Perfekt för fester och kvällar med vänner.';

  @override
  String get deckDescUnpopularOpinions =>
      'Kortleken som utmanar dig att säga det alla tänker men ingen säger högt. Från influencer-kultur till sociala normer – de här frågorna väcker ärliga diskussioner och oväntade perspektiv. Perfekt för vänner med starka åsikter.';

  @override
  String get deckDescPlotTwists =>
      'Den här kortleken kastar in er i livets roligaste och svåraste \"vad skulle du göra om...?\"-situationer. Snabba val, magkänsla och många skratt utlovas! Perfekt för gruppkvällar fulla av överraskningar.';

  @override
  String get deckDescAfterDark =>
      'Kliva in i samtalens mörkare sida med frågor som ger rysningar. Från kusliga sammanträffanden till överlevnadsscenarier – perfekt för sena kvällar med lite spänning.';

  @override
  String get deckDescHistoryTalks =>
      'En nostalgisk blandning av personliga minnen och familjeögonblick. De här frågorna inspirerar till berättelser, skratt och att återupptäcka dina rötter. Perfekt för familjeträffar eller lugna kvällar.';

  @override
  String get deckDescTinyTalks =>
      'Skapad för föräldrar och små barn! Enkla, lekfulla frågor hjälper barn att uttrycka sig, medan föräldrar får se hur de tänker. Perfekt för åldrarna 3–9.';

  @override
  String get deckDescGoodOldDays =>
      'Res tillbaka i tiden med frågor om kära minnen, tidigare upplevelser och hur saker brukade vara. Passar alla åldrar.';

  @override
  String get deckDescWouldYouRather =>
      'Klassiska \"skulle du hellre\"-dilemman som startar diskussioner och visar vad ni föredrar. Välj mellan två alternativ och upptäck vad som är viktigast.';

  @override
  String get createNewDeck => 'Skapa ny kortlek';

  @override
  String get sessionPin => 'Sessions-PIN';

  @override
  String get joinSession => 'Gå med i session';

  @override
  String get questionSubmitted => 'Fråga inskickad';

  @override
  String get sessionCancelled => 'Session avbruten';

  @override
  String get yourQuestion => 'Din fråga';

  @override
  String get reactionBreakdown => 'Reaktionsöversikt';

  @override
  String get deckNameHint => 'Kortleksnamn';

  @override
  String get deckCreatedSuccess => 'Kortlek skapad!';

  @override
  String get cancelSession => 'Avbryt session?';

  @override
  String get cancelSessionConfirm =>
      'Detta avbryter sessionen för alla spelare. Är du säker?';

  @override
  String get no => 'Nej';

  @override
  String get yesCancel => 'Ja, avbryt';

  @override
  String get hostQuestionCollection => 'Värd – insamling av frågor';

  @override
  String get questionCollection => 'Insamling av frågor';

  @override
  String get endSessionButton => 'Avsluta session';

  @override
  String get noActiveSubscription => 'Ingen aktiv prenumeration';

  @override
  String get premium => 'Premium';

  @override
  String notEnoughQuestions(Object count) {
    return 'För få frågor. Minst 5 krävs. (Just nu: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Premiumfunktion';

  @override
  String get questionNavigationPremium =>
      'Frågenavigering är en premiumfunktion. Prenumerera för att låsa upp möjligheten att hoppa till valfri fråga!';

  @override
  String get customDecks => 'Egna kortlekar';

  @override
  String get noDecksYetMessage => 'Inga kortlekar ännu';

  @override
  String get createFirstDeckMessage =>
      'Tryck på + för att skapa din första kortlek';

  @override
  String get signInRequired => 'Inloggning krävs';

  @override
  String get signInToUsePersonal =>
      'Logga in för att använda Personligt-läget och skapa egna frågekortlekar.';

  @override
  String get collaborativeQuestionGame => 'Samarbetsspel med frågor';

  @override
  String get hostPandoraSession => 'Var värd för en Pandora-session';

  @override
  String get joinPandoraGame => 'Gå med i ett spel';

  @override
  String get yourDisplayName => 'Ditt visningsnamn';

  @override
  String get enterYourName => 'Ange ditt namn';

  @override
  String get selectQuestion => 'Välj fråga';

  @override
  String get joinTime => 'Tid att gå med';

  @override
  String get participants => 'Deltagare';

  @override
  String get loading => 'Laddar...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Behöver minst 2 spelare ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Fortsätt till timerinställning';

  @override
  String get setQuestionTimer => 'Ställ in frågetimer';

  @override
  String get questionCollectionTime => 'Tid för insamling av frågor';

  @override
  String get minutes => 'minuter';

  @override
  String get sessionWillEnd =>
      'Sessionen avslutas automatiskt om du inte fortsätter inom 5 minuter';

  @override
  String get startQuestionCollection => 'Starta insamling av frågor';

  @override
  String questionsSubmitted(int count) {
    return '$count frågor inskickade';
  }

  @override
  String get writeQuestionHere => 'Skriv din fråga här...';

  @override
  String get whoIsThisFor => 'Vem är frågan till?';

  @override
  String get everyone => 'Alla';

  @override
  String get specific => 'Någon specifik';

  @override
  String get submitQuestion => 'Skicka fråga';

  @override
  String needMoreQuestions(int count) {
    return 'Behöver $count fler frågor';
  }

  @override
  String get startGame => 'Starta spel';

  @override
  String get selectPlayer => 'Välj spelare';

  @override
  String get unsubscribe => 'Avsluta prenumeration';

  @override
  String get unsubscribeConfirm => 'Avsluta Premium-prenumeration?';

  @override
  String get unsubscribeWarning =>
      'Du förlorar tillgången till alla premiumfunktioner, inklusive obegränsat antal frågor, alla kategorier, annonsfri upplevelse och obegränsat antal Pandora-spelare. Du kan alltid börja prenumerera igen.';

  @override
  String get yesUnsubscribe => 'Ja, avsluta';

  @override
  String get unsubscribeSuccess =>
      'Prenumeration avslutad. Premiumfunktioner har inaktiverats.';

  @override
  String get unsubscribeError => 'Det gick inte att avsluta prenumerationen';

  @override
  String get questions => 'frågor';

  @override
  String get preview => 'förhandsvisning';

  @override
  String get userId => 'Användar-ID';

  @override
  String get subscription => 'Prenumeration';

  @override
  String get questionsCount75 => '75 frågor';

  @override
  String get questionsCount30 => '30 frågor';

  @override
  String get questionsCount5Preview => '5 frågor i förhandsvisning';

  @override
  String get unlockFullDeck => 'Lås upp 75 frågor';

  @override
  String get renameDeck => 'Byt namn på kortlek';

  @override
  String get deckRenamed => 'Kortleken har fått nytt namn';

  @override
  String get failedToRenameDeck => 'Det gick inte att byta namn på kortlek';

  @override
  String get shuffleQuestions => 'Blanda frågor';

  @override
  String get resetOrder => 'Återställ ordning';

  @override
  String get questionsShuffled => 'Frågorna har blandats!';

  @override
  String get orderReset => 'Ordningen har återställts till originalet';

  @override
  String get readyToPlay => 'Redo att spela';

  @override
  String get longPressReorder =>
      'Håll ned och dra för att ändra ordning på frågorna';

  @override
  String get noFavoritesYet => 'Inga favoriter ännu';

  @override
  String get heartQuestionsDuringGameplay =>
      'Tryck på hjärtat ❤️ på frågekorten under spelet för att spara dem här!';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Lägg till minst $count frågor för att börja spela!';
  }

  @override
  String get heartQuestionsInfo =>
      'Märk frågor med hjärta under spelet för att lägga dem i Favoriter!';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Lägg till minst $count frågor för att spela den här kortleken';
  }

  @override
  String get removeFromFavorites => 'Ta bort från favoriter';

  @override
  String get unlockEverything => 'Lås upp allt';

  @override
  String get premiumSubtitle =>
      'Få obegränsad tillgång till alla kategorier, ta bort annonser för alltid och lås upp premiumfunktioner';

  @override
  String get save32Percent => 'SPARA 29 %';

  @override
  String get priceMonthly => '€6,99/månad';

  @override
  String get priceYearly => '€59,99/år';

  @override
  String get billedAnnually => 'Debiteras årligen';

  @override
  String get equivalentMonthly => 'Endast €5/månad';

  @override
  String get feature24Categories =>
      '24+ premiumkategorier upplåsta i alla lägen';

  @override
  String get feature75Questions =>
      '75 frågor per kategori (jämfört med 30 i gratisnivån)';

  @override
  String get featureNoAds => 'Inga annonser – oavbrutet spel';

  @override
  String get featureUnlimitedPlayers =>
      'Pandora-läge: Obegränsat antal spelare och frågor';

  @override
  String get featureQuestionNavigation =>
      'Navigera och hoppa till vilken fråga du vill under spelet';

  @override
  String get featureSupportDevelopment =>
      'Stöd fortsatt utveckling och nya funktioner';

  @override
  String get error => 'Fel';

  @override
  String get premiumActivatedMessage =>
      'Premium aktiverat! Alla kategorier är upplåsta.';

  @override
  String get featurePersonalDecks =>
      'Personligt-läget: skapa obegränsat antal egna kortlekar med dina egna frågor';

  @override
  String get premiumPersonal =>
      'Personligt-läge med egna kortlekar är en premiumfunktion. Uppgradera till Premium för att skapa och spela dina egna kortlekar!';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Är du säker på att du vill ta bort \"$deckName\"? Detta tar bort alla frågor i den här kortleken.';
  }

  @override
  String needMore(int count) {
    return 'Behöver $count till';
  }

  @override
  String get editQuestions => 'Redigera frågor';

  @override
  String get addMore => 'Lägg till fler';

  @override
  String useMyConnectEmail(String email) {
    return 'Använd min Connect-e-post: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Gratisspelare kan ha max 6 spelare. Uppgradera till Premium för obegränsat antal spelare!';

  @override
  String get freemiumQuestionLimit =>
      'Gratisspelare kan skicka in max 12 frågor. Uppgradera till Premium för obegränsat antal frågor!';

  @override
  String get yourQuestions => 'Dina frågor';

  @override
  String waitingForHost(int count) {
    return 'Väntar på värden... ($count spelare)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Uppgradera till Premium för obegränsat antal spelare';

  @override
  String get kickPlayer => 'Ta bort spelare';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Är du säker på att du vill ta bort \"$playerName\" från sessionen?';
  }

  @override
  String get kick => 'Ta bort';

  @override
  String playerKicked(String playerName) {
    return '$playerName har tagits bort från sessionen';
  }

  @override
  String get failedToKickPlayer => 'Det gick inte att ta bort spelaren';

  @override
  String get cancelSessionForAll =>
      'Detta avbryter sessionen för alla spelare. Är du säker?';

  @override
  String get youWereKicked => 'Du har tagits bort från sessionen';

  @override
  String get you => 'Du';

  @override
  String get loginRequiredForPandora =>
      'Inloggning krävs för att spela Pandora';

  @override
  String get login => 'Logga in';

  @override
  String get loginRequiredNote =>
      'Inloggning krävs för att spela Pandora (för att hålla koll på spelare korrekt)';

  @override
  String get timeIsUp => 'Tiden är slut!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Det skickades inte in tillräckligt många frågor ($current/$minimum minimum).';
  }

  @override
  String get sessionQuestionLimit => 'Frågegränsen för sessionen har nåtts';

  @override
  String get sessionQuestionLimitMessage =>
      'Den här sessionen har nått gränsen på 12 frågor (gratisvärd). Uppgradera till Premium för obegränsat antal frågor!';

  @override
  String sessionQuestionCount(int current) {
    return 'Session: $current/12 frågor';
  }

  @override
  String get pleaseEnterQuestion => 'Ange en fråga';

  @override
  String get rateThisDeck => 'Betygsätt den här kortleken';

  @override
  String get yourRating => 'Ditt betyg';

  @override
  String get skip => 'Hoppa över';

  @override
  String get submit => 'Skicka';

  @override
  String get thankYouForFeedback => 'Tack för din feedback!';

  @override
  String get failedToSubmitRating => 'Det gick inte att skicka betyg';

  @override
  String get tapStarsToRate => 'Tryck på stjärnorna för att betygsätta';

  @override
  String get downloadForOffline => 'Ladda ner för offline-användning';

  @override
  String get downloading => 'Laddar ner...';

  @override
  String get downloadedLanguages => 'Nedladdade språk';

  @override
  String get languageNotDownloaded => 'Språket har inte laddats ner';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'Du har inte laddat ner $languageName för offline-användning.\n\nGå till Inställningar > Profil > \"Ladda ner för offline-användning\" när du är ansluten till internet.';
  }

  @override
  String get offlineLanguageError =>
      'Det här språket har inte laddats ner för offline-användning. Gå till Inställningar > Profil > \"Ladda ner för offline-användning\" när du är ansluten till internet.';

  @override
  String get downloadComplete => 'Nedladdning klar!';

  @override
  String get downloadCompleteMessage =>
      'Allt innehåll har laddats ner för offline-användning.';

  @override
  String get addedToFavorites => 'Tillagt till favoriter';

  @override
  String get removedFromFavorites => 'Borttaget från favoriter';

  @override
  String get errorSavingFavorite => 'Fel vid sparande av favorit';

  @override
  String get internetRequired => 'Internet krävs';

  @override
  String get internetRequiredMessage =>
      'Vissa funktioner kräver internetanslutning. Premium-användare kan ladda ner innehåll för offline-användning i Inställningar.';

  @override
  String get goPremium => 'Gå till Premium';

  @override
  String get pleaseEnterPin => 'Ange en 6-siffrig PIN';

  @override
  String errorOccurred(String error) {
    return 'Fel: $error';
  }

  @override
  String get errorCreatingSession => 'Fel vid skapande av session';

  @override
  String get sessionTimedOut =>
      'Sessionen löpte ut - värden ställde inte in timer';

  @override
  String get errorStarting => 'Fel vid start';

  @override
  String get errorLoadingParticipants => 'Fel vid laddning av deltagare';

  @override
  String get sessionCancelledByHost => 'Sessionen avbröts av värden';

  @override
  String needAtLeast5Questions(int count) {
    return 'Behöver minst 5 frågor för att starta! (Just nu: $count)';
  }

  @override
  String get errorStartingGame => 'Fel vid start av spel';

  @override
  String get questionsAsked => 'Ställda frågor';

  @override
  String get totalReactions => 'Totalt antal reaktioner';

  @override
  String get mostLovedQuestion => 'Mest älskade frågan';

  @override
  String get mostFunQuestion => 'Roligaste frågan';

  @override
  String get mostShockingQuestion => 'Mest chockerande frågan';

  @override
  String get mostLitQuestion => 'Hetaste frågan';

  @override
  String get hotSeatAward => 'Hot Seat-priset';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Fel: kunde inte identifiera spelaren. Gå med i sessionen igen.';

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
