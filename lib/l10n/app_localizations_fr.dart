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
  String get previewAvailable => 'Preview: First 5 questions available';

  @override
  String get upgradeNow => 'Upgrade Now';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Peut-être plus tard';

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
  String get subscribe => 'S\'abonner';

  @override
  String get cancel => 'Annuler';

  @override
  String subscriptionActivated(Object bundles) {
    return 'Abonnement activé ! $bundles débloqué.';
  }

  @override
  String get premiumActivated =>
      'Premium activé ! Publicités supprimées. Pack débloqué.';

  @override
  String get demoNote =>
      'Démo : Les déverrouillages seront réinitialisés au redémarrage de l\'application';

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
  String get subscriptionStatus => 'Subscription Status';

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
  String get createCustomDeck => 'Create Custom Deck';

  @override
  String get deckName => 'Nom du deck';

  @override
  String get enterDeckName => 'Entrez le nom du deck';

  @override
  String get create => 'Créer';

  @override
  String get deckCreated => 'Deck created!';

  @override
  String get failedToCreateDeck => 'Échec de la création du deck';

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
      'Un jeu audacieux qui mêle honnêteté émotionnelle et sujets sensibles comme la confiance, la religion, l\'argent et les limites personnelles — pour révéler ce qui compte vraiment. *Avertissement:* Certaines questions sont franches — jouez avec ouverture et respect.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspiré des cinq langages de l\'amour, ce jeu aide les couples à exprimer leur affection de manière authentique. Découvrez comment les mots, les gestes et les actions renforcent votre lien.';

  @override
  String get deckDescSillyTalks =>
      'Du pur plaisir et des rires ! Ces questions légères révèlent vos habitudes les plus étranges et vos pensées les plus drôles. Idéal pour amis, famille ou couples qui aiment s\'amuser.';

  @override
  String get deckDescCarTalks =>
      'Parfaites pour les road trips — ces cartes transforment le temps de conduite en super conversations. Des questions amusantes, créatives et nostalgiques sur les voyages et les aventures.';

  @override
  String get deckDescCozyTalks =>
      'Des questions douces et réconfortantes qui te font sentir bien chez toi. Elles inspirent des conversations apaisantes sur les petits plaisirs et souvenirs.';

  @override
  String get deckDescPartyNight =>
      'Ton jeu idéal pour des soirées amusantes entre amis ! Ces questions pleines d\'énergie déclenchent rires, histoires et débats ludiques – de petits ratés de fête à \"qui flirte le plus ?\". Parfait pour détendre l\'ambiance.';

  @override
  String get deckDescUnpopularOpinions =>
      'Le jeu qui t\'encourage à dire tout haut ce que tout le monde pense tout bas. De la culture des influenceurs aux valeurs modernes — ces cartes suscitent des débats francs et des réflexions surprenantes.';

  @override
  String get deckDescPlotTwists =>
      'Ce jeu t\'embarque dans les moments les plus drôles et délicats du \"Que ferais-tu si… ?\". Idéal pour des soirées entre amis pleines de rires, surprises et rebondissements.';

  @override
  String get deckDescAfterDark =>
      'Explore le côté sombre des conversations avec des questions qui donnent des frissons. Parfait pour les soirées tardives entre amateurs de sensations fortes.';

  @override
  String get deckDescHistoryTalks =>
      'Un mélange nostalgique de souvenirs personnels et familiaux. Ces questions inspirent récits, rires et redécouverte de ses racines.';

  @override
  String get deckDescTinyTalks =>
      'Conçu pour les parents et leurs petits ! Des questions simples et ludiques qui aident les enfants à s\'exprimer et les parents à mieux les comprendre. Idéal de 3 à 9 ans.';

  @override
  String get deckDescGoodOldDays =>
      'Un voyage nostalgique dans le passé — de l\'enfance aux changements de la vie. Idéal pour les grands-parents qui aiment partager leurs souvenirs.';

  @override
  String get deckDescWouldYouRather =>
      'Une version familiale du classique \"Tu préfères…\". Remplie de choix drôles et imaginatifs qui font réfléchir et rire tout le monde.';

  @override
  String get createNewDeck => 'Créer un nouveau deck';

  @override
  String get sessionPin => 'PIN de session';

  @override
  String get joinSession => 'Rejoindre la session';

  @override
  String get questionSubmitted => 'Question soumise !';

  @override
  String get sessionCancelled => 'Session annulée';

  @override
  String get yourQuestion => 'Votre question';

  @override
  String get reactionBreakdown => 'Répartition des réactions';
}
