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
  String get chooseGameMode => 'Choisissez votre mode de jeu';

  @override
  String get family => 'Famille';

  @override
  String get couple => 'Couple';

  @override
  String get friends => 'Amis';

  @override
  String get chooseCategory => 'Choisissez une catégorie';

  @override
  String get locked => 'Catégorie verrouillée';

  @override
  String get lockedMessage =>
      'Cette catégorie est verrouillée. Passez à premium pour débloquer toutes les catégories !';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Peut-être plus tard';

  @override
  String get chooseSubscription => 'Choisissez votre abonnement';

  @override
  String get subscriptionDescription =>
      'Débloquez les catégories premium et accédez à des packs de questions exclusifs';

  @override
  String get chooseBundleOne => 'Choisissez 1 pack de catégories';

  @override
  String get chooseBundleTwo => 'Choisissez 2 packs de catégories';

  @override
  String get chooseBundleThree => 'Les 3 packs de catégories';

  @override
  String get perMonth => '/mois';

  @override
  String get bestValue => 'MEILLEURE OFFRE';

  @override
  String get unlockAllBundles => 'Débloquer tous les packs';

  @override
  String get selectYourBundle => 'Sélectionnez votre pack';

  @override
  String selectBundles(Object count, Object plural) {
    return 'Sélectionnez $count pack$plural';
  }

  @override
  String get premiumCategories => '4 catégories premium';

  @override
  String get cancel => 'Annuler';

  @override
  String get subscribe => 'S\'abonner';

  @override
  String subscriptionActivated(Object bundles) {
    return 'Abonnement activé ! $bundles débloqué.';
  }

  @override
  String get demoNote =>
      'Démo : Les déverrouillages seront réinitialisés au redémarrage de l\'application';

  @override
  String get swipeOrTap => 'Glisser ou toucher les flèches';

  @override
  String get previous => 'Précédent';

  @override
  String get next => 'Suivant';

  @override
  String get advertisement => 'Publicité';

  @override
  String get watchAdMessage =>
      'Regardez une courte publicité pour continuer, ou passez en mode premium sans publicité !';

  @override
  String get watchAd => 'Regarder la pub';

  @override
  String get goAdFree => 'Sans pub - 59 DKK/mois';

  @override
  String get removeAdsForever => 'Supprimer les pubs pour toujours';

  @override
  String get chooseOneBundle =>
      'Choisissez 1 pack à débloquer et supprimez toutes les publicités';

  @override
  String get noAdsForever => 'Aucune publicité pour toujours';

  @override
  String premiumActivated(Object bundle) {
    return 'Premium activé ! Publicités supprimées. Pack $bundle débloqué.';
  }

  @override
  String get adNotReady => 'Publicité non prête. Continuer sans publicité.';

  @override
  String get adLoadingContinue => 'Chargement de la publicité... Continuer';

  @override
  String get pricePerMonth => '59 DKK/mois';

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
  String get signOut => 'Se déconnecter';

  @override
  String get notSignedIn => 'Non connecté';

  @override
  String get signInSignUp => 'Se connecter / S\'inscrire';

  @override
  String get signInToSync =>
      'Connectez-vous pour synchroniser vos abonnements sur tous vos appareils et débloquer du contenu premium';

  @override
  String get signOutConfirm => 'Êtes-vous sûr de vouloir vous déconnecter ?';

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
  String get activeSubscriptions => 'Abonnements actifs';

  @override
  String bundlesUnlocked(Object count, Object plural) {
    return '$count pack$plural débloqué';
  }

  @override
  String bundle(Object name) {
    return 'Pack $name';
  }

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
  String selectBundlePlural(Object plural) {
    return 'Sélectionnez le$plural pack$plural de catégories que vous souhaitez débloquer';
  }

  @override
  String get getAccessAllBundles =>
      'Accédez à toutes les catégories premium dans les 3 packs !';

  @override
  String subscriptionActivatedFull(Object bundles) {
    return 'Abonnement activé ! $bundles débloqué.';
  }

  @override
  String get aboutCredits => 'À propos / Crédits';

  @override
  String get welcomeBack => 'Bon retour !';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get displayName => 'Nom d\'affichage';

  @override
  String get password => 'Mot de passe';

  @override
  String get signIn => 'Se connecter';

  @override
  String get signUp => 'S\'inscrire';

  @override
  String get dontHaveAccount => 'Vous n\'avez pas de compte ? Inscrivez-vous';

  @override
  String get alreadyHaveAccount => 'Vous avez déjà un compte ? Connectez-vous';

  @override
  String get chooseYourMode => '1. Choisissez votre mode';

  @override
  String get chooseYourModeDesc =>
      'Sélectionnez parmi trois styles de conversation :\n\n• Famille - Conversations chaleureuses et saines, parfaites pour tous les âges\n• Couple - Questions intimes et romantiques pour approfondir votre connexion\n• Amis - Sujets amusants et divertissants pour votre groupe';

  @override
  String get pickCategory => '2. Choisissez une catégorie';

  @override
  String get pickCategoryDesc =>
      'Chaque mode a plusieurs catégories avec des packs de questions uniques. Les catégories gratuites sont débloquées, tandis que les catégories premium nécessitent un abonnement.';

  @override
  String get startTalking => '3. Commencez à parler';

  @override
  String get startTalkingDesc =>
      'Les questions apparaissent en plein écran. À tour de rôle, lisez-les et répondez-y honnêtement. Il n\'y a pas de mauvaises réponses - l\'objectif est une conversation significative !';

  @override
  String get navigateQuestions => '4. Naviguer dans les questions';

  @override
  String get navigateQuestionsDesc =>
      '• Glissez vers la droite ou touchez \"Suivant\" pour la question suivante\n• Glissez vers la gauche ou touchez \"Précédent\" pour revenir aux questions\n• Touchez le bouton d\'accueil pour revenir au menu principal à tout moment';

  @override
  String get premiumFeatures => '5. Fonctionnalités Premium';

  @override
  String get premiumFeaturesDesc =>
      'Débloquez des catégories de questions exclusives avec un abonnement :\n\n• 1 pack (4 catégories) - 59 DKK/mois\n• 2 packs (8 catégories) - 109 DKK/mois\n• 3 packs (12 catégories) - 149 DKK/mois';

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
  String get gameComplete => 'Jeu terminé !';

  @override
  String get noMoreQuestions =>
      'Vous avez parcouru toutes les questions de ce deck !';

  @override
  String get playAgain => 'Rejouer';

  @override
  String get mainMenu => 'Menu principal';

  @override
  String get thanksForPlaying => 'Merci d\'avoir joué !';

  @override
  String get hopeYouHadFun => 'J\'espère que vous vous êtes amusé ! 🎉';

  @override
  String get backToMenu => 'Retour au menu';

  @override
  String get leaveGame => 'Quitter le jeu ?';

  @override
  String get leaveGameMessage =>
      'Êtes-vous sûr de vouloir partir ? Le jeu continuera pour les autres joueurs.';

  @override
  String get leave => 'Partir';

  @override
  String get noQuestionsAvailable => 'Aucune question disponible';

  @override
  String get showLess => 'Afficher moins';

  @override
  String get readMore => 'Lire plus';

  @override
  String get tapToPlay => 'Toucher pour jouer';

  @override
  String get coupleBundle => 'Pack Couple';

  @override
  String get friendsBundle => 'Pack Amis';

  @override
  String get familyBundle => 'Pack Famille';

  @override
  String get favorites => 'Favoris';

  @override
  String get pandoraHostCreatePin =>
      'L\'hôte crée une session et partage le PIN';

  @override
  String get pandoraPlayersJoinMax => 'Les joueurs rejoignent (max 15 min)';

  @override
  String get pandoraHostSetsTimer =>
      'L\'hôte définit le minuteur de questions (1-15 min)';

  @override
  String get pandoraEveryoneSubmits => 'Tout le monde soumet des questions';

  @override
  String get pandoraHostControls => 'L\'hôte contrôle la progression du jeu';

  @override
  String get pandoraQuestionsDeleted => 'Questions supprimées après le jeu';

  @override
  String get pandoraHost => 'Hôte';

  @override
  String get pandoraJoinGame => 'Rejoindre la partie';

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
      'Tout le monde soumet des questions (min 5)';

  @override
  String get createSession => 'Créer une session';

  @override
  String get creating => 'Création...';

  @override
  String get yourName => 'Votre nom';

  @override
  String get enterDisplayName => 'Entrez votre nom d\'affichage';

  @override
  String get howItWorks => 'Comment ça marche';

  @override
  String get pinCopied => 'PIN copié dans le presse-papiers !';

  @override
  String get endSession => 'Terminer la session ?';

  @override
  String get endSessionConfirm =>
      'Êtes-vous sûr de vouloir terminer cette session Pandora ?';

  @override
  String get end => 'Terminer';

  @override
  String get sessionPin => 'PIN de session';

  @override
  String get sharePin => 'Partagez ce PIN avec les joueurs';

  @override
  String get waitingForPlayers => 'En attente de joueurs...';

  @override
  String get startGame => 'Démarrer le jeu';

  @override
  String get lobby => 'Salon';

  @override
  String get hostLabel => ' (Hôte)';

  @override
  String get selectTimer => 'Sélectionner le minuteur';

  @override
  String get timerQuestion =>
      'Combien de temps les joueurs doivent-ils avoir pour soumettre des questions ?';

  @override
  String get minutes => 'minutes';

  @override
  String get startCollectingQuestions => 'Commencer à collecter les questions';

  @override
  String get sessionCancelled => 'Session annulée';

  @override
  String get questionCannotBeEmpty => 'La question ne peut pas être vide';

  @override
  String get questionSubmitted => 'Question soumise !';

  @override
  String get failedToSubmit => 'Échec de la soumission de la question';

  @override
  String notEnoughQuestions(Object count) {
    return 'Pas assez de questions. Minimum 5 requis. (Actuellement : $count)';
  }

  @override
  String get submitQuestions => 'Soumettre des questions';

  @override
  String get submitMinimum5 =>
      'Soumettez au moins 5 questions pour commencer le jeu';

  @override
  String get yourQuestion => 'Votre question';

  @override
  String get enterQuestionHere => 'Entrez votre question ici...';

  @override
  String get forEveryone => 'Pour tout le monde';

  @override
  String get forSpecificPerson => 'Pour une personne spécifique';

  @override
  String get submit => 'Soumettre';

  @override
  String questionsRemaining(Object count) {
    return '$count questions restantes';
  }

  @override
  String questionRemaining(Object count) {
    return '$count question restante';
  }

  @override
  String get startGameExclamation => 'Démarrer le jeu !';

  @override
  String get cancelSession => 'Annuler la session';

  @override
  String get timeRemaining => 'Temps restant';

  @override
  String get pleaseEnterPin => 'Veuillez entrer un PIN';

  @override
  String get sessionNotFound => 'Session non trouvée';

  @override
  String get sessionEnded => 'La session est terminée';

  @override
  String get sessionStarted => 'La session a déjà commencé';

  @override
  String get failedToJoin => 'Échec de la connexion à la session';

  @override
  String get joinSession => 'Rejoindre la session';

  @override
  String get joining => 'Connexion...';

  @override
  String get enterPin => 'Entrez le PIN à 6 chiffres';

  @override
  String get join => 'Rejoindre';

  @override
  String get reactionBreakdown => 'Répartition des réactions';

  @override
  String get laugh => 'Rire';

  @override
  String get shock => 'Choc';

  @override
  String get heart => 'Cœur';

  @override
  String get fire => 'Feu';

  @override
  String get mostLaughs => 'Le plus de rires';

  @override
  String get mostShocked => 'Le plus choqué';

  @override
  String get mostHearts => 'Le plus de cœurs';

  @override
  String get sessionComplete => 'Session terminée !';

  @override
  String get thanksForPlayingPandora =>
      'Merci d\'avoir joué à la Boîte de Pandore !';

  @override
  String get returnToMenu => 'Retour au menu';

  @override
  String get failedToCreateDeck => 'Échec de la création du deck';

  @override
  String get createNewDeck => 'Créer un nouveau deck';

  @override
  String get deckName => 'Nom du deck';

  @override
  String get enterDeckName => 'Entrez le nom du deck';

  @override
  String get create => 'Créer';

  @override
  String get deleteDeck => 'Supprimer le deck';

  @override
  String deleteDeckConfirm(Object name) {
    return 'Êtes-vous sûr de vouloir supprimer \"$name\" ? Cela supprimera toutes les questions de ce deck.';
  }

  @override
  String get delete => 'Supprimer';

  @override
  String get deckDeleted => 'Deck supprimé';

  @override
  String get failedToDeleteDeck => 'Échec de la suppression du deck';

  @override
  String get myDecks => 'Mes decks';

  @override
  String get noDecksYet => 'Aucun deck pour le moment';

  @override
  String get createFirstDeck => 'Créez votre premier deck personnalisé !';

  @override
  String questionsCount(Object count) {
    return '$count questions';
  }

  @override
  String questionCount(Object count) {
    return '$count question';
  }

  @override
  String get questionAdded => 'Question ajoutée !';

  @override
  String get failedToAddQuestion => 'Échec de l\'ajout de la question';

  @override
  String get editQuestion => 'Modifier la question';

  @override
  String get enterYourQuestion => 'Entrez votre question';

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
      'Êtes-vous sûr de vouloir supprimer cette question ?';

  @override
  String get questionDeleted => 'Question supprimée';

  @override
  String get failedToDeleteQuestion => 'Échec de la suppression de la question';

  @override
  String get addQuestion => 'Ajouter une question';

  @override
  String get typeQuestionHere => 'Tapez votre question ici...';

  @override
  String get add => 'Ajouter';

  @override
  String get noQuestionsYet => 'Aucune question pour le moment';

  @override
  String get addFirstQuestion => 'Ajoutez votre première question !';
}
