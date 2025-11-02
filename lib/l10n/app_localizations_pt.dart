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
  String get locked => 'Categoria Premium';

  @override
  String get lockedMessage =>
      'Esta é uma categoria premium. Faça upgrade para desbloquear todas as categorias e remover anúncios!';

  @override
  String get previewAvailable =>
      'Pré-visualização: Primeiras 5 perguntas disponíveis';

  @override
  String get upgradeNow => 'Atualizar Agora';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Talvez Mais Tarde';

  @override
  String get getPremium => 'Obter Premium';

  @override
  String get premiumTitle => 'Desbloquear Tudo';

  @override
  String get premiumDescription =>
      'Obtenha acesso ilimitado a todas as categorias em todos os modos, remova anúncios e desfrute de sessões ilimitadas do Pandora.';

  @override
  String get premiumPriceMonthly => '49 DKK/mês';

  @override
  String get premiumPriceYearly => '399 DKK/ano';

  @override
  String get saveWithYearly => 'Economize 189 DKK com o plano anual!';

  @override
  String get monthly => 'Mensal';

  @override
  String get yearly => 'Anual';

  @override
  String get billedMonthly => 'Cobrado mensalmente';

  @override
  String get billedYearly => 'Cobrado anualmente';

  @override
  String get premiumFeature1 =>
      '✓ Todas as 21 categorias premium desbloqueadas';

  @override
  String get premiumFeature2 => '✓ Sem anúncios para sempre';

  @override
  String get premiumFeature3 => '✓ Perguntas ilimitadas em todas as categorias';

  @override
  String get premiumFeature4 => '✓ Pandora: Jogadores e perguntas ilimitados';

  @override
  String get premiumFeature5 => '✓ Apoie o desenvolvimento contínuo';

  @override
  String get subscribePremium => 'Assinar Premium';

  @override
  String get subscribe => 'Assinar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get subscriptionActivated =>
      'Premium ativado! Todas as categorias desbloqueadas.';

  @override
  String get premiumActivated => 'Premium Ativado!';

  @override
  String get demoNote =>
      'Demo: A assinatura será redefinida ao reiniciar o aplicativo';

  @override
  String get freeTier => 'Nível Gratuito';

  @override
  String get freeTierDesc =>
      '3 categorias por modo (30 perguntas cada)\nPré-visualizações de 5 perguntas das categorias premium\nAnúncios a cada 7 perguntas';

  @override
  String get currentPlan => 'Plano Atual';

  @override
  String get limitReached => 'Limite Atingido';

  @override
  String get freeCategoryLimit =>
      'Você atingiu o limite de 30 perguntas para categorias gratuitas. Atualize para Premium para acesso ilimitado!';

  @override
  String get previewLimit =>
      'Você viu todas as 5 perguntas de pré-visualização. Atualize para Premium para continuar!';

  @override
  String get pandoraFreeLimit => 'Limite Gratuito';

  @override
  String get pandoraFreeLimitMessage =>
      'Anfitriões gratuitos podem ter máx. 6 jogadores e 12 perguntas. Atualize para Premium para acesso ilimitado!';

  @override
  String get pandoraUpgradeMessage =>
      'Você atingiu 12 perguntas. Atualize para Premium para continuar jogando!';

  @override
  String get pandoraMaxPlayers =>
      'Máximo de 6 jogadores atingido (limite gratuito). Atualize para Premium para jogadores ilimitados!';

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
  String get goAdFree => 'Sem Anúncios com Premium';

  @override
  String get removeAdsForever => 'Remover Anúncios Para Sempre';

  @override
  String get adNotReady => 'Anúncio não está pronto. Continuando sem anúncio.';

  @override
  String get adLoadingContinue => 'Carregando anúncio... Continue';

  @override
  String get pricePerMonth => '49 DKK/mês ou 399 DKK/ano';

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
  String get signInSignUp => 'Entrar / Criar Conta';

  @override
  String get signInToSync =>
      'Entre para sincronizar sua assinatura entre dispositivos e desbloquear conteúdo premium';

  @override
  String get signOutConfirm => 'Você tem certeza que deseja sair?';

  @override
  String get signedOutSuccess => 'Desconectado com sucesso';

  @override
  String get accountInformation => 'Informações da Conta';

  @override
  String get email => 'Email';

  @override
  String get memberSince => 'Membro Desde';

  @override
  String get notAvailable => 'Não disponível';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get subscriptionStatus => 'Status da Assinatura';

  @override
  String get premiumMember => 'Membro Premium';

  @override
  String get freeAccount => 'Conta Grátis';

  @override
  String get welcomeToConnect => 'Bem-vindo ao Connect!';

  @override
  String get continueWithApple => 'Continuar com a Apple';

  @override
  String get continueWithGoogle => 'Continuar com o Google';

  @override
  String get skipForNow => 'Pular por Enquanto';

  @override
  String get byContining =>
      'Ao continuar, você concorda com nossos Termos de Serviço e Política de Privacidade';

  @override
  String get googleSignInFailed =>
      'Falha ao fazer login com o Google. Por favor, tente novamente.';

  @override
  String get appleSignInFailed =>
      'Falha ao fazer login com a Apple. Por favor, tente novamente.';

  @override
  String get noCategoriesFound => 'Nenhuma categoria encontrada';

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
  String get signUp => 'Cadastrar-se';

  @override
  String get dontHaveAccount => 'Não tem uma conta? Cadastre-se';

  @override
  String get alreadyHaveAccount => 'Já tem uma conta? Entrar';

  @override
  String get chooseYourMode => '1. Escolha Seu Modo';

  @override
  String get chooseYourModeDesc =>
      'Selecione entre três estilos de conversa:\n\n• Família - Conversas calorosas e saudáveis perfeitas para todas as idades\n• Casal - Perguntas íntimas e românticas para aprofundar sua conexão\n• Amigos - Tópicos divertidos e divertidos para seu grupo';

  @override
  String get pickCategory => '2. Escolha uma Categoria';

  @override
  String get pickCategoryDesc =>
      'Cada modo tem várias categorias com pacotes de perguntas únicos. 3 categorias gratuitas por modo (30 perguntas cada), com pré-visualizações de 5 perguntas das categorias premium.';

  @override
  String get startTalking => '3. Comece a Conversar';

  @override
  String get startTalkingDesc =>
      'As perguntas aparecem em tela cheia. Revezem-se para ler e responder honestamente. Não há respostas erradas - o objetivo é uma conversa significativa!';

  @override
  String get navigateQuestions => '4. Navegue pelas Perguntas';

  @override
  String get navigateQuestionsDesc =>
      '• Deslize para a direita ou toque em \"Próxima\" para a próxima pergunta\n• Deslize para a esquerda ou toque em \"Anterior\" para revisitar perguntas\n• Toque no botão inicial para retornar ao menu principal a qualquer momento';

  @override
  String get premiumFeatures => '5. Recursos Premium';

  @override
  String get premiumFeaturesDesc =>
      'Desbloqueie todas as 24 categorias com Premium:\n\n• Mensal: 49 DKK/mês\n• Anual: 399 DKK/ano (economize 189 DKK!)\n\n✓ Todas as categorias desbloqueadas\n✓ Sem anúncios\n✓ Perguntas ilimitadas\n✓ Sessões ilimitadas do Pandora';

  @override
  String get proTips => 'Dicas Profissionais';

  @override
  String get proTipsDesc =>
      '• Crie um ambiente confortável e sem distrações\n• Ouça ativamente e esteja presente\n• Compartilhe honestamente e incentive outros a fazer o mesmo\n• Respeite os limites - pule perguntas se necessário\n• Divirta-se e aproveite a conexão!';

  @override
  String get personal => 'Pessoal';

  @override
  String get personalDesc =>
      'Crie seus próprios baralhos de perguntas personalizados';

  @override
  String get gameComplete => 'Jogo Completo!';

  @override
  String get noMoreQuestions =>
      'Você passou por todas as perguntas deste baralho!';

  @override
  String get playAgain => 'Jogar Novamente';

  @override
  String get mainMenu => 'Menu Principal';

  @override
  String get thanksForPlaying => 'Obrigado por Jogar!';

  @override
  String get hopeYouHadFun => 'Espero que você tenha se divertido! 🎉';

  @override
  String get backToMenu => 'Voltar ao Menu';

  @override
  String get leaveGame => 'Sair do Jogo?';

  @override
  String get leaveGameMessage =>
      'Você tem certeza que quer sair? O jogo continuará para os outros jogadores.';

  @override
  String get leave => 'Sair';

  @override
  String get noQuestionsAvailable => 'Nenhuma pergunta disponível';

  @override
  String get showLess => 'Mostrar Menos';

  @override
  String get readMore => 'Ler Mais';

  @override
  String get tapToPlay => 'Toque para Jogar';

  @override
  String get favorites => 'Favoritos';

  @override
  String get pandoraHostCreatePin =>
      'Anfitrião cria a sessão e compartilha o PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'Jogadores entram (máx. 6 grátis, ilimitado premium)';

  @override
  String get pandoraHostSetsTimer =>
      'Anfitrião define o tempo para a pergunta (1-15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Todos enviam perguntas (máx. 12 grátis)';

  @override
  String get pandoraHostControls => 'Anfitrião controla o progresso do jogo';

  @override
  String get pandoraQuestionsDeleted => 'Perguntas deletadas após o jogo';

  @override
  String get pandoraHost => 'Anfitrião';

  @override
  String get pandoraJoinGame => 'Entrar no Jogo';

  @override
  String get pandoraPandoraBox => 'Caixa de Pandora';

  @override
  String get pleaseEnterName => 'Por favor, insira seu nome';

  @override
  String get hostSuffix => '(Anfitrião)';

  @override
  String get playersJoinWithNames => 'Os jogadores entram com seus nomes';

  @override
  String get everyoneSubmitsMin5 =>
      'Todo mundo envia perguntas (mín 5, máx 12 grátis)';

  @override
  String get createSession => 'Criar Sessão';

  @override
  String get creating => 'Criando...';

  @override
  String get yourName => 'Seu Nome';

  @override
  String get enterDisplayName => 'Insira seu nome de exibição';

  @override
  String get howItWorks => 'Como Funciona';

  @override
  String get pinCopied => 'PIN copiado para a área de transferência!';

  @override
  String get endSession => 'Encerrar Sessão?';

  @override
  String get endSessionConfirm =>
      'Você tem certeza de que deseja encerrar esta sessão do Pandora?';

  @override
  String get createCustomDeck => 'Criar Baralho Personalizado';

  @override
  String get deckName => 'Nome do Baralho';

  @override
  String get enterDeckName => 'Digite o nome do baralho';

  @override
  String get create => 'Criar';

  @override
  String get deckCreated => 'Baralho criado!';

  @override
  String get failedToCreateDeck => 'Falha ao criar o baralho';

  @override
  String get deleteDeck => 'Excluir Baralho?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Você tem certeza que deseja excluir \"$deckName\"? Isso irá deletar todas as perguntas deste baralho.';
  }

  @override
  String get delete => 'Excluir';

  @override
  String get deckDeleted => 'Baralho excluído';

  @override
  String get failedToDeleteDeck => 'Falha ao deletar o baralho';

  @override
  String get myDecks => 'Meus Baralhos';

  @override
  String get noDecksYet => 'Nenhum baralho ainda';

  @override
  String get createFirstDeck => 'Crie seu primeiro baralho personalizado!';

  @override
  String questionsCount(Object count) {
    return '$count perguntas';
  }

  @override
  String questionCount(Object count) {
    return '$count pergunta';
  }

  @override
  String get questionAdded => 'Pergunta adicionada!';

  @override
  String get failedToAddQuestion => 'Falha ao adicionar pergunta';

  @override
  String get editQuestion => 'Editar Pergunta';

  @override
  String get enterYourQuestion => 'Digite sua pergunta';

  @override
  String get save => 'Salvar';

  @override
  String get questionUpdated => 'Pergunta atualizada!';

  @override
  String get failedToUpdateQuestion => 'Falha ao atualizar a pergunta';

  @override
  String get deleteQuestion => 'Excluir Pergunta';

  @override
  String get deleteQuestionConfirm =>
      'Você tem certeza de que deseja excluir esta pergunta?';

  @override
  String get questionDeleted => 'Pergunta excluída';

  @override
  String get failedToDeleteQuestion => 'Falha ao excluir a pergunta';

  @override
  String get addQuestion => 'Adicionar Pergunta';

  @override
  String get typeQuestionHere => 'Digite sua pergunta aqui...';

  @override
  String get add => 'Adicionar';

  @override
  String get noQuestionsYet => 'Ainda não há perguntas';

  @override
  String get addFirstQuestion => 'Adicione sua primeira pergunta!';

  @override
  String get deckDescLoveTalks =>
      'Explore o romance, a química e a conexão através de perguntas sinceras que celebram o seu relacionamento. Desde \"como nos conhecemos\" até ao que te faz sentir mais amado — estas cartas aprofundam a intimidade emocional.';

  @override
  String get deckDescDeepTalks =>
      'Estas cartas mergulham em valores, vulnerabilidade e no que significa crescer juntos. Ajudam os parceiros a refletir sobre independência, comunicação e propósito partilhado.';

  @override
  String get deckDescSpicyTalks =>
      'Ousadas, atrevidas e íntimas — estas cartas convidam os casais a explorar o desejo, as fantasias e a paixão juntos. Cada pergunta desperta conversas honestas e excitantes que aproximam o casal.';

  @override
  String get deckDescDoYouDareTalks =>
      'Um baralho destemido que combina honestidade emocional com temas delicados como confiança, religião, dinheiro e limites pessoais — tudo projetado para revelar o que realmente importa. *Nota:* Algumas perguntas são diretas e sem filtros — joguem com abertura, empatia e respeito.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspirado nas cinco linguagens do amor, este baralho ajuda os parceiros a expressar afeto de formas que realmente ressoam. Descubram como palavras, ações e gestos fortalecem a vossa ligação.';

  @override
  String get deckDescSillyTalks =>
      'Diversão e gargalhadas! Estas perguntas leves e engraçadas revelam os seus hábitos mais estranhos e pensamentos mais divertidos. Perfeitas para amigos, família ou casais que não se levam muito a sério.';

  @override
  String get deckDescCarTalks =>
      'Perfeito para viagens de carro — estas cartas transformam o tempo de condução em ótimas conversas. Espere perguntas engraçadas, criativas e nostálgicas sobre viagens, aventuras e peculiaridades.';

  @override
  String get deckDescCozyTalks =>
      'Conversas calorosas e relaxadas perfeitas para noites aconchegantes. Estas perguntas criam momentos confortáveis e sinceros de conexão.';

  @override
  String get deckDescPartyNight =>
      'Perguntas de alta energia projetadas para ambientes de grupo divertidos. Perfeitas para festas e encontros sociais com amigos.';

  @override
  String get deckDescUnpopularOpinions =>
      'O baralho que te desafia a dizer o que todos pensam, mas ninguém admite. Da cultura dos influenciadores às regras sociais — estas cartas despertam debates honestos e perspetivas inesperadas. Perfeito para amigos com opinião.';

  @override
  String get deckDescPlotTwists =>
      'Este baralho coloca-te no centro dos momentos mais engraçados e difíceis da vida — \"O que farias se…?\". Pensamento rápido, instintos e gargalhadas garantidas! Ideal para noites de grupo cheias de surpresas e gargalhadas.';

  @override
  String get deckDescAfterDark =>
      'Entre no lado sombrio da conversa com perguntas que dão arrepios. De coincidências assustadoras a cenários de sobrevivência — perfeito para noites tardias com emoção.';

  @override
  String get deckDescHistoryTalks =>
      'Uma mistura nostálgica de memórias pessoais e momentos familiares. Estas perguntas inspiram histórias, gargalhadas e redescoberta de suas raízes. Perfeito para reuniões de família ou noites aconchegantes.';

  @override
  String get deckDescTinyTalks =>
      'Feito para pais e os seus pequenos! Perguntas simples e divertidas que ajudam as crianças a expressar-se enquanto os pais aprendem como pensam. Ideal dos 3 aos 9 anos.';

  @override
  String get deckDescGoodOldDays =>
      'Viaje no tempo com perguntas sobre memórias queridas, experiências passadas e como as coisas costumavam ser. Perfeito para todas as idades.';

  @override
  String get deckDescWouldYouRather =>
      'Perguntas clássicas de dilemas que provocam debates e revelam preferências. Escolha entre duas opções e descubra o que importa mais.';

  @override
  String get createNewDeck => 'Criar Novo Baralho';

  @override
  String get sessionPin => 'PIN da Sessão';

  @override
  String get joinSession => 'Entrar na Sessão';

  @override
  String get questionSubmitted => 'Pergunta Enviada';

  @override
  String get sessionCancelled => 'Sessão Cancelada';

  @override
  String get yourQuestion => 'Sua Pergunta';

  @override
  String get reactionBreakdown => 'Análise de Reação';

  @override
  String get deckNameHint => 'Nome do baralho';

  @override
  String get deckCreatedSuccess => 'Baralho criado!';

  @override
  String get cancelSession => 'Cancelar Sessão?';

  @override
  String get cancelSessionConfirm =>
      'Isso cancelará a sessão para todos os jogadores. Você tem certeza?';

  @override
  String get no => 'Não';

  @override
  String get yesCancel => 'Sim, Cancelar';

  @override
  String get hostQuestionCollection => 'Anfitrião - Coleta de Perguntas';

  @override
  String get questionCollection => 'Coleta de Perguntas';

  @override
  String get endSessionButton => 'Encerrar Sessão';

  @override
  String get noActiveSubscription => 'Sem Assinatura Ativa';

  @override
  String get premium => 'Premium';

  @override
  String notEnoughQuestions(Object count) {
    return 'Not enough questions. Minimum 5 required. (Currently: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Recurso Premium';

  @override
  String get questionNavigationPremium =>
      'A navegação de perguntas é um recurso premium. Assine para desbloquear a capacidade de pular para qualquer pergunta!';

  @override
  String get customDecks => 'Baralhos Personalizados';

  @override
  String get noDecksYetMessage => 'Ainda não há baralhos';

  @override
  String get createFirstDeckMessage =>
      'Toque em + para criar seu primeiro baralho';

  @override
  String get signInRequired => 'Login Necessário';

  @override
  String get signInToUsePersonal =>
      'Por favor, faça login para usar o modo Pessoal e criar baralhos de perguntas personalizados.';

  @override
  String get collaborativeQuestionGame => 'Jogo Colaborativo de Perguntas';

  @override
  String get hostPandoraSession => 'Hospedar Sessão Pandora';

  @override
  String get joinPandoraGame => 'Entrar em um Jogo';

  @override
  String get yourDisplayName => 'Seu Nome de Exibição';

  @override
  String get enterYourName => 'Digite seu nome';

  @override
  String get selectQuestion => 'Selecionar Pergunta';

  @override
  String get joinTime => 'Tempo para Entrar';

  @override
  String get participants => 'Participantes';

  @override
  String get loading => 'Carregando...';

  @override
  String needAtLeastPlayers(int current) {
    return 'São necessários pelo menos 2 jogadores ($current/2)';
  }

  @override
  String get continueToTimerSetup =>
      'Continuar para Configuração do Temporizador';
}
