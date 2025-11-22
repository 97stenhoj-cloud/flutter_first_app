// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Start';

  @override
  String get settings => 'Instellingen';

  @override
  String get howToPlay => 'Hoe speel je';

  @override
  String get chooseGameMode => 'Kies je spelmodus';

  @override
  String get family => 'Familie';

  @override
  String get couple => 'Stel';

  @override
  String get friends => 'Vrienden';

  @override
  String get chooseCategory => 'Kies een categorie';

  @override
  String get locked => 'Premiumcategorie';

  @override
  String get lockedMessage =>
      'Dit is een premiumcategorie. Upgrade om alle categorieën te ontgrendelen en advertenties te verwijderen!';

  @override
  String get previewAvailable => 'Voorbeeld: eerste 5 vragen beschikbaar';

  @override
  String get upgradeNow => 'Nu upgraden';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Misschien later';

  @override
  String get getPremium => 'Neem Premium';

  @override
  String get premiumTitle => 'Ontgrendel alles';

  @override
  String get premiumDescription =>
      'Krijg onbeperkte toegang tot alle categorieën in alle modi, verwijder advertenties en geniet van onbeperkte Pandora-sessies.';

  @override
  String get premiumPriceMonthly => '€6,99/maand';

  @override
  String get premiumPriceYearly => '€59,99/jaar';

  @override
  String get saveWithYearly => 'Bespaar €23,89 met een jaarabonnement!';

  @override
  String get monthly => 'Maandelijks';

  @override
  String get yearly => 'Jaarlijks';

  @override
  String get billedMonthly => 'Maandelijks gefactureerd';

  @override
  String get billedYearly => 'Jaarlijks gefactureerd';

  @override
  String get premiumFeature1 => '✓ Alle 21 premiumcategorieën ontgrendeld';

  @override
  String get premiumFeature2 => '✓ Geen advertenties, voor altijd';

  @override
  String get premiumFeature3 => '✓ 75 vragen in alle categorieën';

  @override
  String get premiumFeature4 => '✓ Pandora: onbeperkt aantal spelers en vragen';

  @override
  String get premiumFeature5 => '✓ Steun de verdere ontwikkeling';

  @override
  String get subscribePremium => 'Abonneer op Premium';

  @override
  String get subscribe => 'Abonneren';

  @override
  String get cancel => 'Annuleren';

  @override
  String get subscriptionActivated =>
      'Premium geactiveerd! Alle categorieën zijn ontgrendeld.';

  @override
  String get premiumActivated => 'Premium geactiveerd!';

  @override
  String get demoNote =>
      'Demo: abonnement wordt teruggezet wanneer de app opnieuw wordt gestart';

  @override
  String get freeTier => 'Gratis versie';

  @override
  String get freeTierDesc =>
      '3 categorieën per modus (30 vragen per categorie)\nVoorbeeld van 5 vragen uit premiumcategorieën\nAdvertenties om de 7 vragen';

  @override
  String get currentPlan => 'Huidig abonnement';

  @override
  String get limitReached => 'Limiet bereikt';

  @override
  String get freeCategoryLimit =>
      'Je hebt de limiet van 30 vragen voor gratis categorieën bereikt. Upgrade naar Premium voor onbeperkte toegang!';

  @override
  String get previewLimit =>
      'Je hebt alle 5 voorbeeldvragen gezien. Upgrade naar Premium om door te gaan!';

  @override
  String get pandoraFreeLimit => 'Gratis limiet';

  @override
  String get pandoraFreeLimitMessage =>
      'Gratis hosts kunnen maximaal 6 spelers en 12 vragen hebben. Upgrade naar Premium voor onbeperkt!';

  @override
  String get pandoraUpgradeMessage =>
      'Je hebt 12 vragen bereikt. Upgrade naar Premium om verder te spelen!';

  @override
  String get pandoraMaxPlayers =>
      'Maximum van 6 spelers bereikt (gratis limiet). Upgrade naar Premium voor onbeperkte spelers!';

  @override
  String get swipeOrTap => 'Veeg of tik op de pijlen';

  @override
  String get previous => 'Vorige';

  @override
  String get next => 'Volgende';

  @override
  String get advertisement => 'Advertentie';

  @override
  String get watchAdMessage =>
      'Bekijk een korte advertentie om door te gaan, of speel advertentievrij met Premium!';

  @override
  String get watchAd => 'Advertentie bekijken';

  @override
  String get goAdFree => 'Advertentievrij met Premium';

  @override
  String get removeAdsForever => 'Advertenties voor altijd verwijderen';

  @override
  String get adNotReady =>
      'Advertentie is nog niet klaar. We gaan door zonder advertentie.';

  @override
  String get adLoadingContinue => 'Advertentie wordt geladen... Doorgaan';

  @override
  String get pricePerMonth => '€6,99/maand of €59,99/jaar';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Geen vragen gevonden voor $category in modus $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Fout bij het laden van vragen. Controleer je verbinding.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Vragen laden mislukt: $error';
  }

  @override
  String get howManyPlayers => 'Hoeveel spelers?';

  @override
  String get players => 'Spelers';

  @override
  String get continueButton => 'Doorgaan';

  @override
  String get language => 'Taal';

  @override
  String languageChanged(Object language) {
    return 'Taal gewijzigd naar $language';
  }

  @override
  String get profile => 'Profiel';

  @override
  String get signOut => 'Uitloggen';

  @override
  String get notSignedIn => 'Niet ingelogd';

  @override
  String get signInSignUp => 'Inloggen / Registreren';

  @override
  String get signInToSync =>
      'Log in om je abonnement tussen apparaten te synchroniseren en premiumcontent te ontgrendelen';

  @override
  String get signOutConfirm => 'Weet je zeker dat je wilt uitloggen?';

  @override
  String get signedOutSuccess => 'Succesvol uitgelogd';

  @override
  String get accountInformation => 'Accountinformatie';

  @override
  String get email => 'E-mail';

  @override
  String get memberSince => 'Lid sinds';

  @override
  String get notAvailable => 'Niet beschikbaar';

  @override
  String get unknown => 'Onbekend';

  @override
  String get subscriptionStatus => 'Abonnementsstatus';

  @override
  String get premiumMember => 'Premiumlid';

  @override
  String get freeAccount => 'Gratis account';

  @override
  String get welcomeToConnect => 'Welkom bij Connect!';

  @override
  String get continueWithApple => 'Doorgaan met Apple';

  @override
  String get continueWithGoogle => 'Doorgaan met Google';

  @override
  String get skipForNow => 'Voor nu overslaan';

  @override
  String get byContining =>
      'Door door te gaan ga je akkoord met onze servicevoorwaarden en privacyverklaring';

  @override
  String get googleSignInFailed =>
      'Inloggen met Google is mislukt. Probeer het opnieuw.';

  @override
  String get appleSignInFailed =>
      'Inloggen met Apple is mislukt. Probeer het opnieuw.';

  @override
  String get noCategoriesFound => 'Geen categorieën gevonden';

  @override
  String get welcomeBack => 'Welkom terug!';

  @override
  String get createAccount => 'Account aanmaken';

  @override
  String get displayName => 'Schermnaam';

  @override
  String get password => 'Wachtwoord';

  @override
  String get signIn => 'Inloggen';

  @override
  String get signUp => 'Registreren';

  @override
  String get dontHaveAccount => 'Nog geen account? Registreren';

  @override
  String get alreadyHaveAccount => 'Heb je al een account? Inloggen';

  @override
  String get chooseYourMode => '1. Kies je modus';

  @override
  String get chooseYourModeDesc =>
      'Kies uit vijf unieke gespreksbelevingen:\n\n• Stel – Intieme vragen om jullie relatie te verdiepen\n• Vrienden – Leuke, interactieve topics voor jouw vriendengroep\n• Familie – Warme, veilige gesprekken voor alle leeftijden\n• Persoonlijk – Maak je eigen aangepaste vragendecks (Premium)\n• Pandora – Samenwerkings-multiplayergame met vragen in realtime';

  @override
  String get pickCategory => '2. Kies een categorie';

  @override
  String get pickCategoryDesc =>
      'Elke modus heeft meerdere categorieën met zorgvuldig samengestelde vragenpakketten:\n\n• Gratis: 3 categorieën per modus (30 vragen per categorie)\n• Premiumvoorbeeld: eerste 5 vragen van premiumcategorieën\n• Premium: 24+ categorieën (75 vragen per categorie)\n• Persoonlijk: maak onbeperkt eigen decks met je eigen vragen';

  @override
  String get startTalking => '3. Start met spelen';

  @override
  String get startTalkingDesc =>
      'Vragen worden op volledig scherm getoond voor een meeslepende ervaring. Neem om de beurt een vraag en antwoord eerlijk – er zijn geen foute antwoorden! Het doel is verbinding en plezier.\n\nIn de Pandora-modus: alle spelers dienen anoniem vragen in en beantwoorden ze daarna samen in realtime.';

  @override
  String get navigateQuestions => '4. Navigeer tussen vragen';

  @override
  String get navigateQuestionsDesc =>
      '• Veeg in een willekeurige richting of tik op de pijlen om te wisselen van vraag\n• Tik op het hart-icoon ❤️ om favorieten op te slaan\n• Premium: tik op het vragenlijst-icoon (rechtsboven) om naar een willekeurige vraag te springen\n• Tik op de homeknop om op elk moment terug te keren naar het hoofdmenu';

  @override
  String get premiumFeatures => '5. Premiumfuncties';

  @override
  String get premiumFeaturesDesc =>
      'Ontgrendel de volledige Connect-ervaring:\n\n• Maandelijks: €6,99/maand\n• Jaarlijks: €59,99/jaar (bespaar 29%!)\n\n✓ Alle 24+ premiumcategorieën in alle modi\n✓ 75 vragen per categorie (vs 30 in de gratis versie)\n✓ Geen advertenties, voor altijd\n✓ Pandora: onbeperkt aantal spelers en vragen\n✓ Persoonlijk: maak onbeperkt eigen decks\n✓ Vragennavigatie – spring naar elke vraag\n✓ Steun de verdere ontwikkeling';

  @override
  String get proTips => 'Tips';

  @override
  String get proTipsDesc =>
      '• Zorg voor een comfortabele, rustige omgeving\n• Luister actief en wees aanwezig\n• Deel eerlijk en moedig anderen aan hetzelfde te doen\n• Respecteer grenzen – een vraag overslaan is oké\n• Gebruik favorieten ❤️ om vragen te bewaren die je mooi vindt\n• Probeer verschillende modi voor verschillende gelegenheden\n• Pandora is perfect voor feestjes en groepsavonden\n• Heb plezier en geniet van de verbinding!';

  @override
  String get aboutCredits => 'Over / Credits';

  @override
  String get developedBy => 'Ontwikkeld door TechyKoala';

  @override
  String get learnMore => 'Lees meer over ons en komende apps';

  @override
  String get visitWebsite => 'Bezoek techykoala.com';

  @override
  String get madeWithLove => 'Gemaakt met ❤️ voor betekenisvolle gesprekken';

  @override
  String get personal => 'Persoonlijk';

  @override
  String get personalDesc => 'Maak je eigen aangepaste vragendecks';

  @override
  String get gameComplete => 'Spel voltooid!';

  @override
  String get noMoreQuestions => 'Je hebt alle vragen in dit deck doorlopen!';

  @override
  String get playAgain => 'Opnieuw spelen';

  @override
  String get mainMenu => 'Hoofdmenu';

  @override
  String get thanksForPlaying => 'Bedankt voor het spelen!';

  @override
  String get hopeYouHadFun => 'Hopelijk heb je genoten! 🎉';

  @override
  String get backToMenu => 'Terug naar menu';

  @override
  String get leaveGame => 'Spel verlaten?';

  @override
  String get leaveGameMessage =>
      'Weet je zeker dat je wilt verlaten? Het spel gaat verder voor de andere spelers.';

  @override
  String get leave => 'Verlaten';

  @override
  String get noQuestionsAvailable => 'Geen vragen beschikbaar';

  @override
  String get showLess => 'Minder weergeven';

  @override
  String get readMore => 'Meer weergeven';

  @override
  String get tapToPlay => 'Tik om te spelen';

  @override
  String get favorites => 'Favorieten';

  @override
  String get pandoraHostCreatePin =>
      'Host maakt een sessie en deelt de pincode';

  @override
  String get pandoraPlayersJoinMax =>
      'Spelers doen mee (max. 6 gratis, onbeperkt met Premium)';

  @override
  String get pandoraHostSetsTimer => 'Host stelt een vraag-timer in (1–15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Iedereen dient vragen in (max. 12 gratis)';

  @override
  String get pandoraHostControls => 'Host bestuurt het verloop van het spel';

  @override
  String get pandoraQuestionsDeleted => 'Vragen worden na het spel verwijderd';

  @override
  String get pandoraHost => 'Host';

  @override
  String get pandoraJoinGame => 'Meedoen met spel';

  @override
  String get pandoraPandoraBox => 'Pandora-box';

  @override
  String get pleaseEnterName => 'Vul je naam in';

  @override
  String get hostSuffix => '(Host)';

  @override
  String get playersJoinWithNames => 'Spelers doen mee met hun naam';

  @override
  String get everyoneSubmitsMin5 =>
      'Iedereen stuurt vragen in (min. 5, max. 12 gratis)';

  @override
  String get createSession => 'Sessie aanmaken';

  @override
  String get creating => 'Bezig met aanmaken...';

  @override
  String get yourName => 'Jouw naam';

  @override
  String get enterDisplayName => 'Vul je schermnaam in';

  @override
  String get howItWorks => 'Hoe het werkt';

  @override
  String get pinCopied => 'PIN gekopieerd naar klembord!';

  @override
  String get endSession => 'Sessie beëindigen?';

  @override
  String get endSessionConfirm =>
      'Weet je zeker dat je deze Pandora-sessie wilt beëindigen?';

  @override
  String get createCustomDeck => 'Eigen deck maken';

  @override
  String get deckName => 'Decknaam';

  @override
  String get enterDeckName => 'Vul een decknaam in';

  @override
  String get create => 'Maken';

  @override
  String get deckCreated => 'Deck gemaakt!';

  @override
  String get failedToCreateDeck => 'Deck maken mislukt';

  @override
  String get deleteDeck => 'Deck verwijderen?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Weet je zeker dat je \"$deckName\" wilt verwijderen? Dit verwijdert alle vragen in dit deck.';
  }

  @override
  String get delete => 'Verwijderen';

  @override
  String get deckDeleted => 'Deck verwijderd';

  @override
  String get failedToDeleteDeck => 'Deck verwijderen mislukt';

  @override
  String get myDecks => 'Mijn decks';

  @override
  String get noDecksYet => 'Nog geen decks';

  @override
  String get createFirstDeck => 'Maak je eerste eigen deck!';

  @override
  String questionsCount(Object count) {
    return '$count vragen';
  }

  @override
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vragen',
      one: '1 vraag',
      zero: '0 vragen',
    );
    return '$_temp0';
  }

  @override
  String get questionAdded => 'Vraag toegevoegd!';

  @override
  String get failedToAddQuestion => 'Vraag toevoegen mislukt';

  @override
  String get editQuestion => 'Vraag bewerken';

  @override
  String get enterYourQuestion => 'Vul je vraag in';

  @override
  String get save => 'Opslaan';

  @override
  String get questionUpdated => 'Vraag bijgewerkt!';

  @override
  String get failedToUpdateQuestion => 'Vraag bijwerken mislukt';

  @override
  String get deleteQuestion => 'Vraag verwijderen';

  @override
  String get deleteQuestionConfirm =>
      'Weet je zeker dat je deze vraag wilt verwijderen?';

  @override
  String get questionDeleted => 'Vraag verwijderd';

  @override
  String get failedToDeleteQuestion => 'Vraag verwijderen mislukt';

  @override
  String get addQuestion => 'Vraag toevoegen';

  @override
  String get typeQuestionHere => 'Typ hier je vraag...';

  @override
  String get add => 'Toevoegen';

  @override
  String get noQuestionsYet => 'Nog geen vragen';

  @override
  String get addFirstQuestion => 'Voeg je eerste vraag toe!';

  @override
  String get deckDescLoveTalks =>
      'Ontdek romantiek, chemie en verbinding met vragen die jullie relatie vieren. Van \"hoe we elkaar hebben ontmoet\" tot wat jou het meest geliefd laat voelen – deze kaarten verdiepen de emotionele intimiteit.';

  @override
  String get deckDescDeepTalks =>
      'Deze kaarten duiken in waarden, kwetsbaarheid en wat het betekent om samen te groeien. Ze helpen partners nadenken over onafhankelijkheid, communicatie en een gedeelde richting.';

  @override
  String get deckDescSpicyTalks =>
      'Flirterig, gedurfd en intiem — deze kaarten nodigen stellen uit om verlangens, fantasieën en passie samen te verkennen. Elke vraag is gemaakt om eerlijke, spannende gesprekken aan te wakkeren over wat jullie aantrekt en dichter bij elkaar brengt.';

  @override
  String get deckDescDoYouDareTalks =>
      'Een onverschrokken deck dat emotionele eerlijkheid combineert met gevoelige onderwerpen zoals vertrouwen, religie, geld en persoonlijke grenzen — allemaal ontworpen om te onthullen wat echt belangrijk is voor jullie beiden. *Let op:* sommige vragen zijn rauw en ongefilterd — speel met openheid, empathie en respect.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Geïnspireerd door de vijf liefdestalen helpt dit deck partners om affectie te uiten op manieren die echt binnenkomen. Ontdek hoe woorden, daden en kleine gebaren jullie band kunnen versterken.';

  @override
  String get deckDescSillyTalks =>
      'Pure lol en veel gelach! Deze luchtige, maffe vragen halen jullie gekste gewoontes en grappigste gedachten naar boven. Perfect voor vrienden, familie of stellen die het leven niet te serieus nemen.';

  @override
  String get deckDescCarTalks =>
      'Perfect voor autoritten – deze kaarten veranderen reistijd in goede gesprekken. Verwacht grappige, creatieve en nostalgische vragen over reizen, avonturen en eigenaardigheden.';

  @override
  String get deckDescCozyTalks =>
      'Warme, ontspannen gesprekken, perfect voor knusse avonden. Deze vragen creëren comfortabele, hartelijke momenten van verbinding.';

  @override
  String get deckDescPartyNight =>
      'Energieke vragen, gemaakt voor groepen. Ideaal voor feestjes en sociale avonden met vrienden.';

  @override
  String get deckDescUnpopularOpinions =>
      'Het deck dat je uitdaagt om te zeggen wat iedereen denkt maar niemand hardop zegt. Van influencer-cultuur tot sociale normen — deze kaarten zorgen voor eerlijke discussies en verrassende standpunten. Perfect voor vrienden met sterke meningen.';

  @override
  String get deckDescPlotTwists =>
      'Dit deck gooit jullie midden in de grappigste en lastigste \'wat zou jij doen als...?\'-situaties. Snelle keuzes, onderbuikgevoel en veel gelach gegarandeerd! Perfect voor groepsavonden vol verrassingen.';

  @override
  String get deckDescAfterDark =>
      'Stap in de donkere kant van gesprekken met vragen die je kippenvel bezorgen. Van creepy toevalligheden tot survival-scenario’s — perfect voor late avonden met een vleugje spanning.';

  @override
  String get deckDescHistoryTalks =>
      'Een nostalgische mix van persoonlijke herinneringen en familieverhalen. Deze vragen inspireren tot anekdotes, gelach en het herontdekken van je roots. Perfect voor familiebijeenkomsten of rustige avonden.';

  @override
  String get deckDescTinyTalks =>
      'Gemaakt voor ouders en kleintjes! Eenvoudige, speelse vragen helpen kinderen zichzelf uit te drukken, terwijl ouders leren hoe ze denken. Perfect voor leeftijden 3–9 jaar.';

  @override
  String get deckDescGoodOldDays =>
      'Reis terug in de tijd met vragen over dierbare herinneringen, vroegere ervaringen en hoe dingen vroeger waren. Geschikt voor alle leeftijden.';

  @override
  String get deckDescWouldYouRather =>
      'Klassieke dilemma-vragen die discussies starten en voorkeuren onthullen. Kies tussen twee opties en ontdek wat écht belangrijk is.';

  @override
  String get createNewDeck => 'Nieuw deck maken';

  @override
  String get sessionPin => 'Sessiepincode';

  @override
  String get joinSession => 'Aan sessie deelnemen';

  @override
  String get questionSubmitted => 'Vraag verstuurd';

  @override
  String get sessionCancelled => 'Sessie geannuleerd';

  @override
  String get yourQuestion => 'Jouw vraag';

  @override
  String get reactionBreakdown => 'Overzicht van reacties';

  @override
  String get deckNameHint => 'Decknaam';

  @override
  String get deckCreatedSuccess => 'Deck gemaakt!';

  @override
  String get cancelSession => 'Sessie annuleren?';

  @override
  String get cancelSessionConfirm =>
      'Dit annuleert de sessie voor alle spelers. Weet je het zeker?';

  @override
  String get no => 'Nee';

  @override
  String get yesCancel => 'Ja, annuleren';

  @override
  String get hostQuestionCollection => 'Host – vragen verzamelen';

  @override
  String get questionCollection => 'Vragenverzameling';

  @override
  String get endSessionButton => 'Sessie beëindigen';

  @override
  String get noActiveSubscription => 'Geen actief abonnement';

  @override
  String get premium => 'PREMIUM';

  @override
  String notEnoughQuestions(Object count) {
    return 'Niet genoeg vragen. Minimaal 5 vereist. (Nu: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Premiumfunctie';

  @override
  String get questionNavigationPremium =>
      'Vragennavigatie is een premiumfunctie. Abonneer om de mogelijkheid te ontgrendelen om naar elke vraag te springen!';

  @override
  String get customDecks => 'Aangepaste decks';

  @override
  String get noDecksYetMessage => 'Nog geen decks';

  @override
  String get createFirstDeckMessage => 'Tik op + om je eerste deck te maken';

  @override
  String get signInRequired => 'Inloggen vereist';

  @override
  String get signInToUsePersonal =>
      'Log in om de modus Persoonlijk te gebruiken en je eigen vragendecks te maken.';

  @override
  String get collaborativeQuestionGame => 'Samenwerkings-vragenspel';

  @override
  String get hostPandoraSession => 'Pandora-sessie hosten';

  @override
  String get joinPandoraGame => 'Meedoen aan een spel';

  @override
  String get yourDisplayName => 'Je schermnaam';

  @override
  String get enterYourName => 'Vul je naam in';

  @override
  String get selectQuestion => 'Selecteer een vraag';

  @override
  String get joinTime => 'Tijd om mee te doen';

  @override
  String get participants => 'Deelnemers';

  @override
  String get loading => 'Laden...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Minstens 2 spelers nodig ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Doorgaan naar timerinstellingen';

  @override
  String get setQuestionTimer => 'Vraag-timer instellen';

  @override
  String get questionCollectionTime => 'Tijd om vragen te verzamelen';

  @override
  String get minutes => 'minuten';

  @override
  String get sessionWillEnd =>
      'De sessie wordt automatisch beëindigd als je niet binnen 5 minuten doorgaat';

  @override
  String get startQuestionCollection => 'Start vragenverzameling';

  @override
  String questionsSubmitted(int count) {
    return '$count vragen verstuurd';
  }

  @override
  String get writeQuestionHere => 'Schrijf je vraag hier...';

  @override
  String get whoIsThisFor => 'Voor wie is deze vraag?';

  @override
  String get everyone => 'Iedereen';

  @override
  String get specific => 'Specifiek';

  @override
  String get submitQuestion => 'Vraag versturen';

  @override
  String needMoreQuestions(int count) {
    return 'Er zijn nog $count vragen nodig';
  }

  @override
  String get startGame => 'Spel starten';

  @override
  String get selectPlayer => 'Selecteer een speler';

  @override
  String get unsubscribe => 'Abonnement opzeggen';

  @override
  String get unsubscribeConfirm => 'Premium-abonnement opzeggen?';

  @override
  String get unsubscribeWarning =>
      'Je verliest toegang tot alle premiumfuncties, waaronder onbeperkte vragen, alle categorieën, een advertentievrije ervaring en onbeperkt aantal Pandora-spelers. Je kunt op elk moment opnieuw abonneren.';

  @override
  String get yesUnsubscribe => 'Ja, opzeggen';

  @override
  String get unsubscribeSuccess =>
      'Abonnement succesvol opgezegd. Premiumfuncties zijn uitgeschakeld.';

  @override
  String get unsubscribeError => 'Opzeggen van abonnement mislukt';

  @override
  String get questions => 'vragen';

  @override
  String get preview => 'voorbeeld';

  @override
  String get userId => 'Gebruikers-ID';

  @override
  String get subscription => 'Abonnement';

  @override
  String get questionsCount75 => '75 vragen';

  @override
  String get questionsCount30 => '30 vragen';

  @override
  String get questionsCount5Preview => 'Voorbeeld van 5 vragen';

  @override
  String get unlockFullDeck => '75 vragen ontgrendelen';

  @override
  String get renameDeck => 'Deck hernoemen';

  @override
  String get deckRenamed => 'Deck hernoemd';

  @override
  String get failedToRenameDeck => 'Deck hernoemen mislukt';

  @override
  String get shuffleQuestions => 'Vragen schudden';

  @override
  String get resetOrder => 'Volgorde herstellen';

  @override
  String get questionsShuffled => 'Vragen geschud!';

  @override
  String get orderReset => 'Volgorde teruggezet naar origineel';

  @override
  String get readyToPlay => 'Klaar om te spelen';

  @override
  String get longPressReorder =>
      'Houd ingedrukt en sleep om de volgorde van vragen te wijzigen';

  @override
  String get noFavoritesYet => 'Nog geen favorieten';

  @override
  String get heartQuestionsDuringGameplay =>
      'Tik op het hart ❤️ op vraagkaarten tijdens het spelen om ze hier op te slaan!';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Voeg minstens $count vragen toe om te beginnen met spelen!';
  }

  @override
  String get heartQuestionsInfo =>
      'Markeer vragen met een hartje tijdens het spelen om ze aan je favorieten toe te voegen!';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Voeg minstens $count vragen toe om dit deck te spelen';
  }

  @override
  String get removeFromFavorites => 'Uit favorieten verwijderen';

  @override
  String get unlockEverything => 'Alles ontgrendelen';

  @override
  String get premiumSubtitle =>
      'Krijg onbeperkte toegang tot alle categorieën, verwijder advertenties voorgoed en ontgrendel premiumfuncties';

  @override
  String get save32Percent => 'BESPAAR 29%';

  @override
  String get priceMonthly => '€6,99/maand';

  @override
  String get priceYearly => '€59,99/jaar';

  @override
  String get billedAnnually => 'Jaarlijks gefactureerd';

  @override
  String get equivalentMonthly => 'Slechts €5/maand';

  @override
  String get feature24Categories =>
      '24+ premiumcategorieën ontgrendeld in alle modi';

  @override
  String get feature75Questions =>
      '75 vragen per categorie (vs 30 in de gratis versie)';

  @override
  String get featureNoAds => 'Geen advertenties meer – ononderbroken spel';

  @override
  String get featureUnlimitedPlayers =>
      'Pandora-modus: onbeperkt aantal spelers en vragen';

  @override
  String get featureQuestionNavigation =>
      'Navigeer en spring naar elke vraag tijdens het spel';

  @override
  String get featureSupportDevelopment =>
      'Steun de verdere ontwikkeling en nieuwe functies';

  @override
  String get error => 'Fout';

  @override
  String get premiumActivatedMessage =>
      'Premium geactiveerd! Alle categorieën zijn ontgrendeld.';

  @override
  String get featurePersonalDecks =>
      'Persoonlijk-modus: maak onbeperkt eigen decks met je eigen vragen';

  @override
  String get premiumPersonal =>
      'De modus Persoonlijk met eigen decks is een premiumfunctie. Upgrade naar Premium om je eigen vragendecks te maken en te spelen!';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Weet je zeker dat je \"$deckName\" wilt verwijderen? Dit verwijdert alle vragen in dit deck.';
  }

  @override
  String needMore(int count) {
    return 'Nog $count nodig';
  }

  @override
  String get editQuestions => 'Vragen bewerken';

  @override
  String get addMore => 'Meer toevoegen';

  @override
  String useMyConnectEmail(String email) {
    return 'Gebruik mijn Connect-e-mailadres: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Gratis gebruikers kunnen maximaal 6 spelers hebben. Upgrade naar Premium voor onbeperkt aantal spelers!';

  @override
  String get freemiumQuestionLimit =>
      'Gratis gebruikers kunnen maximaal 12 vragen insturen. Upgrade naar Premium voor onbeperkt aantal vragen!';

  @override
  String get yourQuestions => 'Jouw vragen';

  @override
  String waitingForHost(int count) {
    return 'Wachten op host... ($count spelers)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Upgrade naar Premium voor onbeperkt aantal spelers';

  @override
  String get kickPlayer => 'Speler verwijderen';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Weet je zeker dat je \"$playerName\" uit de sessie wilt verwijderen?';
  }

  @override
  String get kick => 'Verwijderen';

  @override
  String playerKicked(String playerName) {
    return '$playerName is verwijderd';
  }

  @override
  String get failedToKickPlayer => 'Speler verwijderen mislukt';

  @override
  String get cancelSessionForAll =>
      'Dit annuleert de sessie voor alle spelers. Weet je het zeker?';

  @override
  String get youWereKicked => 'Je bent verwijderd uit de sessie';

  @override
  String get you => 'Jij';

  @override
  String get loginRequiredForPandora => 'Inloggen vereist om Pandora te spelen';

  @override
  String get login => 'Inloggen';

  @override
  String get loginRequiredNote =>
      'Inloggen is vereist om Pandora te spelen (zodat spelers correct kunnen worden bijgehouden)';

  @override
  String get timeIsUp => 'Tijd is om!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Er zijn niet genoeg vragen ingestuurd ($current/$minimum minimum).';
  }

  @override
  String get sessionQuestionLimit => 'Vragenlimiet van sessie bereikt';

  @override
  String get sessionQuestionLimitMessage =>
      'Deze sessie heeft de limiet van 12 vragen bereikt (gratis host). Upgrade naar Premium voor onbeperkt aantal vragen!';

  @override
  String sessionQuestionCount(int current) {
    return 'Sessie: $current/12 vragen';
  }

  @override
  String get pleaseEnterQuestion => 'Vul een vraag in';

  @override
  String get rateThisDeck => 'Beoordeel dit deck';

  @override
  String get yourRating => 'Jouw beoordeling';

  @override
  String get skip => 'Overslaan';

  @override
  String get submit => 'Verzenden';

  @override
  String get thankYouForFeedback => 'Bedankt voor je feedback!';

  @override
  String get failedToSubmitRating => 'Beoordeling verzenden mislukt';

  @override
  String get tapStarsToRate => 'Tik op de sterren om te beoordelen';

  @override
  String get downloadForOffline => 'Download voor offline gebruik';

  @override
  String get downloading => 'Downloaden...';

  @override
  String get downloadedLanguages => 'Gedownloade talen';

  @override
  String get languageNotDownloaded => 'Taal niet gedownload';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'Je hebt $languageName niet gedownload voor offline gebruik.\n\nGa naar Instellingen > Profiel > \"Download voor offline gebruik\" terwijl je verbonden bent met internet.';
  }

  @override
  String get offlineLanguageError =>
      'Deze taal is niet gedownload voor offline gebruik. Ga naar Instellingen > Profiel > \"Download voor offline gebruik\" terwijl je verbonden bent met internet.';

  @override
  String get downloadComplete => 'Download voltooid!';

  @override
  String get downloadCompleteMessage =>
      'Alle inhoud is gedownload voor offline gebruik.';

  @override
  String get addedToFavorites => 'Toegevoegd aan favorieten';

  @override
  String get removedFromFavorites => 'Verwijderd uit favorieten';

  @override
  String get errorSavingFavorite => 'Fout bij opslaan van favoriet';

  @override
  String get internetRequired => 'Internet vereist';

  @override
  String get internetRequiredMessage =>
      'Sommige functies vereisen een internetverbinding. Premium-gebruikers kunnen inhoud downloaden voor offline gebruik in Instellingen.';

  @override
  String get goPremium => 'Ga naar Premium';

  @override
  String get pleaseEnterPin => 'Voer een 6-cijferige PIN in';

  @override
  String errorOccurred(String error) {
    return 'Fout: $error';
  }

  @override
  String get errorCreatingSession => 'Fout bij aanmaken van sessie';

  @override
  String get sessionTimedOut =>
      'Sessie verlopen - host heeft geen timer ingesteld';

  @override
  String get errorStarting => 'Fout bij starten';

  @override
  String get errorLoadingParticipants => 'Fout bij laden van deelnemers';

  @override
  String get sessionCancelledByHost => 'Sessie geannuleerd door host';

  @override
  String needAtLeast5Questions(int count) {
    return 'Minstens 5 vragen nodig om te starten! (Nu: $count)';
  }

  @override
  String get errorStartingGame => 'Fout bij starten van spel';

  @override
  String get questionsAsked => 'Gestelde vragen';

  @override
  String get totalReactions => 'Totaal aantal reacties';

  @override
  String get mostLovedQuestion => 'Meest geliefde vraag';

  @override
  String get mostFunQuestion => 'Leukste vraag';

  @override
  String get mostShockingQuestion => 'Meest schokkende vraag';

  @override
  String get mostLitQuestion => 'Meest vette vraag';

  @override
  String get hotSeatAward => 'Hot Seat Award';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Fout: kon speler niet identificeren. Sluit opnieuw aan bij de sessie.';

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
