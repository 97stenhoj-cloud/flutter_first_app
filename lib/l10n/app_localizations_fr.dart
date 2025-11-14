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
  String get howToPlay => 'Comment Jouer';

  @override
  String get chooseGameMode => 'Choisissez votre mode de jeu';

  @override
  String get family => 'Famille';

  @override
  String get couple => 'Couple';

  @override
  String get friends => 'Amis';

  @override
  String get chooseCategory => 'Choisissez une Catégorie';

  @override
  String get locked => 'Catégorie Premium';

  @override
  String get lockedMessage =>
      'Ceci est une catégorie premium. Passez à la version supérieure pour débloquer toutes les catégories et supprimer les publicités !';

  @override
  String get previewAvailable =>
      'Aperçu : Les 5 premières questions disponibles';

  @override
  String get upgradeNow => 'Mettre à Niveau Maintenant';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Peut-être Plus Tard';

  @override
  String get getPremium => 'Obtenir Premium';

  @override
  String get premiumTitle => 'Tout Débloquer';

  @override
  String get premiumDescription =>
      'Obtenez un accès illimité à toutes les catégories dans tous les modes, supprimez les publicités et profitez de sessions Pandora illimitées.';

  @override
  String get premiumPriceMonthly => '49 DKK/mois';

  @override
  String get premiumPriceYearly => '399 DKK/an';

  @override
  String get saveWithYearly => 'Économisez 189 DKK avec l\'abonnement annuel !';

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
  String get premiumFeature2 => '✓ Sans publicités pour toujours';

  @override
  String get premiumFeature3 => '✓ 75 questions dans toutes les catégories';

  @override
  String get premiumFeature4 => '✓ Pandora : Joueurs et questions illimités';

  @override
  String get premiumFeature5 => '✓ Soutenez le développement continu';

  @override
  String get subscribePremium => 'S\'abonner à Premium';

  @override
  String get subscribe => 'S\'abonner';

  @override
  String get cancel => 'Annuler';

  @override
  String get subscriptionActivated =>
      'Premium activé ! Toutes les catégories débloquées.';

  @override
  String get premiumActivated => 'Premium Activé !';

  @override
  String get demoNote =>
      'Démo : L\'abonnement sera réinitialisé au redémarrage de l\'application';

  @override
  String get freeTier => 'Niveau Gratuit';

  @override
  String get freeTierDesc =>
      '3 catégories par mode (30 questions chacune)\nAperçus de 5 questions des catégories premium\nPublicités toutes les 7 questions';

  @override
  String get currentPlan => 'Forfait Actuel';

  @override
  String get limitReached => 'Limite Atteinte';

  @override
  String get freeCategoryLimit =>
      'Vous avez atteint la limite de 30 questions pour les catégories gratuites. Passez à Premium pour un accès illimité !';

  @override
  String get previewLimit =>
      'Vous avez vu toutes les 5 questions d\'aperçu. Passez à Premium pour continuer !';

  @override
  String get pandoraFreeLimit => 'Limite Gratuite';

  @override
  String get pandoraFreeLimitMessage =>
      'Les hôtes gratuits peuvent avoir max. 6 joueurs et 12 questions. Passez à Premium pour un accès illimité !';

  @override
  String get pandoraUpgradeMessage =>
      'Vous avez atteint 12 questions. Passez à Premium pour continuer à jouer !';

  @override
  String get pandoraMaxPlayers =>
      'Maximum de 6 joueurs atteint (limite gratuite). Passez à Premium pour des joueurs illimités !';

  @override
  String get swipeOrTap => 'Glissez ou touchez les flèches';

  @override
  String get previous => 'Précédent';

  @override
  String get next => 'Suivant';

  @override
  String get advertisement => 'Publicité';

  @override
  String get watchAdMessage =>
      'Regardez une courte publicité pour continuer, ou profitez sans publicité avec premium !';

  @override
  String get watchAd => 'Regarder la Pub';

  @override
  String get goAdFree => 'Sans Pub avec Premium';

  @override
  String get removeAdsForever => 'Supprimer les Pubs Pour Toujours';

  @override
  String get adNotReady => 'Publicité non prête. Continuer sans publicité.';

  @override
  String get adLoadingContinue => 'Chargement de la publicité... Continuer';

  @override
  String get pricePerMonth => '49 DKK/mois ou 399 DKK/an';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Aucune question trouvée pour $category en mode $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Erreur lors du chargement des questions. Veuillez vérifier votre connexion.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Échec du chargement des questions : $error';
  }

  @override
  String get madeForWife => 'Fait pour ma belle épouse';

  @override
  String get otiLia => 'Otilia Stenhøj';

  @override
  String get withLoveAndConversations => 'Avec amour et conversations';

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
  String get signOut => 'Se Déconnecter';

  @override
  String get notSignedIn => 'Non Connecté';

  @override
  String get signInSignUp => 'Se Connecter / S\'inscrire';

  @override
  String get signInToSync =>
      'Connectez-vous pour synchroniser votre abonnement sur tous vos appareils et débloquer du contenu premium';

  @override
  String get signOutConfirm => 'Êtes-vous sûr de vouloir vous déconnecter ?';

  @override
  String get signedOutSuccess => 'Déconnexion réussie';

  @override
  String get accountInformation => 'Informations du Compte';

  @override
  String get email => 'E-mail';

  @override
  String get memberSince => 'Membre Depuis';

  @override
  String get notAvailable => 'Non disponible';

  @override
  String get unknown => 'Inconnu';

  @override
  String get subscriptionStatus => 'Statut d\'Abonnement';

  @override
  String get premiumMember => 'Membre Premium';

  @override
  String get freeAccount => 'Compte Gratuit';

  @override
  String get welcomeToConnect => 'Bienvenue sur Connect !';

  @override
  String get continueWithApple => 'Continuer avec Apple';

  @override
  String get continueWithGoogle => 'Continuer avec Google';

  @override
  String get skipForNow => 'Passer pour l\'instant';

  @override
  String get byContining =>
      'En continuant, vous acceptez nos Conditions d\'utilisation et notre Politique de confidentialité';

  @override
  String get googleSignInFailed =>
      'Échec de la connexion Google. Veuillez réessayer.';

  @override
  String get appleSignInFailed =>
      'Échec de la connexion Apple. Veuillez réessayer.';

  @override
  String get noCategoriesFound => 'Aucune catégorie trouvée';

  @override
  String get aboutCredits => 'À Propos / Crédits';

  @override
  String get welcomeBack => 'Bon Retour !';

  @override
  String get createAccount => 'Créer un Compte';

  @override
  String get displayName => 'Nom d\'Affichage';

  @override
  String get password => 'Mot de Passe';

  @override
  String get signIn => 'Se Connecter';

  @override
  String get signUp => 'S\'inscrire';

  @override
  String get dontHaveAccount => 'Vous n\'avez pas de compte ? Inscrivez-vous';

  @override
  String get alreadyHaveAccount => 'Vous avez déjà un compte ? Connectez-vous';

  @override
  String get chooseYourMode => '1. Choisissez Votre Mode';

  @override
  String get chooseYourModeDesc =>
      'Sélectionnez parmi trois styles de conversation :\n\n• Famille - Conversations chaleureuses et saines parfaites pour tous les âges\n• Couple - Questions intimes et romantiques pour approfondir votre connexion\n• Amis - Sujets amusants et divertissants pour votre groupe';

  @override
  String get pickCategory => '2. Choisissez une Catégorie';

  @override
  String get pickCategoryDesc =>
      'Chaque mode a plusieurs catégories avec des packs de questions uniques. 3 catégories gratuites par mode (30 questions chacune), avec des aperçus de 5 questions des catégories premium.';

  @override
  String get startTalking => '3. Commencez à Parler';

  @override
  String get startTalkingDesc =>
      'Les questions apparaissent en plein écran. À tour de rôle, lisez-les et répondez-y honnêtement. Il n\'y a pas de mauvaises réponses - l\'objectif est une conversation significative !';

  @override
  String get navigateQuestions => '4. Naviguez dans les Questions';

  @override
  String get navigateQuestionsDesc =>
      '• Glissez vers la droite ou touchez \"Suivant\" pour la question suivante\n• Glissez vers la gauche ou touchez \"Précédent\" pour revenir aux questions\n• Touchez le bouton d\'accueil pour revenir au menu principal à tout moment';

  @override
  String get premiumFeatures => '5. Fonctionnalités Premium';

  @override
  String get premiumFeaturesDesc =>
      'Débloquez les 24 catégories avec Premium :\n\n• Mensuel : 49 DKK/mois\n• Annuel : 399 DKK/an (économisez 189 DKK !)\n\n✓ Toutes les catégories débloquées\n✓ Sans publicités\n✓ Questions illimitées\n✓ Sessions Pandora illimitées';

  @override
  String get proTips => 'Conseils Pro';

  @override
  String get proTipsDesc =>
      '• Créez un environnement confortable et sans distraction\n• Écoutez activement et soyez présent\n• Partagez honnêtement et encouragez les autres à faire de même\n• Respectez les limites - sautez les questions si nécessaire\n• Amusez-vous et profitez de la connexion !';

  @override
  String get personal => 'Personnel';

  @override
  String get personalDesc =>
      'Créez vos propres decks de questions personnalisés';

  @override
  String get gameComplete => 'Jeu Terminé !';

  @override
  String get noMoreQuestions =>
      'Vous avez parcouru toutes les questions de ce deck !';

  @override
  String get playAgain => 'Rejouer';

  @override
  String get mainMenu => 'Menu Principal';

  @override
  String get thanksForPlaying => 'Merci d\'Avoir Joué !';

  @override
  String get hopeYouHadFun => 'J\'espère que vous vous êtes amusé ! 🎉';

  @override
  String get backToMenu => 'Retour au Menu';

  @override
  String get leaveGame => 'Quitter le Jeu ?';

  @override
  String get leaveGameMessage =>
      'Êtes-vous sûr de vouloir partir ? Le jeu continuera pour les autres joueurs.';

  @override
  String get leave => 'Partir';

  @override
  String get noQuestionsAvailable => 'Aucune question disponible';

  @override
  String get showLess => 'Afficher Moins';

  @override
  String get readMore => 'Lire Plus';

  @override
  String get tapToPlay => 'Toucher pour Jouer';

  @override
  String get favorites => 'Favoris';

  @override
  String get pandoraHostCreatePin =>
      'L\'hôte crée une session et partage le PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'Les joueurs rejoignent (max 6 gratuit, illimité premium)';

  @override
  String get pandoraHostSetsTimer =>
      'L\'hôte définit le minuteur de questions (1-15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Tout le monde soumet des questions (max 12 gratuit)';

  @override
  String get pandoraHostControls => 'L\'hôte contrôle la progression du jeu';

  @override
  String get pandoraQuestionsDeleted => 'Questions supprimées après le jeu';

  @override
  String get pandoraHost => 'Hôte';

  @override
  String get pandoraJoinGame => 'Rejoindre la Partie';

  @override
  String get pandoraPandoraBox => 'Boîte de Pandore';

  @override
  String get pleaseEnterName => 'Veuillez entrer votre nom';

  @override
  String get hostSuffix => '(Hôte)';

  @override
  String get playersJoinWithNames => 'Les joueurs rejoignent avec leurs noms';

  @override
  String get everyoneSubmitsMin5 =>
      'Tout le monde soumet des questions (min 5, max 12 gratuit)';

  @override
  String get createSession => 'Créer une Session';

  @override
  String get creating => 'Création...';

  @override
  String get yourName => 'Votre Nom';

  @override
  String get enterDisplayName => 'Entrez votre nom d\'affichage';

  @override
  String get howItWorks => 'Comment Ça Marche';

  @override
  String get pinCopied => 'PIN copié dans le presse-papiers !';

  @override
  String get endSession => 'Terminer la Session ?';

  @override
  String get endSessionConfirm =>
      'Êtes-vous sûr de vouloir terminer cette session Pandora ?';

  @override
  String get createCustomDeck => 'Créer un Deck Personnalisé';

  @override
  String get deckName => 'Nom du Deck';

  @override
  String get enterDeckName => 'Entrez le nom du deck';

  @override
  String get create => 'Créer';

  @override
  String get deckCreated => 'Deck créé !';

  @override
  String get failedToCreateDeck => 'Échec de la création du deck';

  @override
  String get deleteDeck => 'Supprimer le Deck ?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Êtes-vous sûr de vouloir supprimer \"$deckName\" ? Cela supprimera toutes les questions de ce deck.';
  }

  @override
  String get delete => 'Supprimer';

  @override
  String get deckDeleted => 'Deck supprimé';

  @override
  String get failedToDeleteDeck => 'Échec de la suppression du deck';

  @override
  String get myDecks => 'Mes Decks';

  @override
  String get noDecksYet => 'Aucun deck pour le moment';

  @override
  String get createFirstDeck => 'Créez votre premier deck personnalisé !';

  @override
  String questionsCount(Object count) {
    return '$count questions';
  }

  @override
  String questionCount(int count) {
    return '$count question';
  }

  @override
  String get questionAdded => 'Question ajoutée !';

  @override
  String get failedToAddQuestion => 'Échec de l\'ajout de la question';

  @override
  String get editQuestion => 'Modifier la Question';

  @override
  String get enterYourQuestion => 'Entrez votre question';

  @override
  String get save => 'Enregistrer';

  @override
  String get questionUpdated => 'Question mise à jour !';

  @override
  String get failedToUpdateQuestion => 'Échec de la mise à jour de la question';

  @override
  String get deleteQuestion => 'Supprimer la Question';

  @override
  String get deleteQuestionConfirm =>
      'Êtes-vous sûr de vouloir supprimer cette question ?';

  @override
  String get questionDeleted => 'Question supprimée';

  @override
  String get failedToDeleteQuestion => 'Échec de la suppression de la question';

  @override
  String get addQuestion => 'Ajouter une Question';

  @override
  String get typeQuestionHere => 'Tapez votre question ici...';

  @override
  String get add => 'Ajouter';

  @override
  String get noQuestionsYet => 'Aucune question pour le moment';

  @override
  String get addFirstQuestion => 'Ajoutez votre première question !';

  @override
  String get deckDescLoveTalks =>
      'Explorez la romance, la chimie et la connexion à travers des questions sincères qui célèbrent votre relation. Des \"comment nous nous sommes rencontrés\" à ce qui vous fait vous sentir le plus aimé, ces cartes approfondissent l\'intimité émotionnelle.';

  @override
  String get deckDescDeepTalks =>
      'Ces cartes explorent les valeurs, la vulnérabilité et ce que signifie grandir ensemble. Elles aident les partenaires à réfléchir à l\'indépendance, à la communication et à un but commun.';

  @override
  String get deckDescSpicyTalks =>
      'Audacieuses, sensuelles et intimes — ces cartes invitent les couples à explorer le désir, les fantasmes et la passion ensemble. Chaque question suscite des conversations honnêtes et excitantes qui rapprochent.';

  @override
  String get deckDescDoYouDareTalks =>
      'Un jeu audacieux qui mêle honnêteté émotionnelle et sujets sensibles comme la confiance, la religion, l\'argent et les limites personnelles — tout conçu pour révéler ce qui compte vraiment. *Note :* Certaines questions sont franches et sans filtre — jouez avec ouverture, empathie et respect.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspiré des cinq langages de l\'amour, ce jeu aide les couples à exprimer leur affection de manière authentique. Découvrez comment les mots, les actions et les gestes renforcent votre lien.';

  @override
  String get deckDescSillyTalks =>
      'Du pur plaisir et des rires ! Ces questions légères révèlent vos habitudes les plus étranges et vos pensées les plus drôles. Idéal pour amis, famille ou couples qui ne se prennent pas trop au sérieux.';

  @override
  String get deckDescCarTalks =>
      'Parfaites pour les road trips — ces cartes transforment le temps de conduite en super conversations. Des questions amusantes, créatives et nostalgiques sur les voyages et les aventures.';

  @override
  String get deckDescCozyTalks =>
      'Conversations chaleureuses et détendues parfaites pour les soirées confortables. Ces questions créent des moments confortables et sincères de connexion.';

  @override
  String get deckDescPartyNight =>
      'Questions énergiques conçues pour des ambiances de groupe amusantes. Parfaites pour les fêtes et les réunions sociales avec des amis.';

  @override
  String get deckDescUnpopularOpinions =>
      'Le jeu qui vous encourage à dire tout haut ce que tout le monde pense tout bas. De la culture des influenceurs aux normes sociales — ces cartes suscitent des débats francs et des réflexions surprenantes. Parfait pour les amis avec des opinions.';

  @override
  String get deckDescPlotTwists =>
      'Ce jeu vous embarque dans les moments les plus drôles et délicats du \"Que ferais-tu si... ?\". Pensée rapide, instincts et rires garantis ! Idéal pour des soirées entre amis pleines de surprises et de rires.';

  @override
  String get deckDescAfterDark =>
      'Explorez le côté sombre des conversations avec des questions qui donnent des frissons. Des coïncidences étranges aux scénarios de survie — parfait pour les soirées tardives avec des sensations fortes.';

  @override
  String get deckDescHistoryTalks =>
      'Un mélange nostalgique de souvenirs personnels et familiaux. Ces questions inspirent récits, rires et redécouverte de ses racines. Parfait pour les réunions de famille ou les soirées confortables.';

  @override
  String get deckDescTinyTalks =>
      'Conçu pour les parents et leurs petits ! Ces questions simples et ludiques aident les enfants à s\'exprimer pendant que les parents apprennent comment ils pensent. Parfait pour les 3 à 9 ans.';

  @override
  String get deckDescGoodOldDays =>
      'Voyagez dans le temps avec des questions sur des souvenirs chéris, des expériences passées et comment les choses étaient avant. Parfait pour tous les âges.';

  @override
  String get deckDescWouldYouRather =>
      'Questions de dilemmes classiques qui provoquent des débats et révèlent des préférences. Choisissez entre deux options et découvrez ce qui compte le plus.';

  @override
  String get createNewDeck => 'Créer un Nouveau Deck';

  @override
  String get sessionPin => 'PIN de Session';

  @override
  String get joinSession => 'Rejoindre la Session';

  @override
  String get questionSubmitted => 'Question Soumise';

  @override
  String get sessionCancelled => 'Session Annulée';

  @override
  String get yourQuestion => 'Votre question';

  @override
  String get reactionBreakdown => 'Répartition des Réactions';

  @override
  String get deckNameHint => 'Nom du deck';

  @override
  String get deckCreatedSuccess => 'Deck créé !';

  @override
  String get cancelSession => 'Annuler la Session ?';

  @override
  String get cancelSessionConfirm =>
      'Cela annulera la session pour tous les joueurs. Êtes-vous sûr ?';

  @override
  String get no => 'Non';

  @override
  String get yesCancel => 'Oui, Annuler';

  @override
  String get hostQuestionCollection => 'Hôte - Collecte des questions';

  @override
  String get questionCollection => 'Collection de Questions';

  @override
  String get endSessionButton => 'Terminer la Session';

  @override
  String get noActiveSubscription => 'Aucun Abonnement Actif';

  @override
  String get premium => 'Premium';

  @override
  String notEnoughQuestions(Object count) {
    return 'Not enough questions. Minimum 5 required. (Currently: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Fonctionnalité Premium';

  @override
  String get questionNavigationPremium =>
      'La navigation entre les questions est une fonctionnalité premium. Abonnez-vous pour débloquer la possibilité de sauter à n\'importe quelle question !';

  @override
  String get customDecks => 'Paquets Personnalisés';

  @override
  String get noDecksYetMessage => 'Pas encore de paquets';

  @override
  String get createFirstDeckMessage =>
      'Appuyez sur + pour créer votre premier paquet';

  @override
  String get signInRequired => 'Connexion Requise';

  @override
  String get signInToUsePersonal =>
      'Veuillez vous connecter pour utiliser le mode Personnel et créer des paquets de questions personnalisés.';

  @override
  String get collaborativeQuestionGame => 'Jeu de Questions Collaboratif';

  @override
  String get hostPandoraSession => 'Héberger Session Pandora';

  @override
  String get joinPandoraGame => 'Rejoindre un Jeu';

  @override
  String get yourDisplayName => 'Votre Nom d\'Affichage';

  @override
  String get enterYourName => 'Entrez votre nom';

  @override
  String get selectQuestion => 'Sélectionner la Question';

  @override
  String get joinTime => 'Temps pour Rejoindre';

  @override
  String get participants => 'Participants';

  @override
  String get loading => 'Chargement...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Au moins 2 joueurs nécessaires ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Continuer vers Configuration du Minuteur';

  @override
  String get setQuestionTimer => 'Régler le minuteur de questions';

  @override
  String get questionCollectionTime => 'Temps de collecte des questions';

  @override
  String get minutes => 'minutes';

  @override
  String get sessionWillEnd =>
      'La session se terminera automatiquement si vous ne continuez pas dans les 5 minutes';

  @override
  String get startQuestionCollection => 'Commencer la collecte des questions';

  @override
  String questionsSubmitted(int count) {
    return '$count questions soumises';
  }

  @override
  String get writeQuestionHere => 'Écrivez votre question ici...';

  @override
  String get whoIsThisFor => 'Pour qui est-ce ?';

  @override
  String get everyone => 'Tout le monde';

  @override
  String get specific => 'Spécifique';

  @override
  String get submitQuestion => 'Soumettre la question';

  @override
  String needMoreQuestions(int count) {
    return 'Besoin de $count questions supplémentaires';
  }

  @override
  String get startGame => 'Commencer le jeu';

  @override
  String get selectPlayer => 'Sélectionnez un joueur';

  @override
  String get unsubscribe => 'Se désabonner';

  @override
  String get unsubscribeConfirm => 'Annuler l’abonnement Premium ?';

  @override
  String get unsubscribeWarning =>
      'Vous perdrez l’accès à toutes les fonctionnalités premium, y compris les questions illimitées, toutes les catégories, une expérience sans publicité et des lecteurs Pandora illimités. Vous pouvez vous réabonner à tout moment.';

  @override
  String get yesUnsubscribe => 'Oui, se désabonner';

  @override
  String get unsubscribeSuccess =>
      'Désabonnement réussi. Les fonctionnalités premium ont été désactivées.';

  @override
  String get unsubscribeError => 'Échec du désabonnement';

  @override
  String get questions => 'questions';

  @override
  String get preview => 'aperçu';

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
    return 'Are you sure you want to kick $playerName?';
  }

  @override
  String get kick => 'Kick';

  @override
  String playerKicked(String playerName) {
    return '$playerName has been kicked';
  }

  @override
  String get failedToKickPlayer => 'Failed to kick player';

  @override
  String get cancelSessionForAll =>
      'This will cancel the session for all players. Are you sure?';

  @override
  String get youWereKicked => 'You were removed from the session';

  @override
  String get you => 'You';

  @override
  String get loginRequiredForPandora => 'Login required to play Pandora';

  @override
  String get login => 'Login';

  @override
  String get loginRequiredNote =>
      'Login required to play Pandora (track players properly)';

  @override
  String get timeIsUp => 'Time\'s Up!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Not enough questions were submitted ($current/$minimum minimum).';
  }

  @override
  String get sessionQuestionLimit => 'Session Question Limit Reached';

  @override
  String get sessionQuestionLimitMessage =>
      'This session has reached the 12-question limit (Free host). Upgrade to Premium for unlimited questions!';

  @override
  String sessionQuestionCount(int current) {
    return 'Session: $current/12 questions';
  }

  @override
  String get pleaseEnterQuestion => 'Please enter a question';

  @override
  String get rateThisDeck => 'Rate this deck';

  @override
  String get yourRating => 'Your rating';

  @override
  String get skip => 'Skip';

  @override
  String get submit => 'Submit';

  @override
  String get thankYouForFeedback => 'Thank you for your feedback!';

  @override
  String get failedToSubmitRating => 'Failed to submit rating';

  @override
  String get tapStarsToRate => 'Tap stars to rate';
}
