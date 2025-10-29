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
      'Esta categoria está bloqueada. Faça um upgrade para premium para desbloquear todas as categorias!';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Talvez mais tarde';

  @override
  String get chooseSubscription => 'Escolha sua assinatura';

  @override
  String get subscriptionDescription =>
      'Desbloqueie categorias premium e tenha acesso a pacotes de perguntas exclusivos';

  @override
  String get chooseBundleOne => 'Escolha 1 pacote de categorias';

  @override
  String get chooseBundleTwo => 'Escolha 2 pacotes de categorias';

  @override
  String get chooseBundleThree => 'Todos os 3 pacotes de categorias';

  @override
  String get perMonth => '/mês';

  @override
  String get bestValue => 'MELHOR VALOR';

  @override
  String get unlockAllBundles => 'Desbloquear Todos os Pacotes';

  @override
  String get selectYourBundle => 'Selecione Seu Pacote';

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
    return 'Assinatura ativada! $bundles desbloqueados.';
  }

  @override
  String get demoNote =>
      'Demonstração: os desbloqueios serão redefinidos ao reiniciar o app';

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
      'Assista a um anúncio curto para continuar, ou fique sem anúncios com o premium!';

  @override
  String get watchAd => 'Assistir Anúncio';

  @override
  String get goAdFree => 'Fique sem Anúncios - 59 DKK/mês';

  @override
  String get removeAdsForever => 'Remover Anúncios Para Sempre';

  @override
  String get chooseOneBundle =>
      'Escolha 1 pacote para desbloquear e remover todos os anúncios';

  @override
  String get noAdsForever => 'Sem Anúncios Para Sempre';

  @override
  String premiumActivated(Object bundle) {
    return 'Premium ativado! Anúncios removidos. Pacote $bundle desbloqueado.';
  }

  @override
  String get adNotReady => 'Anúncio não está pronto. Continuando sem anúncio.';

  @override
  String get adLoadingContinue => 'Carregando anúncio... Continue';

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
  String get notSignedIn => 'Não conectado';

  @override
  String get signInSignUp => 'Entrar / Criar conta';

  @override
  String get signInToSync =>
      'Entre para sincronizar suas assinaturas entre dispositivos e desbloquear conteúdo premium';

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
  String get freeAccount => 'Conta Grátis';

  @override
  String get welcomeToConnect => 'Bem-vindo ao Connect!';

  @override
  String get continueWithApple => 'Continuar com a Apple';

  @override
  String get continueWithGoogle => 'Continuar com o Google';

  @override
  String get skipForNow => 'Pular por enquanto';

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
  String selectBundlePlural(Object plural) {
    return 'Selecione o pacote de categorias$plural que você deseja desbloquear';
  }

  @override
  String get getAccessAllBundles =>
      'Tenha acesso a todas as categorias premium em todos os 3 pacotes!';

  @override
  String subscriptionActivatedFull(Object bundles) {
    return 'Assinatura ativada! $bundles desbloqueados.';
  }

  @override
  String get aboutCredits => 'Sobre / Créditos';

  @override
  String get welcomeBack => 'Bem-vindo de volta!';

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
  String get chooseYourModeDesc => 'Selecione entre três estilos de conversa:';

  @override
  String get pickCategory => '2. Escolha uma Categoria';

  @override
  String get pickCategoryDesc =>
      'Cada modo tem várias categorias com pacotes de perguntas únicos. As categorias gratuitas são desbloqueadas, enquanto as categorias premium requerem uma assinatura.';

  @override
  String get startTalking => '3. Comece a Conversar';

  @override
  String get startTalkingDesc =>
      'As perguntas aparecem em tela cheia. Alternem-se para ler e responder honestamente. Não há respostas erradas - o objetivo é uma conversa significativa!';

  @override
  String get navigateQuestions => '4. Navegue pelas Perguntas';

  @override
  String get navigateQuestionsDesc =>
      '• Deslize para a direita ou toque em \"Próxima\" para a próxima pergunta';

  @override
  String get premiumFeatures => '5. Recursos Premium';

  @override
  String get premiumFeaturesDesc =>
      'Desbloqueie categorias de perguntas exclusivas com uma assinatura:';

  @override
  String get proTips => 'Dicas Profissionais';

  @override
  String get proTipsDesc => '• Crie um ambiente confortável e sem distrações';

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
  String get coupleBundle => 'Pacote de Casal';

  @override
  String get friendsBundle => 'Pacote de Amigos';

  @override
  String get familyBundle => 'Pacote da Família';

  @override
  String get favorites => 'Favoritos';

  @override
  String get pandoraHostCreatePin =>
      'Anfitrião cria a sessão e compartilha o PIN';

  @override
  String get pandoraPlayersJoinMax => 'Jogadores entram (máx. 15 min)';

  @override
  String get pandoraHostSetsTimer =>
      'Anfitrião define o tempo para a pergunta (1-15 min)';

  @override
  String get pandoraEveryoneSubmits => 'Todos enviam perguntas';

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
  String get everyoneSubmitsMin5 => 'Todo mundo envia perguntas (mínimo 5)';

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
  String get endSession => 'Encerrar sessão?';

  @override
  String get endSessionConfirm =>
      'Você tem certeza de que deseja encerrar esta sessão do Pandora?';

  @override
  String get end => 'Encerrar';

  @override
  String get sessionPin => 'PIN da sessão';

  @override
  String get sharePin => 'Compartilhe este PIN com os jogadores';

  @override
  String get waitingForPlayers => 'Aguardando jogadores...';

  @override
  String get startGame => 'Iniciar jogo';

  @override
  String get lobby => 'Lobby';

  @override
  String get hostLabel => '(Anfitrião)';

  @override
  String get selectTimer => 'Selecionar Temporizador';

  @override
  String get timerQuestion =>
      'Quanto tempo os jogadores devem ter para enviar perguntas?';

  @override
  String get minutes => 'minutos';

  @override
  String get startCollectingQuestions => 'Começar a Coletar Perguntas';

  @override
  String get sessionCancelled => 'Sessão cancelada';

  @override
  String get questionCannotBeEmpty => 'A pergunta não pode estar vazia';

  @override
  String get questionSubmitted => 'Pergunta enviada!';

  @override
  String get failedToSubmit => 'Falha ao enviar a pergunta';

  @override
  String notEnoughQuestions(Object count) {
    return 'Perguntas insuficientes. Mínimo de 5 necessário. (Atualmente: $count)';
  }

  @override
  String get submitQuestions => 'Enviar Perguntas';

  @override
  String get submitMinimum5 =>
      'Envie pelo menos 5 perguntas para começar o jogo';

  @override
  String get yourQuestion => 'Sua Pergunta';

  @override
  String get enterQuestionHere => 'Digite sua pergunta aqui...';

  @override
  String get forEveryone => 'Para Todos';

  @override
  String get forSpecificPerson => 'Para Pessoa Específica';

  @override
  String get submit => 'Enviar';

  @override
  String questionsRemaining(Object count) {
    return '$count perguntas restantes';
  }

  @override
  String questionRemaining(Object count) {
    return '$count pergunta restante';
  }

  @override
  String get startGameExclamation => 'Começar Jogo!';

  @override
  String get cancelSession => 'Cancelar Sessão';

  @override
  String get timeRemaining => 'Tempo Restante';

  @override
  String get pleaseEnterPin => 'Por favor, insira um PIN';

  @override
  String get sessionNotFound => 'Sessão não encontrada';

  @override
  String get sessionEnded => 'Sessão encerrada';

  @override
  String get sessionStarted => 'Sessão já começou';

  @override
  String get failedToJoin => 'Falha ao entrar na sessão';

  @override
  String get joinSession => 'Entrar na Sessão';

  @override
  String get joining => 'Entrando...';

  @override
  String get enterPin => 'Insira o PIN de 6 dígitos';

  @override
  String get join => 'Entrar';

  @override
  String get reactionBreakdown => 'Análise de Reação';

  @override
  String get laugh => 'Rir';

  @override
  String get shock => 'Choque';

  @override
  String get heart => 'Coração';

  @override
  String get fire => 'Fogo';

  @override
  String get mostLaughs => 'Mais Risadas';

  @override
  String get mostShocked => 'Mais Chocado';

  @override
  String get mostHearts => 'Mais Corações';

  @override
  String get sessionComplete => 'Sessão Completa!';

  @override
  String get thanksForPlayingPandora => 'Obrigado por jogar Pandora Box!';

  @override
  String get returnToMenu => 'Voltar ao Menu';

  @override
  String get failedToCreateDeck => 'Falha ao criar o baralho';

  @override
  String get createNewDeck => 'Criar Novo Baralho';

  @override
  String get deckName => 'Nome do Baralho';

  @override
  String get enterDeckName => 'Digite o nome do baralho';

  @override
  String get create => 'Criar';

  @override
  String get deleteDeck => 'Excluir Baralho';

  @override
  String deleteDeckConfirm(Object name) {
    return 'Você tem certeza que deseja excluir \"$name\"? Isso irá deletar todas as perguntas deste baralho.';
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
      'Explore o romance, a química e a conexão através de perguntas sinceras que celebram o vosso relacionamento. Desde \"como nos conhecemos\" até ao que te faz sentir mais amado — estas cartas aprofundam a intimidade emocional.';

  @override
  String get deckDescDeepTalks =>
      'Estas cartas mergulham em valores, vulnerabilidade e no que significa crescer juntos. Ajudam os parceiros a refletir sobre independência, comunicação e propósito partilhado.';

  @override
  String get deckDescSpicyTalks =>
      'Ousadas, atrevidas e íntimas — estas cartas convidam os casais a explorar o desejo, as fantasias e a paixão juntos. Cada pergunta desperta conversas honestas e excitantes que aproximam o casal.';

  @override
  String get deckDescDoYouDareTalks =>
      'Um baralho destemido que combina honestidade emocional com temas delicados como confiança, religião, dinheiro e limites pessoais — tudo para revelar o que realmente importa. *Nota:* Algumas perguntas são diretas — joguem com empatia e respeito.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspirado nas cinco linguagens do amor, este baralho ajuda os parceiros a expressar afeto de formas que realmente ressoam. Descubram como palavras, ações e gestos fortalecem a vossa ligação.';

  @override
  String get deckDescSillyTalks =>
      'Diversão e gargalhadas! Estas perguntas leves e engraçadas revelam os teus hábitos mais estranhos e pensamentos mais divertidos. Perfeitas para amigos, família ou casais que gostam de rir juntos.';

  @override
  String get deckDescCarTalks =>
      'Perfeito para viagens de carro — estas cartas transformam o tempo de condução em ótimas conversas. Espera perguntas engraçadas, criativas e nostálgicas sobre viagens, aventuras e peculiaridades.';

  @override
  String get deckDescUnpopularOpinions =>
      'O baralho que te desafia a dizer o que todos pensam, mas ninguém admite. Da cultura dos influenciadores às regras sociais — estas cartas despertam debates honestos e perspetivas inesperadas. Perfeito para conversas fortes.';

  @override
  String get deckDescPlotTwists =>
      'Este baralho coloca-te no centro dos momentos mais engraçados e difíceis da vida — \"O que farias se…?\". Ideal para noites de grupo cheias de gargalhadas e surpresas.';

  @override
  String get deckDescAfterDark =>
      'Entra no lado sombrio da conversa com perguntas que dão arrepios. Perfeito para noites tardias cheias de mistério.';

  @override
  String get deckDescHistoryTalks =>
      'Uma mistura nostálgica de memórias pessoais e momentos familiares. Estas perguntas inspiram histórias e risadas em família.';

  @override
  String get deckDescTinyTalks =>
      'Feito para pais e os seus pequenos! Perguntas simples e divertidas que ajudam as crianças a expressar-se e os pais a compreendê-las. Ideal dos 3 aos 9 anos.';

  @override
  String get deckDescGoodOldDays =>
      'Uma viagem nostálgica ao passado — da infância até às mudanças da vida. Perfeito para avós que querem partilhar histórias.';

  @override
  String get deckDescWouldYouRather =>
      'Uma versão familiar do clássico jogo \"Preferias...?\". Repleta de escolhas engraçadas e criativas que fazem todos rir e pensar.';

  @override
  String get deckDescCozyTalks =>
      'Perguntas quentes e acolhedoras que te fazem sentir em casa. Inspiram conversas reconfortantes sobre pequenas alegrias e memórias.';

  @override
  String get deckDescPartyNight =>
      'O teu baralho ideal para noites divertidas com amigos! Estas perguntas animadas trazem risadas, histórias e debates divertidos — de falhas em festas a quem é o maior flirt da noite. Perfeito para manter o bom humor.';
}
