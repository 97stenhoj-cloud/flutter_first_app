// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Aloita';

  @override
  String get settings => 'Asetukset';

  @override
  String get howToPlay => 'Näin pelaat';

  @override
  String get chooseGameMode => 'Valitse pelitila';

  @override
  String get family => 'Perhe';

  @override
  String get couple => 'Pari';

  @override
  String get friends => 'Ystävät';

  @override
  String get chooseCategory => 'Valitse kategoria';

  @override
  String get locked => 'Premium-kategoria';

  @override
  String get lockedMessage =>
      'Tämä on premium-kategoria. Päivitä Premiumiin avataksesi kaikki kategoriat ja poistaaksesi mainokset!';

  @override
  String get previewAvailable =>
      'Esikatselu: ensimmäiset 5 kysymystä käytettävissä';

  @override
  String get upgradeNow => 'Päivitä nyt';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Ehkä myöhemmin';

  @override
  String get getPremium => 'Hanki Premium';

  @override
  String get premiumTitle => 'Avaa kaikki';

  @override
  String get premiumDescription =>
      'Saat rajattoman pääsyn kaikkiin kategorioihin kaikissa tiloissa, poistat mainokset ja nautit rajattomista Pandora-istunnoista.';

  @override
  String get premiumPriceMonthly => '€6,99/kk';

  @override
  String get premiumPriceYearly => '€59,99/vuosi';

  @override
  String get saveWithYearly => 'Säästä 23,89 € vuositilauksella!';

  @override
  String get monthly => 'Kuukausittain';

  @override
  String get yearly => 'Vuosittain';

  @override
  String get billedMonthly => 'Laskutetaan kuukausittain';

  @override
  String get billedYearly => 'Laskutetaan vuosittain';

  @override
  String get premiumFeature1 => '✓ Kaikki 21 premium-kategoriaa avattu';

  @override
  String get premiumFeature2 => '✓ Ei mainoksia – ikuisesti';

  @override
  String get premiumFeature3 =>
      '✓ Rajoittamattomasti kysymyksiä kaikissa kategorioissa';

  @override
  String get premiumFeature4 =>
      '✓ Pandora: rajaton määrä pelaajia ja kysymyksiä';

  @override
  String get premiumFeature5 => '✓ Tue jatkuvaa kehitystä';

  @override
  String get subscribePremium => 'Tilaa Premium';

  @override
  String get subscribe => 'Tilaa';

  @override
  String get cancel => 'Peruuta';

  @override
  String get subscriptionActivated =>
      'Premium aktivoitu! Kaikki kategoriat on avattu.';

  @override
  String get premiumActivated => 'Premium aktivoitu!';

  @override
  String get demoNote =>
      'Demo: tilaus nollautuu, kun sovellus käynnistetään uudelleen';

  @override
  String get freeTier => 'Ilmaisversio';

  @override
  String get freeTierDesc =>
      '3 kategoriaa per tila (30 kysymystä/kategoria)\n5 kysymyksen esikatselut premium-kategorioista\nMainos joka 7. kysymyksen jälkeen';

  @override
  String get currentPlan => 'Nykyinen tilaus';

  @override
  String get limitReached => 'Raja saavutettu';

  @override
  String get freeCategoryLimit =>
      'Olet saavuttanut 30 kysymyksen rajan ilmaisissa kategorioissa. Päivitä Premiumiin saadaksesi rajattoman pääsyn!';

  @override
  String get previewLimit =>
      'Olet nähnyt kaikki 5 esikatselukysymystä. Päivitä Premiumiin jatkaaksesi!';

  @override
  String get pandoraFreeLimit => 'Ilmaisraja';

  @override
  String get pandoraFreeLimitMessage =>
      'Ilmaisilla isännillä voi olla enintään 6 pelaajaa ja 12 kysymystä. Päivitä Premiumiin saadaksesi rajattomat mahdollisuudet!';

  @override
  String get pandoraUpgradeMessage =>
      'Olet saavuttanut 12 kysymystä. Päivitä Premiumiin jatkaaksesi pelaamista!';

  @override
  String get pandoraMaxPlayers =>
      'Enimmäismäärä 6 pelaajaa saavutettu (ilmaisraja). Päivitä Premiumiin saadaksesi rajattomasti pelaajia!';

  @override
  String get swipeOrTap => 'Pyyhkäise tai napauta nuolia';

  @override
  String get previous => 'Edellinen';

  @override
  String get next => 'Seuraava';

  @override
  String get advertisement => 'Mainos';

  @override
  String get watchAdMessage =>
      'Katso lyhyt mainos jatkaaksesi tai pelaa ilman mainoksia Premiumilla!';

  @override
  String get watchAd => 'Katso mainos';

  @override
  String get goAdFree => 'Pelaa ilman mainoksia Premiumilla';

  @override
  String get removeAdsForever => 'Poista mainokset pysyvästi';

  @override
  String get adNotReady => 'Mainos ei ole valmis. Jatketaan ilman mainosta.';

  @override
  String get adLoadingContinue => 'Ladataan mainosta... Jatka';

  @override
  String get pricePerMonth => '€6,99/kk tai €59,99/vuosi';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Yhtään kysymystä ei löytynyt kategorialle $category tilassa $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Virhe kysymysten latauksessa. Tarkista verkkoyhteys.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Kysymysten lataus epäonnistui: $error';
  }

  @override
  String get howManyPlayers => 'Kuinka monta pelaajaa?';

  @override
  String get players => 'Pelaajat';

  @override
  String get continueButton => 'Jatka';

  @override
  String get language => 'Kieli';

  @override
  String languageChanged(Object language) {
    return 'Kieli vaihdettu kieleen $language';
  }

  @override
  String get profile => 'Profiili';

  @override
  String get signOut => 'Kirjaudu ulos';

  @override
  String get notSignedIn => 'Ei kirjautuneena';

  @override
  String get signInSignUp => 'Kirjaudu sisään / Luo tili';

  @override
  String get signInToSync =>
      'Kirjaudu sisään synkronoidaksesi tilauksesi laitteiden välillä ja avataksesi premium-sisällön';

  @override
  String get signOutConfirm => 'Haluatko varmasti kirjautua ulos?';

  @override
  String get signedOutSuccess => 'Uloskirjautuminen onnistui';

  @override
  String get accountInformation => 'Tilin tiedot';

  @override
  String get email => 'Sähköposti';

  @override
  String get memberSince => 'Jäsenenä alkaen';

  @override
  String get notAvailable => 'Ei saatavilla';

  @override
  String get unknown => 'Tuntematon';

  @override
  String get subscriptionStatus => 'Tilauksen tila';

  @override
  String get premiumMember => 'Premium-jäsen';

  @override
  String get freeAccount => 'Ilmainen tili';

  @override
  String get welcomeToConnect => 'Tervetuloa Connectiin!';

  @override
  String get continueWithApple => 'Jatka Applella';

  @override
  String get continueWithGoogle => 'Jatka Googlella';

  @override
  String get skipForNow => 'Ohita toistaiseksi';

  @override
  String get byContining =>
      'Jatkamalla hyväksyt käyttöehdot ja tietosuojakäytännön';

  @override
  String get googleSignInFailed =>
      'Kirjautuminen Googlella epäonnistui. Yritä uudelleen.';

  @override
  String get appleSignInFailed =>
      'Kirjautuminen Applella epäonnistui. Yritä uudelleen.';

  @override
  String get noCategoriesFound => 'Kategorioita ei löytynyt';

  @override
  String get welcomeBack => 'Tervetuloa takaisin!';

  @override
  String get createAccount => 'Luo tili';

  @override
  String get displayName => 'Näyttönimi';

  @override
  String get password => 'Salasana';

  @override
  String get signIn => 'Kirjaudu sisään';

  @override
  String get signUp => 'Rekisteröidy';

  @override
  String get dontHaveAccount => 'Eikö sinulla ole tiliä? Rekisteröidy';

  @override
  String get alreadyHaveAccount => 'Onko sinulla jo tili? Kirjaudu sisään';

  @override
  String get chooseYourMode => '1. Valitse tila';

  @override
  String get chooseYourModeDesc =>
      'Valitse viidestä erilaisesta keskustelukokemuksesta:\n\n• Pari – intiimejä kysymyksiä, jotka syventävät suhdettanne\n• Ystävät – hauskoja, innostavia aiheita kaveriporukalle\n• Perhe – lämpimiä, turvallisia keskusteluja kaikenikäisille\n• Oma – luo omat, räätälöidyt kysymyspakat (Premium)\n• Pandora – yhteistyöhön perustuva moninpeli, jossa kysymykset tulevat reaaliajassa';

  @override
  String get pickCategory => '2. Valitse kategoria';

  @override
  String get pickCategoryDesc =>
      'Jokaisessa tilassa on useita kategorioita valmiiksi kuratoiduilla kysymyspakoilla:\n\n• Ilmainen: 3 kategoriaa per tila (30 kysymystä/kategoria)\n• Premium-esikatselu: ensimmäiset 5 kysymystä premium-kategorioista\n• Premium: yli 24 kategoriaa (75 kysymystä/kategoria)\n• Oma: luo rajattomasti omia pakkoja omilla kysymyksilläsi';

  @override
  String get startTalking => '3. Aloita pelaaminen';

  @override
  String get startTalkingDesc =>
      'Kysymykset näkyvät koko näytöllä, jotta keskustelu on mahdollisimman syvä. Lukekaa ja vastatkaa vuorotellen rehellisesti – vääriä vastauksia ei ole! Tavoitteena on merkityksellinen yhteys ja hauskanpito.\n\nPandora-tilassa: kaikki pelaajat lähettävät kysymyksiä anonyymisti, ja sen jälkeen kaikki vastaavat niihin yhdessä reaaliajassa.';

  @override
  String get navigateQuestions => '4. Selaa kysymyksiä';

  @override
  String get navigateQuestionsDesc =>
      '• Pyyhkäise mihin tahansa suuntaan tai napauta nuolia vaihtaaksesi kysymystä\n• Napauta sydän-kuvaketta ❤️ tallentaaksesi suosikit\n• Premium: napauta kysymyslista-kuvaketta (oikea yläkulma) hypätäksesi suoraan mihin tahansa kysymykseen\n• Napauta Koti-painiketta palataksesi päävalikkoon milloin tahansa';

  @override
  String get premiumFeatures => '5. Premium-ominaisuudet';

  @override
  String get premiumFeaturesDesc =>
      'Avaa koko Connect-kokemus:\n\n• Kuukausi: €6,99/kk\n• Vuosi: €59,99/vuosi (säästä 29 %!)\n\n✓ Kaikki 24+ premium-kategoriaa kaikissa tiloissa\n✓ 75 kysymystä per kategoria (vs. 30 ilmaisversiossa)\n✓ Ei mainoksia – ikuisesti\n✓ Pandora: rajattomasti pelaajia ja kysymyksiä\n✓ Oma: luo rajattomasti omia pakkoja\n✓ Kysymysnavigointi – hyppää mihin tahansa kysymykseen\n✓ Tue jatkuvaa kehitystyötä';

  @override
  String get proTips => 'Vinkkejä';

  @override
  String get proTipsDesc =>
      '• Luo mukava, häiriötön ympäristö\n• Kuuntele aktiivisesti ja ole läsnä\n• Jaa rehellisesti ja rohkaise muita tekemään samoin\n• Kunnioita rajoja – kysymyksiä saa ohittaa\n• Käytä suosikkeja ❤️ tallentaaksesi parhaat kysymykset\n• Kokeile eri tiloja eri tilanteisiin\n• Pandora sopii täydellisesti bileisiin ja kaveriporukan iltoihin\n• Pidä hauskaa ja nauti yhteisestä ajasta!';

  @override
  String get aboutCredits => 'Tietoja / Tekijät';

  @override
  String get developedBy => 'Kehittänyt TechyKoala';

  @override
  String get learnMore => 'Lue lisää meistä ja tulevista sovelluksista';

  @override
  String get visitWebsite => 'Vieraile sivulla techykoala.com';

  @override
  String get madeWithLove =>
      'Tehty ❤️:lla merkityksellisiä keskusteluja varten';

  @override
  String get personal => 'Oma';

  @override
  String get personalDesc => 'Luo omat, räätälöidyt kysymyspakkasi';

  @override
  String get gameComplete => 'Peli päättynyt!';

  @override
  String get noMoreQuestions =>
      'Olet käynyt läpi kaikki tämän pakan kysymykset!';

  @override
  String get playAgain => 'Pelaa uudelleen';

  @override
  String get mainMenu => 'Päävalikko';

  @override
  String get thanksForPlaying => 'Kiitos pelaamisesta!';

  @override
  String get hopeYouHadFun => 'Toivottavasti viihdyit! 🎉';

  @override
  String get backToMenu => 'Takaisin valikkoon';

  @override
  String get leaveGame => 'Poistu pelistä?';

  @override
  String get leaveGameMessage =>
      'Haluatko varmasti poistua? Peli jatkuu muille pelaajille.';

  @override
  String get leave => 'Poistu';

  @override
  String get noQuestionsAvailable => 'Ei kysymyksiä saatavilla';

  @override
  String get showLess => 'Näytä vähemmän';

  @override
  String get readMore => 'Näytä lisää';

  @override
  String get tapToPlay => 'Napauta pelataksesi';

  @override
  String get favorites => 'Suosikit';

  @override
  String get pandoraHostCreatePin => 'Isäntä luo istunnon ja jakaa PIN-koodin';

  @override
  String get pandoraPlayersJoinMax =>
      'Pelaajat liittyvät (maks. 6 ilmaisessa, rajattomasti Premiumissa)';

  @override
  String get pandoraHostSetsTimer =>
      'Isäntä asettaa kysymysajastimen (1–15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Kaikki lähettävät kysymyksiä (maks. 12 ilmaisessa)';

  @override
  String get pandoraHostControls => 'Isäntä ohjaa pelin kulkua';

  @override
  String get pandoraQuestionsDeleted => 'Kysymykset poistetaan pelin jälkeen';

  @override
  String get pandoraHost => 'Isäntä';

  @override
  String get pandoraJoinGame => 'Liity peliin';

  @override
  String get pandoraPandoraBox => 'Pandoran lipas';

  @override
  String get pleaseEnterName => 'Kirjoita nimesi';

  @override
  String get hostSuffix => '(Isäntä)';

  @override
  String get playersJoinWithNames => 'Pelaajat liittyvät omilla nimillään';

  @override
  String get everyoneSubmitsMin5 =>
      'Kaikki lähettävät kysymyksiä (vähintään 5, enintään 12 ilmaisessa)';

  @override
  String get createSession => 'Luo istunto';

  @override
  String get creating => 'Luodaan...';

  @override
  String get yourName => 'Nimesi';

  @override
  String get enterDisplayName => 'Kirjoita näyttönimesi';

  @override
  String get howItWorks => 'Näin se toimii';

  @override
  String get pinCopied => 'PIN-koodi kopioitu leikepöydälle!';

  @override
  String get endSession => 'Lopeta istunto?';

  @override
  String get endSessionConfirm =>
      'Haluatko varmasti lopettaa tämän Pandora-istunnon?';

  @override
  String get createCustomDeck => 'Luo oma pakka';

  @override
  String get deckName => 'Pakan nimi';

  @override
  String get enterDeckName => 'Kirjoita pakan nimi';

  @override
  String get create => 'Luo';

  @override
  String get deckCreated => 'Pakka luotu!';

  @override
  String get failedToCreateDeck => 'Pakan luominen epäonnistui';

  @override
  String get deleteDeck => 'Poista pakka?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Haluatko varmasti poistaa pakan \"$deckName\"? Tämä poistaa kaikki pakan kysymykset.';
  }

  @override
  String get delete => 'Poista';

  @override
  String get deckDeleted => 'Pakka poistettu';

  @override
  String get failedToDeleteDeck => 'Pakan poistaminen epäonnistui';

  @override
  String get myDecks => 'Omat pakkani';

  @override
  String get noDecksYet => 'Ei pakkoja vielä';

  @override
  String get createFirstDeck => 'Luo ensimmäinen oma pakkasi!';

  @override
  String questionsCount(Object count) {
    return '$count kysymystä';
  }

  @override
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kysymystä',
      one: '1 kysymys',
      zero: '0 kysymystä',
    );
    return '$_temp0';
  }

  @override
  String get questionAdded => 'Kysymys lisätty!';

  @override
  String get failedToAddQuestion => 'Kysymyksen lisääminen epäonnistui';

  @override
  String get editQuestion => 'Muokkaa kysymystä';

  @override
  String get enterYourQuestion => 'Kirjoita kysymyksesi';

  @override
  String get save => 'Tallenna';

  @override
  String get questionUpdated => 'Kysymys päivitetty!';

  @override
  String get failedToUpdateQuestion => 'Kysymyksen päivittäminen epäonnistui';

  @override
  String get deleteQuestion => 'Poista kysymys';

  @override
  String get deleteQuestionConfirm =>
      'Haluatko varmasti poistaa tämän kysymyksen?';

  @override
  String get questionDeleted => 'Kysymys poistettu';

  @override
  String get failedToDeleteQuestion => 'Kysymyksen poistaminen epäonnistui';

  @override
  String get addQuestion => 'Lisää kysymys';

  @override
  String get typeQuestionHere => 'Kirjoita kysymyksesi tähän...';

  @override
  String get add => 'Lisää';

  @override
  String get noQuestionsYet => 'Ei vielä kysymyksiä';

  @override
  String get addFirstQuestion => 'Lisää ensimmäinen kysymyksesi!';

  @override
  String get deckDescLoveTalks =>
      'Tutki romantiikkaa, kemiaa ja yhteyttä kysymysten avulla, jotka juhlistavat suhdettanne. \"Miten tapasimme\" -hetkistä siihen, mikä saa sinut tuntemaan olosi rakastetuksi – nämä kortit syventävät tunnesidettänne.';

  @override
  String get deckDescDeepTalks =>
      'Nämä kortit sukeltavat arvoihin, haavoittuvuuteen ja siihen, mitä on kasvaa yhdessä. Ne auttavat kumppaneita pohtimaan itsenäisyyttä, kommunikaatiota ja yhteistä suuntaa.';

  @override
  String get deckDescSpicyTalks =>
      'Flirttaileva, rohkea ja intiimi — nämä kortit kutsuvat pareja tutkimaan haluja, fantasioita ja intohimoa yhdessä. Jokainen kysymys on suunniteltu herättämään rehellisiä, kutkuttavia keskusteluja siitä, mikä sytyttää teidät ja tuo teidät lähemmäs.';

  @override
  String get deckDescDoYouDareTalks =>
      'Pelkäämätön pakka, joka yhdistää tunnesekäryyden ja vaikeat aiheet, kuten luottamus, uskonto, raha ja henkilökohtaiset rajat — kaikki sen paljastamiseksi, mikä on teille todella tärkeää. *Huom:* osa kysymyksistä on suoria ja ronskeja — pelatkaa avoimin mielin, empatialla ja kunnioituksella.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Viiteen rakkauden kieleen perustuva pakka auttaa kumppaneita ilmaisemaan rakkautta tavoilla, jotka todella puhuttelevat toista. Löytäkää, miten sanat, teot ja pienet eleet voivat vahvistaa suhdettanne.';

  @override
  String get deckDescSillyTalks =>
      'Pelkkää hupia ja paljon naurua! Nämä kevyet ja hassut kysymykset paljastavat oudoimmat tapanne ja hauskimmat ajatuksenne. Täydellinen ystäville, perheelle tai pareille, jotka eivät ota elämää liian vakavasti.';

  @override
  String get deckDescCarTalks =>
      'Täydellinen automatkoille – nämä kortit muuttavat ajomatkat hyvän keskustelun hetkiksi. Odota hauskoja, luovia ja nostalgisia kysymyksiä matkustamisesta, seikkailuista ja pikkukummallisuuksista.';

  @override
  String get deckDescCozyTalks =>
      'Lämpimiä ja rauhallisia keskusteluja, täydellisiä kotoisiin iltoihin. Nämä kysymykset luovat turvallisia, sydämellisiä yhteyshetkiä.';

  @override
  String get deckDescPartyNight =>
      'Energiaa tihkuvia kysymyksiä ryhmille. Täydellinen juhliin ja iltoihin ystävien kanssa.';

  @override
  String get deckDescUnpopularOpinions =>
      'Pakka, joka haastaa sanomaan ääneen sen, mitä kaikki ajattelevat mutta eivät uskalla sanoa. Somekulttuurista ja vaikuttajista sosiaalisiin normeihin — nämä kysymykset herättävät rehellisiä keskusteluja ja yllättäviä näkökulmia. Täydellinen ystäville, joilla on vahvat mielipiteet.';

  @override
  String get deckDescPlotTwists =>
      'Tämä pakka heittää teidät suoraan elämän hauskimpiin ja vaikeimpiin \"mitä tekisit, jos...?\" -tilanteisiin. Nopeat päätökset, maalaisjärki ja paljon naurua taattuja! Täydellinen ryhmäiltoihin täynnä yllätyksiä.';

  @override
  String get deckDescAfterDark =>
      'Astu keskustelujen pimeämmälle puolelle kysymysten kanssa, jotka saavat niskavillat nousemaan. Karmivista sattumuksista selviytymiskuvitelmiin — täydellinen myöhäisillan tunnelmaan pienellä kauhuefektillä.';

  @override
  String get deckDescHistoryTalks =>
      'Nostalginen sekoitus omia muistoja ja yhteisiä perhehetkiä. Nämä kysymykset inspiroivat tarinoihin, nauruun ja juurien uudelleen löytämiseen. Täydellinen perhejuhliin tai rauhallisiin iltoihin.';

  @override
  String get deckDescTinyTalks =>
      'Suunniteltu vanhemmille ja pienille lapsille! Yksinkertaiset, leikkisät kysymykset auttavat lapsia ilmaisemaan itseään, ja vanhemmat oppivat paremmin, miten he ajattelevat. Sopii noin 3–9-vuotiaille.';

  @override
  String get deckDescGoodOldDays =>
      'Lähde ajassa taaksepäin kysymysten avulla, jotka koskevat rakkaita muistoja, menneitä kokemuksia ja sitä, millaista \"ennen vanhaan\" oli. Sopii kaikenikäisille.';

  @override
  String get deckDescWouldYouRather =>
      'Klassiset \"kumpi mieluummin\" -dilemmat, jotka sytyttävät keskustelun ja paljastavat mieltymyksiä. Valitse kahden vaihtoehdon välillä ja katso, mikä teille on tärkeintä.';

  @override
  String get createNewDeck => 'Luo uusi pakka';

  @override
  String get sessionPin => 'Istunnon PIN';

  @override
  String get joinSession => 'Liity istuntoon';

  @override
  String get questionSubmitted => 'Kysymys lähetetty';

  @override
  String get sessionCancelled => 'Istunto peruttu';

  @override
  String get yourQuestion => 'Kysymyksesi';

  @override
  String get reactionBreakdown => 'Reaktioiden yhteenveto';

  @override
  String get deckNameHint => 'Pakan nimi';

  @override
  String get deckCreatedSuccess => 'Pakka luotu!';

  @override
  String get cancelSession => 'Peruuta istunto?';

  @override
  String get cancelSessionConfirm =>
      'Tämä peruuttaa istunnon kaikilta pelaajilta. Oletko varma?';

  @override
  String get no => 'Ei';

  @override
  String get yesCancel => 'Kyllä, peruuta';

  @override
  String get hostQuestionCollection => 'Isäntä – kysymysten keruu';

  @override
  String get questionCollection => 'Kysymysten keruu';

  @override
  String get endSessionButton => 'Lopeta istunto';

  @override
  String get noActiveSubscription => 'Ei aktiivista tilausta';

  @override
  String get premium => 'PREMIUM';

  @override
  String notEnoughQuestions(Object count) {
    return 'Kysymyksiä ei ole tarpeeksi. Vähintään 5 vaaditaan. (Tällä hetkellä: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Premium-ominaisuus';

  @override
  String get questionNavigationPremium =>
      'Kysymysnavigointi on premium-ominaisuus. Tilaa Premium avataksesi mahdollisuuden hypätä mihin tahansa kysymykseen!';

  @override
  String get customDecks => 'Omat pakat';

  @override
  String get noDecksYetMessage => 'Ei pakkoja vielä';

  @override
  String get createFirstDeckMessage => 'Napauta + luodaksesi ensimmäisen pakan';

  @override
  String get signInRequired => 'Kirjautuminen vaaditaan';

  @override
  String get signInToUsePersonal =>
      'Kirjaudu sisään käyttääksesi Oma-tilaa ja luodaksesi omia kysymyspakkojasi.';

  @override
  String get collaborativeQuestionGame => 'Yhteistoiminnallinen kysymyspeli';

  @override
  String get hostPandoraSession => 'Isännöi Pandora-istuntoa';

  @override
  String get joinPandoraGame => 'Liity peliin';

  @override
  String get yourDisplayName => 'Näyttönimesi';

  @override
  String get enterYourName => 'Kirjoita nimesi';

  @override
  String get selectQuestion => 'Valitse kysymys';

  @override
  String get joinTime => 'Liittymisaika';

  @override
  String get participants => 'Osallistujat';

  @override
  String get loading => 'Ladataan...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Tarvitaan vähintään 2 pelaajaa ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Jatka ajastimen asetuksiin';

  @override
  String get setQuestionTimer => 'Aseta kysymysajastin';

  @override
  String get questionCollectionTime => 'Kysymysten keruun kesto';

  @override
  String get minutes => 'minuuttia';

  @override
  String get sessionWillEnd =>
      'Istunto päättyy automaattisesti, jos et jatka 5 minuutin kuluessa';

  @override
  String get startQuestionCollection => 'Aloita kysymysten keruu';

  @override
  String questionsSubmitted(int count) {
    return '$count kysymystä lähetetty';
  }

  @override
  String get writeQuestionHere => 'Kirjoita kysymyksesi tähän...';

  @override
  String get whoIsThisFor => 'Kenelle tämä kysymys on?';

  @override
  String get everyone => 'Kaikille';

  @override
  String get specific => 'Tietylle henkilölle';

  @override
  String get submitQuestion => 'Lähetä kysymys';

  @override
  String needMoreQuestions(int count) {
    return 'Tarvitaan vielä $count kysymystä';
  }

  @override
  String get startGame => 'Aloita peli';

  @override
  String get selectPlayer => 'Valitse pelaaja';

  @override
  String get unsubscribe => 'Peru tilaus';

  @override
  String get unsubscribeConfirm => 'Perutaanko Premium-tilaus?';

  @override
  String get unsubscribeWarning =>
      'Menetät pääsyn kaikkiin Premium-ominaisuuksiin, kuten rajattomiin kysymyksiin, kaikkiin kategorioihin, mainoksettomaan kokemukseen ja rajattomaan määrään Pandora-pelaajia. Voit tilata uudelleen milloin tahansa.';

  @override
  String get yesUnsubscribe => 'Kyllä, peru tilaus';

  @override
  String get unsubscribeSuccess =>
      'Tilaus peruttu. Premium-ominaisuudet on poistettu käytöstä.';

  @override
  String get unsubscribeError => 'Tilauksen peruminen epäonnistui';

  @override
  String get questions => 'kysymystä';

  @override
  String get preview => 'esikatselu';

  @override
  String get userId => 'Käyttäjä-ID';

  @override
  String get subscription => 'Tilaus';

  @override
  String get questionsCount75 => '75 kysymystä';

  @override
  String get questionsCount30 => '30 kysymystä';

  @override
  String get questionsCount5Preview => '5 kysymyksen esikatselu';

  @override
  String get unlockFullDeck => 'Avaa 75 kysymystä';

  @override
  String get renameDeck => 'Nimeä pakka uudelleen';

  @override
  String get deckRenamed => 'Pakka nimetty uudelleen';

  @override
  String get failedToRenameDeck => 'Pakan uudelleennimeäminen epäonnistui';

  @override
  String get shuffleQuestions => 'Sekoita kysymykset';

  @override
  String get resetOrder => 'Palauta alkuperäinen järjestys';

  @override
  String get questionsShuffled => 'Kysymykset sekoitettu!';

  @override
  String get orderReset => 'Järjestys palautettu alkuperäiseksi';

  @override
  String get readyToPlay => 'Valmis pelaamaan';

  @override
  String get longPressReorder =>
      'Pidä pohjassa ja vedä järjestelläksesi kysymysten järjestystä';

  @override
  String get noFavoritesYet => 'Ei vielä suosikkeja';

  @override
  String get heartQuestionsDuringGameplay =>
      'Napauta sydäntä ❤️ kysymyskorteissa pelin aikana tallentaaksesi ne tänne!';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Lisää vähintään $count kysymystä aloittaaksesi pelaamisen!';
  }

  @override
  String get heartQuestionsInfo =>
      'Merkitse kysymyksiä sydämellä pelin aikana lisätäksesi ne suosikkeihin!';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Lisää vähintään $count kysymystä pelataksesi tätä pakkaa';
  }

  @override
  String get removeFromFavorites => 'Poista suosikeista';

  @override
  String get unlockEverything => 'Avaa kaikki';

  @override
  String get premiumSubtitle =>
      'Saat rajattoman pääsyn kaikkiin kategorioihin, poistat mainokset pysyvästi ja avaat Premium-ominaisuudet';

  @override
  String get save32Percent => 'SÄÄSTÄ 29 %';

  @override
  String get priceMonthly => '€6,99/kk';

  @override
  String get priceYearly => '€59,99/vuosi';

  @override
  String get billedAnnually => 'Laskutetaan vuosittain';

  @override
  String get equivalentMonthly => 'Vain 5 €/kk';

  @override
  String get feature24Categories =>
      'Yli 24 premium-kategoriaa avattuna kaikissa tiloissa';

  @override
  String get feature75Questions =>
      '75 kysymystä per kategoria (vs. 30 ilmaisversiossa)';

  @override
  String get featureNoAds => 'Ei mainoksia – keskeytyksetön peli';

  @override
  String get featureUnlimitedPlayers =>
      'Pandora-tila: rajattomasti pelaajia ja kysymyksiä';

  @override
  String get featureQuestionNavigation =>
      'Selaa ja hyppää mihin tahansa kysymykseen pelin aikana';

  @override
  String get featureSupportDevelopment =>
      'Tue jatkuvaa kehitystä ja uusia ominaisuuksia';

  @override
  String get error => 'Virhe';

  @override
  String get premiumActivatedMessage =>
      'Premium aktivoitu! Kaikki kategoriat on avattu.';

  @override
  String get featurePersonalDecks =>
      'Oma-tila: luo rajattomasti omia kysymyspakkoja';

  @override
  String get premiumPersonal =>
      'Oma-tila omilla pakoilla on Premium-ominaisuus. Päivitä Premiumiin, jotta voit luoda ja pelata omilla kysymyspakoillasi!';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Haluatko varmasti poistaa pakan \"$deckName\"? Tämä poistaa kaikki pakan kysymykset.';
  }

  @override
  String needMore(int count) {
    return 'Tarvitaan vielä $count';
  }

  @override
  String get editQuestions => 'Muokkaa kysymyksiä';

  @override
  String get addMore => 'Lisää lisää';

  @override
  String useMyConnectEmail(String email) {
    return 'Käytä Connect-sähköpostiani: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Ilmaiskäyttäjillä voi olla enintään 6 pelaajaa. Päivitä Premiumiin saadaksesi rajattomasti pelaajia!';

  @override
  String get freemiumQuestionLimit =>
      'Ilmaiskäyttäjät voivat lähettää enintään 12 kysymystä. Päivitä Premiumiin saadaksesi rajattomasti kysymyksiä!';

  @override
  String get yourQuestions => 'Kysymyksesi';

  @override
  String waitingForHost(int count) {
    return 'Odotetaan isäntää... ($count pelaajaa)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Päivitä Premiumiin saadaksesi rajattomasti pelaajia';

  @override
  String get kickPlayer => 'Poista pelaaja';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Haluatko varmasti poistaa pelaajan \"$playerName\" istunnosta?';
  }

  @override
  String get kick => 'Poista';

  @override
  String playerKicked(String playerName) {
    return '$playerName on poistettu istunnosta';
  }

  @override
  String get failedToKickPlayer => 'Pelaajan poistaminen epäonnistui';

  @override
  String get cancelSessionForAll =>
      'Tämä peruuttaa istunnon kaikilta pelaajilta. Oletko varma?';

  @override
  String get youWereKicked => 'Sinut poistettiin istunnosta';

  @override
  String get you => 'Sinä';

  @override
  String get loginRequiredForPandora =>
      'Pandora-tilaa varten on kirjauduttava sisään';

  @override
  String get login => 'Kirjaudu';

  @override
  String get loginRequiredNote =>
      'Kirjautuminen vaaditaan Pandora-tilassa (jotta pelaajat voidaan kirjata oikein)';

  @override
  String get timeIsUp => 'Aika loppui!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Kysymyksiä ei lähetetty tarpeeksi ($current/$minimum vähintään).';
  }

  @override
  String get sessionQuestionLimit => 'Istunnon kysymysraja saavutettu';

  @override
  String get sessionQuestionLimitMessage =>
      'Tämä istunto on saavuttanut 12 kysymyksen rajan (ilmaisisäntä). Päivitä Premiumiin saadaksesi rajattomasti kysymyksiä!';

  @override
  String sessionQuestionCount(int current) {
    return 'Istunto: $current/12 kysymystä';
  }

  @override
  String get pleaseEnterQuestion => 'Kirjoita kysymys';

  @override
  String get rateThisDeck => 'Arvostele tämä pakka';

  @override
  String get yourRating => 'Arvostelusi';

  @override
  String get skip => 'Ohita';

  @override
  String get submit => 'Lähetä';

  @override
  String get thankYouForFeedback => 'Kiitos palautteestasi!';

  @override
  String get failedToSubmitRating => 'Arvostelun lähettäminen epäonnistui';

  @override
  String get tapStarsToRate => 'Napauta tähtiä arvioidaksesi';

  @override
  String get downloadForOffline => 'Lataa offline-käyttöön';

  @override
  String get downloading => 'Ladataan...';

  @override
  String get downloadedLanguages => 'Ladatut kielet';

  @override
  String get languageNotDownloaded => 'Kieltä ei ole ladattu';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'Et ole ladannut kieltä $languageName offline-käyttöön.\n\nSiirry kohtaan Asetukset > Profiili > \"Lataa offline-käyttöön\" ollessasi yhteydessä internetiin.';
  }

  @override
  String get offlineLanguageError =>
      'Tätä kieltä ei ole ladattu offline-käyttöön. Siirry kohtaan Asetukset > Profiili > \"Lataa offline-käyttöön\" ollessasi yhteydessä internetiin.';

  @override
  String get downloadComplete => 'Lataus valmis!';

  @override
  String get downloadCompleteMessage =>
      'Kaikki sisältö on ladattu offline-käyttöön.';

  @override
  String get addedToFavorites => 'Lisätty suosikkeihin';

  @override
  String get removedFromFavorites => 'Poistettu suosikeista';

  @override
  String get errorSavingFavorite => 'Virhe suosikin tallentamisessa';

  @override
  String get internetRequired => 'Internet-yhteys vaaditaan';

  @override
  String get internetRequiredMessage =>
      'Jotkin ominaisuudet vaativat internet-yhteyden. Premium-käyttäjät voivat ladata sisältöä offline-käyttöön Asetuksista.';

  @override
  String get goPremium => 'Siirry Premiumiin';

  @override
  String get pleaseEnterPin => 'Kirjoita 6-numeroinen PIN-koodi';

  @override
  String errorOccurred(String error) {
    return 'Virhe: $error';
  }

  @override
  String get errorCreatingSession => 'Virhe istunnon luomisessa';

  @override
  String get sessionTimedOut =>
      'Istunto aikakatkaistiin – isäntä ei asettanut ajastinta';

  @override
  String get errorStarting => 'Virhe käynnistyksessä';

  @override
  String get errorLoadingParticipants => 'Virhe osallistujien lataamisessa';

  @override
  String get sessionCancelledByHost => 'Isäntä peruutti istunnon';

  @override
  String needAtLeast5Questions(int count) {
    return 'Tarvitaan vähintään 5 kysymystä aloittamiseen! (Tällä hetkellä: $count)';
  }

  @override
  String get errorStartingGame => 'Virhe pelin aloittamisessa';

  @override
  String get questionsAsked => 'Kysytyt kysymykset';

  @override
  String get totalReactions => 'Reaktiot yhteensä';

  @override
  String get mostLovedQuestion => 'Rakastetuin kysymys';

  @override
  String get mostFunQuestion => 'Hauskin kysymys';

  @override
  String get mostShockingQuestion => 'Järkyttävin kysymys';

  @override
  String get mostLitQuestion => 'Mahtavin kysymys';

  @override
  String get hotSeatAward => 'Kuuma tuoli -palkinto';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Virhe: Pelaajaa ei voitu tunnistaa. Liity istuntoon uudelleen.';

  @override
  String get createAiDeck => 'Luo AI-paketti';

  @override
  String get whatIsTheOccasion => 'Mikä on tilaisuus?';

  @override
  String get occasionHint =>
      'esim. Syntymäpäiväjuhlat, Tiimihengen rakentaminen, Treffiyö';

  @override
  String get whatIsTheMood => 'Mikä on tunnelma?';

  @override
  String get lighthearted => 'Keveäntuulinen';

  @override
  String get serious => 'Vakava';

  @override
  String get mixed => 'Sekoitettu';

  @override
  String get depthOfQuestions => 'Kysymysten syvyys?';

  @override
  String get surfaceLevel => 'Pintataso';

  @override
  String get deep => 'Syvä';

  @override
  String get level => 'Taso';

  @override
  String get sizeOfGroup => 'Ryhmän koko?';

  @override
  String get people => 'ihmiset';

  @override
  String get anyOtherRemarks => 'Muita huomautuksia? (valinnainen)';

  @override
  String get remarksHint =>
      'esim. Perheystävällinen, sisällytä mukaan joitakin hauskoja kysymyksiä';

  @override
  String get generateQuestions => 'Luo kysymyksiä';

  @override
  String get aiDeckPremiumMessage =>
      'AI-dekkien luonti on premium-ominaisuus. Päivitä luodaksesi rajattomasti AI-pohjaisia keskusteludekkejä!';

  @override
  String get pleaseEnterOccasion => 'Ole hyvä ja syötä tilaisuus';

  @override
  String errorGeneratingQuestions(String error) {
    return 'Virhe kysymysten luomisessa: $error';
  }

  @override
  String get generatingAiQuestions => 'Generoidaan AI-kysymyksiä...';

  @override
  String get generatingMoreQuestions => 'Luodaan lisää kysymyksiä...';

  @override
  String get batchComplete => 'Erä valmis!';

  @override
  String questionsInDeckMessage(int count) {
    return 'Sinulla on $count kysymystä pakassasi. Generoidaanko 10 lisää?';
  }

  @override
  String questionsInDeck(
    int kept,
    int max,
    Object behalten,
    Object beholdt,
    Object behouden,
    Object bevarad,
    Object maks,
    Object pidetty,
  ) {
    return '$pidetty/$max';
  }

  @override
  String questionProgress(int current, int total) {
    return '$current/$total';
  }

  @override
  String batchNumber(int number) {
    return 'Erä #$number';
  }

  @override
  String get imDone => 'Olen valmis';

  @override
  String get generateMore => 'Tuota lisää';

  @override
  String get maxQuestionsReached => 'Maksimi kysymykset (50)';

  @override
  String get namYourDeck => 'Nimeä pakkaasi';

  @override
  String get goBack => 'Palaa takaisin';

  @override
  String get swipeInstructions =>
      'Pyyhkäise oikealle pitääksesi • Pyyhkäise vasemmalle hylätäksesi';

  @override
  String get discussionPoint => 'Keskustelupiste';

  @override
  String get sparkMode => 'Spark-tila';

  @override
  String get sparkModeSubtitle => 'AI-Voimaiset Keskustelun Aloittajat';

  @override
  String get sparkPremiumRequired => 'Spark Mode - Premium-ominaisuus';

  @override
  String get sparkPremiumMessage =>
      'Spark Mode on saatavilla Premium- ja Premium+-tilaajille. Luo AI-pohjaisia keskustelunaloituksia, jotka on räätälöity tilaisuuteesi!';

  @override
  String sparkQuestionsRemaining(int remaining, int limit) {
    return '$remaining kysymystä jäljellä $limit kysymyksestä';
  }

  @override
  String get howManyQuestions => 'Kuinka monta kysymystä?';

  @override
  String sparkQuestions(int count) {
    return '$count Kysymystä';
  }

  @override
  String generateSparkQuestions(int count) {
    return 'Luo $count kysymystä';
  }

  @override
  String get sparkLimitReached => 'Kuukausiraja saavutettu';

  @override
  String sparkLimitMessage(int remaining, int requested) {
    return 'Sinulla on vain $remaining Spark-kysymystä jäljellä tänä kuukautena. Yrität luoda $requested kysymystä.\n\nPäivitä Premium+:aan saadaksesi 400 kysymystä kuukaudessa!';
  }

  @override
  String get expiresIn24Hours => 'Vanhenee 24 tunnin kuluttua';

  @override
  String get alreadyInFavorites => 'Jo suosikeissa';

  @override
  String addedToDeck(String deckName) {
    return 'Lisätty $deckName!';
  }

  @override
  String get questionAlreadyInDeck => 'Kysymys on jo tässä pakassa';

  @override
  String get addToDeck => 'Lisää pakkaan';

  @override
  String get favorite => 'Suosikki';

  @override
  String get chooseDeck =>
      'Valitse pakka, johon haluat lisätä tämän kysymyksen:';

  @override
  String get noDecksFound => 'Ei pakkoja löytynyt';

  @override
  String get noDecksMessage =>
      'Sinulla ei ole vielä mitään mukautettuja pakkoja. Haluaisitko luoda yhden?';

  @override
  String get createDeck => 'Luo pakka';

  @override
  String get createAndAdd => 'Luo & Lisää';

  @override
  String get pleaseEnterDeckName => 'Ole hyvä ja syötä pakka nimi';

  @override
  String get tierBasic => 'Perus';

  @override
  String get tierPremium => 'Premium';

  @override
  String get tierPremiumPlus => 'Premium+';

  @override
  String get tierFree => 'Ilmainen';

  @override
  String get choosePlan => 'Valitse suunnitelmasi';

  @override
  String get choosePlanSubtitle =>
      'Avaa premium-ominaisuudet ja AI-pohjaiset keskustelut';

  @override
  String get mostPopular => 'SUOSITUIN';

  @override
  String get perMonth => 'kuukaudessa';

  @override
  String get forever => 'Ikuisesti';

  @override
  String get continueWithBasic => 'Jatka Basic (Ilmainen) kanssa';

  @override
  String subscribeTo(String tier) {
    return 'Tilaa $tier';
  }

  @override
  String get cancelAnytime => 'Peru milloin tahansa. Ei piilomaksuja.';

  @override
  String get basicTierTitle => 'Perus';

  @override
  String get basicTierPrice => '€6.99';

  @override
  String get basicTierDescription =>
      'Pääsy kaikkiin pelitiloihin lukuun ottamatta Sparkia';

  @override
  String get basicFeature1 =>
      'Kaikki pelitilat (Pariskunta, Ystävät, Perhe, Henkilökohtainen, Pandora)';

  @override
  String get basicFeature2 => 'Pääsy kaikkiin 24+ kategoriaan';

  @override
  String get basicFeature3 => 'Mukautetut henkilökohtaiset pakat';

  @override
  String get basicFeature4 => 'Ei mainoksia';

  @override
  String get basicFeature5 => 'Kysymysnavigointi';

  @override
  String get premiumTierTitle => 'Premium';

  @override
  String get premiumTierPrice => '€11.99';

  @override
  String get premiumTierDescription => 'Kaikki perusversiossa + Spark AI';

  @override
  String get premiumFeature6 => 'Tallenna suosikit henkilökohtaisiin pakkoihin';

  @override
  String get premiumPlusTierTitle => 'Premium+';

  @override
  String get premiumPlusTierPrice => '€19.99';

  @override
  String get premiumPlusTierDescription => 'Maksimaalinen AI-teho';

  @override
  String get premiumPlusFeature1 => 'Kaikki Premiumissa';

  @override
  String get premiumPlusFeature2 => '🚀 400 AI-kysymystä kuukaudessa';

  @override
  String get premiumPlusFeature3 => '2,5x enemmän Spark-kysymyksiä';

  @override
  String get premiumPlusFeature4 => 'Täydellinen usein käyttöön';

  @override
  String get premiumPlusFeature5 => 'Prioriteettituki';
}
