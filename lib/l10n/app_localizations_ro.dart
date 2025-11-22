// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Start';

  @override
  String get settings => 'Setări';

  @override
  String get howToPlay => 'Cum se joacă';

  @override
  String get chooseGameMode => 'Alege modul de joc';

  @override
  String get family => 'Familie';

  @override
  String get couple => 'Cuplu';

  @override
  String get friends => 'Prieteni';

  @override
  String get chooseCategory => 'Alege o categorie';

  @override
  String get locked => 'Categorie Premium';

  @override
  String get lockedMessage =>
      'Aceasta este o categorie premium. Fă upgrade pentru a debloca toate categoriile și pentru a elimina reclamele!';

  @override
  String get previewAvailable =>
      'Previzualizare: primele 5 întrebări disponibile';

  @override
  String get upgradeNow => 'Fă upgrade acum';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Poate mai târziu';

  @override
  String get getPremium => 'Obține Premium';

  @override
  String get premiumTitle => 'Deblochează tot';

  @override
  String get premiumDescription =>
      'Obține acces nelimitat la toate categoriile în toate modurile, elimină reclamele și bucură-te de sesiuni Pandora nelimitate.';

  @override
  String get premiumPriceMonthly => '€6,99/lună';

  @override
  String get premiumPriceYearly => '€59,99/an';

  @override
  String get saveWithYearly => 'Economisești €23,89 cu abonamentul anual.';

  @override
  String get monthly => 'Lunar';

  @override
  String get yearly => 'Anual';

  @override
  String get billedMonthly => 'Facturat lunar';

  @override
  String get billedYearly => 'Facturat anual';

  @override
  String get premiumFeature1 =>
      '✓ Toate cele 21 de categorii premium deblocate';

  @override
  String get premiumFeature2 => '✓ Fără reclame pentru totdeauna';

  @override
  String get premiumFeature3 => '✓ 75 de întrebări în toate categoriile';

  @override
  String get premiumFeature4 => '✓ Pandora: jucători și întrebări nelimitate';

  @override
  String get premiumFeature5 => '✓ Susține dezvoltarea continuă';

  @override
  String get subscribePremium => 'Abonează-te la Premium';

  @override
  String get subscribe => 'Abonare';

  @override
  String get cancel => 'Anulează';

  @override
  String get subscriptionActivated =>
      'Premium activat! Toate categoriile au fost deblocate.';

  @override
  String get premiumActivated => 'Premium activat!';

  @override
  String get demoNote =>
      'Demo: abonamentul va fi resetat la repornirea aplicației';

  @override
  String get freeTier => 'Versiune gratuită';

  @override
  String get freeTierDesc =>
      '3 categorii pe mod (30 de întrebări fiecare)\nPrevizualizare cu 5 întrebări pentru categoriile premium\nReclame la fiecare 7 întrebări';

  @override
  String get currentPlan => 'Planul actual';

  @override
  String get limitReached => 'Limită atinsă';

  @override
  String get freeCategoryLimit =>
      'Ai atins limita de 30 de întrebări pentru categoriile gratuite. Fă upgrade la Premium pentru acces nelimitat!';

  @override
  String get previewLimit =>
      'Ai văzut toate cele 5 întrebări de previzualizare. Fă upgrade la Premium pentru a continua!';

  @override
  String get pandoraFreeLimit => 'Limită pentru versiunea gratuită';

  @override
  String get pandoraFreeLimitMessage =>
      'Gazdele gratuite pot avea maximum 6 jucători și 12 întrebări. Fă upgrade la Premium pentru a elimina limitele!';

  @override
  String get pandoraUpgradeMessage =>
      'Ai ajuns la 12 întrebări. Fă upgrade la Premium pentru a continua jocul!';

  @override
  String get pandoraMaxPlayers =>
      'S-a atins numărul maxim de 6 jucători (limită gratuită). Fă upgrade la Premium pentru jucători nelimitați!';

  @override
  String get swipeOrTap => 'Glisează sau atinge săgețile';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Următor';

  @override
  String get advertisement => 'Reclamă';

  @override
  String get watchAdMessage =>
      'Urmărește un scurt anunț pentru a continua sau joacă fără reclame cu Premium.';

  @override
  String get watchAd => 'Urmărește reclama';

  @override
  String get goAdFree => 'Joacă fără reclame cu Premium';

  @override
  String get removeAdsForever => 'Elimină reclamele pentru totdeauna';

  @override
  String get adNotReady => 'Reclama nu este gata. Continui fără reclamă.';

  @override
  String get adLoadingContinue => 'Se încarcă reclama... Continuă';

  @override
  String get pricePerMonth => '€6,99/lună sau €59,99/an';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Nu s-au găsit întrebări pentru $category în modul $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Eroare la încărcarea întrebărilor. Verifică-ți conexiunea.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Întrebările nu au putut fi încărcate: $error';
  }

  @override
  String get howManyPlayers => 'Câți jucători?';

  @override
  String get players => 'Jucători';

  @override
  String get continueButton => 'Continuă';

  @override
  String get language => 'Limbă';

  @override
  String languageChanged(Object language) {
    return 'Limba a fost schimbată în $language';
  }

  @override
  String get profile => 'Profil';

  @override
  String get signOut => 'Deconectare';

  @override
  String get notSignedIn => 'Neconectat';

  @override
  String get signInSignUp => 'Autentificare / Înregistrare';

  @override
  String get signInToSync =>
      'Conectează-te pentru a-ți sincroniza abonamentul pe toate dispozitivele și pentru a debloca conținutul premium';

  @override
  String get signOutConfirm => 'Ești sigur că vrei să te deconectezi?';

  @override
  String get signedOutSuccess => 'Te-ai deconectat cu succes';

  @override
  String get accountInformation => 'Informații despre cont';

  @override
  String get email => 'E-mail';

  @override
  String get memberSince => 'Membru din';

  @override
  String get notAvailable => 'Indisponibil';

  @override
  String get unknown => 'Necunoscut';

  @override
  String get subscriptionStatus => 'Stare abonament';

  @override
  String get premiumMember => 'Membru Premium';

  @override
  String get freeAccount => 'Cont gratuit';

  @override
  String get welcomeToConnect => 'Bun venit în Connect!';

  @override
  String get continueWithApple => 'Continuă cu Apple';

  @override
  String get continueWithGoogle => 'Continuă cu Google';

  @override
  String get skipForNow => 'Sari peste deocamdată';

  @override
  String get byContining =>
      'Continuând, ești de acord cu Termenii de utilizare și Politica de confidențialitate';

  @override
  String get googleSignInFailed =>
      'Autentificarea cu Google a eșuat. Încearcă din nou.';

  @override
  String get appleSignInFailed =>
      'Autentificarea cu Apple a eșuat. Încearcă din nou.';

  @override
  String get noCategoriesFound => 'Nu s-au găsit categorii';

  @override
  String get welcomeBack => 'Bine ai revenit!';

  @override
  String get createAccount => 'Creează cont';

  @override
  String get displayName => 'Nume afișat';

  @override
  String get password => 'Parolă';

  @override
  String get signIn => 'Autentificare';

  @override
  String get signUp => 'Înregistrare';

  @override
  String get dontHaveAccount => 'Nu ai cont? Înregistrează-te';

  @override
  String get alreadyHaveAccount => 'Ai deja un cont? Autentifică-te';

  @override
  String get chooseYourMode => '1. Alege-ți modul';

  @override
  String get chooseYourModeDesc =>
      'Alege dintre cinci experiențe de conversație unice:\n\n• Cuplu – Întrebări intime pentru a vă aprofunda relația\n• Prieteni – Subiecte amuzante și captivante, perfecte pentru gașca ta\n• Familie – Conversații calde și potrivite pentru toate vârstele\n• Personal – Creează-ți propriile seturi de întrebări (Premium)\n• Pandora – Joc colaborativ multiplayer cu întrebări în timp real';

  @override
  String get pickCategory => '2. Alege o categorie';

  @override
  String get pickCategoryDesc =>
      'Fiecare mod oferă mai multe categorii cu seturi de întrebări atent alese:\n\n• Gratuit: 3 categorii pe mod (30 de întrebări fiecare)\n• Previzualizare Premium: primele 5 întrebări din categoriile premium\n• Premium: peste 24 de categorii (75 de întrebări fiecare)\n• Personal: creează seturi personalizate nelimitate cu propriile întrebări';

  @override
  String get startTalking => '3. Începe jocul';

  @override
  String get startTalkingDesc =>
      'Întrebările apar pe tot ecranul pentru conversații mai profunde. Rând pe rând, citiți și răspundeți sincer – nu există răspunsuri greșite! Scopul este conexiunea autentică și distracția.\n\nÎn modul Pandora: toți jucătorii trimit întrebări anonim, apoi răspund împreună în timp real.';

  @override
  String get navigateQuestions => '4. Navighează printre întrebări';

  @override
  String get navigateQuestionsDesc =>
      '• Glisează în orice direcție sau atinge săgețile pentru a schimba întrebarea\n• Atinge icoana cu inima ❤️ pentru a salva favoritele\n• Premium: atinge icoana listei de întrebări (sus dreapta) pentru a sări la orice întrebare\n• Atinge butonul Acasă pentru a reveni oricând la meniul principal';

  @override
  String get premiumFeatures => '5. Funcții Premium';

  @override
  String get premiumFeaturesDesc =>
      'Deblochează experiența completă Connect:\n\n• Lunar: €6,99/lună\n• Anual: €59,99/an (Economisești 29%!)\n\n✓ Toate cele 24+ categorii premium în toate modurile\n✓ 75 de întrebări pe categorie (vs 30 în versiunea gratuită)\n✓ Fără reclame pentru totdeauna\n✓ Pandora: jucători și întrebări nelimitate\n✓ Personal: creează seturi personalizate nelimitate\n✓ Navigare după întrebări – sari la orice întrebare\n✓ Susții dezvoltarea continuă';

  @override
  String get proTips => 'Sfaturi';

  @override
  String get proTipsDesc =>
      '• Creează un mediu confortabil, fără distrageri\n• Ascultă activ și fii prezent\n• Răspunde sincer și încurajează-i și pe ceilalți\n• Respectă limitele – este în regulă să sari peste întrebări\n• Folosește favoritele ❤️ pentru a păstra întrebările care îți plac\n• Încearcă moduri diferite pentru ocazii diferite\n• Pandora este perfect pentru petreceri și seri de joc în grup\n• Bucură-te și conectează-te cu ceilalți!';

  @override
  String get aboutCredits => 'Despre / Credite';

  @override
  String get developedBy => 'Dezvoltat de TechyKoala';

  @override
  String get learnMore =>
      'Află mai multe despre noi și despre aplicațiile viitoare';

  @override
  String get visitWebsite => 'Vizitează techykoala.com';

  @override
  String get madeWithLove => 'Creat cu ❤️ pentru conversații cu sens';

  @override
  String get personal => 'Personal';

  @override
  String get personalDesc =>
      'Creează-ți propriile seturi personalizate de întrebări';

  @override
  String get gameComplete => 'Joc terminat!';

  @override
  String get noMoreQuestions => 'Ai parcurs toate întrebările din acest set.';

  @override
  String get playAgain => 'Joacă din nou';

  @override
  String get mainMenu => 'Meniu principal';

  @override
  String get thanksForPlaying => 'Mulțumim că ai jucat!';

  @override
  String get hopeYouHadFun => 'Sperăm că te-ai distrat! 🎉';

  @override
  String get backToMenu => 'Înapoi la meniu';

  @override
  String get leaveGame => 'Părăsești jocul?';

  @override
  String get leaveGameMessage =>
      'Sigur vrei să părăsești jocul? Pentru ceilalți jucători jocul va continua.';

  @override
  String get leave => 'Părăsește';

  @override
  String get noQuestionsAvailable => 'Nu sunt întrebări disponibile';

  @override
  String get showLess => 'Arată mai puțin';

  @override
  String get readMore => 'Arată mai mult';

  @override
  String get tapToPlay => 'Atinge pentru a juca';

  @override
  String get favorites => 'Favorite';

  @override
  String get pandoraHostCreatePin =>
      'Gazda creează o sesiune și distribuie PIN-ul';

  @override
  String get pandoraPlayersJoinMax =>
      'Jucătorii se alătură (max. 6 în versiunea gratuită, nelimitat în Premium)';

  @override
  String get pandoraHostSetsTimer =>
      'Gazda setează timpul pentru întrebare (1–15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Toată lumea trimite întrebări (max. 12 în versiunea gratuită)';

  @override
  String get pandoraHostControls => 'Gazda controlează progresul jocului';

  @override
  String get pandoraQuestionsDeleted => 'Întrebările sunt șterse după joc';

  @override
  String get pandoraHost => 'Gazdă';

  @override
  String get pandoraJoinGame => 'Alătură-te jocului';

  @override
  String get pandoraPandoraBox => 'Cutia Pandorei';

  @override
  String get pleaseEnterName => 'Te rugăm să introduci numele tău';

  @override
  String get hostSuffix => '(Gazdă)';

  @override
  String get playersJoinWithNames => 'Jucătorii se alătură folosind numele lor';

  @override
  String get everyoneSubmitsMin5 =>
      'Toți trimit întrebări (min. 5, max. 12 în versiunea gratuită)';

  @override
  String get createSession => 'Creează sesiune';

  @override
  String get creating => 'Se creează...';

  @override
  String get yourName => 'Numele tău';

  @override
  String get enterDisplayName => 'Introdu numele afișat';

  @override
  String get howItWorks => 'Cum funcționează';

  @override
  String get pinCopied => 'PIN copiat în clipboard!';

  @override
  String get endSession => 'Închei sesiunea?';

  @override
  String get endSessionConfirm =>
      'Sigur vrei să închei această sesiune Pandora?';

  @override
  String get createCustomDeck => 'Creează set personalizat';

  @override
  String get deckName => 'Numele setului';

  @override
  String get enterDeckName => 'Introdu numele setului';

  @override
  String get create => 'Creează';

  @override
  String get deckCreated => 'Set creat!';

  @override
  String get failedToCreateDeck => 'Setul nu a putut fi creat';

  @override
  String get deleteDeck => 'Ștergi setul?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Sigur vrei să ștergi \"$deckName\"? Aceasta va șterge toate întrebările din acest set.';
  }

  @override
  String get delete => 'Șterge';

  @override
  String get deckDeleted => 'Set șters';

  @override
  String get failedToDeleteDeck => 'Setul nu a putut fi șters';

  @override
  String get myDecks => 'Seturile mele';

  @override
  String get noDecksYet => 'Încă nu ai seturi';

  @override
  String get createFirstDeck => 'Creează primul tău set personalizat!';

  @override
  String questionsCount(Object count) {
    return '$count întrebări';
  }

  @override
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count întrebări',
      one: '1 întrebare',
      zero: '0 întrebări',
    );
    return '$_temp0';
  }

  @override
  String get questionAdded => 'Întrebare adăugată!';

  @override
  String get failedToAddQuestion => 'Întrebarea nu a putut fi adăugată';

  @override
  String get editQuestion => 'Editează întrebarea';

  @override
  String get enterYourQuestion => 'Introdu întrebarea ta';

  @override
  String get save => 'Salvează';

  @override
  String get questionUpdated => 'Întrebare actualizată!';

  @override
  String get failedToUpdateQuestion => 'Întrebarea nu a putut fi actualizată';

  @override
  String get deleteQuestion => 'Șterge întrebarea';

  @override
  String get deleteQuestionConfirm => 'Sigur vrei să ștergi această întrebare?';

  @override
  String get questionDeleted => 'Întrebare ștearsă';

  @override
  String get failedToDeleteQuestion => 'Întrebarea nu a putut fi ștearsă';

  @override
  String get addQuestion => 'Adaugă întrebare';

  @override
  String get typeQuestionHere => 'Scrie întrebarea aici...';

  @override
  String get add => 'Adaugă';

  @override
  String get noQuestionsYet => 'Încă nu există întrebări';

  @override
  String get addFirstQuestion => 'Adaugă prima ta întrebare!';

  @override
  String get deckDescLoveTalks =>
      'Explorează romantismul, chimia și conexiunea prin întrebări emoționante care sărbătoresc relația voastră. De la momentele \"cum ne-am cunoscut\" până la ceea ce te face să te simți cel mai iubit, aceste cărți adâncesc intimitatea emoțională.';

  @override
  String get deckDescDeepTalks =>
      'Aceste cărți intră în valori, vulnerabilitate și ce înseamnă să creșteți împreună. Ele îi ajută pe parteneri să reflecteze la independență, comunicare și scopul comun.';

  @override
  String get deckDescSpicyTalks =>
      'Îndrăzneț, flirtant și intim — acest set îi invită pe parteneri să exploreze dorințele, fanteziile și pasiunea împreună. Fiecare întrebare este creată pentru a aprinde conversații sincere și incitante despre ceea ce vă atrage și vă apropie.';

  @override
  String get deckDescDoYouDareTalks =>
      'Un set curajos care îmbină sinceritatea emoțională cu subiecte sensibile precum încrederea, religia, banii și limitele personale — totul pentru a dezvălui ce contează cu adevărat pentru voi doi. *Notă:* Unele întrebări sunt directe și nefiltrate — jucați cu deschidere, empatie și respect.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspirat de cele cinci limbaje ale iubirii, acest set îi ajută pe parteneri să-și exprime afecțiunea în moduri care chiar ajung la celălalt. Descoperiți cum cuvintele, acțiunile și gesturile vă pot întări conexiunea.';

  @override
  String get deckDescSillyTalks =>
      'Distracție pură și multe râsete! Aceste întrebări ușoare și trăznite scot la iveală cele mai ciudate obiceiuri și cele mai amuzante gânduri. Perfect pentru prieteni, familie sau cupluri care nu iau viața prea în serios.';

  @override
  String get deckDescCarTalks =>
      'Perfect pentru drumurile cu mașina — aceste cărți transformă timpul petrecut pe drum în conversații grozave. Așteaptă-te la întrebări amuzante, creative și nostalgice despre călătorii, aventuri și mici ciudățenii.';

  @override
  String get deckDescCozyTalks =>
      'Conversații calde și relaxate, perfecte pentru seri liniștite. Aceste întrebări creează momente confortabile și pline de căldură.';

  @override
  String get deckDescPartyNight =>
      'Întrebări pline de energie, gândite pentru grupuri. Perfecte pentru petreceri și seri cu prietenii.';

  @override
  String get deckDescUnpopularOpinions =>
      'Setul care te provoacă să spui cu voce tare ceea ce toată lumea gândește, dar nimeni nu spune. De la cultura influencerilor până la normele sociale — aceste întrebări stârnesc dezbateri sincere și perspective surprinzătoare. Ideal pentru prieteni cu opinii puternice.';

  @override
  String get deckDescPlotTwists =>
      'Acest set te aruncă direct în cele mai amuzante și mai dificile momente de tip \"ce ai face dacă...?\". Reacții spontane, instinct și multe râsete garantate! Perfect pentru seri de grup pline de surprize.';

  @override
  String get deckDescAfterDark =>
      'Intră în partea mai întunecată a conversațiilor cu întrebări care îți dau fiori. De la coincidențe ciudate la scenarii de supraviețuire — perfect pentru nopți târzii cu puțin suspans.';

  @override
  String get deckDescHistoryTalks =>
      'Un amestec nostalgic de amintiri personale și momente de familie. Aceste întrebări inspiră povești, râsete și redescoperirea rădăcinilor tale. Perfect pentru întâlniri de familie sau seri liniștite.';

  @override
  String get deckDescTinyTalks =>
      'Creat pentru părinți și cei mici! Întrebări simple și jucăușe îi ajută pe copii să se exprime, iar părinții să le înțeleagă felul de a gândi. Perfect pentru vârste între 3 și 9 ani.';

  @override
  String get deckDescGoodOldDays =>
      'Călătorește înapoi în timp cu întrebări despre amintiri dragi, experiențe trecute și cum erau lucrurile „pe vremuri”. Potrivit pentru toate vârstele.';

  @override
  String get deckDescWouldYouRather =>
      'Dileme clasice care pornesc discuții și scot la iveală preferințele. Alege între două opțiuni și descoperă ce contează mai mult pentru fiecare.';

  @override
  String get createNewDeck => 'Creează set nou';

  @override
  String get sessionPin => 'PIN sesiune';

  @override
  String get joinSession => 'Alătură-te sesiunii';

  @override
  String get questionSubmitted => 'Întrebare trimisă';

  @override
  String get sessionCancelled => 'Sesiune anulată';

  @override
  String get yourQuestion => 'Întrebarea ta';

  @override
  String get reactionBreakdown => 'Detaliu reacții';

  @override
  String get deckNameHint => 'Nume set';

  @override
  String get deckCreatedSuccess => 'Set creat!';

  @override
  String get cancelSession => 'Anulezi sesiunea?';

  @override
  String get cancelSessionConfirm =>
      'Aceasta va anula sesiunea pentru toți jucătorii. Ești sigur?';

  @override
  String get no => 'Nu';

  @override
  String get yesCancel => 'Da, anulează';

  @override
  String get hostQuestionCollection => 'Gazdă – colectare întrebări';

  @override
  String get questionCollection => 'Colectare întrebări';

  @override
  String get endSessionButton => 'Încheie sesiunea';

  @override
  String get noActiveSubscription => 'Niciun abonament activ';

  @override
  String get premium => 'PREMIUM';

  @override
  String notEnoughQuestions(Object count) {
    return 'Nu sunt suficiente întrebări. Sunt necesare cel puțin 5. (Momentan: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Funcție Premium';

  @override
  String get questionNavigationPremium =>
      'Navigarea după întrebări este o funcție Premium. Abonează-te pentru a debloca posibilitatea de a sări la orice întrebare!';

  @override
  String get customDecks => 'Seturi personalizate';

  @override
  String get noDecksYetMessage => 'Încă nu ai seturi';

  @override
  String get createFirstDeckMessage => 'Atinge + pentru a crea primul tău set';

  @override
  String get signInRequired => 'Autentificare necesară';

  @override
  String get signInToUsePersonal =>
      'Te rugăm să te conectezi pentru a folosi modul Personal și pentru a crea seturi personalizate de întrebări.';

  @override
  String get collaborativeQuestionGame => 'Joc colaborativ de întrebări';

  @override
  String get hostPandoraSession => 'Găzduiește o sesiune Pandora';

  @override
  String get joinPandoraGame => 'Alătură-te unui joc';

  @override
  String get yourDisplayName => 'Numele tău afișat';

  @override
  String get enterYourName => 'Introdu numele tău';

  @override
  String get selectQuestion => 'Selectează o întrebare';

  @override
  String get joinTime => 'Timp pentru a intra';

  @override
  String get participants => 'Participanți';

  @override
  String get loading => 'Se încarcă...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Ai nevoie de cel puțin 2 jucători ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Continuă la setarea temporizatorului';

  @override
  String get setQuestionTimer => 'Setează temporizatorul pentru întrebare';

  @override
  String get questionCollectionTime => 'Timp pentru colectarea întrebărilor';

  @override
  String get minutes => 'minute';

  @override
  String get sessionWillEnd =>
      'Sesiunea se va încheia automat dacă nu continui în 5 minute';

  @override
  String get startQuestionCollection => 'Pornește colectarea întrebărilor';

  @override
  String questionsSubmitted(int count) {
    return '$count întrebări trimise';
  }

  @override
  String get writeQuestionHere => 'Scrie întrebarea aici...';

  @override
  String get whoIsThisFor => 'Pentru cine este această întrebare?';

  @override
  String get everyone => 'Toți';

  @override
  String get specific => 'O persoană anume';

  @override
  String get submitQuestion => 'Trimite întrebarea';

  @override
  String needMoreQuestions(int count) {
    return 'Mai sunt necesare încă $count întrebări';
  }

  @override
  String get startGame => 'Pornește jocul';

  @override
  String get selectPlayer => 'Selectează un jucător';

  @override
  String get unsubscribe => 'Anulează abonamentul';

  @override
  String get unsubscribeConfirm => 'Anulezi abonamentul Premium?';

  @override
  String get unsubscribeWarning =>
      'Vei pierde accesul la toate funcțiile Premium, inclusiv întrebări nelimitate, toate categoriile, experiență fără reclame și jucători nelimitați în Pandora. Te poți abona din nou oricând.';

  @override
  String get yesUnsubscribe => 'Da, anulează';

  @override
  String get unsubscribeSuccess =>
      'Abonament anulat. Funcțiile Premium au fost dezactivate.';

  @override
  String get unsubscribeError => 'Abonamentul nu a putut fi anulat';

  @override
  String get questions => 'întrebări';

  @override
  String get preview => 'previzualizare';

  @override
  String get userId => 'ID utilizator';

  @override
  String get subscription => 'Abonament';

  @override
  String get questionsCount75 => '75 de întrebări';

  @override
  String get questionsCount30 => '30 de întrebări';

  @override
  String get questionsCount5Preview => 'Previzualizare cu 5 întrebări';

  @override
  String get unlockFullDeck => 'Deblochează 75 de întrebări';

  @override
  String get renameDeck => 'Redenumește setul';

  @override
  String get deckRenamed => 'Set redenumit cu succes';

  @override
  String get failedToRenameDeck => 'Setul nu a putut fi redenumit';

  @override
  String get shuffleQuestions => 'Amestecă întrebările';

  @override
  String get resetOrder => 'Resetează ordinea';

  @override
  String get questionsShuffled => 'Întrebările au fost amestecate!';

  @override
  String get orderReset => 'Ordinea a fost resetată la cea inițială';

  @override
  String get readyToPlay => 'Gata de joc';

  @override
  String get longPressReorder =>
      'Apasă lung și trage pentru a reordona întrebările';

  @override
  String get noFavoritesYet => 'Încă nu ai favorite';

  @override
  String get heartQuestionsDuringGameplay =>
      'Atinge inima ❤️ de pe cărțile cu întrebări în timpul jocului pentru a le salva aici!';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Adaugă cel puțin $count întrebări pentru a începe jocul.';
  }

  @override
  String get heartQuestionsInfo =>
      'Pune inimă întrebărilor în timpul jocului pentru a le adăuga la Favorite!';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Adaugă cel puțin $count întrebări pentru a juca acest set';
  }

  @override
  String get removeFromFavorites => 'Șterge din favorite';

  @override
  String get unlockEverything => 'Deblochează tot';

  @override
  String get premiumSubtitle =>
      'Obține acces nelimitat la toate categoriile, elimină reclamele pentru totdeauna și deblochează funcțiile Premium';

  @override
  String get save32Percent => 'ECONOMISEȘTI 29%';

  @override
  String get priceMonthly => '€6,99/lună';

  @override
  String get priceYearly => '€59,99/an';

  @override
  String get billedAnnually => 'Facturat anual';

  @override
  String get equivalentMonthly => 'Doar €5/lună';

  @override
  String get feature24Categories =>
      'Peste 24 de categorii premium deblocate în toate modurile';

  @override
  String get feature75Questions =>
      '75 de întrebări pe categorie (vs 30 în nivelul gratuit)';

  @override
  String get featureNoAds => 'Fără reclame pentru totdeauna – joc neîntrerupt';

  @override
  String get featureUnlimitedPlayers =>
      'Modul Pandora: jucători și întrebări nelimitate';

  @override
  String get featureQuestionNavigation =>
      'Navighează și sari la orice întrebare în timpul jocului';

  @override
  String get featureSupportDevelopment =>
      'Susții dezvoltarea continuă și noile funcții';

  @override
  String get error => 'Eroare';

  @override
  String get premiumActivatedMessage =>
      'Premium activat! Toate categoriile sunt deblocate.';

  @override
  String get featurePersonalDecks =>
      'Modul Personal: creează seturi personalizate nelimitate cu propriile întrebări';

  @override
  String get premiumPersonal =>
      'Modul Personal cu seturi personalizate este o funcție Premium. Fă upgrade la Premium pentru a crea și juca propriile seturi de întrebări!';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Sigur vrei să ștergi \"$deckName\"? Aceasta va șterge toate întrebările din acest set.';
  }

  @override
  String needMore(int count) {
    return 'Mai ai nevoie de $count';
  }

  @override
  String get editQuestions => 'Editează întrebările';

  @override
  String get addMore => 'Adaugă mai multe';

  @override
  String useMyConnectEmail(String email) {
    return 'Folosește adresa mea de e-mail Connect: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Utilizatorii gratuiti pot avea maximum 6 jucători. Fă upgrade la Premium pentru jucători nelimitați!';

  @override
  String get freemiumQuestionLimit =>
      'Utilizatorii gratuiti pot trimite maximum 12 întrebări. Fă upgrade la Premium pentru întrebări nelimitate!';

  @override
  String get yourQuestions => 'Întrebările tale';

  @override
  String waitingForHost(int count) {
    return 'Se așteaptă gazda... ($count jucători)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Fă upgrade la Premium pentru jucători nelimitați';

  @override
  String get kickPlayer => 'Elimină jucătorul';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Sigur vrei să îl elimini pe $playerName?';
  }

  @override
  String get kick => 'Elimină';

  @override
  String playerKicked(String playerName) {
    return '$playerName a fost eliminat';
  }

  @override
  String get failedToKickPlayer => 'Jucătorul nu a putut fi eliminat';

  @override
  String get cancelSessionForAll =>
      'Aceasta va anula sesiunea pentru toți jucătorii. Ești sigur?';

  @override
  String get youWereKicked => 'Ai fost eliminat din sesiune';

  @override
  String get you => 'Tu';

  @override
  String get loginRequiredForPandora =>
      'Este necesară autentificarea pentru a juca Pandora';

  @override
  String get login => 'Autentificare';

  @override
  String get loginRequiredNote =>
      'Este necesară autentificarea pentru a juca Pandora (pentru a urmări corect jucătorii)';

  @override
  String get timeIsUp => 'Timpul a expirat!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Nu au fost trimise suficiente întrebări ($current/$minimum minim).';
  }

  @override
  String get sessionQuestionLimit => 'Limită de întrebări a sesiunii atinsă';

  @override
  String get sessionQuestionLimitMessage =>
      'Această sesiune a atins limita de 12 întrebări (gazdă gratuită). Fă upgrade la Premium pentru întrebări nelimitate!';

  @override
  String sessionQuestionCount(int current) {
    return 'Sesiune: $current/12 întrebări';
  }

  @override
  String get pleaseEnterQuestion => 'Te rugăm să introduci o întrebare';

  @override
  String get rateThisDeck => 'Evaluează acest set';

  @override
  String get yourRating => 'Evaluarea ta';

  @override
  String get skip => 'Sari peste';

  @override
  String get submit => 'Trimite';

  @override
  String get thankYouForFeedback => 'Mulțumim pentru feedback!';

  @override
  String get failedToSubmitRating => 'Evaluarea nu a putut fi trimisă';

  @override
  String get tapStarsToRate => 'Atinge stelele pentru a evalua';

  @override
  String get downloadForOffline => 'Descarcă pentru offline';

  @override
  String get downloading => 'Se descarcă...';

  @override
  String get downloadedLanguages => 'Limbi descărcate';

  @override
  String get languageNotDownloaded => 'Limbă nedescărcată';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'Nu ai descărcat $languageName pentru utilizare offline.\n\nMergi la Setări > Profil > \"Descarcă pentru offline\" în timp ce ești conectat la internet.';
  }

  @override
  String get offlineLanguageError =>
      'Această limbă nu a fost descărcată pentru utilizare offline. Mergi la Setări > Profil > \"Descarcă pentru offline\" în timp ce ești conectat la internet.';

  @override
  String get downloadComplete => 'Descărcare finalizată!';

  @override
  String get downloadCompleteMessage =>
      'Tot conținutul a fost descărcat pentru utilizare offline.';

  @override
  String get addedToFavorites => 'Adăugat la favorite';

  @override
  String get removedFromFavorites => 'Eliminat din favorite';

  @override
  String get errorSavingFavorite => 'Eroare la salvarea favoritului';

  @override
  String get internetRequired => 'Internet necesar';

  @override
  String get internetRequiredMessage =>
      'Unele funcții necesită conexiune la internet. Utilizatorii Premium pot descărca conținut pentru utilizare offline în Setări.';

  @override
  String get goPremium => 'Obține Premium';

  @override
  String get pleaseEnterPin => 'Te rugăm să introduci un PIN de 6 cifre';

  @override
  String errorOccurred(String error) {
    return 'Eroare: $error';
  }

  @override
  String get errorCreatingSession => 'Eroare la crearea sesiunii';

  @override
  String get sessionTimedOut =>
      'Sesiune expirată - gazda nu a setat temporizatorul';

  @override
  String get errorStarting => 'Eroare la pornire';

  @override
  String get errorLoadingParticipants => 'Eroare la încărcarea participanților';

  @override
  String get sessionCancelledByHost => 'Sesiune anulată de gazdă';

  @override
  String needAtLeast5Questions(int count) {
    return 'Sunt necesare cel puțin 5 întrebări pentru a începe! (Momentan: $count)';
  }

  @override
  String get errorStartingGame => 'Eroare la pornirea jocului';

  @override
  String get questionsAsked => 'Întrebări puse';

  @override
  String get totalReactions => 'Reacții totale';

  @override
  String get mostLovedQuestion => 'Întrebarea cea mai iubită';

  @override
  String get mostFunQuestion => 'Întrebarea cea mai distractivă';

  @override
  String get mostShockingQuestion => 'Întrebarea cea mai șocantă';

  @override
  String get mostLitQuestion => 'Întrebarea cea mai tare';

  @override
  String get hotSeatAward => 'Premiul Hot Seat';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Eroare: Nu s-a putut identifica jucătorul. Te rugăm să te alături din nou sesiunii.';

  @override
  String get createAiDeck => 'Creează Deck AI';

  @override
  String get whatIsTheOccasion => 'Care este ocazia?';

  @override
  String get occasionHint =>
      'de exemplu, Petrecere de ziua de naștere, Teambuilding, Seară romantică';

  @override
  String get whatIsTheMood => 'Care este starea de spirit?';

  @override
  String get lighthearted => 'Cu umor';

  @override
  String get serious => 'Serios';

  @override
  String get mixed => 'Amestecat';

  @override
  String get depthOfQuestions => 'Adâncimea întrebărilor?';

  @override
  String get surfaceLevel => 'Nivel de suprafață';

  @override
  String get deep => 'Adânc';

  @override
  String get level => 'Nivel';

  @override
  String get sizeOfGroup => 'Dimensiunea grupului?';

  @override
  String get people => 'oameni';

  @override
  String get anyOtherRemarks => 'Orice alte observații? (opțional)';

  @override
  String get remarksHint =>
      'de exemplu, Prietenos cu familia, include câteva întrebări amuzante';

  @override
  String get generateQuestions => 'Generați Întrebări';

  @override
  String get aiDeckPremiumMessage =>
      'Generarea de deck-uri AI este o funcție premium. Upgradează pentru a crea deck-uri de conversație nelimitate alimentate de AI!';

  @override
  String get pleaseEnterOccasion => 'Vă rugăm să introduceți ocazia';

  @override
  String errorGeneratingQuestions(String error) {
    return 'Eroare la generarea întrebărilor: $error';
  }

  @override
  String get generatingAiQuestions => 'Generarea întrebărilor AI...';

  @override
  String get generatingMoreQuestions => 'Generarea mai multor întrebări...';

  @override
  String get batchComplete => 'Lot complet!';

  @override
  String questionsInDeckMessage(int count) {
    return 'Ai $count întrebări în pachetul tău. Generezi încă 10?';
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
    return '$kept/$max';
  }

  @override
  String questionProgress(int current, int total) {
    return '$current/$total';
  }

  @override
  String batchNumber(int number) {
    return 'Lotul #$number';
  }

  @override
  String get imDone => 'Am terminat';

  @override
  String get generateMore => 'Generează Mai Mult';

  @override
  String get maxQuestionsReached => 'Max Întrebări (50)';

  @override
  String get namYourDeck => 'Numește-ți Pachetul';

  @override
  String get goBack => 'Întoarce-te';

  @override
  String get swipeInstructions =>
      'Glisează spre dreapta pentru a păstra • Glisează spre stânga pentru a elimina';

  @override
  String get discussionPoint => 'Punct de discuție';

  @override
  String get sparkMode => 'Mod Spark';

  @override
  String get sparkModeSubtitle =>
      'Întrebări de început de conversație alimentate de AI';

  @override
  String get sparkPremiumRequired => 'Mod Spark - Funcție Premium';

  @override
  String get sparkPremiumMessage =>
      'Modul Spark este disponibil pentru abonații Premium și Premium+. Generează inițiative de conversație alimentate de AI, adaptate ocaziei tale!';

  @override
  String sparkQuestionsRemaining(int remaining, int limit) {
    return '$remaining din $limit întrebări rămase';
  }

  @override
  String get howManyQuestions => 'Câte întrebări?';

  @override
  String sparkQuestions(int count) {
    return '$count Întrebări';
  }

  @override
  String generateSparkQuestions(int count) {
    return 'Generați $count întrebări';
  }

  @override
  String get sparkLimitReached => 'Limita lunară atinsă';

  @override
  String sparkLimitMessage(int remaining, int requested) {
    return 'Mai ai doar $remaining întrebări Spark rămase în această lună. Încerci să generezi $requested întrebări.\n\nUpgradează la Premium+ pentru 400 de întrebări pe lună!';
  }

  @override
  String get expiresIn24Hours => 'Expiră în 24 de ore';

  @override
  String get alreadyInFavorites => 'Deja în Favorite';

  @override
  String addedToDeck(String deckName) {
    return 'Adăugat la $deckName!';
  }

  @override
  String get questionAlreadyInDeck => 'Întrebare deja în acest deck';

  @override
  String get addToDeck => 'Adaugă la Deck';

  @override
  String get favorite => 'Favorit';

  @override
  String get chooseDeck =>
      'Alege un pachet la care să adaugi această întrebare:';

  @override
  String get noDecksFound => 'Niciun pachet găsit';

  @override
  String get noDecksMessage =>
      'Nu ai încă niciun pachet personalizat. Vrei să creezi unul?';

  @override
  String get createDeck => 'Creează Pachet';

  @override
  String get createAndAdd => 'Creează și Adaugă';

  @override
  String get pleaseEnterDeckName =>
      'Vă rugăm să introduceți un nume pentru pachet';

  @override
  String get tierBasic => 'De bază';

  @override
  String get tierPremium => 'Premium';

  @override
  String get tierPremiumPlus => 'Premium+';

  @override
  String get tierFree => 'Gratuit';

  @override
  String get choosePlan => 'Alege-ți Planul';

  @override
  String get choosePlanSubtitle =>
      'Dezvăluie funcții premium și conversații alimentate de AI';

  @override
  String get mostPopular => 'CELE MAI POPULARE';

  @override
  String get perMonth => 'pe lună';

  @override
  String get forever => 'Pentru totdeauna';

  @override
  String get continueWithBasic => 'Continuă cu Basic (Gratuit)';

  @override
  String subscribeTo(String tier) {
    return 'Abonează-te la $tier';
  }

  @override
  String get cancelAnytime => 'Anulează oricând. Fără taxe ascunse.';

  @override
  String get basicTierTitle => 'De bază';

  @override
  String get basicTierPrice => '€6.99';

  @override
  String get basicTierDescription =>
      'Accesați toate modurile de joc, cu excepția Spark';

  @override
  String get basicFeature1 =>
      'Toate modurile de joc (Cuplu, Prieteni, Familie, Personal, Pandora)';

  @override
  String get basicFeature2 => 'Acces la toate cele 24+ categorii';

  @override
  String get basicFeature3 => 'Deckuri personale personalizate';

  @override
  String get basicFeature4 => 'Fără reclame';

  @override
  String get basicFeature5 => 'Navigare întrebări';

  @override
  String get premiumTierTitle => 'Premium';

  @override
  String get premiumTierPrice => '€11.99';

  @override
  String get premiumTierDescription => 'Totul în Basic + Spark AI';

  @override
  String get premiumFeature6 => 'Salvează favoritele în deck-uri personale';

  @override
  String get premiumPlusTierTitle => 'Premium+';

  @override
  String get premiumPlusTierPrice => '€19.99';

  @override
  String get premiumPlusTierDescription => 'Puterea maximă AI';

  @override
  String get premiumPlusFeature1 => 'Totul în Premium';

  @override
  String get premiumPlusFeature2 => '🚀 400 întrebări AI pe lună';

  @override
  String get premiumPlusFeature3 => 'De 2,5 ori mai multe întrebări Spark';

  @override
  String get premiumPlusFeature4 => 'Perfect pentru utilizare frecventă';

  @override
  String get premiumPlusFeature5 => 'Asistență prioritară';
}
