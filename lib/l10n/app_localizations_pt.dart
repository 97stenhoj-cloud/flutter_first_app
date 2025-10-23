// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Começar';

  @override
  String get settings => 'Configurações';

  @override
  String get howToPlay => 'Como Jogar';

  @override
  String get chooseGameMode => 'Escolha seu modo de jogo';

  @override
  String get family => 'Família';

  @override
  String get couple => 'Casal';

  @override
  String get friends => 'Amigos';

  @override
  String get chooseCategory => 'Escolha uma Categoria';

  @override
  String get locked => 'Categoria Bloqueada';

  @override
  String get lockedMessage =>
      'Esta categoria está bloqueada. Atualize para premium para desbloquear todas as categorias!';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Talvez Depois';

  @override
  String get chooseSubscription => 'Escolha sua Assinatura';

  @override
  String get subscriptionDescription =>
      'Desbloqueie categorias premium e obtenha acesso a pacotes exclusivos de perguntas';

  @override
  String get chooseBundleOne => 'Escolha 1 pacote de categorias';

  @override
  String get chooseBundleTwo => 'Escolha 2 pacotes de categorias';

  @override
  String get chooseBundleThree => 'Todos os 3 pacotes';

  @override
  String get perMonth => '/mês';

  @override
  String get bestValue => 'MELHOR VALOR';

  @override
  String get unlockAllBundles => 'Desbloquear Todos os Pacotes';

  @override
  String get selectYourBundle => 'Selecione seu Pacote';

  @override
  String selectBundles(Object count, Object plural) {
    return 'Selecione $count Pacote$plural';
  }

  @override
  String get premiumCategories => '4 categorias premium';

  @override
  String get cancel => 'Cancelar';

  @override
  String get subscribe => 'Assinar';

  @override
  String subscriptionActivated(Object bundles) {
    return 'Assinatura ativada! $bundles desbloqueado.';
  }

  @override
  String get demoNote =>
      'Demo: Os desbloqueios serão redefinidos ao reiniciar o aplicativo';

  @override
  String get swipeOrTap => 'Deslize ou toque nas setas';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Próximo';

  @override
  String get advertisement => 'Anúncio';

  @override
  String get watchAdMessage =>
      'Assista a um anúncio curto para continuar, ou fique sem anúncios com premium!';

  @override
  String get watchAd => 'Assistir Anúncio';

  @override
  String get goAdFree => 'Sem Anúncios - 59 DKK/mês';

  @override
  String get removeAdsForever => 'Remover Anúncios para Sempre';

  @override
  String get chooseOneBundle =>
      'Escolha 1 pacote para desbloquear e remover todos os anúncios';

  @override
  String get noAdsForever => 'Sem Anúncios para Sempre';

  @override
  String premiumActivated(Object bundle) {
    return 'Premium ativado! Anúncios removidos. Pacote $bundle desbloqueado.';
  }

  @override
  String get adNotReady => 'Anúncio não está pronto. Continuando sem anúncio.';

  @override
  String get adLoadingContinue => 'Anúncio Carregando... Continuar';

  @override
  String get pricePerMonth => '59 DKK/mês';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Nenhuma pergunta encontrada para $category no modo $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Erro ao carregar perguntas. Por favor, verifique sua conexão.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Falha ao carregar perguntas: $error';
  }

  @override
  String get madeForWife => 'Feito para minha linda esposa';

  @override
  String get otiLia => 'Otilia Stenhøj';

  @override
  String get withLoveAndConversations => 'Com amor e conversas';

  @override
  String get howManyPlayers => 'Quantos jogadores?';

  @override
  String get players => 'Jogadores';

  @override
  String get continueButton => 'Continuar';

  @override
  String get language => 'Idioma';

  @override
  String languageChanged(Object language) {
    return 'Idioma alterado para $language';
  }

  @override
  String get profile => 'Perfil';

  @override
  String get signOut => 'Sair';

  @override
  String get notSignedIn => 'Não Conectado';

  @override
  String get signInSignUp => 'Entrar / Cadastrar';

  @override
  String get signInToSync =>
      'Entre para sincronizar suas assinaturas em todos os dispositivos e desbloquear conteúdo premium';

  @override
  String get signOutConfirm => 'Tem certeza de que deseja sair?';

  @override
  String get signedOutSuccess => 'Desconectado com sucesso';

  @override
  String get accountInformation => 'Informações da Conta';

  @override
  String get email => 'E-mail';

  @override
  String get memberSince => 'Membro desde';

  @override
  String get notAvailable => 'Não disponível';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get activeSubscriptions => 'Assinaturas Ativas';

  @override
  String bundlesUnlocked(Object count, Object plural) {
    return '$count Pacote$plural Desbloqueado';
  }

  @override
  String bundle(Object name) {
    return 'Pacote $name';
  }

  @override
  String get premiumMember => 'Membro Premium';

  @override
  String get freeAccount => 'Conta Gratuita';

  @override
  String get welcomeToConnect => 'Bem-vindo ao Connect!';

  @override
  String get continueWithApple => 'Continuar com Apple';

  @override
  String get continueWithGoogle => 'Continuar com Google';

  @override
  String get skipForNow => 'Pular por enquanto';

  @override
  String get byContining =>
      'Ao continuar, você concorda com nossos Termos de Serviço e Política de Privacidade';

  @override
  String get googleSignInFailed =>
      'Login com Google falhou. Por favor, tente novamente.';

  @override
  String get appleSignInFailed =>
      'Login com Apple falhou. Por favor, tente novamente.';

  @override
  String get noCategoriesFound => 'Nenhuma categoria encontrada';

  @override
  String selectBundlePlural(Object plural) {
    return 'Selecione o$plural pacote$plural de categorias que você deseja desbloquear';
  }

  @override
  String get getAccessAllBundles =>
      'Obtenha acesso a todas as categorias premium em todos os 3 pacotes!';

  @override
  String subscriptionActivatedFull(Object bundles) {
    return 'Assinatura ativada! $bundles desbloqueado.';
  }

  @override
  String get aboutCredits => 'Sobre / Créditos';

  @override
  String get welcomeBack => 'Bem-vindo de Volta!';

  @override
  String get createAccount => 'Criar Conta';

  @override
  String get displayName => 'Nome de Exibição';

  @override
  String get password => 'Senha';

  @override
  String get signIn => 'Entrar';

  @override
  String get signUp => 'Cadastrar';

  @override
  String get dontHaveAccount => 'Não tem uma conta? Cadastre-se';

  @override
  String get alreadyHaveAccount => 'Já tem uma conta? Entre';

  @override
  String get chooseYourMode => '1. Escolha seu Modo';

  @override
  String get chooseYourModeDesc =>
      'Selecione entre três estilos de conversa:\n\n• Família - Conversas calorosas e saudáveis perfeitas para todas as idades\n• Casal - Perguntas íntimas e românticas para aprofundar sua conexão\n• Amigos - Tópicos divertidos e envolventes para sua turma';

  @override
  String get pickCategory => '2. Escolha uma Categoria';

  @override
  String get pickCategoryDesc =>
      'Cada modo tem múltiplas categorias com pacotes únicos de perguntas. Categorias gratuitas estão desbloqueadas, enquanto categorias premium requerem assinatura.';

  @override
  String get startTalking => '3. Comece a Conversar';

  @override
  String get startTalkingDesc =>
      'As perguntas aparecem em tela cheia. Revezem-se lendo e respondendo-as honestamente. Não há respostas erradas - o objetivo é uma conversa significativa!';

  @override
  String get navigateQuestions => '4. Navegue pelas Perguntas';

  @override
  String get navigateQuestionsDesc =>
      '• Deslize para a direita ou toque em \"Próximo\" para a próxima pergunta\n• Deslize para a esquerda ou toque em \"Anterior\" para revisitar perguntas\n• Toque no botão home para retornar ao menu principal a qualquer momento';

  @override
  String get premiumFeatures => '5. Recursos Premium';

  @override
  String get premiumFeaturesDesc =>
      'Desbloqueie categorias exclusivas de perguntas com uma assinatura:\n\n• 1 Pacote (4 categorias) - 59 DKK/mês\n• 2 Pacotes (8 categorias) - 109 DKK/mês\n• 3 Pacotes (12 categorias) - 149 DKK/mês';

  @override
  String get proTips => 'Dicas Pro';

  @override
  String get proTipsDesc =>
      '• Crie um ambiente confortável e sem distrações\n• Ouça ativamente e esteja presente\n• Compartilhe honestamente e encoraje os outros a fazerem o mesmo\n• Respeite os limites - pule perguntas se necessário\n• Divirta-se e aproveite a conexão!';

  @override
  String get personal => 'Personal';

  @override
  String get personalDesc => 'Create your own custom question decks';

  @override
  String get gameComplete => 'Game Complete!';

  @override
  String get noMoreQuestions =>
      'You\'ve gone through all the questions in this deck!';

  @override
  String get playAgain => 'Play Again';

  @override
  String get mainMenu => 'Main Menu';

  @override
  String get thanksForPlaying => 'Thanks for Playing!';

  @override
  String get hopeYouHadFun => 'Hope you had fun! 🎉';

  @override
  String get backToMenu => 'Back to Menu';

  @override
  String get leaveGame => 'Leave Game?';

  @override
  String get leaveGameMessage =>
      'Are you sure you want to leave? The game will continue for other players.';

  @override
  String get leave => 'Leave';

  @override
  String get noQuestionsAvailable => 'No questions available';
}
