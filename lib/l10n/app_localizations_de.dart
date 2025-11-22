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
  String get start => 'Start';

  @override
  String get settings => 'Einstellungen';

  @override
  String get howToPlay => 'Spielanleitung';

  @override
  String get chooseGameMode => 'Wähle deinen Spielmodus';

  @override
  String get family => 'Familie';

  @override
  String get couple => 'Paar';

  @override
  String get friends => 'Freunde';

  @override
  String get chooseCategory => 'Kategorie wählen';

  @override
  String get locked => 'Premium-Kategorie';

  @override
  String get lockedMessage =>
      'Dies ist eine Premium-Kategorie. Upgrade, um alle Kategorien freizuschalten und Werbung zu entfernen!';

  @override
  String get previewAvailable => 'Vorschau: Die ersten 5 Fragen sind verfügbar';

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
      'Erhalte unbegrenzten Zugriff auf alle Kategorien in allen Modi, entferne Werbung und genieße unbegrenzte Pandora-Sitzungen.';

  @override
  String get premiumPriceMonthly => '€6,99/Monat';

  @override
  String get premiumPriceYearly => '€59,99/Jahr';

  @override
  String get saveWithYearly => 'Spare €23,89 mit dem Jahresabo!';

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
  String get premiumFeature2 => '✓ Für immer keine Werbung';

  @override
  String get premiumFeature3 => '✓ 75 Fragen in allen Kategorien';

  @override
  String get premiumFeature4 => '✓ Pandora: Unbegrenzte Spieler & Fragen';

  @override
  String get premiumFeature5 => '✓ Unterstützung der weiteren Entwicklung';

  @override
  String get subscribePremium => 'Premium abonnieren';

  @override
  String get subscribe => 'Abonnieren';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get subscriptionActivated =>
      'Premium aktiviert! Alle Kategorien sind freigeschaltet.';

  @override
  String get premiumActivated => 'Premium aktiviert!';

  @override
  String get demoNote =>
      'Demo: Das Abonnement wird beim Neustart der App zurückgesetzt';

  @override
  String get freeTier => 'Kostenlose Stufe';

  @override
  String get freeTierDesc =>
      '3 Kategorien pro Modus (30 Fragen pro Kategorie)\n5-Fragen-Vorschauen der Premium-Kategorien\nWerbung alle 7 Fragen';

  @override
  String get currentPlan => 'Aktueller Plan';

  @override
  String get limitReached => 'Limit erreicht';

  @override
  String get freeCategoryLimit =>
      'Du hast das Limit von 30 Fragen für kostenlose Kategorien erreicht. Upgrade auf Premium für unbegrenzten Zugriff!';

  @override
  String get previewLimit =>
      'Du hast alle 5 Vorschaufragen gesehen. Upgrade auf Premium, um fortzufahren!';

  @override
  String get pandoraFreeLimit => 'Kostenloses Limit';

  @override
  String get pandoraFreeLimitMessage =>
      'Kostenlose Hosts können maximal 6 Spieler und 12 Fragen haben. Upgrade auf Premium für unbegrenzten Zugang!';

  @override
  String get pandoraUpgradeMessage =>
      'Du hast 12 Fragen erreicht. Upgrade auf Premium, um weiterzuspielen!';

  @override
  String get pandoraMaxPlayers =>
      'Maximale Anzahl von 6 Spielern erreicht (kostenloses Limit). Upgrade auf Premium für unbegrenzte Spieler!';

  @override
  String get swipeOrTap => 'Wische oder tippe auf die Pfeile';

  @override
  String get previous => 'Zurück';

  @override
  String get next => 'Weiter';

  @override
  String get advertisement => 'Werbung';

  @override
  String get watchAdMessage =>
      'Sieh dir eine kurze Werbung an, um fortzufahren, oder werde mit Premium werbefrei!';

  @override
  String get watchAd => 'Werbung ansehen';

  @override
  String get goAdFree => 'Werbefrei mit Premium';

  @override
  String get removeAdsForever => 'Werbung für immer entfernen';

  @override
  String get adNotReady => 'Werbung nicht bereit. Es geht ohne Werbung weiter.';

  @override
  String get adLoadingContinue => 'Werbung wird geladen... Fortfahren';

  @override
  String get pricePerMonth => '€6,99/Monat oder €59,99/Jahr';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Keine Fragen für $category im Modus $mode gefunden';
  }

  @override
  String get errorLoadingQuestions =>
      'Fehler beim Laden der Fragen. Bitte überprüfe deine Verbindung.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Fragen konnten nicht geladen werden: $error';
  }

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
      'Melde dich an, um dein Abonnement über Geräte hinweg zu synchronisieren und Premium-Inhalte freizuschalten';

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
  String get skipForNow => 'Für jetzt überspringen';

  @override
  String get byContining =>
      'Indem du fortfährst, stimmst du unseren Nutzungsbedingungen und unserer Datenschutzrichtlinie zu';

  @override
  String get googleSignInFailed =>
      'Google-Anmeldung fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get appleSignInFailed =>
      'Apple-Anmeldung fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String get noCategoriesFound => 'Keine Kategorien gefunden';

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
      'Wähle aus fünf einzigartigen Gesprächserlebnissen:\n\n• Paar – Intime Fragen, um eure romantische Verbindung zu vertiefen\n• Freunde – Lustige und spannende Themen, perfekt für deine Clique\n• Familie – Warme, familienfreundliche Gespräche für alle Altersgruppen\n• Persönlich – Erstelle deine eigenen individuellen Fragekarten (Premium)\n• Pandora – Kollaboratives Multiplayer-Spiel mit Fragen in Echtzeit';

  @override
  String get pickCategory => '2. Wähle eine Kategorie';

  @override
  String get pickCategoryDesc =>
      'Jeder Modus bietet mehrere Kategorien mit kuratierten Fragenpaketen:\n\n• Kostenlos: 3 Kategorien pro Modus (30 Fragen pro Kategorie)\n• Premium-Vorschau: Die ersten 5 Fragen von Premium-Kategorien\n• Premium: 24+ Kategorien (75 Fragen pro Kategorie)\n• Persönlich: Erstelle unbegrenzt eigene Kartensets mit deinen Fragen';

  @override
  String get startTalking => '3. Starte das Spiel';

  @override
  String get startTalkingDesc =>
      'Fragen werden im Vollbild angezeigt, damit ihr euch voll auf das Gespräch konzentrieren könnt. Wechselt euch ab mit Vorlesen und ehrlichem Antworten – es gibt keine falschen Antworten! Ziel ist eine echte Verbindung und Spaß.\n\nIm Pandora-Modus: Alle Spieler reichen anonym Fragen ein, die dann in Echtzeit gemeinsam beantwortet werden.';

  @override
  String get navigateQuestions => '4. Fragen navigieren';

  @override
  String get navigateQuestionsDesc =>
      '• Wische in eine beliebige Richtung oder tippe auf die Pfeile, um durch die Fragen zu blättern\n• Tippe auf das ❤️-Symbol, um Favoriten zu speichern\n• Premium: Tippe auf das Fragenlisten-Symbol (oben rechts), um zu einer beliebigen Frage zu springen\n• Tippe auf die Home-Taste, um jederzeit zum Hauptmenü zurückzukehren';

  @override
  String get premiumFeatures => '5. Premium-Funktionen';

  @override
  String get premiumFeaturesDesc =>
      'Schalte das vollständige Connect-Erlebnis frei:\n\n• Monatlich: €6,99/Monat\n• Jährlich: €59,99/Jahr (Spare 29 %!)\n\n✓ Alle 24+ Premium-Kategorien in allen Modi\n✓ 75 Fragen pro Kategorie (vs. 30 kostenlos)\n✓ Für immer keine Werbung\n✓ Pandora: Unbegrenzte Spieler & Fragen\n✓ Persönlich: Unbegrenzte eigene Kartensets\n✓ Fragennavigation – springe zu jeder Frage\n✓ Unterstützung der weiteren Entwicklung';

  @override
  String get proTips => 'Profi-Tipps';

  @override
  String get proTipsDesc =>
      '• Schafft eine gemütliche, ablenkungsfreie Umgebung\n• Höre aktiv zu und sei präsent\n• Teile ehrlich und ermutige andere dazu\n• Respektiere Grenzen – es ist okay, Fragen zu überspringen\n• Nutze Favoriten ❤️, um Lieblingsfragen zu speichern\n• Probiere verschiedene Modi für verschiedene Anlässe aus\n• Pandora eignet sich perfekt für Partys und Gruppenevents\n• Hab Spaß und genieße die Verbindung!';

  @override
  String get aboutCredits => 'Über / Credits';

  @override
  String get developedBy => 'Entwickelt von TechyKoala';

  @override
  String get learnMore => 'Erfahre mehr über uns und kommende Apps';

  @override
  String get visitWebsite => 'Besuche techykoala.com';

  @override
  String get madeWithLove => 'Mit ❤️ gemacht für bedeutungsvolle Gespräche';

  @override
  String get personal => 'Persönlich';

  @override
  String get personalDesc => 'Erstelle deine eigenen individuellen Fragekarten';

  @override
  String get gameComplete => 'Spiel abgeschlossen!';

  @override
  String get noMoreQuestions =>
      'Du hast alle Fragen in diesem Set durchgespielt!';

  @override
  String get playAgain => 'Noch einmal spielen';

  @override
  String get mainMenu => 'Hauptmenü';

  @override
  String get thanksForPlaying => 'Danke fürs Spielen!';

  @override
  String get hopeYouHadFun => 'Wir hoffen, du hattest Spaß! 🎉';

  @override
  String get backToMenu => 'Zurück zum Menü';

  @override
  String get leaveGame => 'Spiel verlassen?';

  @override
  String get leaveGameMessage =>
      'Bist du sicher, dass du das Spiel verlassen möchtest? Das Spiel läuft für die anderen Spieler weiter.';

  @override
  String get leave => 'Verlassen';

  @override
  String get noQuestionsAvailable => 'Keine Fragen verfügbar';

  @override
  String get showLess => 'Weniger anzeigen';

  @override
  String get readMore => 'Mehr anzeigen';

  @override
  String get tapToPlay => 'Zum Spielen tippen';

  @override
  String get favorites => 'Favoriten';

  @override
  String get pandoraHostCreatePin =>
      'Host erstellt eine Sitzung und teilt die PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'Spieler treten bei (max. 6 kostenlos, unbegrenzt mit Premium)';

  @override
  String get pandoraHostSetsTimer =>
      'Host stellt den Fragetimer ein (1–15 Min.)';

  @override
  String get pandoraEveryoneSubmits =>
      'Alle reichen Fragen ein (max. 12 kostenlos)';

  @override
  String get pandoraHostControls => 'Der Host steuert den Spielfortschritt';

  @override
  String get pandoraQuestionsDeleted => 'Fragen werden nach dem Spiel gelöscht';

  @override
  String get pandoraHost => 'Host';

  @override
  String get pandoraJoinGame => 'Spiel beitreten';

  @override
  String get pandoraPandoraBox => 'Pandoras Box';

  @override
  String get pleaseEnterName => 'Bitte gib deinen Namen ein';

  @override
  String get hostSuffix => '(Host)';

  @override
  String get playersJoinWithNames => 'Spieler treten mit ihrem Namen bei';

  @override
  String get everyoneSubmitsMin5 =>
      'Alle reichen Fragen ein (mind. 5, max. 12 kostenlos)';

  @override
  String get createSession => 'Sitzung erstellen';

  @override
  String get creating => 'Erstelle...';

  @override
  String get yourName => 'Dein Name';

  @override
  String get enterDisplayName => 'Gib deinen Anzeigenamen ein';

  @override
  String get howItWorks => 'So funktioniert es';

  @override
  String get pinCopied => 'PIN in die Zwischenablage kopiert!';

  @override
  String get endSession => 'Sitzung beenden?';

  @override
  String get endSessionConfirm =>
      'Bist du sicher, dass du diese Pandora-Sitzung beenden möchtest?';

  @override
  String get createCustomDeck => 'Eigenes Kartenset erstellen';

  @override
  String get deckName => 'Name des Sets';

  @override
  String get enterDeckName => 'Set-Namen eingeben';

  @override
  String get create => 'Erstellen';

  @override
  String get deckCreated => 'Set erstellt!';

  @override
  String get failedToCreateDeck => 'Set konnte nicht erstellt werden';

  @override
  String get deleteDeck => 'Set löschen?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Dadurch werden alle Fragen in diesem Set gelöscht.';
  }

  @override
  String get delete => 'Löschen';

  @override
  String get deckDeleted => 'Set gelöscht';

  @override
  String get failedToDeleteDeck => 'Set konnte nicht gelöscht werden';

  @override
  String get myDecks => 'Meine Sets';

  @override
  String get noDecksYet => 'Noch keine Sets';

  @override
  String get createFirstDeck => 'Erstelle dein erstes eigenes Set!';

  @override
  String questionsCount(Object count) {
    return '$count Fragen';
  }

  @override
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fragen',
      one: '1 Frage',
      zero: '0 Fragen',
    );
    return '$_temp0';
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
  String get typeQuestionHere => 'Gib deine Frage hier ein...';

  @override
  String get add => 'Hinzufügen';

  @override
  String get noQuestionsYet => 'Noch keine Fragen';

  @override
  String get addFirstQuestion => 'Füge deine erste Frage hinzu!';

  @override
  String get deckDescLoveTalks =>
      'Erkunde Romantik, Chemie und Verbindung durch herzliche Fragen, die eure Beziehung feiern. Von \"wie wir uns kennengelernt haben\" bis zu dem, was dich am meisten geliebt fühlen lässt – diese Karten vertiefen eure emotionale Nähe.';

  @override
  String get deckDescDeepTalks =>
      'Diese Karten tauchen in Werte, Verletzlichkeit und gemeinsames Wachstum ein. Sie helfen euch, über Unabhängigkeit, Kommunikation und gemeinsame Ziele nachzudenken.';

  @override
  String get deckDescSpicyTalks =>
      'Flirty, mutig und intim – diese Karten laden Paare ein, Wünsche, Fantasien und Leidenschaft gemeinsam zu erkunden. Jede Frage ist darauf ausgelegt, ehrliche, aufregende Gespräche darüber anzuregen, was euch anmacht und näher zusammenbringt.';

  @override
  String get deckDescDoYouDareTalks =>
      'Ein furchtloses Set, das emotionale Ehrlichkeit mit heiß diskutierten Themen wie Vertrauen, Religion, Geld und persönlichen Grenzen verbindet – alles darauf ausgelegt, zu zeigen, was euch wirklich wichtig ist. *Hinweis:* Einige Fragen sind roh und ungefiltert – spielt mit Offenheit, Empathie und Respekt.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspiriert von den fünf Sprachen der Liebe hilft dieses Set Partnern, Zuneigung auf eine Weise auszudrücken, die wirklich ankommt. Entdeckt, wie Worte, Taten und Gesten eure Verbindung stärken.';

  @override
  String get deckDescSillyTalks =>
      'Reiner Spaß und viel Gelächter! Diese verrückten, leichten Fragen bringen eure seltsamsten Angewohnheiten und lustigsten Gedanken zum Vorschein. Perfekt für Freunde, Familie oder Paare mit Humor.';

  @override
  String get deckDescCarTalks =>
      'Perfekt für Autofahrten – diese Karten machen die Fahrtzeit zu guter Gesprächszeit. Erwarte lustige, kreative und nostalgische Fragen zu Reisen, Abenteuern und kleinen Eigenheiten.';

  @override
  String get deckDescCozyTalks =>
      'Warme, entspannte Gespräche für gemütliche Abende. Diese Fragen schaffen eine vertraute, herzliche Atmosphäre.';

  @override
  String get deckDescPartyNight =>
      'Fragen mit viel Energie für lustige Runden in der Gruppe. Perfekt für Partys und gesellige Abende mit Freunden.';

  @override
  String get deckDescUnpopularOpinions =>
      'Das Set, das dich herausfordert, das zu sagen, was alle denken, aber niemand ausspricht. Von Influencer-Kultur bis zu sozialen Normen – diese Karten lösen ehrliche Diskussionen und überraschende Meinungen aus. Ideal für Freunde mit starken Ansichten.';

  @override
  String get deckDescPlotTwists =>
      'Dieses Set wirft dich direkt in die lustigsten und schwierigsten \"Was würdest du tun?\"-Momente. Spontane Reaktionen, Bauchgefühl und Lacher garantiert!';

  @override
  String get deckDescAfterDark =>
      'Betritt die dunklere Seite der Gespräche mit Fragen, die dir einen Schauer über den Rücken jagen. Von gruseligen Zufällen bis zu Survival-Szenarien – perfekt für späte Abende mit Nervenkitzel.';

  @override
  String get deckDescHistoryTalks =>
      'Eine nostalgische Mischung aus persönlichen Erinnerungen und Familienmomenten. Diese Fragen laden zu Geschichten, Lachen und dem Wiederentdecken eurer Wurzeln ein. Perfekt für Familientreffen oder gemütliche Abende.';

  @override
  String get deckDescTinyTalks =>
      'Entwickelt für Eltern und kleine Kinder! Einfache, spielerische Fragen helfen Kindern, sich auszudrücken, während Eltern lernen, wie sie denken. Perfekt für 3–9 Jahre.';

  @override
  String get deckDescGoodOldDays =>
      'Reist zurück in die Vergangenheit mit Fragen zu schönen Erinnerungen, alten Erfahrungen und „wie es früher war“. Geeignet für alle Altersgruppen.';

  @override
  String get deckDescWouldYouRather =>
      'Klassische Entweder-oder-Fragen, die Diskussionen anregen und Vorlieben offenbaren. Wählt zwischen zwei Optionen und findet heraus, was euch wichtiger ist.';

  @override
  String get createNewDeck => 'Neues Set erstellen';

  @override
  String get sessionPin => 'Sitzungs-PIN';

  @override
  String get joinSession => 'Sitzung beitreten';

  @override
  String get questionSubmitted => 'Frage gesendet';

  @override
  String get sessionCancelled => 'Sitzung abgebrochen';

  @override
  String get yourQuestion => 'Deine Frage';

  @override
  String get reactionBreakdown => 'Reaktionsübersicht';

  @override
  String get deckNameHint => 'Name des Sets';

  @override
  String get deckCreatedSuccess => 'Set erstellt!';

  @override
  String get cancelSession => 'Sitzung abbrechen?';

  @override
  String get cancelSessionConfirm =>
      'Dies bricht die Sitzung für alle Spieler ab. Bist du sicher?';

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
    return 'Nicht genug Fragen. Mindestens 5 erforderlich. (Aktuell: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Premium-Funktion';

  @override
  String get questionNavigationPremium =>
      'Die Fragennavigation ist eine Premium-Funktion. Abonniere, um die Möglichkeit freizuschalten, zu jeder Frage zu springen!';

  @override
  String get customDecks => 'Eigene Sets';

  @override
  String get noDecksYetMessage => 'Noch keine Sets';

  @override
  String get createFirstDeckMessage =>
      'Tippe auf +, um dein erstes Set zu erstellen';

  @override
  String get signInRequired => 'Anmeldung erforderlich';

  @override
  String get signInToUsePersonal =>
      'Bitte melde dich an, um den persönlichen Modus zu nutzen und eigene Frage-Sets zu erstellen.';

  @override
  String get collaborativeQuestionGame => 'Kollaboratives Fragespiel';

  @override
  String get hostPandoraSession => 'Pandora-Sitzung hosten';

  @override
  String get joinPandoraGame => 'Einem Spiel beitreten';

  @override
  String get yourDisplayName => 'Dein Anzeigename';

  @override
  String get enterYourName => 'Gib deinen Namen ein';

  @override
  String get selectQuestion => 'Frage auswählen';

  @override
  String get joinTime => 'Beitrittszeit';

  @override
  String get participants => 'Teilnehmende';

  @override
  String get loading => 'Lädt...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Mindestens 2 Spieler benötigt ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Weiter zur Timer-Einstellung';

  @override
  String get setQuestionTimer => 'Fragetimer einstellen';

  @override
  String get questionCollectionTime => 'Zeit für das Sammeln von Fragen';

  @override
  String get minutes => 'Minuten';

  @override
  String get sessionWillEnd =>
      'Die Sitzung endet automatisch, wenn du nicht innerhalb von 5 Minuten fortfährst';

  @override
  String get startQuestionCollection => 'Fragen sammeln starten';

  @override
  String questionsSubmitted(int count) {
    return '$count Fragen eingereicht';
  }

  @override
  String get writeQuestionHere => 'Schreibe deine Frage hier...';

  @override
  String get whoIsThisFor => 'Für wen ist diese Frage?';

  @override
  String get everyone => 'Alle';

  @override
  String get specific => 'Bestimmte Person';

  @override
  String get submitQuestion => 'Frage einreichen';

  @override
  String needMoreQuestions(int count) {
    return 'Es werden noch $count Fragen benötigt';
  }

  @override
  String get startGame => 'Spiel starten';

  @override
  String get selectPlayer => 'Spieler auswählen';

  @override
  String get unsubscribe => 'Abonnement kündigen';

  @override
  String get unsubscribeConfirm => 'Premium-Abonnement kündigen?';

  @override
  String get unsubscribeWarning =>
      'Du verlierst den Zugriff auf alle Premium-Funktionen, einschließlich unbegrenzter Fragen, aller Kategorien, werbefreier Nutzung und unbegrenzter Pandora-Spieler. Du kannst jederzeit erneut abonnieren.';

  @override
  String get yesUnsubscribe => 'Ja, kündigen';

  @override
  String get unsubscribeSuccess =>
      'Erfolgreich gekündigt. Premium-Funktionen wurden deaktiviert.';

  @override
  String get unsubscribeError => 'Kündigung fehlgeschlagen';

  @override
  String get questions => 'Fragen';

  @override
  String get preview => 'Vorschau';

  @override
  String get userId => 'Benutzer-ID';

  @override
  String get subscription => 'Abonnement';

  @override
  String get questionsCount75 => '75 Fragen';

  @override
  String get questionsCount30 => '30 Fragen';

  @override
  String get questionsCount5Preview => '5 Fragen in der Vorschau';

  @override
  String get unlockFullDeck => '75 Fragen freischalten';

  @override
  String get renameDeck => 'Set umbenennen';

  @override
  String get deckRenamed => 'Set erfolgreich umbenannt';

  @override
  String get failedToRenameDeck => 'Set konnte nicht umbenannt werden';

  @override
  String get shuffleQuestions => 'Fragen mischen';

  @override
  String get resetOrder => 'Reihenfolge zurücksetzen';

  @override
  String get questionsShuffled => 'Fragen gemischt!';

  @override
  String get orderReset =>
      'Reihenfolge auf ursprüngliche Einstellung zurückgesetzt';

  @override
  String get readyToPlay => 'Bereit zum Spielen';

  @override
  String get longPressReorder => 'Zum Neuordnen lange drücken und ziehen';

  @override
  String get noFavoritesYet => 'Noch keine Favoriten';

  @override
  String get heartQuestionsDuringGameplay =>
      'Tippe während des Spiels auf das Herz ❤️, um Fragen hier zu speichern!';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Füge mindestens $count Fragen hinzu, um zu spielen!';
  }

  @override
  String get heartQuestionsInfo =>
      'Markiere Fragen während des Spiels mit einem Herz, um sie zu deinen Favoriten hinzuzufügen!';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Füge mindestens $count Fragen hinzu, um dieses Set zu spielen';
  }

  @override
  String get removeFromFavorites => 'Aus Favoriten entfernen';

  @override
  String get unlockEverything => 'Alles freischalten';

  @override
  String get premiumSubtitle =>
      'Erhalte unbegrenzten Zugriff auf alle Kategorien, entferne Werbung für immer und schalte Premium-Funktionen frei';

  @override
  String get save32Percent => 'SPARE 29 %';

  @override
  String get priceMonthly => '€6,99/Monat';

  @override
  String get priceYearly => '€59,99/Jahr';

  @override
  String get billedAnnually => 'Jährlich abgerechnet';

  @override
  String get equivalentMonthly => 'Nur €5/Monat';

  @override
  String get feature24Categories =>
      '24+ Premium-Kategorien in allen Modi freigeschaltet';

  @override
  String get feature75Questions =>
      '75 Fragen pro Kategorie (vs. 30 im kostenlosen Niveau)';

  @override
  String get featureNoAds =>
      'Für immer keine Werbung – ununterbrochenes Spielerlebnis';

  @override
  String get featureUnlimitedPlayers =>
      'Pandora-Modus: Unbegrenzte Spieler & Fragen';

  @override
  String get featureQuestionNavigation =>
      'Navigiere und springe während des Spiels zu jeder Frage';

  @override
  String get featureSupportDevelopment =>
      'Unterstütze die weitere Entwicklung & neue Funktionen';

  @override
  String get error => 'Fehler';

  @override
  String get premiumActivatedMessage =>
      'Premium aktiviert! Alle Kategorien freigeschaltet.';

  @override
  String get featurePersonalDecks =>
      'Persönlicher Modus: Erstelle unbegrenzte eigene Sets mit deinen Fragen';

  @override
  String get premiumPersonal =>
      'Der persönliche Modus mit eigenen Sets ist eine Premium-Funktion. Upgrade auf Premium, um eigene Frage-Sets zu erstellen und zu spielen!';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Bist du sicher, dass du \"$deckName\" löschen möchtest? Dadurch werden alle Fragen in diesem Set gelöscht.';
  }

  @override
  String needMore(int count) {
    return 'Es fehlen $count';
  }

  @override
  String get editQuestions => 'Fragen bearbeiten';

  @override
  String get addMore => 'Mehr hinzufügen';

  @override
  String useMyConnectEmail(String email) {
    return 'Meine Connect-E-Mail verwenden: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Kostenlose Nutzer können maximal 6 Spieler haben. Upgrade auf Premium für unbegrenzte Spieler!';

  @override
  String get freemiumQuestionLimit =>
      'Kostenlose Nutzer können maximal 12 Fragen einreichen. Upgrade auf Premium für unbegrenzte Fragen!';

  @override
  String get yourQuestions => 'Deine Fragen';

  @override
  String waitingForHost(int count) {
    return 'Warte auf den Host... ($count Spieler)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Upgrade auf Premium für unbegrenzte Spieler';

  @override
  String get kickPlayer => 'Spieler entfernen';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Bist du sicher, dass du \"$playerName\" aus der Sitzung entfernen möchtest?';
  }

  @override
  String get kick => 'Entfernen';

  @override
  String playerKicked(String playerName) {
    return '$playerName wurde aus der Sitzung entfernt';
  }

  @override
  String get failedToKickPlayer => 'Spieler konnte nicht entfernt werden';

  @override
  String get cancelSessionForAll =>
      'Dies wird die Sitzung für alle Spieler abbrechen. Bist du sicher?';

  @override
  String get youWereKicked => 'Du wurdest aus der Sitzung entfernt';

  @override
  String get you => 'Du';

  @override
  String get loginRequiredForPandora =>
      'Für Pandora ist eine Anmeldung erforderlich';

  @override
  String get login => 'Login';

  @override
  String get loginRequiredNote =>
      'Anmeldung ist erforderlich, um Pandora zu spielen (korrekte Spielerzuordnung)';

  @override
  String get timeIsUp => 'Zeit ist um!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Es wurden nicht genug Fragen eingereicht ($current/$minimum Minimum).';
  }

  @override
  String get sessionQuestionLimit => 'Fragenlimit der Sitzung erreicht';

  @override
  String get sessionQuestionLimitMessage =>
      'Diese Sitzung hat das Limit von 12 Fragen erreicht (kostenloser Host). Upgrade auf Premium für unbegrenzte Fragen!';

  @override
  String sessionQuestionCount(int current) {
    return 'Sitzung: $current/12 Fragen';
  }

  @override
  String get pleaseEnterQuestion => 'Bitte gib eine Frage ein';

  @override
  String get rateThisDeck => 'Dieses Set bewerten';

  @override
  String get yourRating => 'Deine Bewertung';

  @override
  String get skip => 'Überspringen';

  @override
  String get submit => 'Senden';

  @override
  String get thankYouForFeedback => 'Danke für dein Feedback!';

  @override
  String get failedToSubmitRating => 'Bewertung konnte nicht gesendet werden';

  @override
  String get tapStarsToRate => 'Tippe auf die Sterne, um zu bewerten';

  @override
  String get downloadForOffline => 'Für Offline herunterladen';

  @override
  String get downloading => 'Wird heruntergeladen...';

  @override
  String get downloadedLanguages => 'Heruntergeladene Sprachen';

  @override
  String get languageNotDownloaded => 'Sprache nicht heruntergeladen';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'Du hast $languageName nicht für die Offline-Nutzung heruntergeladen.\n\nGehe zu Einstellungen > Profil > \"Für Offline herunterladen\", während du mit dem Internet verbunden bist.';
  }

  @override
  String get offlineLanguageError =>
      'Diese Sprache wurde nicht für die Offline-Nutzung heruntergeladen. Gehe zu Einstellungen > Profil > \"Für Offline herunterladen\", während du mit dem Internet verbunden bist.';

  @override
  String get downloadComplete => 'Download abgeschlossen!';

  @override
  String get downloadCompleteMessage =>
      'Alle Inhalte wurden für die Offline-Nutzung heruntergeladen.';

  @override
  String get addedToFavorites => 'Zu Favoriten hinzugefügt';

  @override
  String get removedFromFavorites => 'Aus Favoriten entfernt';

  @override
  String get errorSavingFavorite => 'Fehler beim Speichern des Favoriten';

  @override
  String get internetRequired => 'Internet erforderlich';

  @override
  String get internetRequiredMessage =>
      'Einige Funktionen erfordern eine Internetverbindung. Premium-Nutzer können Inhalte in den Einstellungen für die Offline-Nutzung herunterladen.';

  @override
  String get goPremium => 'Premium holen';

  @override
  String get pleaseEnterPin => 'Bitte gib eine 6-stellige PIN ein';

  @override
  String errorOccurred(String error) {
    return 'Fehler: $error';
  }

  @override
  String get errorCreatingSession => 'Fehler beim Erstellen der Sitzung';

  @override
  String get sessionTimedOut =>
      'Zeitüberschreitung der Sitzung – Host hat keinen Timer gesetzt';

  @override
  String get errorStarting => 'Fehler beim Starten';

  @override
  String get errorLoadingParticipants => 'Fehler beim Laden der Teilnehmer';

  @override
  String get sessionCancelledByHost => 'Sitzung vom Host abgebrochen';

  @override
  String needAtLeast5Questions(int count) {
    return 'Mindestens 5 Fragen erforderlich! (Aktuell: $count)';
  }

  @override
  String get errorStartingGame => 'Fehler beim Starten des Spiels';

  @override
  String get questionsAsked => 'Gestellte Fragen';

  @override
  String get totalReactions => 'Reaktionen insgesamt';

  @override
  String get mostLovedQuestion => 'Beliebteste Frage';

  @override
  String get mostFunQuestion => 'Lustigste Frage';

  @override
  String get mostShockingQuestion => 'Schockierendste Frage';

  @override
  String get mostLitQuestion => 'Coolste Frage';

  @override
  String get hotSeatAward => 'Hot-Seat-Auszeichnung';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Fehler: Spieler konnte nicht identifiziert werden. Bitte tritt der Sitzung erneut bei.';

  @override
  String get createAiDeck => 'AI Deck erstellen';

  @override
  String get whatIsTheOccasion => 'Was ist der Anlass?';

  @override
  String get occasionHint => 'z.B. Geburtstagsparty, Teambuilding, Date-Night';

  @override
  String get whatIsTheMood => 'Wie ist die Stimmung?';

  @override
  String get lighthearted => 'Unbeschwert';

  @override
  String get serious => 'Ernst';

  @override
  String get mixed => 'Gemischt';

  @override
  String get depthOfQuestions => 'Tiefe der Fragen?';

  @override
  String get surfaceLevel => 'Oberfläche';

  @override
  String get deep => 'Tief';

  @override
  String get level => 'Level';

  @override
  String get sizeOfGroup => 'Größe der Gruppe?';

  @override
  String get people => 'Menschen';

  @override
  String get anyOtherRemarks => 'Sonstige Anmerkungen? (optional)';

  @override
  String get remarksHint =>
      'z.B. Familienfreundlich, einige lustige Fragen einfügen';

  @override
  String get generateQuestions => 'Fragen generieren';

  @override
  String get aiDeckPremiumMessage =>
      'Die AI-Deck-Generierung ist eine Premium-Funktion. Upgrade, um unbegrenzt AI-unterstützte Gesprächsdecks zu erstellen!';

  @override
  String get pleaseEnterOccasion => 'Bitte geben Sie den Anlass ein';

  @override
  String errorGeneratingQuestions(String error) {
    return 'Fehler beim Generieren von Fragen: $error';
  }

  @override
  String get generatingAiQuestions => 'Fragen mit AI generieren...';

  @override
  String get generatingMoreQuestions => 'Fragen werden generiert...';

  @override
  String get batchComplete => 'Batch abgeschlossen!';

  @override
  String questionsInDeckMessage(int count) {
    return 'Du hast $count Fragen in deinem Deck. 10 weitere generieren?';
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
    return '$behalten/$max';
  }

  @override
  String questionProgress(int current, int total) {
    return '$current/$total';
  }

  @override
  String batchNumber(int number) {
    return 'Charge #$number';
  }

  @override
  String get imDone => 'Ich bin fertig';

  @override
  String get generateMore => 'Mehr generieren';

  @override
  String get maxQuestionsReached => 'Max Fragen (50)';

  @override
  String get namYourDeck => 'Benennen Sie Ihr Deck';

  @override
  String get goBack => 'Zurück';

  @override
  String get swipeInstructions =>
      'Wische nach rechts, um zu behalten • Wische nach links, um abzulehnen';

  @override
  String get discussionPoint => 'Diskussionspunkt';

  @override
  String get sparkMode => 'Spark-Modus';

  @override
  String get sparkModeSubtitle => 'KI-gestützte Gesprächsöffner';

  @override
  String get sparkPremiumRequired => 'Spark-Modus - Premium-Funktion';

  @override
  String get sparkPremiumMessage =>
      'Der Spark-Modus ist für Premium- und Premium+-Abonnenten verfügbar. Generiere KI-gestützte Gesprächsstarter, die auf deinen Anlass zugeschnitten sind!';

  @override
  String sparkQuestionsRemaining(int remaining, int limit) {
    return '$remaining von $limit Fragen verbleibend';
  }

  @override
  String get howManyQuestions => 'Wie viele Fragen?';

  @override
  String sparkQuestions(int count) {
    return '$count Fragen';
  }

  @override
  String generateSparkQuestions(int count) {
    return 'Generiere $count Fragen';
  }

  @override
  String get sparkLimitReached => 'Monatliches Limit erreicht';

  @override
  String sparkLimitMessage(int remaining, int requested) {
    return 'Sie haben in diesem Monat nur noch $remaining Spark-Fragen übrig. Sie versuchen, $requested Fragen zu generieren.\n\nUpgrade auf Premium+ für 400 Fragen pro Monat!';
  }

  @override
  String get expiresIn24Hours => 'Läuft in 24 Stunden ab';

  @override
  String get alreadyInFavorites => 'Bereits in den Favoriten';

  @override
  String addedToDeck(String deckName) {
    return 'Zu $deckName hinzugefügt!';
  }

  @override
  String get questionAlreadyInDeck => 'Frage bereits in diesem Deck';

  @override
  String get addToDeck => 'Zum Deck hinzufügen';

  @override
  String get favorite => 'Favorit';

  @override
  String get chooseDeck =>
      'Wählen Sie ein Deck aus, um diese Frage hinzuzufügen:';

  @override
  String get noDecksFound => 'Keine Decks gefunden';

  @override
  String get noDecksMessage =>
      'Du hast noch keine benutzerdefinierten Decks. Möchtest du eines erstellen?';

  @override
  String get createDeck => 'Deck erstellen';

  @override
  String get createAndAdd => 'Erstellen & Hinzufügen';

  @override
  String get pleaseEnterDeckName => 'Bitte geben Sie einen Decknamen ein';

  @override
  String get tierBasic => 'Basis';

  @override
  String get tierPremium => 'Premium';

  @override
  String get tierPremiumPlus => 'Premium+';

  @override
  String get tierFree => 'Kostenlos';

  @override
  String get choosePlan => 'Wählen Sie Ihren Plan';

  @override
  String get choosePlanSubtitle =>
      'Premium-Funktionen und KI-gestützte Gespräche freischalten';

  @override
  String get mostPopular => 'AM BELIEBTESTEN';

  @override
  String get perMonth => 'pro Monat';

  @override
  String get forever => 'Für immer';

  @override
  String get continueWithBasic => 'Weiter mit Basic (Kostenlos)';

  @override
  String subscribeTo(String tier) {
    return 'Abonnieren Sie $tier';
  }

  @override
  String get cancelAnytime => 'Jederzeit kündbar. Keine versteckten Gebühren.';

  @override
  String get basicTierTitle => 'Basis';

  @override
  String get basicTierPrice => '€6,99';

  @override
  String get basicTierDescription => 'Zugriff auf alle Spielmodi außer Spark';

  @override
  String get basicFeature1 =>
      'Alle Spielmodi (Paar, Freunde, Familie, Persönlich, Pandora)';

  @override
  String get basicFeature2 => 'Zugang zu allen 24+ Kategorien';

  @override
  String get basicFeature3 => 'Benutzerdefinierte persönliche Decks';

  @override
  String get basicFeature4 => 'Keine Werbung';

  @override
  String get basicFeature5 => 'Fragenavigation';

  @override
  String get premiumTierTitle => 'Premium';

  @override
  String get premiumTierPrice => '€11,99';

  @override
  String get premiumTierDescription => 'Alles in Basic + Spark AI';

  @override
  String get premiumFeature6 => 'Favoriten in persönlichen Decks speichern';

  @override
  String get premiumPlusTierTitle => 'Premium+';

  @override
  String get premiumPlusTierPrice => '€19,99';

  @override
  String get premiumPlusTierDescription => 'Maximale AI-Power';

  @override
  String get premiumPlusFeature1 => 'Alles in Premium';

  @override
  String get premiumPlusFeature2 => '🚀 400 AI-Fragen pro Monat';

  @override
  String get premiumPlusFeature3 => '2,5x mehr Spark-Fragen';

  @override
  String get premiumPlusFeature4 => 'Perfekt für den häufigen Gebrauch';

  @override
  String get premiumPlusFeature5 => 'Prioritätsunterstützung';
}
