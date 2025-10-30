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
  String get start => 'Începe';

  @override
  String get settings => 'Setări';

  @override
  String get howToPlay => 'Cum să joci';

  @override
  String get chooseGameMode => 'Alege modul tău de joc';

  @override
  String get family => 'Familie';

  @override
  String get couple => 'Cuplu';

  @override
  String get friends => 'Prieteni';

  @override
  String get chooseCategory => 'Alege o categorie';

  @override
  String get locked => 'Categorie blocată';

  @override
  String get lockedMessage =>
      'Această categorie este blocată. Upgradează la premium pentru a debloca toate categoriile!';

  @override
  String get previewAvailable => 'Preview: First 5 questions available';

  @override
  String get upgradeNow => 'Upgrade Now';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Poate mai târziu';

  @override
  String get getPremium => 'Get Premium';

  @override
  String get premiumTitle => 'Unlock Everything';

  @override
  String get premiumDescription =>
      'Get unlimited access to all categories across all modes, remove ads, and enjoy unlimited Pandora sessions.';

  @override
  String get premiumPriceMonthly => '49 DKK/month';

  @override
  String get premiumPriceYearly => '399 DKK/year';

  @override
  String get saveWithYearly => 'Save 189 DKK with yearly!';

  @override
  String get monthly => 'Monthly';

  @override
  String get yearly => 'Yearly';

  @override
  String get billedMonthly => 'Billed monthly';

  @override
  String get billedYearly => 'Billed annually';

  @override
  String get premiumFeature1 => '✓ All 21 premium categories unlocked';

  @override
  String get premiumFeature2 => '✓ No ads forever';

  @override
  String get premiumFeature3 => '✓ Unlimited questions in all categories';

  @override
  String get premiumFeature4 => '✓ Pandora: Unlimited players & questions';

  @override
  String get premiumFeature5 => '✓ Support ongoing development';

  @override
  String get subscribePremium => 'Subscribe to Premium';

  @override
  String get subscribe => 'Abonează-te';

  @override
  String get cancel => 'Anulează';

  @override
  String subscriptionActivated(Object bundles) {
    return 'Abonamentul activat! $bundles deblocate.';
  }

  @override
  String get premiumActivated =>
      'Premium activat! Reclamele au fost eliminate. Pachetul a fost deblocat.';

  @override
  String get demoNote =>
      'Demo: Deblocările se vor reseta la repornirea aplicației';

  @override
  String get freeTier => 'Free Tier';

  @override
  String get freeTierDesc =>
      '3 categories per mode (30 questions each)\n5-question previews of premium categories\nAds every 7 questions';

  @override
  String get currentPlan => 'Current Plan';

  @override
  String get limitReached => 'Limit Reached';

  @override
  String get freeCategoryLimit =>
      'You\'ve reached the 30-question limit for free categories. Upgrade to Premium for unlimited access!';

  @override
  String get previewLimit =>
      'You\'ve seen all 5 preview questions. Upgrade to Premium to continue!';

  @override
  String get pandoraFreeLimit => 'Free Limit';

  @override
  String get pandoraFreeLimitMessage =>
      'Free hosts can have max 6 players and 12 questions. Upgrade to Premium for unlimited!';

  @override
  String get pandoraUpgradeMessage =>
      'You\'ve reached 12 questions. Upgrade to Premium to continue playing!';

  @override
  String get pandoraMaxPlayers =>
      'Maximum 6 players reached (Free limit). Upgrade to Premium for unlimited players!';

  @override
  String get swipeOrTap => 'Glisează sau apasă pe săgeți';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Următorul';

  @override
  String get advertisement => 'Reclamă';

  @override
  String get watchAdMessage =>
      'Vizionați o reclamă scurtă pentru a continua sau treceți la versiunea fără reclame cu premium!';

  @override
  String get watchAd => 'Vizionați reclamă';

  @override
  String get goAdFree => 'Treceți la versiunea fără reclame - 59 DKK/lună';

  @override
  String get removeAdsForever => 'Îndepărtați reclamele pentru totdeauna';

  @override
  String get adNotReady => 'Reclama nu este gata. Continuăm fără reclamă.';

  @override
  String get adLoadingContinue => 'Încărcare anunț... Continuă';

  @override
  String get pricePerMonth => '59 DKK/lună';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Nicio întrebare găsită pentru $category în modul $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Eroare la încărcarea întrebărilor. Te rog verifică-ți conexiunea.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Nu s-au putut încărca întrebările: $error';
  }

  @override
  String get madeForWife => 'Creat pentru soția mea frumoasă';

  @override
  String get otiLia => 'Otilia Stenhøj';

  @override
  String get withLoveAndConversations => 'Cu dragoste și conversații';

  @override
  String get howManyPlayers => 'Câți jucători?';

  @override
  String get players => 'Jucători';

  @override
  String get continueButton => 'Continuă';

  @override
  String get language => 'Limba';

  @override
  String languageChanged(Object language) {
    return 'Limba schimbată în $language';
  }

  @override
  String get profile => 'Profil';

  @override
  String get signOut => 'Deconectare';

  @override
  String get notSignedIn => 'Nu ești conectat';

  @override
  String get signInSignUp => 'Conectează-te / Înscrie-te';

  @override
  String get signInToSync =>
      'Conectează-te pentru a sincroniza abonamentele pe dispozitive și a debloca conținut premium';

  @override
  String get signOutConfirm => 'Ești sigur că vrei să te deconectezi?';

  @override
  String get signedOutSuccess => 'Deconectare reușită';

  @override
  String get accountInformation => 'Informații cont';

  @override
  String get email => 'Email';

  @override
  String get memberSince => 'Membru din';

  @override
  String get notAvailable => 'Nedisponibil';

  @override
  String get unknown => 'Necunoscut';

  @override
  String get subscriptionStatus => 'Subscription Status';

  @override
  String get premiumMember => 'Membru Premium';

  @override
  String get freeAccount => 'Cont gratuit';

  @override
  String get welcomeToConnect => 'Bine ai venit la Connect!';

  @override
  String get continueWithApple => 'Continuă cu Apple';

  @override
  String get continueWithGoogle => 'Continuă cu Google';

  @override
  String get skipForNow => 'Sari peste pentru acum';

  @override
  String get byContining =>
      'Prin continuare, ești de acord cu Termenii și Condițiile noastre și Politica de Confidențialitate';

  @override
  String get googleSignInFailed =>
      'Autentificarea Google a eșuat. Te rugăm să încerci din nou.';

  @override
  String get appleSignInFailed =>
      'Autentificarea Apple a eșuat. Te rugăm să încerci din nou.';

  @override
  String get noCategoriesFound => 'Nu au fost găsite categorii';

  @override
  String get aboutCredits => 'Despre / Credite';

  @override
  String get welcomeBack => 'Bine ai revenit!';

  @override
  String get createAccount => 'Creează un cont';

  @override
  String get displayName => 'Nume de afișare';

  @override
  String get password => 'Parolă';

  @override
  String get signIn => 'Conectează-te';

  @override
  String get signUp => 'Înscrie-te';

  @override
  String get dontHaveAccount => 'Nu ai un cont? Înscrie-te';

  @override
  String get alreadyHaveAccount => 'Ai deja un cont? Conectează-te';

  @override
  String get chooseYourMode => '1. Alege-ți Modul';

  @override
  String get chooseYourModeDesc =>
      'Selectează din trei stiluri de conversație:';

  @override
  String get pickCategory => '2. Alege o Categorie';

  @override
  String get pickCategoryDesc =>
      'Fiecare mod are mai multe categorii cu pachete unice de întrebări. Categoriile gratuite sunt deblocate, în timp ce categoriile premium necesită un abonament.';

  @override
  String get startTalking => '3. Începe Să Vorbești';

  @override
  String get startTalkingDesc =>
      'Întrebările apar pe ecran complet. Faceți schimb de rânduri citind și răspunzând sincer. Nu există răspunsuri greșite - scopul este o conversație semnificativă!';

  @override
  String get navigateQuestions => '4. Navighează Întrebările';

  @override
  String get navigateQuestionsDesc =>
      '• Glisează spre dreapta sau apasă \"Următorul\" pentru următoarea întrebare';

  @override
  String get premiumFeatures => '5. Funcții Premium';

  @override
  String get premiumFeaturesDesc =>
      'Deblochează categorii exclusive de întrebări cu un abonament:';

  @override
  String get proTips => 'Sfaturi Pro';

  @override
  String get proTipsDesc => '• Creează un mediu confortabil, fără distrageri';

  @override
  String get personal => 'Personal';

  @override
  String get personalDesc =>
      'Creează-ți propriile pachete de întrebări personalizate';

  @override
  String get gameComplete => 'Joc complet!';

  @override
  String get noMoreQuestions =>
      'Ai parcurs toate întrebările din acest pachet!';

  @override
  String get playAgain => 'Joacă din nou';

  @override
  String get mainMenu => 'Meniu principal';

  @override
  String get thanksForPlaying => 'Mulțumim că ai jucat!';

  @override
  String get hopeYouHadFun => 'Sper că te-ai distrat! 🎉';

  @override
  String get backToMenu => 'Înapoi la Meniu';

  @override
  String get leaveGame => 'Părăsești jocul?';

  @override
  String get leaveGameMessage =>
      'Ești sigur că vrei să pleci? Jocul va continua pentru ceilalți jucători.';

  @override
  String get leave => 'Părăsește';

  @override
  String get noQuestionsAvailable => 'Nu sunt întrebări disponibile';

  @override
  String get showLess => 'Arată mai puțin';

  @override
  String get readMore => 'Citește mai mult';

  @override
  String get tapToPlay => 'Apasă pentru a juca';

  @override
  String get favorites => 'Preferate';

  @override
  String get pandoraHostCreatePin =>
      'Gazda creează sesiunea și împărtășește PIN-ul';

  @override
  String get pandoraPlayersJoinMax => 'Jucătorii se alătură (max 15 min)';

  @override
  String get pandoraHostSetsTimer =>
      'Gazda setează cronometrul pentru întrebări (1-15 min)';

  @override
  String get pandoraEveryoneSubmits => 'Toată lumea trimite întrebările';

  @override
  String get pandoraHostControls => 'Gazda controlează progresul jocului';

  @override
  String get pandoraQuestionsDeleted => 'Întrebările sunt șterse după joc';

  @override
  String get pandoraHost => 'Gazda';

  @override
  String get pandoraJoinGame => 'Alătură-te Jocului';

  @override
  String get pandoraPandoraBox => 'Cutia Pandorei';

  @override
  String get pleaseEnterName => 'Te rog introdu numele tău';

  @override
  String get hostSuffix => '(Gazdă)';

  @override
  String get playersJoinWithNames => 'Jucătorii se alătură cu numele lor';

  @override
  String get everyoneSubmitsMin5 => 'Toată lumea trimite întrebări (minim 5)';

  @override
  String get createSession => 'Creează sesiune';

  @override
  String get creating => 'Se creează...';

  @override
  String get yourName => 'Numele tău';

  @override
  String get enterDisplayName => 'Introdu numele tău de afișare';

  @override
  String get howItWorks => 'Cum funcționează';

  @override
  String get pinCopied => 'PIN copiat în clipboard!';

  @override
  String get endSession => 'Încheie sesiunea?';

  @override
  String get endSessionConfirm =>
      'Ești sigur că vrei să închei această sesiune Pandora?';

  @override
  String get createCustomDeck => 'Create Custom Deck';

  @override
  String get deckName => 'Numele Pachetului';

  @override
  String get enterDeckName => 'Introdu numele pachetului';

  @override
  String get create => 'Creează';

  @override
  String get deckCreated => 'Deck created!';

  @override
  String get failedToCreateDeck => 'Nu s-a reușit crearea pachetului';

  @override
  String get deleteDeck => 'Șterge Pachetul';

  @override
  String deleteDeckConfirm(Object name) {
    return 'Ești sigur că vrei să ștergi \"$name\"? Aceasta va șterge toate întrebările din acest pachet.';
  }

  @override
  String get delete => 'Șterge';

  @override
  String get deckDeleted => 'Pachet șters';

  @override
  String get failedToDeleteDeck => 'Nu s-a reușit ștergerea pachetului';

  @override
  String get myDecks => 'Pachetele mele';

  @override
  String get noDecksYet => 'Încă nu ai pachete';

  @override
  String get createFirstDeck => 'Creează-ți primul pachet personalizat!';

  @override
  String questionsCount(Object count) {
    return '$count întrebări';
  }

  @override
  String questionCount(Object count) {
    return '$count întrebare';
  }

  @override
  String get questionAdded => 'Întrebarea a fost adăugată!';

  @override
  String get failedToAddQuestion => 'Nu s-a reușit adăugarea întrebării';

  @override
  String get editQuestion => 'Editează întrebare';

  @override
  String get enterYourQuestion => 'Introdu întrebarea ta';

  @override
  String get save => 'Salvează';

  @override
  String get questionUpdated => 'Întrebarea a fost actualizată!';

  @override
  String get failedToUpdateQuestion => 'Nu s-a putut actualiza întrebarea';

  @override
  String get deleteQuestion => 'Șterge întrebarea';

  @override
  String get deleteQuestionConfirm =>
      'Ești sigur că vrei să ștergi această întrebare?';

  @override
  String get questionDeleted => 'Întrebarea a fost ștearsă';

  @override
  String get failedToDeleteQuestion => 'Nu s-a putut șterge întrebarea';

  @override
  String get addQuestion => 'Adaugă întrebare';

  @override
  String get typeQuestionHere => 'Scrie întrebarea ta aici...';

  @override
  String get add => 'Adaugă';

  @override
  String get noQuestionsYet => 'Încă nu sunt întrebări';

  @override
  String get addFirstQuestion => 'Adaugă-ți prima întrebare!';

  @override
  String get deckDescLoveTalks =>
      'Explorează romantismul, chimia și conexiunea prin întrebări sincere care celebrează relația voastră. De la \"cum ne-am cunoscut\" până la ce te face să te simți cel mai iubit, aceste cărți adâncesc intimitatea emoțională.';

  @override
  String get deckDescDeepTalks =>
      'Aceste cărți explorează valorile, vulnerabilitatea și ce înseamnă să crești împreună. Ele ajută partenerii să reflecteze asupra independenței, comunicării și scopului comun.';

  @override
  String get deckDescSpicyTalks =>
      'Îndrăznețe, pasionale și intime — aceste cărți invită cuplurile să exploreze dorința, fanteziile și pasiunea împreună. Fiecare întrebare provoacă conversații sincere și incitante care apropie partenerii.';

  @override
  String get deckDescDoYouDareTalks =>
      'Un set curajos care combină onestitatea emoțională cu subiecte sensibile precum încrederea, religia, banii și limitele personale — totul pentru a descoperi ce contează cu adevărat. *Avertisment:* Unele întrebări sunt directe — abordați-le cu empatie și respect.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspirat de cele cinci limbaje ale iubirii, acest set îi ajută pe parteneri să își exprime afecțiunea în moduri care rezonează cu adevărat. Descoperă cum cuvintele, acțiunile și gesturile întăresc conexiunea.';

  @override
  String get deckDescSillyTalks =>
      'Distracție și râsete! Aceste întrebări amuzante dezvăluie obiceiurile și gândurile tale cele mai ciudate. Perfecte pentru prieteni, familie sau cupluri care iau viața cu umor.';

  @override
  String get deckDescCarTalks =>
      'Perfecte pentru călătorii lungi — aceste cărți transformă timpul din mașină în conversații grozave. Întrebări amuzante, creative și nostalgice despre călătorii, aventuri și ciudățenii.';

  @override
  String get deckDescCozyTalks =>
      'Întrebări calde și relaxante care te fac să te simți acasă. Ele inspiră discuții liniștitoare despre bucurii mărunte și amintiri frumoase.';

  @override
  String get deckDescPartyNight =>
      'Pachetul tău perfect pentru seri amuzante cu prietenii! Aceste întrebări pline de viață provoacă râsete, povești și dezbateri jucăușe — de la eșecuri la petreceri la cine e cel mai mare flirt. Ideal pentru a anima atmosfera.';

  @override
  String get deckDescUnpopularOpinions =>
      'Setul care te provoacă să spui ceea ce toți gândesc, dar nimeni nu recunoaște. De la cultura influencerilor la valorile moderne — aceste cărți stârnesc dezbateri oneste și perspective surprinzătoare.';

  @override
  String get deckDescPlotTwists =>
      'Acest set te aruncă în cele mai amuzante și dificile momente \"ce ai face dacă…\". Perfect pentru seri de grup pline de râsete, surprize și reacții neașteptate.';

  @override
  String get deckDescAfterDark =>
      'Intră în latura întunecată a conversației cu întrebări care îți dau fiori. Perfect pentru nopți târzii și momente de suspans.';

  @override
  String get deckDescHistoryTalks =>
      'Un amestec nostalgic de amintiri personale și momente de familie. Aceste întrebări inspiră povești și redescoperirea rădăcinilor.';

  @override
  String get deckDescTinyTalks =>
      'Creat pentru părinți și micuții lor! Întrebări simple și jucăușe care îi ajută pe copii să se exprime și pe părinți să îi înțeleagă mai bine. Ideal pentru 3–9 ani.';

  @override
  String get deckDescGoodOldDays =>
      'O călătorie nostalgică în trecut — de la amintiri din copilărie la cum s-a schimbat viața. Perfect pentru bunici să-și împărtășească poveștile.';

  @override
  String get deckDescWouldYouRather =>
      'O versiune de familie a clasicului joc \"Ai prefera…?\". Plin de alegeri amuzante și creative care aduc zâmbete și discuții.';

  @override
  String get createNewDeck => 'Creează un Pachet Nou';

  @override
  String get sessionPin => 'PIN-ul sesiunii';

  @override
  String get joinSession => 'Alătură-te sesiunii';

  @override
  String get questionSubmitted => 'Întrebarea a fost trimisă!';

  @override
  String get sessionCancelled => 'Sesiunea a fost anulată';

  @override
  String get yourQuestion => 'Întrebarea ta';

  @override
  String get reactionBreakdown => 'Analiza reacțiilor';
}
