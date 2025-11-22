// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Démarrer';

  @override
  String get settings => 'Paramètres';

  @override
  String get howToPlay => 'Comment jouer';

  @override
  String get chooseGameMode => 'Choisis ton mode de jeu';

  @override
  String get family => 'Famille';

  @override
  String get couple => 'Couple';

  @override
  String get friends => 'Amis';

  @override
  String get chooseCategory => 'Choisis une catégorie';

  @override
  String get locked => 'Catégorie Premium';

  @override
  String get lockedMessage =>
      'Ceci est une catégorie premium. Passe à la version Premium pour tout débloquer et supprimer les publicités !';

  @override
  String get previewAvailable => 'Aperçu : 5 premières questions disponibles';

  @override
  String get upgradeNow => 'Passer en Premium';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Peut-être plus tard';

  @override
  String get getPremium => 'Obtenir Premium';

  @override
  String get premiumTitle => 'Tout débloquer';

  @override
  String get premiumDescription =>
      'Profite d’un accès illimité à toutes les catégories dans tous les modes, supprime les pubs et profite de sessions Pandora illimitées.';

  @override
  String get premiumPriceMonthly => '6,99 €/mois';

  @override
  String get premiumPriceYearly => '59,99 €/an';

  @override
  String get saveWithYearly => 'Économise 23,89 € avec l’abonnement annuel !';

  @override
  String get monthly => 'Mensuel';

  @override
  String get yearly => 'Annuel';

  @override
  String get billedMonthly => 'Facturé mensuellement';

  @override
  String get billedYearly => 'Facturé annuellement';

  @override
  String get premiumFeature1 => '✓ Les 21 catégories premium débloquées';

  @override
  String get premiumFeature2 => '✓ Plus jamais de publicité';

  @override
  String get premiumFeature3 => '✓ 75 questions dans toutes les catégories';

  @override
  String get premiumFeature4 => '✓ Pandora : joueurs et questions illimités';

  @override
  String get premiumFeature5 => '✓ Soutiens le développement continu';

  @override
  String get subscribePremium => 'S’abonner à Premium';

  @override
  String get subscribe => 'S’abonner';

  @override
  String get cancel => 'Annuler';

  @override
  String get subscriptionActivated =>
      'Premium activé ! Toutes les catégories sont débloquées.';

  @override
  String get premiumActivated => 'Premium activé !';

  @override
  String get demoNote =>
      'Démo : l’abonnement sera réinitialisé au redémarrage de l’app';

  @override
  String get freeTier => 'Niveau gratuit';

  @override
  String get freeTierDesc =>
      '3 catégories par mode (30 questions chacune)\nAperçu de 5 questions des catégories premium\nPublicité toutes les 7 questions';

  @override
  String get currentPlan => 'Offre actuelle';

  @override
  String get limitReached => 'Limite atteinte';

  @override
  String get freeCategoryLimit =>
      'Tu as atteint la limite de 30 questions pour les catégories gratuites. Passe à Premium pour un accès illimité !';

  @override
  String get previewLimit =>
      'Tu as vu les 5 questions d’aperçu. Passe à Premium pour continuer !';

  @override
  String get pandoraFreeLimit => 'Limite gratuite';

  @override
  String get pandoraFreeLimitMessage =>
      'Les hôtes gratuits peuvent avoir 6 joueurs et 12 questions maximum. Passe à Premium pour tout rendre illimité !';

  @override
  String get pandoraUpgradeMessage =>
      'Tu as atteint 12 questions. Passe à Premium pour continuer à jouer !';

  @override
  String get pandoraMaxPlayers =>
      'Maximum de 6 joueurs atteint (limite gratuite). Passe à Premium pour un nombre illimité de joueurs !';

  @override
  String get swipeOrTap => 'Glisse ou appuie sur les flèches';

  @override
  String get previous => 'Précédent';

  @override
  String get next => 'Suivant';

  @override
  String get advertisement => 'Publicité';

  @override
  String get watchAdMessage =>
      'Regarde une courte publicité pour continuer, ou supprime-les avec Premium !';

  @override
  String get watchAd => 'Regarder la pub';

  @override
  String get goAdFree => 'Sans pubs avec Premium';

  @override
  String get removeAdsForever => 'Supprimer les pubs pour toujours';

  @override
  String get adNotReady => 'Publicité non prête. Poursuite sans publicité.';

  @override
  String get adLoadingContinue => 'Chargement de la pub... Continuer';

  @override
  String get pricePerMonth => '6,99 €/mois ou 59,99 €/an';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Aucune question trouvée pour $category en mode $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Erreur de chargement des questions. Vérifie ta connexion.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Impossible de charger les questions : $error';
  }

  @override
  String get howManyPlayers => 'Combien de joueurs ?';

  @override
  String get players => 'Joueurs';

  @override
  String get continueButton => 'Continuer';

  @override
  String get language => 'Langue';

  @override
  String languageChanged(Object language) {
    return 'Langue changée en $language';
  }

  @override
  String get profile => 'Profil';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get notSignedIn => 'Non connecté';

  @override
  String get signInSignUp => 'Connexion / Inscription';

  @override
  String get signInToSync =>
      'Connecte-toi pour synchroniser ton abonnement sur tous tes appareils et débloquer le contenu premium';

  @override
  String get signOutConfirm => 'Es-tu sûr de vouloir te déconnecter ?';

  @override
  String get signedOutSuccess => 'Déconnexion réussie';

  @override
  String get accountInformation => 'Informations du compte';

  @override
  String get email => 'E-mail';

  @override
  String get memberSince => 'Membre depuis';

  @override
  String get notAvailable => 'Non disponible';

  @override
  String get unknown => 'Inconnu';

  @override
  String get subscriptionStatus => 'Statut de l’abonnement';

  @override
  String get premiumMember => 'Membre Premium';

  @override
  String get freeAccount => 'Compte gratuit';

  @override
  String get welcomeToConnect => 'Bienvenue sur Connect !';

  @override
  String get continueWithApple => 'Continuer avec Apple';

  @override
  String get continueWithGoogle => 'Continuer avec Google';

  @override
  String get skipForNow => 'Passer pour l’instant';

  @override
  String get byContining =>
      'En continuant, tu acceptes nos Conditions d’utilisation et notre Politique de confidentialité';

  @override
  String get googleSignInFailed => 'Échec de la connexion Google. Réessaie.';

  @override
  String get appleSignInFailed => 'Échec de la connexion Apple. Réessaie.';

  @override
  String get noCategoriesFound => 'Aucune catégorie trouvée';

  @override
  String get welcomeBack => 'Bon retour !';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get displayName => 'Nom affiché';

  @override
  String get password => 'Mot de passe';

  @override
  String get signIn => 'Se connecter';

  @override
  String get signUp => 'S’inscrire';

  @override
  String get dontHaveAccount => 'Pas de compte ? Inscris-toi';

  @override
  String get alreadyHaveAccount => 'Tu as déjà un compte ? Connecte-toi';

  @override
  String get chooseYourMode => '1. Choisis ton mode';

  @override
  String get chooseYourModeDesc =>
      'Choisis parmi cinq expériences de conversation uniques :\n\n• Couple – Questions intimes pour approfondir votre relation\n• Amis – Sujets fun et engageants, parfaits pour ton groupe\n• Famille – Conversations chaleureuses et bienveillantes pour tous les âges\n• Personnel – Crée tes propres paquets de questions (Premium)\n• Pandora – Jeu multijoueur collaboratif avec questions en temps réel';

  @override
  String get pickCategory => '2. Choisis une catégorie';

  @override
  String get pickCategoryDesc =>
      'Chaque mode propose plusieurs catégories avec des paquets de questions sélectionnées :\n\n• Gratuit : 3 catégories par mode (30 questions chacune)\n• Aperçu Premium : 5 premières questions des catégories premium\n• Premium : 24+ catégories (75 questions chacune)\n• Personnel : Crée un nombre illimité de paquets personnalisés avec tes propres questions';

  @override
  String get startTalking => '3. Commence à jouer';

  @override
  String get startTalkingDesc =>
      'Les questions s’affichent en plein écran pour des conversations immersives. À tour de rôle, lisez et répondez honnêtement – il n’y a pas de mauvaises réponses ! Le but : se connecter et s’amuser.\n\nEn mode Pandora : tous les joueurs soumettent des questions anonymes, puis tout le monde y répond ensemble en temps réel.';

  @override
  String get navigateQuestions => '4. Naviguer entre les questions';

  @override
  String get navigateQuestionsDesc =>
      '• Glisse dans n’importe quelle direction ou utilise les flèches pour changer de question\n• Appuie sur l’icône ❤️ pour enregistrer un favori\n• Premium : appuie sur l’icône de liste de questions (en haut à droite) pour sauter à n’importe quelle question\n• Appuie sur le bouton d’accueil pour revenir au menu principal à tout moment';

  @override
  String get premiumFeatures => '5. Fonctionnalités Premium';

  @override
  String get premiumFeaturesDesc =>
      'Débloque toute l’expérience Connect :\n\n• Mensuel : 6,99 €/mois\n• Annuel : 59,99 €/an (Économise 29 % !)\\n\\n✓ Toutes les 24+ catégories premium dans tous les modes\n✓ 75 questions par catégorie (contre 30 en gratuit)\n✓ Plus aucune pub\n✓ Pandora : joueurs et questions illimités\n✓ Personnel : crée des paquets personnalisés sans limite\n✓ Navigation par questions – saute à n’importe quelle question\n✓ Soutiens le développement continu';

  @override
  String get proTips => 'Astuces';

  @override
  String get proTipsDesc =>
      '• Crée un environnement confortable, sans distractions\n• Écoute activement et sois pleinement présent\n• Partage honnêtement et encourage les autres à faire de même\n• Respecte les limites de chacun – sauter une question, c’est OK\n• Utilise les favoris ❤️ pour garder les questions que tu aimes\n• Essaie différents modes selon l’occasion\n• Pandora est parfait pour les soirées et les jeux en groupe\n• Amuse-toi et profite des connexions !';

  @override
  String get aboutCredits => 'À propos / Crédits';

  @override
  String get developedBy => 'Développé par TechyKoala';

  @override
  String get learnMore => 'En savoir plus sur nous et nos futures apps';

  @override
  String get visitWebsite => 'Visiter techykoala.com';

  @override
  String get madeWithLove => 'Créé avec ❤️ pour des conversations profondes';

  @override
  String get personal => 'Personnel';

  @override
  String get personalDesc => 'Crée tes propres paquets de questions';

  @override
  String get gameComplete => 'Partie terminée !';

  @override
  String get noMoreQuestions =>
      'Tu as parcouru toutes les questions de ce paquet !';

  @override
  String get playAgain => 'Rejouer';

  @override
  String get mainMenu => 'Menu principal';

  @override
  String get thanksForPlaying => 'Merci d’avoir joué !';

  @override
  String get hopeYouHadFun => 'On espère que tu t’es bien amusé ! 🎉';

  @override
  String get backToMenu => 'Retour au menu';

  @override
  String get leaveGame => 'Quitter la partie ?';

  @override
  String get leaveGameMessage =>
      'Es-tu sûr de vouloir quitter ? La partie continuera pour les autres joueurs.';

  @override
  String get leave => 'Quitter';

  @override
  String get noQuestionsAvailable => 'Aucune question disponible';

  @override
  String get showLess => 'Afficher moins';

  @override
  String get readMore => 'Afficher plus';

  @override
  String get tapToPlay => 'Appuie pour jouer';

  @override
  String get favorites => 'Favoris';

  @override
  String get pandoraHostCreatePin =>
      'L’hôte crée une session et partage le code PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'Les joueurs rejoignent (max. 6 gratuits, illimités avec Premium)';

  @override
  String get pandoraHostSetsTimer =>
      'L’hôte règle le minuteur de question (1–15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Tout le monde soumet des questions (max. 12 en gratuit)';

  @override
  String get pandoraHostControls =>
      'L’hôte contrôle le déroulement de la partie';

  @override
  String get pandoraQuestionsDeleted =>
      'Les questions sont supprimées après la partie';

  @override
  String get pandoraHost => 'Hôte';

  @override
  String get pandoraJoinGame => 'Rejoindre la partie';

  @override
  String get pandoraPandoraBox => 'Boîte de Pandore';

  @override
  String get pleaseEnterName => 'Merci de saisir ton nom';

  @override
  String get hostSuffix => '(Hôte)';

  @override
  String get playersJoinWithNames => 'Les joueurs rejoignent avec leur nom';

  @override
  String get everyoneSubmitsMin5 =>
      'Tout le monde soumet des questions (min. 5, max. 12 gratuits)';

  @override
  String get createSession => 'Créer une session';

  @override
  String get creating => 'Création en cours...';

  @override
  String get yourName => 'Ton nom';

  @override
  String get enterDisplayName => 'Saisis ton nom affiché';

  @override
  String get howItWorks => 'Comment ça marche';

  @override
  String get pinCopied => 'PIN copié dans le presse-papier !';

  @override
  String get endSession => 'Terminer la session ?';

  @override
  String get endSessionConfirm =>
      'Es-tu sûr de vouloir terminer cette session Pandora ?';

  @override
  String get createCustomDeck => 'Créer un paquet personnalisé';

  @override
  String get deckName => 'Nom du paquet';

  @override
  String get enterDeckName => 'Saisis le nom du paquet';

  @override
  String get create => 'Créer';

  @override
  String get deckCreated => 'Paquet créé !';

  @override
  String get failedToCreateDeck => 'Échec de la création du paquet';

  @override
  String get deleteDeck => 'Supprimer le paquet ?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Es-tu sûr de vouloir supprimer « $deckName » ? Cela supprimera toutes les questions de ce paquet.';
  }

  @override
  String get delete => 'Supprimer';

  @override
  String get deckDeleted => 'Paquet supprimé';

  @override
  String get failedToDeleteDeck => 'Échec de la suppression du paquet';

  @override
  String get myDecks => 'Mes paquets';

  @override
  String get noDecksYet => 'Aucun paquet pour l’instant';

  @override
  String get createFirstDeck => 'Crée ton premier paquet personnalisé !';

  @override
  String questionsCount(Object count) {
    return '$count questions';
  }

  @override
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count questions',
      one: '1 question',
      zero: '0 question',
    );
    return '$_temp0';
  }

  @override
  String get questionAdded => 'Question ajoutée !';

  @override
  String get failedToAddQuestion => 'Échec de l’ajout de la question';

  @override
  String get editQuestion => 'Modifier la question';

  @override
  String get enterYourQuestion => 'Saisis ta question';

  @override
  String get save => 'Enregistrer';

  @override
  String get questionUpdated => 'Question mise à jour !';

  @override
  String get failedToUpdateQuestion => 'Échec de la mise à jour de la question';

  @override
  String get deleteQuestion => 'Supprimer la question';

  @override
  String get deleteQuestionConfirm =>
      'Es-tu sûr de vouloir supprimer cette question ?';

  @override
  String get questionDeleted => 'Question supprimée';

  @override
  String get failedToDeleteQuestion => 'Échec de la suppression de la question';

  @override
  String get addQuestion => 'Ajouter une question';

  @override
  String get typeQuestionHere => 'Écris ta question ici...';

  @override
  String get add => 'Ajouter';

  @override
  String get noQuestionsYet => 'Aucune question pour l’instant';

  @override
  String get addFirstQuestion => 'Ajoute ta première question !';

  @override
  String get deckDescLoveTalks =>
      'Explore la romance, la chimie et la connexion grâce à des questions touchantes qui célèbrent votre relation. Des premiers souvenirs à ce qui te fait te sentir le plus aimé(e), ces cartes renforcent votre intimité émotionnelle.';

  @override
  String get deckDescDeepTalks =>
      'Ces cartes plongent dans les valeurs, la vulnérabilité et la façon de grandir ensemble. Elles aident les partenaires à réfléchir à l’indépendance, la communication et le but commun.';

  @override
  String get deckDescSpicyTalks =>
      'Séduisant, audacieux et intime — ce paquet invite les couples à explorer leurs désirs, fantasmes et passions ensemble. Chaque question est conçue pour déclencher des conversations honnêtes et excitantes sur ce qui vous rapproche.';

  @override
  String get deckDescDoYouDareTalks =>
      'Un paquet sans filtre qui mélange honnêteté émotionnelle et sujets sensibles comme la confiance, la religion, l’argent et les limites personnelles — le tout pour révéler ce qui compte vraiment pour vous deux. *Note :* certaines questions sont brutes et directes — jouez avec ouverture d’esprit, empathie et respect.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspiré des cinq langages de l’amour, ce paquet aide les partenaires à exprimer leur affection de la manière qui résonne vraiment chez l’autre. Découvre comment les mots, les actions et les gestes renforcent votre lien.';

  @override
  String get deckDescSillyTalks =>
      'Juste du fun et des fous rires ! Ces questions légères et décalées révèlent vos habitudes les plus étranges et vos pensées les plus drôles. Parfait pour les amis, la famille ou les couples qui ne se prennent pas trop au sérieux.';

  @override
  String get deckDescCarTalks =>
      'Parfait pour les trajets en voiture — ces cartes transforment le temps de route en vraies conversations. Attends-toi à des questions drôles, créatives et nostalgiques sur les voyages, les aventures et les petites manies.';

  @override
  String get deckDescCozyTalks =>
      'Des conversations douces et détendues, parfaites pour les soirées cocooning. Ces questions créent des moments chaleureux et sincères.';

  @override
  String get deckDescPartyNight =>
      'Des questions dynamiques pensées pour les groupes. Parfait pour les soirées, apéros et fêtes entre amis.';

  @override
  String get deckDescUnpopularOpinions =>
      'Le paquet qui te pousse à dire tout haut ce que tout le monde pense tout bas. De la culture influenceurs aux normes sociales — ces cartes déclenchent des débats honnêtes et des points de vue surprenants. Idéal pour les amis à fort caractère.';

  @override
  String get deckDescPlotTwists =>
      'Ce paquet te projette dans les moments les plus drôles et les plus difficiles du type « Que ferais-tu si… ? ». Réactions spontanées, décisions au feeling et fous rires garantis ! Parfait pour les soirées en groupe pleines de rebondissements.';

  @override
  String get deckDescAfterDark =>
      'Entre dans le côté sombre de la conversation avec des questions qui donnent des frissons. Des coïncidences flippantes aux scénarios de survie — parfait pour les soirées tardives qui font un peu peur.';

  @override
  String get deckDescHistoryTalks =>
      'Un mélange nostalgique de souvenirs personnels et de moments en famille. Ces questions inspirent des histoires, des rires et la redécouverte de tes racines. Parfait pour les repas de famille ou les soirées tranquilles.';

  @override
  String get deckDescTinyTalks =>
      'Conçu pour les parents et les plus petits ! Ces questions simples et ludiques aident les enfants à s’exprimer, tandis que les parents découvrent leur façon de penser. Parfait entre 3 et 9 ans.';

  @override
  String get deckDescGoodOldDays =>
      'Retour dans le passé avec des questions sur les bons souvenirs, les expériences vécues et « comment c’était avant ». Convient à tous les âges.';

  @override
  String get deckDescWouldYouRather =>
      'Des dilemmes classiques qui font débattre et révèlent les préférences. Choisis entre deux options et découvre ce qui compte le plus pour chacun.';

  @override
  String get createNewDeck => 'Créer un nouveau paquet';

  @override
  String get sessionPin => 'PIN de session';

  @override
  String get joinSession => 'Rejoindre la session';

  @override
  String get questionSubmitted => 'Question envoyée';

  @override
  String get sessionCancelled => 'Session annulée';

  @override
  String get yourQuestion => 'Ta question';

  @override
  String get reactionBreakdown => 'Détail des réactions';

  @override
  String get deckNameHint => 'Nom du paquet';

  @override
  String get deckCreatedSuccess => 'Paquet créé !';

  @override
  String get cancelSession => 'Annuler la session ?';

  @override
  String get cancelSessionConfirm =>
      'Cela va annuler la session pour tous les joueurs. Es-tu sûr ?';

  @override
  String get no => 'Non';

  @override
  String get yesCancel => 'Oui, annuler';

  @override
  String get hostQuestionCollection => 'Hôte – collecte des questions';

  @override
  String get questionCollection => 'Collecte des questions';

  @override
  String get endSessionButton => 'Terminer la session';

  @override
  String get noActiveSubscription => 'Aucun abonnement actif';

  @override
  String get premium => 'PREMIUM';

  @override
  String notEnoughQuestions(Object count) {
    return 'Pas assez de questions. Minimum 5 requis. (Actuellement : $count)';
  }

  @override
  String get premiumFeatureTitle => 'Fonction Premium';

  @override
  String get questionNavigationPremium =>
      'La navigation par questions est une fonction Premium. Abonne-toi pour débloquer la possibilité de sauter à n’importe quelle question !';

  @override
  String get customDecks => 'Paquets personnalisés';

  @override
  String get noDecksYetMessage => 'Aucun paquet pour l’instant';

  @override
  String get createFirstDeckMessage =>
      'Appuie sur + pour créer ton premier paquet';

  @override
  String get signInRequired => 'Connexion requise';

  @override
  String get signInToUsePersonal =>
      'Connecte-toi pour utiliser le mode Personnel et créer des paquets de questions personnalisés.';

  @override
  String get collaborativeQuestionGame => 'Jeu de questions collaboratif';

  @override
  String get hostPandoraSession => 'Héberger une session Pandora';

  @override
  String get joinPandoraGame => 'Rejoindre une partie';

  @override
  String get yourDisplayName => 'Ton nom affiché';

  @override
  String get enterYourName => 'Saisis ton nom';

  @override
  String get selectQuestion => 'Sélectionner une question';

  @override
  String get joinTime => 'Temps pour rejoindre';

  @override
  String get participants => 'Participants';

  @override
  String get loading => 'Chargement...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Il faut au moins 2 joueurs ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Continuer vers le minuteur';

  @override
  String get setQuestionTimer => 'Régler le minuteur de question';

  @override
  String get questionCollectionTime => 'Temps de collecte des questions';

  @override
  String get minutes => 'minutes';

  @override
  String get sessionWillEnd =>
      'La session se terminera automatiquement si tu ne continues pas dans les 5 minutes';

  @override
  String get startQuestionCollection => 'Commencer la collecte des questions';

  @override
  String questionsSubmitted(int count) {
    return '$count questions envoyées';
  }

  @override
  String get writeQuestionHere => 'Écris ta question ici...';

  @override
  String get whoIsThisFor => 'Pour qui est cette question ?';

  @override
  String get everyone => 'Tout le monde';

  @override
  String get specific => 'Quelqu’un en particulier';

  @override
  String get submitQuestion => 'Envoyer la question';

  @override
  String needMoreQuestions(int count) {
    return 'Encore $count question(s) nécessaire(s)';
  }

  @override
  String get startGame => 'Lancer la partie';

  @override
  String get selectPlayer => 'Choisir un joueur';

  @override
  String get unsubscribe => 'Se désabonner';

  @override
  String get unsubscribeConfirm => 'Annuler l’abonnement Premium ?';

  @override
  String get unsubscribeWarning =>
      'Tu perdras l’accès à toutes les fonctionnalités Premium, y compris les questions illimitées, toutes les catégories, l’absence de pubs et les joueurs Pandora illimités. Tu pourras te réabonner à tout moment.';

  @override
  String get yesUnsubscribe => 'Oui, se désabonner';

  @override
  String get unsubscribeSuccess =>
      'Désabonnement réussi. Les fonctionnalités Premium ont été désactivées.';

  @override
  String get unsubscribeError => 'Échec du désabonnement';

  @override
  String get questions => 'questions';

  @override
  String get preview => 'aperçu';

  @override
  String get userId => 'ID utilisateur';

  @override
  String get subscription => 'Abonnement';

  @override
  String get questionsCount75 => '75 questions';

  @override
  String get questionsCount30 => '30 questions';

  @override
  String get questionsCount5Preview => 'Aperçu de 5 questions';

  @override
  String get unlockFullDeck => 'Débloquer les 75 questions';

  @override
  String get renameDeck => 'Renommer le paquet';

  @override
  String get deckRenamed => 'Paquet renommé avec succès';

  @override
  String get failedToRenameDeck => 'Échec du renommage du paquet';

  @override
  String get shuffleQuestions => 'Mélanger les questions';

  @override
  String get resetOrder => 'Réinitialiser l’ordre';

  @override
  String get questionsShuffled => 'Questions mélangées !';

  @override
  String get orderReset => 'Ordre réinitialisé à l’original';

  @override
  String get readyToPlay => 'Prêt à jouer';

  @override
  String get longPressReorder =>
      'Appuie longuement et fais glisser pour réorganiser les questions';

  @override
  String get noFavoritesYet => 'Aucun favori pour l’instant';

  @override
  String get heartQuestionsDuringGameplay =>
      'Appuie sur le cœur ❤️ sur les cartes pendant la partie pour les enregistrer ici !';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Ajoute au moins $count questions pour commencer à jouer !';
  }

  @override
  String get heartQuestionsInfo =>
      'Ajoute des questions à tes favoris en appuyant sur le cœur pendant la partie !';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Ajoute au moins $count questions pour jouer avec ce paquet';
  }

  @override
  String get removeFromFavorites => 'Retirer des favoris';

  @override
  String get unlockEverything => 'Tout débloquer';

  @override
  String get premiumSubtitle =>
      'Profite d’un accès illimité à toutes les catégories, supprime les pubs pour toujours et débloque les fonctionnalités Premium';

  @override
  String get save32Percent => 'ÉCONOMISE 29 %';

  @override
  String get priceMonthly => '6,99 €/mois';

  @override
  String get priceYearly => '59,99 €/an';

  @override
  String get billedAnnually => 'Facturé annuellement';

  @override
  String get equivalentMonthly => 'Soit seulement 5 €/mois';

  @override
  String get feature24Categories =>
      '24+ catégories premium débloquées dans tous les modes';

  @override
  String get feature75Questions =>
      '75 questions par catégorie (contre 30 dans le niveau gratuit)';

  @override
  String get featureNoAds => 'Plus aucune pub – expérience ininterrompue';

  @override
  String get featureUnlimitedPlayers =>
      'Mode Pandora : joueurs et questions illimités';

  @override
  String get featureQuestionNavigation =>
      'Navigue et saute à n’importe quelle question pendant la partie';

  @override
  String get featureSupportDevelopment =>
      'Soutiens le développement continu et les nouvelles fonctionnalités';

  @override
  String get error => 'Erreur';

  @override
  String get premiumActivatedMessage =>
      'Premium activé ! Toutes les catégories sont débloquées.';

  @override
  String get featurePersonalDecks =>
      'Mode Personnel : crée un nombre illimité de paquets personnalisés avec tes propres questions';

  @override
  String get premiumPersonal =>
      'Le mode Personnel avec paquets personnalisés est une fonctionnalité Premium. Passe à Premium pour créer et jouer avec tes propres paquets de questions !';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Es-tu sûr de vouloir supprimer « $deckName » ? Cela supprimera toutes les questions de ce paquet.';
  }

  @override
  String needMore(int count) {
    return 'Encore $count nécessaire(s)';
  }

  @override
  String get editQuestions => 'Modifier les questions';

  @override
  String get addMore => 'Ajouter plus';

  @override
  String useMyConnectEmail(String email) {
    return 'Utiliser mon e-mail Connect : $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Les utilisateurs gratuits peuvent avoir 6 joueurs maximum. Passe à Premium pour un nombre illimité de joueurs !';

  @override
  String get freemiumQuestionLimit =>
      'Les utilisateurs gratuits peuvent soumettre 12 questions maximum. Passe à Premium pour un nombre illimité de questions !';

  @override
  String get yourQuestions => 'Tes questions';

  @override
  String waitingForHost(int count) {
    return 'En attente de l’hôte... ($count joueurs)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Passe à Premium pour des joueurs illimités';

  @override
  String get kickPlayer => 'Exclure un joueur';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Es-tu sûr de vouloir exclure $playerName ?';
  }

  @override
  String get kick => 'Exclure';

  @override
  String playerKicked(String playerName) {
    return '$playerName a été exclu';
  }

  @override
  String get failedToKickPlayer => 'Impossible d’exclure le joueur';

  @override
  String get cancelSessionForAll =>
      'Cela va annuler la session pour tous les joueurs. Es-tu sûr ?';

  @override
  String get youWereKicked => 'Tu as été exclu de la session';

  @override
  String get you => 'Toi';

  @override
  String get loginRequiredForPandora =>
      'Connexion requise pour jouer à Pandora';

  @override
  String get login => 'Connexion';

  @override
  String get loginRequiredNote =>
      'Connexion requise pour jouer à Pandora (pour suivre correctement les joueurs)';

  @override
  String get timeIsUp => 'Le temps est écoulé !';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Pas assez de questions soumises ($current/$minimum minimum).';
  }

  @override
  String get sessionQuestionLimit =>
      'Limite de questions de la session atteinte';

  @override
  String get sessionQuestionLimitMessage =>
      'Cette session a atteint la limite de 12 questions (hôte gratuit). Passe à Premium pour des questions illimitées !';

  @override
  String sessionQuestionCount(int current) {
    return 'Session : $current/12 questions';
  }

  @override
  String get pleaseEnterQuestion => 'Merci de saisir une question';

  @override
  String get rateThisDeck => 'Noter ce paquet';

  @override
  String get yourRating => 'Ta note';

  @override
  String get skip => 'Ignorer';

  @override
  String get submit => 'Envoyer';

  @override
  String get thankYouForFeedback => 'Merci pour ton retour !';

  @override
  String get failedToSubmitRating => 'Échec de l’envoi de la note';

  @override
  String get tapStarsToRate => 'Appuie sur les étoiles pour noter';

  @override
  String get downloadForOffline => 'Télécharger pour un usage hors ligne';

  @override
  String get downloading => 'Téléchargement en cours...';

  @override
  String get downloadedLanguages => 'Langues téléchargées';

  @override
  String get languageNotDownloaded => 'Langue non téléchargée';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'Tu n\'as pas téléchargé $languageName pour un usage hors ligne.\n\nVa dans Paramètres > Profil > \"Télécharger pour un usage hors ligne\" pendant que tu es connecté à internet.';
  }

  @override
  String get offlineLanguageError =>
      'Cette langue n\'a pas été téléchargée pour un usage hors ligne. Va dans Paramètres > Profil > \"Télécharger pour un usage hors ligne\" pendant que tu es connecté à internet.';

  @override
  String get downloadComplete => 'Téléchargement terminé !';

  @override
  String get downloadCompleteMessage =>
      'Tout le contenu a été téléchargé pour un usage hors ligne.';

  @override
  String get addedToFavorites => 'Ajouté aux favoris';

  @override
  String get removedFromFavorites => 'Retiré des favoris';

  @override
  String get errorSavingFavorite => 'Erreur lors de la sauvegarde du favori';

  @override
  String get internetRequired => 'Internet requis';

  @override
  String get internetRequiredMessage =>
      'Certaines fonctionnalités nécessitent une connexion Internet. Les utilisateurs Premium peuvent télécharger du contenu pour un usage hors ligne dans les Paramètres.';

  @override
  String get goPremium => 'Passer en Premium';

  @override
  String get pleaseEnterPin => 'Veuillez entrer un code PIN à 6 chiffres';

  @override
  String errorOccurred(String error) {
    return 'Erreur : $error';
  }

  @override
  String get errorCreatingSession => 'Erreur lors de la création de la session';

  @override
  String get sessionTimedOut =>
      'Délai de session expiré - l\'hôte n\'a pas configuré le minuteur';

  @override
  String get errorStarting => 'Erreur au démarrage';

  @override
  String get errorLoadingParticipants =>
      'Erreur lors du chargement des participants';

  @override
  String get sessionCancelledByHost => 'Session annulée par l\'hôte';

  @override
  String needAtLeast5Questions(int count) {
    return 'Il faut au moins 5 questions pour commencer ! (Actuellement : $count)';
  }

  @override
  String get errorStartingGame => 'Erreur lors du démarrage du jeu';

  @override
  String get questionsAsked => 'Questions posées';

  @override
  String get totalReactions => 'Réactions totales';

  @override
  String get mostLovedQuestion => 'Question la plus aimée';

  @override
  String get mostFunQuestion => 'Question la plus drôle';

  @override
  String get mostShockingQuestion => 'Question la plus choquante';

  @override
  String get mostLitQuestion => 'Question la plus cool';

  @override
  String get hotSeatAward => 'Prix Hot Seat';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Erreur : Impossible d\'identifier le joueur. Veuillez rejoindre à nouveau la session.';

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
