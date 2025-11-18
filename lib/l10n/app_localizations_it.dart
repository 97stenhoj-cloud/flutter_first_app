// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Inizia';

  @override
  String get settings => 'Impostazioni';

  @override
  String get howToPlay => 'Come si gioca';

  @override
  String get chooseGameMode => 'Scegli la modalità di gioco';

  @override
  String get family => 'Famiglia';

  @override
  String get couple => 'Coppia';

  @override
  String get friends => 'Amici';

  @override
  String get chooseCategory => 'Scegli una categoria';

  @override
  String get locked => 'Categoria Premium';

  @override
  String get lockedMessage =>
      'Questa è una categoria premium. Passa a Premium per sbloccare tutte le categorie e rimuovere le pubblicità!';

  @override
  String get previewAvailable => 'Anteprima: prime 5 domande disponibili';

  @override
  String get upgradeNow => 'Passa a Premium';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Magari dopo';

  @override
  String get getPremium => 'Ottieni Premium';

  @override
  String get premiumTitle => 'Sblocca tutto';

  @override
  String get premiumDescription =>
      'Ottieni accesso illimitato a tutte le categorie in tutte le modalità, rimuovi le pubblicità e goditi sessioni Pandora illimitate.';

  @override
  String get premiumPriceMonthly => '€6,99/mese';

  @override
  String get premiumPriceYearly => '€59,99/anno';

  @override
  String get saveWithYearly => 'Risparmia €23,89 con l’abbonamento annuale!';

  @override
  String get monthly => 'Mensile';

  @override
  String get yearly => 'Annuale';

  @override
  String get billedMonthly => 'Fatturato mensilmente';

  @override
  String get billedYearly => 'Fatturato annualmente';

  @override
  String get premiumFeature1 => '✓ Tutte le 21 categorie premium sbloccate';

  @override
  String get premiumFeature2 => '✓ Niente pubblicità per sempre';

  @override
  String get premiumFeature3 => '✓ 75 domande in tutte le categorie';

  @override
  String get premiumFeature4 => '✓ Pandora: giocatori e domande illimitati';

  @override
  String get premiumFeature5 => '✓ Supporta lo sviluppo continuo';

  @override
  String get subscribePremium => 'Abbonati a Premium';

  @override
  String get subscribe => 'Abbonati';

  @override
  String get cancel => 'Annulla';

  @override
  String get subscriptionActivated =>
      'Premium attivato! Tutte le categorie sono state sbloccate.';

  @override
  String get premiumActivated => 'Premium attivato!';

  @override
  String get demoNote =>
      'Demo: l’abbonamento verrà reimpostato al riavvio dell’app';

  @override
  String get freeTier => 'Versione gratuita';

  @override
  String get freeTierDesc =>
      '3 categorie per modalità (30 domande ciascuna)\nAnteprima di 5 domande delle categorie premium\nAnnunci ogni 7 domande';

  @override
  String get currentPlan => 'Piano attuale';

  @override
  String get limitReached => 'Limite raggiunto';

  @override
  String get freeCategoryLimit =>
      'Hai raggiunto il limite di 30 domande per le categorie gratuite. Passa a Premium per un accesso illimitato!';

  @override
  String get previewLimit =>
      'Hai visto tutte le 5 domande di anteprima. Passa a Premium per continuare!';

  @override
  String get pandoraFreeLimit => 'Limite versione gratuita';

  @override
  String get pandoraFreeLimitMessage =>
      'Gli host gratuiti possono avere al massimo 6 giocatori e 12 domande. Passa a Premium per togliere i limiti!';

  @override
  String get pandoraUpgradeMessage =>
      'Hai raggiunto 12 domande. Passa a Premium per continuare a giocare!';

  @override
  String get pandoraMaxPlayers =>
      'Numero massimo di 6 giocatori raggiunto (limite gratuito). Passa a Premium per giocatori illimitati!';

  @override
  String get swipeOrTap => 'Scorri o tocca le frecce';

  @override
  String get previous => 'Precedente';

  @override
  String get next => 'Successiva';

  @override
  String get advertisement => 'Pubblicità';

  @override
  String get watchAdMessage =>
      'Guarda una breve pubblicità per continuare, oppure gioca senza pubblicità con Premium!';

  @override
  String get watchAd => 'Guarda la pubblicità';

  @override
  String get goAdFree => 'Vai senza pubblicità con Premium';

  @override
  String get removeAdsForever => 'Rimuovi le pubblicità per sempre';

  @override
  String get adNotReady => 'Pubblicità non pronta. Si continua senza.';

  @override
  String get adLoadingContinue => 'Caricamento pubblicità... Continua';

  @override
  String get pricePerMonth => '€6,99/mese o €59,99/anno';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Nessuna domanda trovata per $category in modalità $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Errore nel caricamento delle domande. Controlla la connessione.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Impossibile caricare le domande: $error';
  }

  @override
  String get howManyPlayers => 'Quanti giocatori?';

  @override
  String get players => 'Giocatori';

  @override
  String get continueButton => 'Continua';

  @override
  String get language => 'Lingua';

  @override
  String languageChanged(Object language) {
    return 'Lingua cambiata in $language';
  }

  @override
  String get profile => 'Profilo';

  @override
  String get signOut => 'Esci';

  @override
  String get notSignedIn => 'Non hai effettuato l’accesso';

  @override
  String get signInSignUp => 'Accedi / Registrati';

  @override
  String get signInToSync =>
      'Accedi per sincronizzare l’abbonamento tra i dispositivi e sbloccare i contenuti premium';

  @override
  String get signOutConfirm => 'Sei sicuro di voler uscire?';

  @override
  String get signedOutSuccess => 'Disconnessione effettuata';

  @override
  String get accountInformation => 'Informazioni account';

  @override
  String get email => 'E-mail';

  @override
  String get memberSince => 'Membro dal';

  @override
  String get notAvailable => 'Non disponibile';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String get subscriptionStatus => 'Stato abbonamento';

  @override
  String get premiumMember => 'Utente Premium';

  @override
  String get freeAccount => 'Account gratuito';

  @override
  String get welcomeToConnect => 'Benvenuto su Connect!';

  @override
  String get continueWithApple => 'Continua con Apple';

  @override
  String get continueWithGoogle => 'Continua con Google';

  @override
  String get skipForNow => 'Salta per ora';

  @override
  String get byContining =>
      'Continuando, accetti i nostri Termini di servizio e l’Informativa sulla privacy';

  @override
  String get googleSignInFailed => 'Accesso con Google non riuscito. Riprova.';

  @override
  String get appleSignInFailed => 'Accesso con Apple non riuscito. Riprova.';

  @override
  String get noCategoriesFound => 'Nessuna categoria trovata';

  @override
  String get welcomeBack => 'Bentornato!';

  @override
  String get createAccount => 'Crea un account';

  @override
  String get displayName => 'Nome visualizzato';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Accedi';

  @override
  String get signUp => 'Registrati';

  @override
  String get dontHaveAccount => 'Non hai un account? Registrati';

  @override
  String get alreadyHaveAccount => 'Hai già un account? Accedi';

  @override
  String get chooseYourMode => '1. Scegli la modalità';

  @override
  String get chooseYourModeDesc =>
      'Scegli tra cinque esperienze di conversazione uniche:\n\n• Coppia – Domande intime per approfondire il vostro rapporto\n• Amici – Argomenti divertenti e coinvolgenti, perfetti per il tuo gruppo\n• Famiglia – Conversazioni calorose e adatte a tutte le età\n• Personale – Crea i tuoi mazzi personalizzati di domande (Premium)\n• Pandora – Gioco multigiocatore collaborativo con domande in tempo reale';

  @override
  String get pickCategory => '2. Scegli una categoria';

  @override
  String get pickCategoryDesc =>
      'Ogni modalità offre più categorie con mazzi di domande selezionate:\n\n• Gratis: 3 categorie per modalità (30 domande ciascuna)\n• Anteprima Premium: prime 5 domande delle categorie premium\n• Premium: oltre 24 categorie (75 domande ciascuna)\n• Personale: crea mazzi personalizzati illimitati con le tue domande';

  @override
  String get startTalking => '3. Inizia a giocare';

  @override
  String get startTalkingDesc =>
      'Le domande compaiono a tutto schermo per conversazioni immersive. A turno, leggete e rispondete con sincerità – non esistono risposte sbagliate! L’obiettivo è connettersi davvero e divertirsi.\n\nIn modalità Pandora: tutti i giocatori inviano domande in modo anonimo, poi tutti rispondono insieme in tempo reale.';

  @override
  String get navigateQuestions => '4. Naviga tra le domande';

  @override
  String get navigateQuestionsDesc =>
      '• Scorri in qualsiasi direzione o tocca le frecce per cambiare domanda\n• Tocca l’icona a forma di cuore ❤️ per salvare i preferiti\n• Premium: tocca l’icona dell’elenco domande (in alto a destra) per passare a qualsiasi domanda\n• Tocca il pulsante Home per tornare al menu principale in qualsiasi momento';

  @override
  String get premiumFeatures => '5. Funzionalità Premium';

  @override
  String get premiumFeaturesDesc =>
      'Sblocca l’esperienza completa di Connect:\n\n• Mensile: €6,99/mese\n• Annuale: €59,99/anno (Risparmi il 29%!)\n\n✓ Tutte le 24+ categorie premium in tutte le modalità\n✓ 75 domande per categoria (contro 30 nella versione gratuita)\n✓ Niente pubblicità per sempre\n✓ Pandora: giocatori e domande illimitati\n✓ Personale: crea mazzi personalizzati illimitati\n✓ Navigazione per domande – salta a qualsiasi domanda\n✓ Supporta lo sviluppo continuo';

  @override
  String get proTips => 'Consigli';

  @override
  String get proTipsDesc =>
      '• Crea un ambiente comodo e senza distrazioni\n• Ascolta attivamente ed essere presente\n• Rispondi con sincerità e incoraggia gli altri a fare lo stesso\n• Rispetta i limiti – va benissimo saltare una domanda\n• Usa i preferiti ❤️ per salvare le domande che ti piacciono\n• Prova modalità diverse per occasioni diverse\n• Pandora è perfetto per feste e serate di gruppo\n• Divertiti e goditi la connessione!';

  @override
  String get aboutCredits => 'Informazioni / Crediti';

  @override
  String get developedBy => 'Sviluppato da TechyKoala';

  @override
  String get learnMore => 'Scopri di più su di noi e sulle prossime app';

  @override
  String get visitWebsite => 'Visita techykoala.com';

  @override
  String get madeWithLove => 'Creato con ❤️ per conversazioni significative';

  @override
  String get personal => 'Personale';

  @override
  String get personalDesc => 'Crea i tuoi mazzi personalizzati di domande';

  @override
  String get gameComplete => 'Partita terminata!';

  @override
  String get noMoreQuestions => 'Hai visto tutte le domande di questo mazzo!';

  @override
  String get playAgain => 'Gioca di nuovo';

  @override
  String get mainMenu => 'Menu principale';

  @override
  String get thanksForPlaying => 'Grazie per aver giocato!';

  @override
  String get hopeYouHadFun => 'Speriamo che ti sia divertito! 🎉';

  @override
  String get backToMenu => 'Torna al menu';

  @override
  String get leaveGame => 'Uscire dalla partita?';

  @override
  String get leaveGameMessage =>
      'Sei sicuro di voler uscire? La partita continuerà per gli altri giocatori.';

  @override
  String get leave => 'Esci';

  @override
  String get noQuestionsAvailable => 'Nessuna domanda disponibile';

  @override
  String get showLess => 'Mostra meno';

  @override
  String get readMore => 'Mostra altro';

  @override
  String get tapToPlay => 'Tocca per giocare';

  @override
  String get favorites => 'Preferiti';

  @override
  String get pandoraHostCreatePin =>
      'L’host crea una sessione e condivide il PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'I giocatori si uniscono (max 6 gratis, illimitati con Premium)';

  @override
  String get pandoraHostSetsTimer =>
      'L’host imposta il timer per le domande (1–15 min)';

  @override
  String get pandoraEveryoneSubmits => 'Tutti inviano domande (max 12 gratis)';

  @override
  String get pandoraHostControls =>
      'L’host controlla l’andamento della partita';

  @override
  String get pandoraQuestionsDeleted =>
      'Le domande vengono eliminate dopo la partita';

  @override
  String get pandoraHost => 'Host';

  @override
  String get pandoraJoinGame => 'Unisciti alla partita';

  @override
  String get pandoraPandoraBox => 'Scatola di Pandora';

  @override
  String get pleaseEnterName => 'Inserisci il tuo nome';

  @override
  String get hostSuffix => '(Host)';

  @override
  String get playersJoinWithNames =>
      'I giocatori si uniscono con il proprio nome';

  @override
  String get everyoneSubmitsMin5 =>
      'Tutti inviano domande (min 5, max 12 gratis)';

  @override
  String get createSession => 'Crea sessione';

  @override
  String get creating => 'Creazione in corso...';

  @override
  String get yourName => 'Il tuo nome';

  @override
  String get enterDisplayName => 'Inserisci il nome visualizzato';

  @override
  String get howItWorks => 'Come funziona';

  @override
  String get pinCopied => 'PIN copiato negli appunti!';

  @override
  String get endSession => 'Terminare la sessione?';

  @override
  String get endSessionConfirm =>
      'Sei sicuro di voler terminare questa sessione di Pandora?';

  @override
  String get createCustomDeck => 'Crea mazzo personalizzato';

  @override
  String get deckName => 'Nome del mazzo';

  @override
  String get enterDeckName => 'Inserisci il nome del mazzo';

  @override
  String get create => 'Crea';

  @override
  String get deckCreated => 'Mazzo creato!';

  @override
  String get failedToCreateDeck => 'Impossibile creare il mazzo';

  @override
  String get deleteDeck => 'Eliminare il mazzo?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Sei sicuro di voler eliminare \"$deckName\"? Questo eliminerà tutte le domande del mazzo.';
  }

  @override
  String get delete => 'Elimina';

  @override
  String get deckDeleted => 'Mazzo eliminato';

  @override
  String get failedToDeleteDeck => 'Impossibile eliminare il mazzo';

  @override
  String get myDecks => 'I miei mazzi';

  @override
  String get noDecksYet => 'Nessun mazzo ancora';

  @override
  String get createFirstDeck => 'Crea il tuo primo mazzo personalizzato!';

  @override
  String questionsCount(Object count) {
    return '$count domande';
  }

  @override
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count domande',
      one: '1 domanda',
      zero: '0 domande',
    );
    return '$_temp0';
  }

  @override
  String get questionAdded => 'Domanda aggiunta!';

  @override
  String get failedToAddQuestion => 'Impossibile aggiungere la domanda';

  @override
  String get editQuestion => 'Modifica domanda';

  @override
  String get enterYourQuestion => 'Inserisci la tua domanda';

  @override
  String get save => 'Salva';

  @override
  String get questionUpdated => 'Domanda aggiornata!';

  @override
  String get failedToUpdateQuestion => 'Impossibile aggiornare la domanda';

  @override
  String get deleteQuestion => 'Elimina domanda';

  @override
  String get deleteQuestionConfirm =>
      'Sei sicuro di voler eliminare questa domanda?';

  @override
  String get questionDeleted => 'Domanda eliminata';

  @override
  String get failedToDeleteQuestion => 'Impossibile eliminare la domanda';

  @override
  String get addQuestion => 'Aggiungi domanda';

  @override
  String get typeQuestionHere => 'Scrivi qui la tua domanda...';

  @override
  String get add => 'Aggiungi';

  @override
  String get noQuestionsYet => 'Ancora nessuna domanda';

  @override
  String get addFirstQuestion => 'Aggiungi la tua prima domanda!';

  @override
  String get deckDescLoveTalks =>
      'Esplora il romanticismo, la chimica e la connessione attraverso domande profonde che celebrano la vostra relazione. Dai momenti di \"come ci siamo conosciuti\" a ciò che ti fa sentire più amato, queste carte approfondiscono l’intimità emotiva.';

  @override
  String get deckDescDeepTalks =>
      'Queste carte affrontano valori, vulnerabilità e cosa significa crescere insieme. Aiutano i partner a riflettere su indipendenza, comunicazione e obiettivi condivisi.';

  @override
  String get deckDescSpicyTalks =>
      'Piccanti, audaci e intime — queste carte invitano la coppia a esplorare desideri, fantasie e passione insieme. Ogni domanda è pensata per accendere conversazioni sincere ed emozionanti su ciò che vi attrae e vi avvicina.';

  @override
  String get deckDescDoYouDareTalks =>
      'Un mazzo senza filtri che unisce onestà emotiva e argomenti delicati come fiducia, religione, soldi e confini personali — tutto pensato per rivelare ciò che conta davvero per entrambi. *Nota:* alcune domande sono crude e dirette — giocate con apertura, empatia e rispetto.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Ispirato ai cinque linguaggi dell’amore, questo mazzo aiuta i partner a esprimere affetto nei modi che risuonano davvero con l’altro. Scoprite come parole, gesti e azioni possano rafforzare la vostra connessione.';

  @override
  String get deckDescSillyTalks =>
      'Solo divertimento e tante risate! Queste domande leggere e buffe tirano fuori le vostre abitudini più strane e i pensieri più divertenti. Perfette per amici, famiglia o coppie che non si prendono troppo sul serio.';

  @override
  String get deckDescCarTalks =>
      'Perfetto per i viaggi in auto — queste carte trasformano il tempo in macchina in ottime conversazioni. Aspettati domande divertenti, creative e nostalgiche su viaggi, avventure e piccole manie.';

  @override
  String get deckDescCozyTalks =>
      'Conversazioni calde e rilassate, ideali per serate accoglienti. Queste domande creano momenti di connessione tranquilla e sincera.';

  @override
  String get deckDescPartyNight =>
      'Domande piene di energia pensate per i gruppi. Perfette per feste, aperitivi e serate con amici.';

  @override
  String get deckDescUnpopularOpinions =>
      'Il mazzo che ti sfida a dire ad alta voce ciò che tutti pensano ma nessuno dice. Dalla cultura degli influencer alle norme sociali — queste domande scatenano dibattiti sinceri e punti di vista sorprendenti. Ideale per amici con opinioni forti.';

  @override
  String get deckDescPlotTwists =>
      'Questo mazzo ti catapulta nelle situazioni più divertenti e più difficili del tipo \"cosa faresti se...?\". Reazioni d’istinto, decisioni a caldo e tante risate garantite! Perfetto per serate di gruppo piene di colpi di scena.';

  @override
  String get deckDescAfterDark =>
      'Entra nel lato più oscuro delle conversazioni con domande che fanno venire i brividi. Da coincidenze inquietanti a scenari di sopravvivenza — perfetto per le notti più tarde con un tocco di mistero.';

  @override
  String get deckDescHistoryTalks =>
      'Un mix nostalgico di ricordi personali e momenti in famiglia. Queste domande ispirano storie, risate e la riscoperta delle tue radici. Perfetto per cene in famiglia o serate tranquille.';

  @override
  String get deckDescTinyTalks =>
      'Pensato per genitori e bambini! Domande semplici e giocose aiutano i piccoli a esprimersi, mentre i genitori scoprono come pensano. Perfetto dai 3 ai 9 anni.';

  @override
  String get deckDescGoodOldDays =>
      'Fai un tuffo nel passato con domande su ricordi preziosi, esperienze vissute e com’era “una volta”. Adatto a tutte le età.';

  @override
  String get deckDescWouldYouRather =>
      'I classici dilemmi \"preferiresti\" che scatenano discussioni e rivelano preferenze. Scegli tra due opzioni e scopri cosa conta di più per ognuno.';

  @override
  String get createNewDeck => 'Crea nuovo mazzo';

  @override
  String get sessionPin => 'PIN sessione';

  @override
  String get joinSession => 'Unisciti alla sessione';

  @override
  String get questionSubmitted => 'Domanda inviata';

  @override
  String get sessionCancelled => 'Sessione annullata';

  @override
  String get yourQuestion => 'La tua domanda';

  @override
  String get reactionBreakdown => 'Dettaglio delle reazioni';

  @override
  String get deckNameHint => 'Nome del mazzo';

  @override
  String get deckCreatedSuccess => 'Mazzo creato!';

  @override
  String get cancelSession => 'Annullare la sessione?';

  @override
  String get cancelSessionConfirm =>
      'Questo annullerà la sessione per tutti i giocatori. Sei sicuro?';

  @override
  String get no => 'No';

  @override
  String get yesCancel => 'Sì, annulla';

  @override
  String get hostQuestionCollection => 'Host – raccolta domande';

  @override
  String get questionCollection => 'Raccolta domande';

  @override
  String get endSessionButton => 'Termina sessione';

  @override
  String get noActiveSubscription => 'Nessun abbonamento attivo';

  @override
  String get premium => 'PREMIUM';

  @override
  String notEnoughQuestions(Object count) {
    return 'Domande insufficienti. Minimo richiesto: 5. (Attualmente: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Funzione Premium';

  @override
  String get questionNavigationPremium =>
      'La navigazione tra le domande è una funzione Premium. Abbonati per sbloccare la possibilità di saltare a qualsiasi domanda!';

  @override
  String get customDecks => 'Mazzi personalizzati';

  @override
  String get noDecksYetMessage => 'Ancora nessun mazzo';

  @override
  String get createFirstDeckMessage => 'Tocca + per creare il tuo primo mazzo';

  @override
  String get signInRequired => 'Accesso richiesto';

  @override
  String get signInToUsePersonal =>
      'Accedi per usare la modalità Personale e creare mazzi personalizzati di domande.';

  @override
  String get collaborativeQuestionGame => 'Gioco collaborativo di domande';

  @override
  String get hostPandoraSession => 'Ospita una sessione Pandora';

  @override
  String get joinPandoraGame => 'Unisciti a una partita';

  @override
  String get yourDisplayName => 'Il tuo nome visualizzato';

  @override
  String get enterYourName => 'Inserisci il tuo nome';

  @override
  String get selectQuestion => 'Seleziona una domanda';

  @override
  String get joinTime => 'Tempo per unirsi';

  @override
  String get participants => 'Partecipanti';

  @override
  String get loading => 'Caricamento...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Servono almeno 2 giocatori ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Continua alla configurazione del timer';

  @override
  String get setQuestionTimer => 'Imposta timer domanda';

  @override
  String get questionCollectionTime => 'Tempo di raccolta delle domande';

  @override
  String get minutes => 'minuti';

  @override
  String get sessionWillEnd =>
      'La sessione terminerà automaticamente se non continui entro 5 minuti';

  @override
  String get startQuestionCollection => 'Inizia raccolta domande';

  @override
  String questionsSubmitted(int count) {
    return '$count domande inviate';
  }

  @override
  String get writeQuestionHere => 'Scrivi qui la tua domanda...';

  @override
  String get whoIsThisFor => 'Per chi è questa domanda?';

  @override
  String get everyone => 'Tutti';

  @override
  String get specific => 'Qualcuno in particolare';

  @override
  String get submitQuestion => 'Invia domanda';

  @override
  String needMoreQuestions(int count) {
    return 'Servono ancora $count domande';
  }

  @override
  String get startGame => 'Avvia partita';

  @override
  String get selectPlayer => 'Seleziona un giocatore';

  @override
  String get unsubscribe => 'Disdici abbonamento';

  @override
  String get unsubscribeConfirm => 'Disdire l’abbonamento Premium?';

  @override
  String get unsubscribeWarning =>
      'Perderai l’accesso a tutte le funzioni Premium, incluse domande illimitate, tutte le categorie, esperienza senza pubblicità e giocatori illimitati su Pandora. Potrai riabbonarti in qualsiasi momento.';

  @override
  String get yesUnsubscribe => 'Sì, disdici';

  @override
  String get unsubscribeSuccess =>
      'Abbonamento disdetto. Le funzioni Premium sono state disabilitate.';

  @override
  String get unsubscribeError => 'Impossibile disdire l’abbonamento';

  @override
  String get questions => 'domande';

  @override
  String get preview => 'anteprima';

  @override
  String get userId => 'ID utente';

  @override
  String get subscription => 'Abbonamento';

  @override
  String get questionsCount75 => '75 domande';

  @override
  String get questionsCount30 => '30 domande';

  @override
  String get questionsCount5Preview => 'Anteprima di 5 domande';

  @override
  String get unlockFullDeck => 'Sblocca 75 domande';

  @override
  String get renameDeck => 'Rinomina mazzo';

  @override
  String get deckRenamed => 'Mazzo rinominato con successo';

  @override
  String get failedToRenameDeck => 'Impossibile rinominare il mazzo';

  @override
  String get shuffleQuestions => 'Mescola domande';

  @override
  String get resetOrder => 'Reimposta ordine';

  @override
  String get questionsShuffled => 'Domande mescolate!';

  @override
  String get orderReset => 'Ordine reimpostato a quello originale';

  @override
  String get readyToPlay => 'Pronto per giocare';

  @override
  String get longPressReorder =>
      'Tieni premuto e trascina per riordinare le domande';

  @override
  String get noFavoritesYet => 'Ancora nessun preferito';

  @override
  String get heartQuestionsDuringGameplay =>
      'Tocca il cuore ❤️ sulle carte durante la partita per salvarle qui!';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Aggiungi almeno $count domande per iniziare a giocare!';
  }

  @override
  String get heartQuestionsInfo =>
      'Metti il cuore alle domande durante la partita per aggiungerle ai Preferiti!';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Aggiungi almeno $count domande per giocare con questo mazzo';
  }

  @override
  String get removeFromFavorites => 'Rimuovi dai preferiti';

  @override
  String get unlockEverything => 'Sblocca tutto';

  @override
  String get premiumSubtitle =>
      'Ottieni accesso illimitato a tutte le categorie, rimuovi per sempre le pubblicità e sblocca le funzioni Premium';

  @override
  String get save32Percent => 'RISPARMIA IL 29%';

  @override
  String get priceMonthly => '€6,99/mese';

  @override
  String get priceYearly => '€59,99/anno';

  @override
  String get billedAnnually => 'Fatturato annualmente';

  @override
  String get equivalentMonthly => 'Solo €5/mese';

  @override
  String get feature24Categories =>
      'Oltre 24 categorie premium sbloccate in tutte le modalità';

  @override
  String get feature75Questions =>
      '75 domande per categoria (contro 30 nella versione gratuita)';

  @override
  String get featureNoAds =>
      'Niente pubblicità per sempre – gioco senza interruzioni';

  @override
  String get featureUnlimitedPlayers =>
      'Modalità Pandora: giocatori e domande illimitati';

  @override
  String get featureQuestionNavigation =>
      'Naviga e salta a qualsiasi domanda durante la partita';

  @override
  String get featureSupportDevelopment =>
      'Supporta lo sviluppo continuo e le nuove funzionalità';

  @override
  String get error => 'Errore';

  @override
  String get premiumActivatedMessage =>
      'Premium attivato! Tutte le categorie sono sbloccate.';

  @override
  String get featurePersonalDecks =>
      'Modalità Personale: crea mazzi personalizzati illimitati con le tue domande';

  @override
  String get premiumPersonal =>
      'La modalità Personale con mazzi personalizzati è una funzione Premium. Passa a Premium per creare e giocare con i tuoi mazzi di domande!';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Sei sicuro di voler eliminare \"$deckName\"? Questo eliminerà tutte le domande del mazzo.';
  }

  @override
  String needMore(int count) {
    return 'Servono ancora $count';
  }

  @override
  String get editQuestions => 'Modifica domande';

  @override
  String get addMore => 'Aggiungi altre';

  @override
  String useMyConnectEmail(String email) {
    return 'Usa la mia e-mail Connect: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Gli utenti gratuiti possono avere al massimo 6 giocatori. Passa a Premium per giocatori illimitati!';

  @override
  String get freemiumQuestionLimit =>
      'Gli utenti gratuiti possono inviare al massimo 12 domande. Passa a Premium per domande illimitate!';

  @override
  String get yourQuestions => 'Le tue domande';

  @override
  String waitingForHost(int count) {
    return 'In attesa dell’host... ($count giocatori)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Passa a Premium per giocatori illimitati';

  @override
  String get kickPlayer => 'Rimuovi giocatore';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Sei sicuro di voler rimuovere \"$playerName\" dalla sessione?';
  }

  @override
  String get kick => 'Rimuovi';

  @override
  String playerKicked(String playerName) {
    return '$playerName è stato rimosso dalla sessione';
  }

  @override
  String get failedToKickPlayer => 'Impossibile rimuovere il giocatore';

  @override
  String get cancelSessionForAll =>
      'Questo annullerà la sessione per tutti i giocatori. Sei sicuro?';

  @override
  String get youWereKicked => 'Sei stato rimosso dalla sessione';

  @override
  String get you => 'Tu';

  @override
  String get loginRequiredForPandora =>
      'Accesso richiesto per giocare a Pandora';

  @override
  String get login => 'Accedi';

  @override
  String get loginRequiredNote =>
      'Per giocare a Pandora è necessario effettuare l’accesso (per tracciare correttamente i giocatori)';

  @override
  String get timeIsUp => 'Tempo scaduto!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Non sono state inviate abbastanza domande ($current/$minimum minimo).';
  }

  @override
  String get sessionQuestionLimit =>
      'Limite di domande della sessione raggiunto';

  @override
  String get sessionQuestionLimitMessage =>
      'Questa sessione ha raggiunto il limite di 12 domande (host gratuito). Passa a Premium per domande illimitate!';

  @override
  String sessionQuestionCount(int current) {
    return 'Sessione: $current/12 domande';
  }

  @override
  String get pleaseEnterQuestion => 'Inserisci una domanda';

  @override
  String get rateThisDeck => 'Valuta questo mazzo';

  @override
  String get yourRating => 'La tua valutazione';

  @override
  String get skip => 'Salta';

  @override
  String get submit => 'Invia';

  @override
  String get thankYouForFeedback => 'Grazie per il tuo feedback!';

  @override
  String get failedToSubmitRating => 'Impossibile inviare la valutazione';

  @override
  String get tapStarsToRate => 'Tocca le stelle per valutare';

  @override
  String get downloadForOffline => 'Scarica per uso offline';

  @override
  String get downloading => 'Download in corso...';

  @override
  String get downloadedLanguages => 'Lingue scaricate';

  @override
  String get languageNotDownloaded => 'Lingua non scaricata';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'Non hai scaricato $languageName per l\'uso offline.\n\nVai in Impostazioni > Profilo > \"Scarica per uso offline\" quando sei connesso a internet.';
  }

  @override
  String get offlineLanguageError =>
      'Questa lingua non è stata scaricata per l\'uso offline. Vai in Impostazioni > Profilo > \"Scarica per uso offline\" quando sei connesso a internet.';

  @override
  String get downloadComplete => 'Download completato!';

  @override
  String get downloadCompleteMessage =>
      'Tutti i contenuti sono stati scaricati per l\'uso offline.';

  @override
  String get addedToFavorites => 'Aggiunto ai preferiti';

  @override
  String get removedFromFavorites => 'Rimosso dai preferiti';

  @override
  String get errorSavingFavorite => 'Errore nel salvataggio del preferito';

  @override
  String get internetRequired => 'Connessione Internet richiesta';

  @override
  String get internetRequiredMessage =>
      'Alcune funzionalità richiedono una connessione Internet. Gli utenti Premium possono scaricare i contenuti per l\'uso offline nelle Impostazioni.';

  @override
  String get goPremium => 'Passa a Premium';

  @override
  String get pleaseEnterPin => 'Inserisci un PIN di 6 cifre';

  @override
  String errorOccurred(String error) {
    return 'Errore: $error';
  }

  @override
  String get errorCreatingSession => 'Errore nella creazione della sessione';

  @override
  String get sessionTimedOut =>
      'Sessione scaduta - l\'host non ha impostato il timer';

  @override
  String get errorStarting => 'Errore nell\'avvio';

  @override
  String get errorLoadingParticipants =>
      'Errore nel caricamento dei partecipanti';

  @override
  String get sessionCancelledByHost => 'Sessione annullata dall\'host';

  @override
  String needAtLeast5Questions(int count) {
    return 'Servono almeno 5 domande per iniziare! (Attualmente: $count)';
  }

  @override
  String get errorStartingGame => 'Errore nell\'avvio della partita';

  @override
  String get questionsAsked => 'Domande poste';

  @override
  String get totalReactions => 'Reazioni totali';

  @override
  String get mostLovedQuestion => 'Domanda più amata';

  @override
  String get mostFunQuestion => 'Domanda più divertente';

  @override
  String get mostShockingQuestion => 'Domanda più scioccante';

  @override
  String get mostLitQuestion => 'Domanda più epica';

  @override
  String get hotSeatAward => 'Premio Hot Seat';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Errore: impossibile identificare il giocatore. Rientra nella sessione.';

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
  String questionsInDeck(int kept, int max) {
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
