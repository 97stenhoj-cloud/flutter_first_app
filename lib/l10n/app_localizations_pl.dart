// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Start';

  @override
  String get settings => 'Ustawienia';

  @override
  String get howToPlay => 'Jak grać';

  @override
  String get chooseGameMode => 'Wybierz tryb gry';

  @override
  String get family => 'Rodzina';

  @override
  String get couple => 'Para';

  @override
  String get friends => 'Przyjaciele';

  @override
  String get chooseCategory => 'Wybierz kategorię';

  @override
  String get locked => 'Kategoria Premium';

  @override
  String get lockedMessage =>
      'To jest kategoria premium. Przejdź na Premium, aby odblokować wszystkie kategorie i usunąć reklamy!';

  @override
  String get previewAvailable => 'Podgląd: dostępnych pierwszych 5 pytań';

  @override
  String get upgradeNow => 'Ulepsz teraz';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Może później';

  @override
  String get getPremium => 'Uzyskaj Premium';

  @override
  String get premiumTitle => 'Odblokuj wszystko';

  @override
  String get premiumDescription =>
      'Uzyskaj nielimitowany dostęp do wszystkich kategorii we wszystkich trybach, usuń reklamy i ciesz się nieograniczonymi sesjami Pandora.';

  @override
  String get premiumPriceMonthly => '€6,99/miesiąc';

  @override
  String get premiumPriceYearly => '€59,99/rok';

  @override
  String get saveWithYearly => 'Zaoszczędzisz €23,89 z planem rocznym!';

  @override
  String get monthly => 'Miesięcznie';

  @override
  String get yearly => 'Rocznie';

  @override
  String get billedMonthly => 'Rozliczane miesięcznie';

  @override
  String get billedYearly => 'Rozliczane rocznie';

  @override
  String get premiumFeature1 => '✓ Wszystkie 21 kategorii premium odblokowane';

  @override
  String get premiumFeature2 => '✓ Bez reklam na zawsze';

  @override
  String get premiumFeature3 =>
      '✓ Nielimitowana liczba pytań we wszystkich kategoriach';

  @override
  String get premiumFeature4 =>
      '✓ Pandora: nielimitowana liczba graczy i pytań';

  @override
  String get premiumFeature5 => '✓ Wspierasz dalszy rozwój';

  @override
  String get subscribePremium => 'Subskrybuj Premium';

  @override
  String get subscribe => 'Subskrybuj';

  @override
  String get cancel => 'Anuluj';

  @override
  String get subscriptionActivated =>
      'Premium aktywne! Wszystkie kategorie zostały odblokowane.';

  @override
  String get premiumActivated => 'Premium aktywowane!';

  @override
  String get demoNote =>
      'Demo: subskrypcja zostanie zresetowana po ponownym uruchomieniu aplikacji';

  @override
  String get freeTier => 'Wersja darmowa';

  @override
  String get freeTierDesc =>
      '3 kategorie na tryb (30 pytań każda)\nPodgląd 5 pytań kategorii premium\nReklamy co 7 pytań';

  @override
  String get currentPlan => 'Obecny plan';

  @override
  String get limitReached => 'Osiągnięto limit';

  @override
  String get freeCategoryLimit =>
      'Osiągnąłeś limit 30 pytań w darmowych kategoriach. Ulepsz do Premium, aby uzyskać nielimitowany dostęp!';

  @override
  String get previewLimit =>
      'Zobaczyłeś wszystkie 5 pytań podglądu. Ulepsz do Premium, aby kontynuować!';

  @override
  String get pandoraFreeLimit => 'Limit darmowy';

  @override
  String get pandoraFreeLimitMessage =>
      'Darmowi gospodarze mogą mieć maksymalnie 6 graczy i 12 pytań. Ulepsz do Premium, aby usunąć limity!';

  @override
  String get pandoraUpgradeMessage =>
      'Osiągnąłeś 12 pytań. Ulepsz do Premium, aby kontynuować grę!';

  @override
  String get pandoraMaxPlayers =>
      'Osiągnięto maksymalną liczbę 6 graczy (limit darmowy). Ulepsz do Premium, aby mieć nielimitowaną liczbę graczy!';

  @override
  String get swipeOrTap => 'Przesuń lub stuknij strzałki';

  @override
  String get previous => 'Poprzednie';

  @override
  String get next => 'Następne';

  @override
  String get advertisement => 'Reklama';

  @override
  String get watchAdMessage =>
      'Obejrzyj krótką reklamę, aby kontynuować, albo graj bez reklam z Premium!';

  @override
  String get watchAd => 'Obejrzyj reklamę';

  @override
  String get goAdFree => 'Graj bez reklam z Premium';

  @override
  String get removeAdsForever => 'Usuń reklamy na zawsze';

  @override
  String get adNotReady => 'Reklama nie jest gotowa. Kontynuujemy bez reklamy.';

  @override
  String get adLoadingContinue => 'Ładowanie reklamy... Kontynuuj';

  @override
  String get pricePerMonth => '€6,99/miesiąc lub €59,99/rok';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Nie znaleziono pytań dla kategorii $category w trybie $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Błąd podczas ładowania pytań. Sprawdź swoje połączenie.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Nie udało się załadować pytań: $error';
  }

  @override
  String get howManyPlayers => 'Ilu graczy?';

  @override
  String get players => 'Gracze';

  @override
  String get continueButton => 'Kontynuuj';

  @override
  String get language => 'Język';

  @override
  String languageChanged(Object language) {
    return 'Język został zmieniony na $language';
  }

  @override
  String get profile => 'Profil';

  @override
  String get signOut => 'Wyloguj się';

  @override
  String get notSignedIn => 'Nie zalogowano';

  @override
  String get signInSignUp => 'Zaloguj się / Załóż konto';

  @override
  String get signInToSync =>
      'Zaloguj się, aby zsynchronizować subskrypcję na wszystkich urządzeniach i odblokować treści premium';

  @override
  String get signOutConfirm => 'Na pewno chcesz się wylogować?';

  @override
  String get signedOutSuccess => 'Pomyślnie wylogowano';

  @override
  String get accountInformation => 'Informacje o koncie';

  @override
  String get email => 'E-mail';

  @override
  String get memberSince => 'Użytkownik od';

  @override
  String get notAvailable => 'Niedostępne';

  @override
  String get unknown => 'Nieznane';

  @override
  String get subscriptionStatus => 'Status subskrypcji';

  @override
  String get premiumMember => 'Użytkownik Premium';

  @override
  String get freeAccount => 'Konto darmowe';

  @override
  String get welcomeToConnect => 'Witamy w Connect!';

  @override
  String get continueWithApple => 'Kontynuuj z Apple';

  @override
  String get continueWithGoogle => 'Kontynuuj z Google';

  @override
  String get skipForNow => 'Pomiń na razie';

  @override
  String get byContining =>
      'Kontynuując, akceptujesz nasze Warunki korzystania i Politykę prywatności';

  @override
  String get googleSignInFailed =>
      'Logowanie przez Google nie powiodło się. Spróbuj ponownie.';

  @override
  String get appleSignInFailed =>
      'Logowanie przez Apple nie powiodło się. Spróbuj ponownie.';

  @override
  String get noCategoriesFound => 'Nie znaleziono kategorii';

  @override
  String get welcomeBack => 'Witaj ponownie!';

  @override
  String get createAccount => 'Utwórz konto';

  @override
  String get displayName => 'Nazwa wyświetlana';

  @override
  String get password => 'Hasło';

  @override
  String get signIn => 'Zaloguj się';

  @override
  String get signUp => 'Zarejestruj się';

  @override
  String get dontHaveAccount => 'Nie masz konta? Zarejestruj się';

  @override
  String get alreadyHaveAccount => 'Masz już konto? Zaloguj się';

  @override
  String get chooseYourMode => '1. Wybierz tryb';

  @override
  String get chooseYourModeDesc =>
      'Wybierz jedno z pięciu wyjątkowych doświadczeń rozmowy:\n\n• Para – intymne pytania, które pogłębiają waszą relację\n• Przyjaciele – zabawne, angażujące tematy idealne dla twojej paczki\n• Rodzina – ciepłe, bezpieczne rozmowy dla wszystkich pokoleń\n• Osobisty – twórz własne, niestandardowe talie pytań (Premium)\n• Pandora – kooperacyjna gra wieloosobowa z pytaniami w czasie rzeczywistym';

  @override
  String get pickCategory => '2. Wybierz kategorię';

  @override
  String get pickCategoryDesc =>
      'Każdy tryb oferuje wiele kategorii ze starannie dobranymi taliami pytań:\n\n• Darmowe: 3 kategorie na tryb (30 pytań każda)\n• Podgląd Premium: pierwsze 5 pytań kategorii premium\n• Premium: ponad 24 kategorie (75 pytań każda)\n• Osobisty: twórz nieograniczoną liczbę własnych talii z pytaniami';

  @override
  String get startTalking => '3. Zacznij grać';

  @override
  String get startTalkingDesc =>
      'Pytania wyświetlane są na pełnym ekranie, aby ułatwić skupioną rozmowę. Na zmianę czytajcie i odpowiadajcie szczerze – nie ma złych odpowiedzi! Celem jest prawdziwe połączenie i dobra zabawa.\n\nW trybie Pandora: wszyscy gracze wysyłają pytania anonimowo, a potem wszyscy odpowiadają razem w czasie rzeczywistym.';

  @override
  String get navigateQuestions => '4. Nawigacja po pytaniach';

  @override
  String get navigateQuestionsDesc =>
      '• Przesuń w dowolnym kierunku lub stuknij strzałki, aby zmienić pytanie\n• Stuknij ikonę serca ❤️, aby zapisać ulubione\n• Premium: stuknij ikonę listy pytań (w prawym górnym rogu), aby przeskoczyć do dowolnego pytania\n• Stuknij przycisk strony głównej, aby w każdej chwili wrócić do głównego menu';

  @override
  String get premiumFeatures => '5. Funkcje Premium';

  @override
  String get premiumFeaturesDesc =>
      'Odblokuj pełne doświadczenie Connect:\n\n• Miesięcznie: €6,99/miesiąc\n• Rocznie: €59,99/rok (oszczędzasz 29%!)\n\n✓ Wszystkie 24+ kategorie premium we wszystkich trybach\n✓ 75 pytań na kategorię (zamiast 30 w wersji darmowej)\n✓ Bez reklam na zawsze\n✓ Pandora: nielimitowana liczba graczy i pytań\n✓ Osobisty: twórz nieograniczoną liczbę własnych talii\n✓ Nawigacja po pytaniach – przeskakuj do dowolnego pytania\n✓ Wspierasz dalszy rozwój aplikacji';

  @override
  String get proTips => 'Wskazówki';

  @override
  String get proTipsDesc =>
      '• Stwórz komfortowe miejsce bez rozpraszaczy\n• Słuchaj aktywnie i bądź obecny\n• Dziel się szczerze i zachęcaj innych do tego samego\n• Szanuj granice – można pomijać pytania\n• Używaj serca ❤️, aby zapisywać ulubione pytania\n• Testuj różne tryby na różne okazje\n• Pandora idealnie nadaje się na imprezy i wieczory w grupie\n• Baw się dobrze i ciesz się rozmową!';

  @override
  String get aboutCredits => 'O aplikacji / Autorzy';

  @override
  String get developedBy => 'Stworzono przez TechyKoala';

  @override
  String get learnMore =>
      'Dowiedz się więcej o nas i nadchodzących aplikacjach';

  @override
  String get visitWebsite => 'Odwiedź techykoala.com';

  @override
  String get madeWithLove => 'Stworzone z ❤️ dla wartościowych rozmów';

  @override
  String get personal => 'Osobisty';

  @override
  String get personalDesc => 'Twórz własne, niestandardowe talie pytań';

  @override
  String get gameComplete => 'Gra zakończona!';

  @override
  String get noMoreQuestions =>
      'Przeszedłeś przez wszystkie pytania w tej talii!';

  @override
  String get playAgain => 'Zagraj ponownie';

  @override
  String get mainMenu => 'Menu główne';

  @override
  String get thanksForPlaying => 'Dziękujemy za grę!';

  @override
  String get hopeYouHadFun => 'Mamy nadzieję, że dobrze się bawiłeś! 🎉';

  @override
  String get backToMenu => 'Wróć do menu';

  @override
  String get leaveGame => 'Opuścić grę?';

  @override
  String get leaveGameMessage =>
      'Na pewno chcesz wyjść? Gra będzie kontynuowana dla pozostałych graczy.';

  @override
  String get leave => 'Opuść';

  @override
  String get noQuestionsAvailable => 'Brak dostępnych pytań';

  @override
  String get showLess => 'Pokaż mniej';

  @override
  String get readMore => 'Pokaż więcej';

  @override
  String get tapToPlay => 'Stuknij, aby zagrać';

  @override
  String get favorites => 'Ulubione';

  @override
  String get pandoraHostCreatePin => 'Gospodarz tworzy sesję i udostępnia PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'Gracze dołączają (maks. 6 w wersji darmowej, nielimitowani w Premium)';

  @override
  String get pandoraHostSetsTimer =>
      'Gospodarz ustawia czas na pytanie (1–15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Wszyscy wysyłają pytania (maks. 12 w wersji darmowej)';

  @override
  String get pandoraHostControls => 'Gospodarz kontroluje przebieg gry';

  @override
  String get pandoraQuestionsDeleted => 'Pytania są usuwane po zakończeniu gry';

  @override
  String get pandoraHost => 'Gospodarz';

  @override
  String get pandoraJoinGame => 'Dołącz do gry';

  @override
  String get pandoraPandoraBox => 'Puszka Pandory';

  @override
  String get pleaseEnterName => 'Wpisz swoje imię';

  @override
  String get hostSuffix => '(Gospodarz)';

  @override
  String get playersJoinWithNames => 'Gracze dołączają, używając swoich imion';

  @override
  String get everyoneSubmitsMin5 =>
      'Wszyscy wysyłają pytania (min. 5, maks. 12 w wersji darmowej)';

  @override
  String get createSession => 'Utwórz sesję';

  @override
  String get creating => 'Tworzenie...';

  @override
  String get yourName => 'Twoje imię';

  @override
  String get enterDisplayName => 'Wpisz nazwę wyświetlaną';

  @override
  String get howItWorks => 'Jak to działa';

  @override
  String get pinCopied => 'PIN skopiowany do schowka!';

  @override
  String get endSession => 'Zakończyć sesję?';

  @override
  String get endSessionConfirm => 'Na pewno chcesz zakończyć tę sesję Pandora?';

  @override
  String get createCustomDeck => 'Utwórz własną talię';

  @override
  String get deckName => 'Nazwa talii';

  @override
  String get enterDeckName => 'Wpisz nazwę talii';

  @override
  String get create => 'Utwórz';

  @override
  String get deckCreated => 'Talia utworzona!';

  @override
  String get failedToCreateDeck => 'Nie udało się utworzyć talii';

  @override
  String get deleteDeck => 'Usunąć talię?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Na pewno chcesz usunąć „$deckName”? To usunie wszystkie pytania w tej talii.';
  }

  @override
  String get delete => 'Usuń';

  @override
  String get deckDeleted => 'Talia usunięta';

  @override
  String get failedToDeleteDeck => 'Nie udało się usunąć talii';

  @override
  String get myDecks => 'Moje talie';

  @override
  String get noDecksYet => 'Brak talii';

  @override
  String get createFirstDeck => 'Utwórz swoją pierwszą własną talię!';

  @override
  String questionsCount(Object count) {
    return '$count pytań';
  }

  @override
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pytań',
      one: '1 pytanie',
      zero: '0 pytań',
    );
    return '$_temp0';
  }

  @override
  String get questionAdded => 'Pytanie dodane!';

  @override
  String get failedToAddQuestion => 'Nie udało się dodać pytania';

  @override
  String get editQuestion => 'Edytuj pytanie';

  @override
  String get enterYourQuestion => 'Wpisz swoje pytanie';

  @override
  String get save => 'Zapisz';

  @override
  String get questionUpdated => 'Pytanie zaktualizowane!';

  @override
  String get failedToUpdateQuestion => 'Nie udało się zaktualizować pytania';

  @override
  String get deleteQuestion => 'Usuń pytanie';

  @override
  String get deleteQuestionConfirm => 'Na pewno chcesz usunąć to pytanie?';

  @override
  String get questionDeleted => 'Pytanie usunięte';

  @override
  String get failedToDeleteQuestion => 'Nie udało się usunąć pytania';

  @override
  String get addQuestion => 'Dodaj pytanie';

  @override
  String get typeQuestionHere => 'Wpisz tutaj swoje pytanie...';

  @override
  String get add => 'Dodaj';

  @override
  String get noQuestionsYet => 'Nie ma jeszcze pytań';

  @override
  String get addFirstQuestion => 'Dodaj swoje pierwsze pytanie!';

  @override
  String get deckDescLoveTalks =>
      'Odkrywaj romantyzm, chemię i bliskość dzięki pytaniom, które celebrują waszą relację. Od momentów „jak się poznaliśmy” po to, co sprawia, że czujesz się najbardziej kochany – te karty pogłębiają intymność emocjonalną.';

  @override
  String get deckDescDeepTalks =>
      'Te karty zagłębiają się w wartości, wrażliwość i to, co znaczy wspólnie się rozwijać. Pomagają partnerom zastanowić się nad niezależnością, komunikacją i wspólnym celem.';

  @override
  String get deckDescSpicyTalks =>
      'Zadziorne, odważne i intymne — te karty zapraszają pary do wspólnego odkrywania pragnień, fantazji i namiętności. Każde pytanie zaprojektowano tak, by rozpalało szczere, ekscytujące rozmowy o tym, co was kręci i zbliża.';

  @override
  String get deckDescDoYouDareTalks =>
      'Bezkompromisowa talia, która łączy emocjonalną szczerość z trudnymi tematami, takimi jak zaufanie, religia, pieniądze czy osobiste granice — wszystko po to, by odkryć, co naprawdę jest dla was ważne. *Uwaga:* niektóre pytania są surowe i nieocenzurowane — grajcie z otwartością, empatią i szacunkiem.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Zainspirowana pięcioma językami miłości talia pomaga partnerom wyrażać uczucia w sposób, który naprawdę trafia do drugiej osoby. Odkryjcie, jak słowa, działania i gesty mogą wzmocnić waszą więź.';

  @override
  String get deckDescSillyTalks =>
      'Czysta zabawa i mnóstwo śmiechu! Te lekkie, zakręcone pytania wyciągają na wierzch wasze najdziwniejsze nawyki i najśmieszniejsze myśli. Idealne dla przyjaciół, rodziny lub par, które nie traktują życia zbyt poważnie.';

  @override
  String get deckDescCarTalks =>
      'Idealne na podróże samochodem — te karty zamieniają czas za kierownicą w świetne rozmowy. Spodziewaj się zabawnych, kreatywnych i nostalgicznych pytań o podróże, przygody i dziwactwa.';

  @override
  String get deckDescCozyTalks =>
      'Ciepłe, spokojne rozmowy idealne na przytulne wieczory. Te pytania tworzą komfortowe, pełne serca chwile bliskości.';

  @override
  String get deckDescPartyNight =>
      'Pełne energii pytania zaprojektowane z myślą o grupach. Idealne na imprezy i spotkania ze znajomymi.';

  @override
  String get deckDescUnpopularOpinions =>
      'Talia, która zachęca cię, by powiedzieć na głos to, co wszyscy myślą, ale nikt nie mówi. Od kultury influencerów po normy społeczne — te pytania wywołują szczere dyskusje i zaskakujące perspektywy. Idealne dla przyjaciół z mocnymi opiniami.';

  @override
  String get deckDescPlotTwists =>
      'Ta talia wrzuca was w najśmieszniejsze i najtrudniejsze sytuacje z serii „co byś zrobił, gdyby...?”. Szybkie decyzje, intuicja i mnóstwo śmiechu gwarantowane! Idealna na grupowe wieczory pełne niespodzianek.';

  @override
  String get deckDescAfterDark =>
      'Wejdź w mroczniejszą stronę rozmów z pytaniami, które wywołują dreszcze. Od niepokojących zbiegów okoliczności po scenariusze przetrwania — idealne na późne wieczory z nutą grozy.';

  @override
  String get deckDescHistoryTalks =>
      'Nostalgiczna mieszanka osobistych wspomnień i rodzinnych chwil. Te pytania inspirują do opowieści, śmiechu i odkrywania swoich korzeni. Idealne na rodzinne spotkania lub spokojne wieczory.';

  @override
  String get deckDescTinyTalks =>
      'Stworzone dla rodziców i najmłodszych! Proste, zabawne pytania pomagają dzieciom wyrażać siebie, a rodzicom lepiej zrozumieć ich sposób myślenia. Idealne dla wieku 3–9 lat.';

  @override
  String get deckDescGoodOldDays =>
      'Wybierz się w podróż do przeszłości z pytaniami o cenne wspomnienia, dawne doświadczenia i to, jak „kiedyś to było”. Odpowiednie dla wszystkich pokoleń.';

  @override
  String get deckDescWouldYouRather =>
      'Klasyczne dylematy typu „wolałbyś...?”, które rozkręcają dyskusje i pokazują preferencje. Wybierz między dwiema opcjami i odkryj, co jest dla was ważniejsze.';

  @override
  String get createNewDeck => 'Utwórz nową talię';

  @override
  String get sessionPin => 'PIN sesji';

  @override
  String get joinSession => 'Dołącz do sesji';

  @override
  String get questionSubmitted => 'Pytanie wysłane';

  @override
  String get sessionCancelled => 'Sesja anulowana';

  @override
  String get yourQuestion => 'Twoje pytanie';

  @override
  String get reactionBreakdown => 'Podsumowanie reakcji';

  @override
  String get deckNameHint => 'Nazwa talii';

  @override
  String get deckCreatedSuccess => 'Talia utworzona!';

  @override
  String get cancelSession => 'Anulować sesję?';

  @override
  String get cancelSessionConfirm =>
      'To anuluje sesję dla wszystkich graczy. Na pewno?';

  @override
  String get no => 'Nie';

  @override
  String get yesCancel => 'Tak, anuluj';

  @override
  String get hostQuestionCollection => 'Gospodarz – zbieranie pytań';

  @override
  String get questionCollection => 'Zbieranie pytań';

  @override
  String get endSessionButton => 'Zakończ sesję';

  @override
  String get noActiveSubscription => 'Brak aktywnej subskrypcji';

  @override
  String get premium => 'PREMIUM';

  @override
  String notEnoughQuestions(Object count) {
    return 'Za mało pytań. Wymagane co najmniej 5. (Obecnie: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Funkcja Premium';

  @override
  String get questionNavigationPremium =>
      'Nawigacja po pytaniach jest funkcją Premium. Zasubskrybuj, aby odblokować możliwość przeskakiwania do dowolnego pytania!';

  @override
  String get customDecks => 'Własne talie';

  @override
  String get noDecksYetMessage => 'Brak talii';

  @override
  String get createFirstDeckMessage =>
      'Stuknij +, aby utworzyć swoją pierwszą talię';

  @override
  String get signInRequired => 'Wymagane logowanie';

  @override
  String get signInToUsePersonal =>
      'Zaloguj się, aby używać trybu Osobistego i tworzyć własne talie pytań.';

  @override
  String get collaborativeQuestionGame => 'Kooperacyjna gra w pytania';

  @override
  String get hostPandoraSession => 'Gospodarz: sesja Pandora';

  @override
  String get joinPandoraGame => 'Dołącz do gry';

  @override
  String get yourDisplayName => 'Twoja nazwa wyświetlana';

  @override
  String get enterYourName => 'Wpisz swoje imię';

  @override
  String get selectQuestion => 'Wybierz pytanie';

  @override
  String get joinTime => 'Czas na dołączenie';

  @override
  String get participants => 'Uczestnicy';

  @override
  String get loading => 'Ładowanie...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Potrzebnych jest co najmniej 2 graczy ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Przejdź do ustawień timera';

  @override
  String get setQuestionTimer => 'Ustaw czas na pytanie';

  @override
  String get questionCollectionTime => 'Czas na zbieranie pytań';

  @override
  String get minutes => 'minuty';

  @override
  String get sessionWillEnd =>
      'Sesja zakończy się automatycznie, jeśli nie będziesz kontynuować w ciągu 5 minut';

  @override
  String get startQuestionCollection => 'Rozpocznij zbieranie pytań';

  @override
  String questionsSubmitted(int count) {
    return 'Wysłano $count pytań';
  }

  @override
  String get writeQuestionHere => 'Wpisz tutaj swoje pytanie...';

  @override
  String get whoIsThisFor => 'Dla kogo jest to pytanie?';

  @override
  String get everyone => 'Dla wszystkich';

  @override
  String get specific => 'Dla konkretnej osoby';

  @override
  String get submitQuestion => 'Wyślij pytanie';

  @override
  String needMoreQuestions(int count) {
    return 'Potrzeba jeszcze $count pytań';
  }

  @override
  String get startGame => 'Rozpocznij grę';

  @override
  String get selectPlayer => 'Wybierz gracza';

  @override
  String get unsubscribe => 'Anuluj subskrypcję';

  @override
  String get unsubscribeConfirm => 'Anulować subskrypcję Premium?';

  @override
  String get unsubscribeWarning =>
      'Stracisz dostęp do wszystkich funkcji Premium, w tym nielimitowanych pytań, wszystkich kategorii, braku reklam i nielimitowanej liczby graczy w trybie Pandora. Zawsze możesz ponownie zasubskrybować.';

  @override
  String get yesUnsubscribe => 'Tak, anuluj';

  @override
  String get unsubscribeSuccess =>
      'Subskrypcja anulowana. Funkcje Premium zostały wyłączone.';

  @override
  String get unsubscribeError => 'Nie udało się anulować subskrypcji';

  @override
  String get questions => 'pytania';

  @override
  String get preview => 'podgląd';

  @override
  String get userId => 'ID użytkownika';

  @override
  String get subscription => 'Subskrypcja';

  @override
  String get questionsCount75 => '75 pytań';

  @override
  String get questionsCount30 => '30 pytań';

  @override
  String get questionsCount5Preview => 'Podgląd 5 pytań';

  @override
  String get unlockFullDeck => 'Odblokuj 75 pytań';

  @override
  String get renameDeck => 'Zmień nazwę talii';

  @override
  String get deckRenamed => 'Zmieniono nazwę talii';

  @override
  String get failedToRenameDeck => 'Nie udało się zmienić nazwy talii';

  @override
  String get shuffleQuestions => 'Wymieszaj pytania';

  @override
  String get resetOrder => 'Zresetuj kolejność';

  @override
  String get questionsShuffled => 'Pytania wymieszane!';

  @override
  String get orderReset => 'Kolejność przywrócona do oryginalnej';

  @override
  String get readyToPlay => 'Gotowy do gry';

  @override
  String get longPressReorder =>
      'Przytrzymaj i przeciągnij, aby zmienić kolejność pytań';

  @override
  String get noFavoritesYet => 'Brak ulubionych';

  @override
  String get heartQuestionsDuringGameplay =>
      'Stuknij serce ❤️ na kartach z pytaniami podczas gry, aby zapisać je tutaj!';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Dodaj co najmniej $count pytań, aby rozpocząć grę!';
  }

  @override
  String get heartQuestionsInfo =>
      'Oznaczaj pytania sercem podczas gry, aby dodać je do Ulubionych!';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Dodaj co najmniej $count pytań, aby zagrać tę talię';
  }

  @override
  String get removeFromFavorites => 'Usuń z ulubionych';

  @override
  String get unlockEverything => 'Odblokuj wszystko';

  @override
  String get premiumSubtitle =>
      'Uzyskaj nielimitowany dostęp do wszystkich kategorii, usuń reklamy na zawsze i odblokuj funkcje Premium';

  @override
  String get save32Percent => 'OSZCZĘDŹ 29%';

  @override
  String get priceMonthly => '€6,99/miesiąc';

  @override
  String get priceYearly => '€59,99/rok';

  @override
  String get billedAnnually => 'Rozliczane rocznie';

  @override
  String get equivalentMonthly => 'Tylko 5 €/miesiąc';

  @override
  String get feature24Categories =>
      'Ponad 24 kategorie premium odblokowane we wszystkich trybach';

  @override
  String get feature75Questions =>
      '75 pytań na kategorię (zamiast 30 w wersji darmowej)';

  @override
  String get featureNoAds => 'Brak reklam na zawsze – nieprzerwana rozgrywka';

  @override
  String get featureUnlimitedPlayers =>
      'Tryb Pandora: nielimitowana liczba graczy i pytań';

  @override
  String get featureQuestionNavigation =>
      'Nawigacja i przeskakiwanie do dowolnego pytania podczas gry';

  @override
  String get featureSupportDevelopment =>
      'Wspierasz dalszy rozwój i nowe funkcje';

  @override
  String get error => 'Błąd';

  @override
  String get premiumActivatedMessage =>
      'Premium aktywowane! Wszystkie kategorie zostały odblokowane.';

  @override
  String get featurePersonalDecks =>
      'Tryb Osobisty: twórz nieograniczoną liczbę własnych talii z pytaniami';

  @override
  String get premiumPersonal =>
      'Tryb Osobisty z własnymi taliami jest funkcją Premium. Ulepsz do Premium, aby tworzyć i grać w swoje własne talie pytań!';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Na pewno chcesz usunąć „$deckName”? To usunie wszystkie pytania w tej talii.';
  }

  @override
  String needMore(int count) {
    return 'Potrzeba jeszcze $count';
  }

  @override
  String get editQuestions => 'Edytuj pytania';

  @override
  String get addMore => 'Dodaj więcej';

  @override
  String useMyConnectEmail(String email) {
    return 'Użyj mojego e-maila Connect: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Darmowi użytkownicy mogą mieć maksymalnie 6 graczy. Ulepsz do Premium, aby mieć nielimitowaną liczbę graczy!';

  @override
  String get freemiumQuestionLimit =>
      'Darmowi użytkownicy mogą wysłać maksymalnie 12 pytań. Ulepsz do Premium, aby mieć nielimitowaną liczbę pytań!';

  @override
  String get yourQuestions => 'Twoje pytania';

  @override
  String waitingForHost(int count) {
    return 'Oczekiwanie na gospodarza... ($count graczy)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Ulepsz do Premium, aby mieć nielimitowaną liczbę graczy';

  @override
  String get kickPlayer => 'Usuń gracza';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Na pewno chcesz usunąć „$playerName” z sesji?';
  }

  @override
  String get kick => 'Usuń';

  @override
  String playerKicked(String playerName) {
    return '$playerName został usunięty z sesji';
  }

  @override
  String get failedToKickPlayer => 'Nie udało się usunąć gracza';

  @override
  String get cancelSessionForAll =>
      'To anuluje sesję dla wszystkich graczy. Na pewno?';

  @override
  String get youWereKicked => 'Zostałeś usunięty z sesji';

  @override
  String get you => 'Ty';

  @override
  String get loginRequiredForPandora =>
      'Logowanie jest wymagane, aby zagrać w trybie Pandora';

  @override
  String get login => 'Zaloguj się';

  @override
  String get loginRequiredNote =>
      'Logowanie jest wymagane, aby grać w trybie Pandora (aby poprawnie śledzić graczy)';

  @override
  String get timeIsUp => 'Czas minął!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Nie wysłano wystarczającej liczby pytań ($current/$minimum minimum).';
  }

  @override
  String get sessionQuestionLimit => 'Osiągnięto limit pytań sesji';

  @override
  String get sessionQuestionLimitMessage =>
      'Ta sesja osiągnęła limit 12 pytań (darmowy gospodarz). Ulepsz do Premium, aby mieć nielimitowaną liczbę pytań!';

  @override
  String sessionQuestionCount(int current) {
    return 'Sesja: $current/12 pytań';
  }

  @override
  String get pleaseEnterQuestion => 'Wpisz pytanie';

  @override
  String get rateThisDeck => 'Oceń tę talię';

  @override
  String get yourRating => 'Twoja ocena';

  @override
  String get skip => 'Pomiń';

  @override
  String get submit => 'Wyślij';

  @override
  String get thankYouForFeedback => 'Dziękujemy za opinię!';

  @override
  String get failedToSubmitRating => 'Nie udało się wysłać oceny';

  @override
  String get tapStarsToRate => 'Stuknij gwiazdki, aby ocenić';

  @override
  String get downloadForOffline => 'Pobierz do użytku offline';

  @override
  String get downloading => 'Pobieranie...';

  @override
  String get downloadedLanguages => 'Pobrane języki';

  @override
  String get languageNotDownloaded => 'Język nie został pobrany';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'Nie pobrałeś języka $languageName do użytku offline.\n\nPrzejdź do Ustawienia > Profil > \"Pobierz do użytku offline\" będąc połączonym z internetem.';
  }

  @override
  String get offlineLanguageError =>
      'Ten język nie został pobrany do użytku offline. Przejdź do Ustawienia > Profil > \"Pobierz do użytku offline\" będąc połączonym z internetem.';

  @override
  String get downloadComplete => 'Pobieranie zakończone!';

  @override
  String get downloadCompleteMessage =>
      'Cała zawartość została pobrana do użytku offline.';

  @override
  String get addedToFavorites => 'Dodano do ulubionych';

  @override
  String get removedFromFavorites => 'Usunięto z ulubionych';

  @override
  String get errorSavingFavorite => 'Błąd podczas zapisywania ulubionego';

  @override
  String get internetRequired => 'Wymagane połączenie z internetem';

  @override
  String get internetRequiredMessage =>
      'Niektóre funkcje wymagają połączenia z internetem. Użytkownicy Premium mogą pobierać treści do użytku offline w Ustawieniach.';

  @override
  String get goPremium => 'Przejdź na Premium';

  @override
  String get pleaseEnterPin => 'Wpisz 6-cyfrowy PIN';

  @override
  String errorOccurred(String error) {
    return 'Błąd: $error';
  }

  @override
  String get errorCreatingSession => 'Błąd podczas tworzenia sesji';

  @override
  String get sessionTimedOut => 'Sesja wygasła - gospodarz nie ustawił timera';

  @override
  String get errorStarting => 'Błąd podczas uruchamiania';

  @override
  String get errorLoadingParticipants => 'Błąd podczas ładowania uczestników';

  @override
  String get sessionCancelledByHost => 'Sesja anulowana przez gospodarza';

  @override
  String needAtLeast5Questions(int count) {
    return 'Potrzeba co najmniej 5 pytań, aby rozpocząć! (Obecnie: $count)';
  }

  @override
  String get errorStartingGame => 'Błąd podczas uruchamiania gry';

  @override
  String get questionsAsked => 'Zadane pytania';

  @override
  String get totalReactions => 'Łączna liczba reakcji';

  @override
  String get mostLovedQuestion => 'Najbardziej lubiane pytanie';

  @override
  String get mostFunQuestion => 'Najzabawniejsze pytanie';

  @override
  String get mostShockingQuestion => 'Najbardziej szokujące pytanie';

  @override
  String get mostLitQuestion => 'Najbardziej ogień pytanie';

  @override
  String get hotSeatAward => 'Nagroda Hot Seat';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Błąd: nie można zidentyfikować gracza. Dołącz ponownie do sesji.';

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
