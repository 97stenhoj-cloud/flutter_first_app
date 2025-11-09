// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Starten';

  @override
  String get settings => 'Einstellungen';

  @override
  String get howToPlay => 'Wie man spielt';

  @override
  String get chooseGameMode => 'Wähle deinen Spielmodus';

  @override
  String get family => 'Familie';

  @override
  String get couple => 'Paar';

  @override
  String get friends => 'Freunde';

  @override
  String get chooseCategory => 'Wähle eine Kategorie';

  @override
  String get locked => 'Premium-Kategorie';

  @override
  String get lockedMessage =>
      'Dies ist eine Premium-Kategorie. Upgrade, um alle Kategorien freizuschalten und Werbung zu entfernen!';

  @override
  String get previewAvailable => 'Vorschau: Erste 5 Fragen verfügbar';

  @override
  String get upgradeNow => 'Jetzt upgraden';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Vielleicht später';

  @override
  String get getPremium => 'Premium holen';

  @override
  String get premiumTitle => 'Alles freischalten';

  @override
  String get premiumDescription =>
      'Erhalte unbegrenzten Zugang zu allen Kategorien in allen Modi, entferne Werbung und genieße unbegrenzte Pandora-Sitzungen.';

  @override
  String get premiumPriceMonthly => '49 DKK/Monat';

  @override
  String get premiumPriceYearly => '399 DKK/Jahr';

  @override
  String get saveWithYearly => 'Spare 189 DKK mit dem Jahresabo!';

  @override
  String get monthly => 'Monatlich';

  @override
  String get yearly => 'Jährlich';

  @override
  String get billedMonthly => 'Monatlich abgerechnet';

  @override
  String get billedYearly => 'Jährlich abgerechnet';

  @override
  String get premiumFeature1 => '✓ Alle 21 Premium-Kategorien freigeschaltet';

  @override
  String get premiumFeature2 => '✓ Keine Werbung für immer';

  @override
  String get premiumFeature3 => '✓ 75 Fragen in allen Kategorien';

  @override
  String get premiumFeature4 => '✓ Pandora: Unbegrenzte Spieler & Fragen';

  @override
  String get premiumFeature5 => '✓ Unterstütze die laufende Entwicklung';

  @override
  String get subscribePremium => 'Premium abonnieren';

  @override
  String get subscribe => 'Abonnieren';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get subscriptionActivated =>
      'Premium aktiviert! Alle Kategorien freigeschaltet.';

  @override
  String get premiumActivated => 'Premium aktiviert!';

  @override
  String get demoNote =>
      'Demo: Abonnement wird beim Neustart der App zurückgesetzt';

  @override
  String get freeTier => 'Kostenlose Version';

  @override
  String get freeTierDesc =>
      '3 Kategorien pro Modus (je 30 Fragen)\n5-Fragen-Vorschau für Premium-Kategorien\nWerbung alle 7 Fragen';

  @override
  String get currentPlan => 'Aktueller Plan';

  @override
  String get limitReached => 'Limit erreicht';

  @override
  String get freeCategoryLimit =>
      'Du hast das 30-Fragen-Limit für kostenlose Kategorien erreicht. Upgrade auf Premium für unbegrenzten Zugang!';

  @override
  String get previewLimit =>
      'Du hast alle 5 Vorschau-Fragen gesehen. Upgrade auf Premium, um fortzufahren!';

  @override
  String get pandoraFreeLimit => 'Kostenloses Limit';

  @override
  String get pandoraFreeLimitMessage =>
      'Kostenlose Hosts können max. 6 Spieler und 12 Fragen haben. Upgrade auf Premium für unbegrenzt!';

  @override
  String get pandoraUpgradeMessage =>
      'Du hast 12 Fragen erreicht. Upgrade auf Premium, um weiterzuspielen!';

  @override
  String get pandoraMaxPlayers =>
      'Maximum von 6 Spielern erreicht (kostenloses Limit). Upgrade auf Premium für unbegrenzte Spieler!';

  @override
  String get swipeOrTap => 'Wischen oder Pfeile antippen';

  @override
  String get previous => 'Zurück';

  @override
  String get next => 'Weiter';

  @override
  String get advertisement => 'Werbung';

  @override
  String get watchAdMessage =>
      'Schaue eine kurze Werbung, um fortzufahren, oder werde werbefrei mit Premium!';

  @override
  String get watchAd => 'Werbung ansehen';

  @override
  String get goAdFree => 'Werbefrei mit Premium';

  @override
  String get removeAdsForever => 'Werbung für immer entfernen';

  @override
  String get adNotReady => 'Werbung nicht bereit. Fahre ohne Werbung fort.';

  @override
  String get adLoadingContinue => 'Werbung lädt... Fortfahren';

  @override
  String get pricePerMonth => '49 DKK/Monat oder 399 DKK/Jahr';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Keine Fragen für $category im $mode-Modus gefunden';
  }

  @override
  String get errorLoadingQuestions =>
      'Fehler beim Laden der Fragen. Bitte überprüfe deine Verbindung.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Fragen konnten nicht geladen werden: $error';
  }

  @override
  String get madeForWife => 'Gemacht für meine wunderschöne Frau';

  @override
  String get otiLia => 'Otilia Stenhøj';

  @override
  String get withLoveAndConversations => 'Mit Liebe und Gesprächen';

  @override
  String get howManyPlayers => 'Wie viele Spieler?';

  @override
  String get players => 'Spieler';

  @override
  String get continueButton => 'Weiter';

  @override
  String get language => 'Sprache';

  @override
  String languageChanged(Object language) {
    return 'Sprache geändert zu $language';
  }

  @override
  String get profile => 'Profil';

  @override
  String get signOut => 'Abmelden';

  @override
  String get notSignedIn => 'Nicht angemeldet';

  @override
  String get signInSignUp => 'Anmelden / Registrieren';

  @override
  String get signInToSync =>
      'Melde dich an, um dein Abonnement auf allen Geräten zu synchronisieren und Premium-Inhalte freizuschalten';

  @override
  String get signOutConfirm =>
      'Bist du sicher, dass du dich abmelden möchtest?';

  @override
  String get signedOutSuccess => 'Erfolgreich abgemeldet';

  @override
  String get accountInformation => 'Kontoinformationen';

  @override
  String get email => 'E-Mail';

  @override
  String get memberSince => 'Mitglied seit';

  @override
  String get notAvailable => 'Nicht verfügbar';

  @override
  String get unknown => 'Unbekannt';

  @override
  String get subscriptionStatus => 'Abonnementstatus';

  @override
  String get premiumMember => 'Premium-Mitglied';

  @override
  String get freeAccount => 'Kostenloses Konto';

  @override
  String get welcomeToConnect => 'Willkommen bei Connect!';

  @override
  String get continueWithApple => 'Mit Apple fortfahren';

  @override
  String get continueWithGoogle => 'Mit Google fortfahren';

  @override
  String get skipForNow => 'Vorerst überspringen';

  @override
  String get byContining =>
      'Indem du fortfährst, stimmst du unseren Nutzungsbedingungen und Datenschutzrichtlinien zu';

  @override
  String get googleSignInFailed =>
      'Google-Anmeldung fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get appleSignInFailed =>
      'Apple-Anmeldung fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get noCategoriesFound => 'Keine Kategorien gefunden';

  @override
  String get aboutCredits => 'Über / Credits';

  @override
  String get welcomeBack => 'Willkommen zurück!';

  @override
  String get createAccount => 'Konto erstellen';

  @override
  String get displayName => 'Anzeigename';

  @override
  String get password => 'Passwort';

  @override
  String get signIn => 'Anmelden';

  @override
  String get signUp => 'Registrieren';

  @override
  String get dontHaveAccount => 'Noch kein Konto? Registrieren';

  @override
  String get alreadyHaveAccount => 'Bereits ein Konto? Anmelden';

  @override
  String get chooseYourMode => '1. Wähle deinen Modus';

  @override
  String get chooseYourModeDesc =>
      'Wähle aus drei Gesprächsstilen:\n\n• Familie - Warme, gesunde Gespräche perfekt für alle Altersgruppen\n• Paar - Intime und romantische Fragen, um eure Verbindung zu vertiefen\n• Freunde - Spaßige und unterhaltsame Themen für deine Gruppe';

  @override
  String get pickCategory => '2. Wähle eine Kategorie';

  @override
  String get pickCategoryDesc =>
      'Jeder Modus hat mehrere Kategorien mit einzigartigen Fragenpaketen. 3 kostenlose Kategorien pro Modus (je 30 Fragen), mit 5-Fragen-Vorschauen von Premium-Kategorien.';

  @override
  String get startTalking => '3. Fang an zu reden';

  @override
  String get startTalkingDesc =>
      'Fragen erscheinen im Vollbild. Wechselt euch ab beim Lesen und ehrlichen Beantworten. Es gibt keine falschen Antworten - das Ziel ist ein bedeutungsvolles Gespräch!';

  @override
  String get navigateQuestions => '4. Navigiere durch die Fragen';

  @override
  String get navigateQuestionsDesc =>
      '• Wische nach rechts oder tippe auf \"Weiter\" für die nächste Frage\n• Wische nach links oder tippe auf \"Zurück\", um Fragen erneut anzusehen\n• Tippe auf den Home-Button, um jederzeit zum Hauptmenü zurückzukehren';

  @override
  String get premiumFeatures => '5. Premium-Funktionen';

  @override
  String get premiumFeaturesDesc =>
      'Schalte alle 24 Kategorien mit Premium frei:\n\n• Monatlich: 49 DKK/Monat\n• Jährlich: 399 DKK/Jahr (spare 189 DKK!)\n\n✓ Alle Kategorien freigeschaltet\n✓ Keine Werbung\n✓ Unbegrenzte Fragen\n✓ Unbegrenzte Pandora-Sitzungen';

  @override
  String get proTips => 'Profi-Tipps';

  @override
  String get proTipsDesc =>
      '• Schaffe eine bequeme, ablenkungsfreie Umgebung\n• Höre aktiv zu und sei präsent\n• Teile ehrlich und ermutige andere, dasselbe zu tun\n• Respektiere Grenzen - überspringe Fragen bei Bedarf\n• Habe Spaß und genieße die Verbindung!';

  @override
  String get personal => 'Persönlich';

  @override
  String get personalDesc =>
      'Erstelle deine eigenen benutzerdefinierten Fragendecks';

  @override
  String get gameComplete => 'Spiel abgeschlossen!';

  @override
  String get noMoreQuestions =>
      'Du hast alle Fragen in diesem Deck durchgegangen!';

  @override
  String get playAgain => 'Nochmal spielen';

  @override
  String get mainMenu => 'Hauptmenü';

  @override
  String get thanksForPlaying => 'Danke fürs Spielen!';

  @override
  String get hopeYouHadFun => 'Hoffe, du hattest Spaß! 🎉';

  @override
  String get backToMenu => 'Zurück zum Menü';

  @override
  String get leaveGame => 'Spiel verlassen?';

  @override
  String get leaveGameMessage =>
      'Bist du sicher, dass du gehen möchtest? Das Spiel wird für andere Spieler fortgesetzt.';

  @override
  String get leave => 'Verlassen';

  @override
  String get noQuestionsAvailable => 'Keine Fragen verfügbar';

  @override
  String get showLess => 'Weniger anzeigen';

  @override
  String get readMore => 'Mehr lesen';

  @override
  String get tapToPlay => 'Zum Spielen antippen';

  @override
  String get favorites => 'Favoriten';

  @override
  String get pandoraHostCreatePin => 'Gastgeber erstellt Sitzung und teilt PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'Spieler treten bei (max. 6 kostenlos, unbegrenzt premium)';

  @override
  String get pandoraHostSetsTimer =>
      'Gastgeber stellt Fragen-Timer ein (1-15 Min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Jeder reicht Fragen ein (max. 12 kostenlos)';

  @override
  String get pandoraHostControls => 'Gastgeber steuert Spielverlauf';

  @override
  String get pandoraQuestionsDeleted => 'Fragen nach Spiel gelöscht';

  @override
  String get pandoraHost => 'Gastgeber';

  @override
  String get pandoraJoinGame => 'Spiel beitreten';

  @override
  String get pandoraPandoraBox => 'Pandora Box';

  @override
  String get pleaseEnterName => 'Bitte gib deinen Namen ein';

  @override
  String get hostSuffix => '(Gastgeber)';

  @override
  String get playersJoinWithNames => 'Spieler treten mit ihren Namen bei';

  @override
  String get everyoneSubmitsMin5 =>
      'Jeder reicht Fragen ein (min 5, max 12 kostenlos)';

  @override
  String get createSession => 'Sitzung erstellen';

  @override
  String get creating => 'Erstelle...';

  @override
  String get yourName => 'Dein Name';

  @override
  String get enterDisplayName => 'Gib deinen Anzeigenamen ein';

  @override
  String get howItWorks => 'Wie es funktioniert';

  @override
  String get pinCopied => 'PIN in Zwischenablage kopiert!';

  @override
  String get endSession => 'Sitzung beenden?';

  @override
  String get endSessionConfirm =>
      'Bist du sicher, dass du diese Pandora-Sitzung beenden möchtest?';

  @override
  String get createCustomDeck => 'Benutzerdefiniertes Deck erstellen';

  @override
  String get deckName => 'Deck-Name';

  @override
  String get enterDeckName => 'Deck-Namen eingeben';

  @override
  String get create => 'Erstellen';

  @override
  String get deckCreated => 'Deck erstellt!';

  @override
  String get failedToCreateDeck => 'Deck konnte nicht erstellt werden';

  @override
  String get deleteDeck => 'Deck löschen?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Bist du sicher, dass du $deckName löschen möchtest? Dies wird alle Fragen in diesem Deck löschen.';
  }

  @override
  String get delete => 'Löschen';

  @override
  String get deckDeleted => 'Deck gelöscht';

  @override
  String get failedToDeleteDeck => 'Deck konnte nicht gelöscht werden';

  @override
  String get myDecks => 'Meine Decks';

  @override
  String get noDecksYet => 'Noch keine Decks';

  @override
  String get createFirstDeck =>
      'Erstelle dein erstes benutzerdefiniertes Deck!';

  @override
  String questionsCount(Object count) {
    return '$count Fragen';
  }

  @override
  String questionCount(int count) {
    return '$count Frage';
  }

  @override
  String get questionAdded => 'Frage hinzugefügt!';

  @override
  String get failedToAddQuestion => 'Frage konnte nicht hinzugefügt werden';

  @override
  String get editQuestion => 'Frage bearbeiten';

  @override
  String get enterYourQuestion => 'Gib deine Frage ein';

  @override
  String get save => 'Speichern';

  @override
  String get questionUpdated => 'Frage aktualisiert!';

  @override
  String get failedToUpdateQuestion => 'Frage konnte nicht aktualisiert werden';

  @override
  String get deleteQuestion => 'Frage löschen';

  @override
  String get deleteQuestionConfirm =>
      'Bist du sicher, dass du diese Frage löschen möchtest?';

  @override
  String get questionDeleted => 'Frage gelöscht';

  @override
  String get failedToDeleteQuestion => 'Frage konnte nicht gelöscht werden';

  @override
  String get addQuestion => 'Frage hinzufügen';

  @override
  String get typeQuestionHere => 'Schreibe deine Frage hier...';

  @override
  String get add => 'Hinzufügen';

  @override
  String get noQuestionsYet => 'Noch keine Fragen';

  @override
  String get addFirstQuestion => 'Füge deine erste Frage hinzu!';

  @override
  String get deckDescLoveTalks =>
      'Erkunde Romantik, Chemie und Verbindung durch herzliche Fragen, die eure Beziehung feiern. Von Momenten wie wir uns trafen bis zu dem, was euch am meisten geliebt fühlen lässt, vertiefen diese Karten die emotionale Intimität.';

  @override
  String get deckDescDeepTalks =>
      'Diese Karten tauchen ein in Werte, Verletzlichkeit und was es bedeutet, gemeinsam zu wachsen. Sie helfen Partnern, über Unabhängigkeit, Kommunikation und gemeinsame Ziele nachzudenken.';

  @override
  String get deckDescSpicyTalks =>
      'Flirtend, mutig und intim - diese Karten laden Paare ein, gemeinsam Begehren, Fantasien und Leidenschaft zu erkunden. Jede Frage ist darauf ausgerichtet, ehrliche, aufregende Gespräche darüber zu entfachen, was euch anturnt und näher bringt.';

  @override
  String get deckDescDoYouDareTalks =>
      'Ein furchtloses Deck, das emotionale Ehrlichkeit mit heiklen Themen wie Vertrauen, Religion, Geld und persönlichen Grenzen verbindet - alles darauf ausgelegt, zu enthüllen, was euch beiden wirklich wichtig ist. *Hinweis:* Einige Fragen sind roh und ungefiltert - spielt mit Offenheit, Empathie und Respekt.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspiriert von den fünf Liebessprachen hilft dieses Deck Partnern, Zuneigung auf Arten auszudrücken, die wirklich ankommen. Entdecke, wie Worte, Handlungen und Gesten eure Verbindung stärker machen.';

  @override
  String get deckDescSillyTalks =>
      'Purer Spaß und Gelächter! Diese skurrilen, leichtherzigen Fragen decken eure seltsamsten Gewohnheiten und lustigsten Gedanken auf. Perfekt für Freunde, Familie oder Paare, die das Leben nicht zu ernst nehmen.';

  @override
  String get deckDescCarTalks =>
      'Perfekt für Roadtrips - diese Karten verwandeln Fahrzeit in tolle Gespräche. Erwarte lustige, kreative und nostalgische Fragen über Reisen, Abenteuer und Eigenheiten.';

  @override
  String get deckDescCozyTalks =>
      'Warme, entspannte Gespräche perfekt für gemütliche Abende. Diese Fragen schaffen komfortable, herzliche Momente der Verbindung.';

  @override
  String get deckDescPartyNight =>
      'Energiegeladene Fragen für lustige Gruppenumgebungen. Perfekt für Partys und gesellige Zusammenkünfte mit Freunden.';

  @override
  String get deckDescUnpopularOpinions =>
      'Das Deck, das dich herausfordert, zu sagen, was jeder denkt, aber niemand zugibt. Von Influencer-Kultur bis zu sozialen Normen - diese Karten entfachen ehrliche Debatten und überraschende Perspektiven. Perfekt für Freunde mit Meinungen.';

  @override
  String get deckDescPlotTwists =>
      'Dieses Deck wirft dich direkt in die lustigsten und schwierigsten Momente des Lebens. Schnelles Denken, Bauchgefühl und Gelächter garantiert! Perfekt für Gruppenabende voller Überraschungen und Lacher.';

  @override
  String get deckDescAfterDark =>
      'Tauche ein in die dunkle Seite der Konversation mit Fragen, die dir eine Gänsehaut bereiten. Von gruseligen Zufällen bis zu Überlebensszenarien - perfekt für späte Nächte mit einem Nervenkitzel.';

  @override
  String get deckDescHistoryTalks =>
      'Eine nostalgische Mischung aus persönlichen Erinnerungen und Familienmomenten. Diese Fragen inspirieren Geschichten, Gelächter und das Wiederentdecken eurer Wurzeln. Perfekt für Familientreffen oder gemütliche Abende.';

  @override
  String get deckDescTinyTalks =>
      'Entwickelt für Eltern und Kleine! Diese einfachen, verspielten Fragen helfen Kindern, sich auszudrücken, während Eltern lernen, wie sie denken. Perfekt für 3-9 Jahre.';

  @override
  String get deckDescGoodOldDays =>
      'Reise zurück in die Zeit mit Fragen über geschätzte Erinnerungen, vergangene Erfahrungen und wie die Dinge früher waren. Perfekt für alle Altersgruppen.';

  @override
  String get deckDescWouldYouRather =>
      'Klassische Dilemma-Fragen, die Debatten auslösen und Präferenzen offenbaren. Wähle zwischen zwei Optionen und entdecke, was am wichtigsten ist.';

  @override
  String get createNewDeck => 'Neues Deck erstellen';

  @override
  String get sessionPin => 'Sitzungs-PIN';

  @override
  String get joinSession => 'Sitzung beitreten';

  @override
  String get questionSubmitted => 'Frage eingereicht';

  @override
  String get sessionCancelled => 'Sitzung abgebrochen';

  @override
  String get yourQuestion => 'Deine Frage';

  @override
  String get reactionBreakdown => 'Reaktionsübersicht';

  @override
  String get deckNameHint => 'Deck-Name';

  @override
  String get deckCreatedSuccess => 'Deck erstellt!';

  @override
  String get cancelSession => 'Sitzung abbrechen?';

  @override
  String get cancelSessionConfirm =>
      'Dies wird die Sitzung für alle Spieler abbrechen. Bist du sicher?';

  @override
  String get no => 'Nein';

  @override
  String get yesCancel => 'Ja, abbrechen';

  @override
  String get hostQuestionCollection => 'Host – Fragensammlung';

  @override
  String get questionCollection => 'Fragensammlung';

  @override
  String get endSessionButton => 'Sitzung beenden';

  @override
  String get noActiveSubscription => 'Kein aktives Abonnement';

  @override
  String get premium => 'Premium';

  @override
  String notEnoughQuestions(Object count) {
    return 'Not enough questions. Minimum 5 required. (Currently: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Premium-Funktion';

  @override
  String get questionNavigationPremium =>
      'Die Fragennavigation ist eine Premium-Funktion. Abonnieren Sie, um die Möglichkeit freizuschalten, zu jeder Frage zu springen!';

  @override
  String get customDecks => 'Benutzerdefinierte Decks';

  @override
  String get noDecksYetMessage => 'Noch keine Decks';

  @override
  String get createFirstDeckMessage =>
      'Tippe auf +, um dein erstes Deck zu erstellen';

  @override
  String get signInRequired => 'Anmeldung Erforderlich';

  @override
  String get signInToUsePersonal =>
      'Bitte melden Sie sich an, um den persönlichen Modus zu verwenden und benutzerdefinierte Fragenkarten zu erstellen.';

  @override
  String get collaborativeQuestionGame => 'Kollaboratives Fragenspiel';

  @override
  String get hostPandoraSession => 'Pandora-Sitzung Hosten';

  @override
  String get joinPandoraGame => 'Einem Spiel Beitreten';

  @override
  String get yourDisplayName => 'Dein Anzeigename';

  @override
  String get enterYourName => 'Gib deinen Namen ein';

  @override
  String get selectQuestion => 'Frage Auswählen';

  @override
  String get joinTime => 'Zeit zum Beitreten';

  @override
  String get participants => 'Teilnehmer';

  @override
  String get loading => 'Wird geladen...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Mindestens 2 Spieler erforderlich ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Weiter zur Timer-Einrichtung';

  @override
  String get setQuestionTimer => 'Fragen-Timer einstellen';

  @override
  String get questionCollectionTime => 'Fragensammlungszeit';

  @override
  String get minutes => 'Minuten';

  @override
  String get sessionWillEnd =>
      'Die Sitzung endet automatisch, wenn du nicht innerhalb von 5 Minuten fortfährst';

  @override
  String get startQuestionCollection => 'Fragensammlung starten';

  @override
  String questionsSubmitted(int count) {
    return '$count Fragen eingereicht';
  }

  @override
  String get writeQuestionHere => 'Schreibe deine Frage hier...';

  @override
  String get whoIsThisFor => 'Für wen ist das?';

  @override
  String get everyone => 'Alle';

  @override
  String get specific => 'Spezifisch';

  @override
  String get submitQuestion => 'Frage einreichen';

  @override
  String needMoreQuestions(int count) {
    return 'Benötigt noch $count weitere Fragen';
  }

  @override
  String get startGame => 'Spiel starten';

  @override
  String get selectPlayer => 'Wähle einen Spieler';

  @override
  String get unsubscribe => 'Abbestellen';

  @override
  String get unsubscribeConfirm => 'Premium-Abonnement kündigen?';

  @override
  String get unsubscribeWarning =>
      'Sie verlieren den Zugriff auf alle Premium-Funktionen, einschließlich unbegrenzter Fragen, aller Kategorien, werbefreier Nutzung und unbegrenzter Pandora-Spieler. Sie können sich jederzeit wieder anmelden.';

  @override
  String get yesUnsubscribe => 'Ja, abbestellen';

  @override
  String get unsubscribeSuccess =>
      'Erfolgreich abgemeldet. Premium-Funktionen wurden deaktiviert.';

  @override
  String get unsubscribeError => 'Abmeldung fehlgeschlagen';

  @override
  String get questions => 'Fragen';

  @override
  String get preview => 'Vorschau';

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

  @override
  String get renameDeck => 'Rename Deck';

  @override
  String get deckRenamed => 'Deck renamed successfully';

  @override
  String get failedToRenameDeck => 'Failed to rename deck';

  @override
  String get shuffleQuestions => 'Shuffle Questions';

  @override
  String get resetOrder => 'Reset Order';

  @override
  String get questionsShuffled => 'Questions shuffled!';

  @override
  String get orderReset => 'Order reset to original';

  @override
  String get readyToPlay => 'Ready to play';

  @override
  String get longPressReorder => 'Long press and drag to reorder questions';

  @override
  String get noFavoritesYet => 'No favorites yet';

  @override
  String get heartQuestionsDuringGameplay =>
      'Tap the heart ❤️ on question cards during gameplay to save them here!';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Add at least $count questions to start playing!';
  }

  @override
  String get heartQuestionsInfo =>
      'Heart questions during gameplay to add them to your Favorites!';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Add at least $count questions to play this deck';
  }

  @override
  String get removeFromFavorites => 'Remove from favorites';

  @override
  String get unlockEverything => 'Unlock Everything';

  @override
  String get premiumSubtitle =>
      'Get unlimited access to all categories, remove ads forever, and unlock premium features';

  @override
  String get save32Percent => 'SAVE 32%';

  @override
  String get priceMonthly => '49 DKK/month';

  @override
  String get priceYearly => '399 DKK/year';

  @override
  String get billedAnnually => 'Billed annually';

  @override
  String get equivalentMonthly => 'Only 33 DKK/month';

  @override
  String get feature24Categories =>
      '24+ premium categories unlocked across all modes';

  @override
  String get feature75Questions =>
      '75 questions per category (vs 30 in free tier)';

  @override
  String get featureNoAds => 'No ads forever - uninterrupted gameplay';

  @override
  String get featureUnlimitedPlayers =>
      'Pandora mode: Unlimited players & questions';

  @override
  String get featureQuestionNavigation =>
      'Navigate & jump to any question during play';

  @override
  String get featureSupportDevelopment =>
      'Support ongoing development & new features';

  @override
  String get error => 'Error';

  @override
  String get premiumActivatedMessage =>
      'Premium activated! All categories unlocked.';

  @override
  String get featurePersonalDecks =>
      'Personal mode: Create unlimited custom decks with your own questions';

  @override
  String get premiumPersonal =>
      'Personal mode with custom decks is a premium feature. Upgrade to Premium to create and play your own custom question decks!';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Are you sure you want to delete \"$deckName\"? This will delete all questions in this deck.';
  }

  @override
  String needMore(int count) {
    return 'Need $count';
  }

  @override
  String get editQuestions => 'Edit Questions';

  @override
  String get addMore => 'Add More';

  @override
  String useMyConnectEmail(String email) {
    return 'Use my Connect email: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Free users can have max 6 players. Upgrade to Premium for unlimited players!';

  @override
  String get freemiumQuestionLimit =>
      'Free users can submit max 12 questions. Upgrade to Premium for unlimited questions!';

  @override
  String get yourQuestions => 'Your questions';

  @override
  String waitingForHost(int count) {
    return 'Waiting for host... ($count players)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Upgrade to Premium for Unlimited Players';

  @override
  String get kickPlayer => 'Kick Player';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Are you sure you want to kick \"$playerName\" from the session?';
  }

  @override
  String get kick => 'Kick';

  @override
  String playerKicked(String playerName) {
    return '$playerName has been kicked from the session';
  }

  @override
  String get failedToKickPlayer => 'Failed to kick player';

  @override
  String get cancelSessionForAll =>
      'This will cancel the session for all players. Are you sure?';
}
