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
  String get howToPlay => 'So spielt man';

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
  String get locked => 'Kategorie gesperrt';

  @override
  String get lockedMessage =>
      'Diese Kategorie ist gesperrt. Upgrade auf Premium, um alle Kategorien freizuschalten!';

  @override
  String get previewAvailable => 'Preview: First 5 questions available';

  @override
  String get upgradeNow => 'Upgrade Now';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Vielleicht später';

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
  String get subscribe => 'Abonnieren';

  @override
  String get cancel => 'Abbrechen';

  @override
  String subscriptionActivated(Object bundles) {
    return 'Abonnement aktiviert! $bundles freigeschaltet.';
  }

  @override
  String get premiumActivated =>
      'Premium aktiviert! Werbung entfernt. Paket freigeschaltet.';

  @override
  String get demoNote =>
      'Demo: Die Freischaltungen werden beim Neustart der App zurückgesetzt';

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
  String get swipeOrTap => 'Wische oder tippe auf die Pfeile';

  @override
  String get previous => 'Vorherige';

  @override
  String get next => 'Weiter';

  @override
  String get advertisement => 'Anzeige';

  @override
  String get watchAdMessage =>
      'Sieh dir eine kurze Anzeige an, um fortzufahren, oder gehe mit Premium werbefrei!';

  @override
  String get watchAd => 'Anzeige ansehen';

  @override
  String get goAdFree => 'Werbefrei - 59 DKK/Monat';

  @override
  String get removeAdsForever => 'Werbung für immer entfernen';

  @override
  String get adNotReady => 'Anzeige nicht bereit. Fortfahren ohne Anzeige.';

  @override
  String get adLoadingContinue => 'Anzeige wird geladen... Fortfahren';

  @override
  String get pricePerMonth => '59 DKK/Monat';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Keine Fragen für $category im $mode Modus gefunden';
  }

  @override
  String get errorLoadingQuestions =>
      'Fehler beim Laden der Fragen. Bitte überprüfen Sie Ihre Verbindung.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Fragen konnten nicht geladen werden: $error';
  }

  @override
  String get madeForWife => 'Für meine wunderschöne Frau gemacht';

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
    return 'Sprache auf $language geändert';
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
      'Melde dich an, um deine Abonnements auf verschiedenen Geräten zu synchronisieren und Premium-Inhalte freizuschalten';

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
  String get subscriptionStatus => 'Subscription Status';

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
  String get skipForNow => 'Jetzt überspringen';

  @override
  String get byContining =>
      'Durch die Fortsetzung stimmst du unseren Nutzungsbedingungen und Datenschutzrichtlinien zu';

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
  String get dontHaveAccount => 'Hast du kein Konto? Registrieren';

  @override
  String get alreadyHaveAccount => 'Hast du bereits ein Konto? Anmelden';

  @override
  String get chooseYourMode => '1. Wähle deinen Modus';

  @override
  String get chooseYourModeDesc => 'Wähle aus drei Gesprächsarten:';

  @override
  String get pickCategory => '2. Wähle eine Kategorie';

  @override
  String get pickCategoryDesc =>
      'Jeder Modus hat mehrere Kategorien mit einzigartigen Fragenpaketen. Kostenlose Kategorien sind freigeschaltet, während Premium-Kategorien ein Abonnement erfordern.';

  @override
  String get startTalking => '3. Fang an zu reden';

  @override
  String get startTalkingDesc =>
      'Fragen erscheinen im Vollbildmodus. Lest euch abwechselnd die Fragen vor und beantwortet sie ehrlich. Es gibt keine falschen Antworten - das Ziel ist ein bedeutungsvolles Gespräch!';

  @override
  String get navigateQuestions => '4. Fragen navigieren';

  @override
  String get navigateQuestionsDesc =>
      '• Wische nach rechts oder tippe auf \"Weiter\" für die nächste Frage';

  @override
  String get premiumFeatures => '5. Premium-Funktionen';

  @override
  String get premiumFeaturesDesc =>
      'Schalte exklusive Fragenkategorien mit einem Abonnement frei:';

  @override
  String get proTips => 'Pro Tipps';

  @override
  String get proTipsDesc =>
      '• Schaffe eine angenehme, ablenkungsfreie Umgebung';

  @override
  String get personal => 'Persönlich';

  @override
  String get personalDesc =>
      'Erstelle deine eigenen benutzerdefinierten Fragenkarten';

  @override
  String get gameComplete => 'Spiel abgeschlossen!';

  @override
  String get noMoreQuestions =>
      'Du hast alle Fragen in diesem Deck durchgespielt!';

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
      'Bist du sicher, dass du das Spiel verlassen möchtest? Das Spiel wird für die anderen Spieler fortgesetzt.';

  @override
  String get leave => 'Verlassen';

  @override
  String get noQuestionsAvailable => 'Keine Fragen verfügbar';

  @override
  String get showLess => 'Weniger anzeigen';

  @override
  String get readMore => 'Mehr lesen';

  @override
  String get tapToPlay => 'Tippe zum Spielen';

  @override
  String get favorites => 'Favoriten';

  @override
  String get pandoraHostCreatePin => 'Gast erstellt Sitzung und teilt PIN';

  @override
  String get pandoraPlayersJoinMax => 'Spieler treten bei (max. 15 Minuten)';

  @override
  String get pandoraHostSetsTimer =>
      'Gast stellt den Fragen-Timer ein (1-15 Minuten)';

  @override
  String get pandoraEveryoneSubmits => 'Alle reichen Fragen ein';

  @override
  String get pandoraHostControls => 'Gast steuert den Spielverlauf';

  @override
  String get pandoraQuestionsDeleted => 'Fragen werden nach dem Spiel gelöscht';

  @override
  String get pandoraHost => 'Gast';

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
  String get everyoneSubmitsMin5 => 'Jeder reicht Fragen ein (mind. 5)';

  @override
  String get createSession => 'Sitzung erstellen';

  @override
  String get creating => 'Wird erstellt...';

  @override
  String get yourName => 'Dein Name';

  @override
  String get enterDisplayName => 'Gib deinen Anzeigenamen ein';

  @override
  String get howItWorks => 'So funktioniert\'s';

  @override
  String get pinCopied => 'PIN in die Zwischenablage kopiert!';

  @override
  String get endSession => 'Sitzung beenden?';

  @override
  String get endSessionConfirm =>
      'Bist du sicher, dass du diese Pandora-Sitzung beenden möchtest?';

  @override
  String get createCustomDeck => 'Create Custom Deck';

  @override
  String get deckName => 'Deckname';

  @override
  String get enterDeckName => 'Gib den Decknamen ein';

  @override
  String get create => 'Erstellen';

  @override
  String get deckCreated => 'Deck created!';

  @override
  String get failedToCreateDeck => 'Deck konnte nicht erstellt werden';

  @override
  String get deleteDeck => 'Deck löschen';

  @override
  String deleteDeckConfirm(Object name) {
    return 'Bist du sicher, dass du \"$name\" löschen möchtest? Dadurch werden alle Fragen in diesem Deck gelöscht.';
  }

  @override
  String get delete => 'Löschen';

  @override
  String get deckDeleted => 'Deck gelöscht';

  @override
  String get failedToDeleteDeck => 'Konnte das Deck nicht löschen';

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
  String questionCount(Object count) {
    return '$count Frage';
  }

  @override
  String get questionAdded => 'Frage hinzugefügt!';

  @override
  String get failedToAddQuestion => 'Konnte die Frage nicht hinzufügen';

  @override
  String get editQuestion => 'Frage bearbeiten';

  @override
  String get enterYourQuestion => 'Gib deine Frage ein';

  @override
  String get save => 'Speichern';

  @override
  String get questionUpdated => 'Frage aktualisiert!';

  @override
  String get failedToUpdateQuestion =>
      'Aktualisierung der Frage fehlgeschlagen';

  @override
  String get deleteQuestion => 'Frage löschen';

  @override
  String get deleteQuestionConfirm =>
      'Bist du sicher, dass du diese Frage löschen möchtest?';

  @override
  String get questionDeleted => 'Frage gelöscht';

  @override
  String get failedToDeleteQuestion => 'Löschen der Frage fehlgeschlagen';

  @override
  String get addQuestion => 'Frage hinzufügen';

  @override
  String get typeQuestionHere => 'Gib hier deine Frage ein...';

  @override
  String get add => 'Hinzufügen';

  @override
  String get noQuestionsYet => 'Noch keine Fragen';

  @override
  String get addFirstQuestion => 'Füge deine erste Frage hinzu!';

  @override
  String get deckDescLoveTalks =>
      'Erkundet Romantik, Chemie und Verbundenheit durch herzliche Fragen, die eure Beziehung feiern. Von „Wie wir uns trafen\"-Momenten bis zu dem, was euch am meisten geliebt fühlen lässt – diese Karten vertiefen emotionale Intimität.';

  @override
  String get deckDescDeepTalks =>
      'Diese Karten tauchen in Werte, Verletzlichkeit und gemeinsames Wachstum ein. Sie helfen Paaren, über Unabhängigkeit, Kommunikation und gemeinsamen Sinn nachzudenken.';

  @override
  String get deckDescSpicyTalks =>
      'Frech, mutig und intim – diese Karten laden Paare ein, Verlangen, Fantasien und Leidenschaft gemeinsam zu erkunden. Jede Frage ist darauf ausgelegt, ehrliche, aufregende Gespräche auszulösen, die euch näherbringen.';

  @override
  String get deckDescDoYouDareTalks =>
      'Ein mutiges Set, das emotionale Ehrlichkeit mit heiklen Themen wie Vertrauen, Religion, Geld und Grenzen verbindet – alles, um herauszufinden, was euch wirklich wichtig ist. *Hinweis:* Manche Fragen sind roh und ungefiltert – spielt mit Offenheit, Empathie und Respekt.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspiriert von den fünf Liebessprachen hilft dieses Deck Partnern, Zuneigung auf wirklich bedeutsame Weise auszudrücken. Entdeckt, wie Worte, Taten und Gesten eure Verbindung stärken.';

  @override
  String get deckDescSillyTalks =>
      'Reiner Spaß und Lachen! Diese skurrilen, leichten Fragen enthüllen eure lustigsten Gedanken und seltsamsten Angewohnheiten. Ideal für Freunde, Familie oder Paare mit Humor.';

  @override
  String get deckDescCarTalks =>
      'Perfekt für Roadtrips – diese Karten verwandeln Fahrten in tolle Gespräche. Erwartet lustige, kreative und nostalgische Fragen über Reisen, Abenteuer und Eigenheiten.';

  @override
  String get deckDescCozyTalks =>
      'Warme, gemütliche Fragen, die dich zu Hause fühlen lassen. Sie regen tröstliche Gespräche über kleine Freuden und Erinnerungen an.';

  @override
  String get deckDescPartyNight =>
      'Dein Party-Starter-Deck für lustige Abende mit Freunden! Diese lebhaften Fragen sorgen für Lachen, Geschichten und spielerische Debatten – von Party-Pannen bis zum größten Flirt auf der Tanzfläche. Perfekt, um die Stimmung zu lockern.';

  @override
  String get deckDescUnpopularOpinions =>
      'Das Deck, das dich herausfordert zu sagen, was alle denken, aber niemand zugibt. Von Influencer-Kultur bis zu sozialen Normen – diese Karten provozieren ehrliche Debatten und überraschende Perspektiven.';

  @override
  String get deckDescPlotTwists =>
      'Dieses Deck steckt dich mitten in die lustigsten und schwierigsten „Was würdest du tun?\"-Momente. Schnelles Denken, Bauchgefühl und Lachen garantiert! Perfekt für Gruppenabende voller Überraschungen.';

  @override
  String get deckDescAfterDark =>
      'Tauche in die dunkle Seite der Gespräche ein – mit Fragen, die dir einen Schauer über den Rücken jagen. Perfekt für späte Abende und Gruselfans.';

  @override
  String get deckDescHistoryTalks =>
      'Eine nostalgische Mischung aus persönlichen Erinnerungen und Familienmomenten. Diese Fragen regen zum Erzählen, Lachen und Erinnern an.';

  @override
  String get deckDescTinyTalks =>
      'Für Eltern und ihre Kleinen! Diese einfachen, spielerischen Fragen helfen Kindern, sich auszudrücken, während Eltern lernen, wie sie denken. Ideal für 3–9 Jahre.';

  @override
  String get deckDescGoodOldDays =>
      'Eine nostalgische Reise in die Vergangenheit – von Kindheitserinnerungen bis zu Lebensveränderungen. Perfekt für Großeltern, um Geschichten zu teilen.';

  @override
  String get deckDescWouldYouRather =>
      'Eine familienfreundliche Version des klassischen \"Würdest du eher...\"-Spiels. Voller lustiger und fantasievoller Entscheidungen, die alle zum Lachen bringen.';

  @override
  String get createNewDeck => 'Neues Deck erstellen';

  @override
  String get sessionPin => 'Sitzungs-PIN';

  @override
  String get joinSession => 'Sitzung beitreten';

  @override
  String get questionSubmitted => 'Frage eingereicht!';

  @override
  String get sessionCancelled => 'Sitzung abgebrochen';

  @override
  String get yourQuestion => 'Deine Frage';

  @override
  String get reactionBreakdown => 'Reaktionsübersicht';
}
