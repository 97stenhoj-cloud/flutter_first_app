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
  String get start => 'Iniciar';

  @override
  String get settings => 'Configurações';

  @override
  String get howToPlay => 'Como jogar';

  @override
  String get chooseGameMode => 'Escolha o modo de jogo';

  @override
  String get family => 'Família';

  @override
  String get couple => 'Casal';

  @override
  String get friends => 'Amigos';

  @override
  String get chooseCategory => 'Escolha uma categoria';

  @override
  String get locked => 'Categoria Premium';

  @override
  String get lockedMessage =>
      'Esta é uma categoria premium. Faça upgrade para desbloquear todas as categorias e remover os anúncios!';

  @override
  String get previewAvailable => 'Prévia: primeiras 5 perguntas disponíveis';

  @override
  String get upgradeNow => 'Fazer upgrade agora';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Talvez depois';

  @override
  String get getPremium => 'Obter Premium';

  @override
  String get premiumTitle => 'Desbloqueie tudo';

  @override
  String get premiumDescription =>
      'Tenha acesso ilimitado a todas as categorias em todos os modos, remova anúncios e aproveite sessões ilimitadas do Pandora.';

  @override
  String get premiumPriceMonthly => '€6,99/mês';

  @override
  String get premiumPriceYearly => '€59,99/ano';

  @override
  String get saveWithYearly => 'Poupe €23,89 com o plano anual!';

  @override
  String get monthly => 'Mensal';

  @override
  String get yearly => 'Anual';

  @override
  String get billedMonthly => 'Cobrada mensalmente';

  @override
  String get billedYearly => 'Cobrada anualmente';

  @override
  String get premiumFeature1 =>
      '✓ Todas as 21 categorias premium desbloqueadas';

  @override
  String get premiumFeature2 => '✓ Sem anúncios para sempre';

  @override
  String get premiumFeature3 => '✓ 75 perguntas em todas as categorias';

  @override
  String get premiumFeature4 => '✓ Pandora: jogadores e perguntas ilimitados';

  @override
  String get premiumFeature5 => '✓ Ajude a apoiar o desenvolvimento contínuo';

  @override
  String get subscribePremium => 'Assinar Premium';

  @override
  String get subscribe => 'Assinar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get subscriptionActivated =>
      'Premium ativado! Todas as categorias foram desbloqueadas.';

  @override
  String get premiumActivated => 'Premium ativado!';

  @override
  String get demoNote =>
      'Demo: a assinatura será reiniciada ao fechar e abrir o app';

  @override
  String get freeTier => 'Versão gratuita';

  @override
  String get freeTierDesc =>
      '3 categorias por modo (30 perguntas cada)\nPrévia de 5 perguntas das categorias premium\nAnúncios a cada 7 perguntas';

  @override
  String get currentPlan => 'Plano atual';

  @override
  String get limitReached => 'Limite atingido';

  @override
  String get freeCategoryLimit =>
      'Você atingiu o limite de 30 perguntas nas categorias gratuitas. Faça upgrade para Premium e tenha acesso ilimitado!';

  @override
  String get previewLimit =>
      'Você já viu as 5 perguntas de prévia. Faça upgrade para Premium para continuar!';

  @override
  String get pandoraFreeLimit => 'Limite da versão gratuita';

  @override
  String get pandoraFreeLimitMessage =>
      'Anfitriões gratuitos podem ter no máximo 6 jogadores e 12 perguntas. Faça upgrade para Premium para se livrar dos limites!';

  @override
  String get pandoraUpgradeMessage =>
      'Você chegou a 12 perguntas. Faça upgrade para Premium para continuar jogando!';

  @override
  String get pandoraMaxPlayers =>
      'Máximo de 6 jogadores atingido (limite da versão gratuita). Faça upgrade para Premium para jogadores ilimitados!';

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
      'Assista a um anúncio rápido para continuar, ou jogue sem anúncios com Premium!';

  @override
  String get watchAd => 'Assistir anúncio';

  @override
  String get goAdFree => 'Remover anúncios com Premium';

  @override
  String get removeAdsForever => 'Remover anúncios para sempre';

  @override
  String get adNotReady => 'Anúncio não está pronto. Continuando sem anúncio.';

  @override
  String get adLoadingContinue => 'Carregando anúncio... Continuar';

  @override
  String get pricePerMonth => '€6,99/mês ou €59,99/ano';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Nenhuma pergunta encontrada para $category no modo $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Erro ao carregar perguntas. Verifique sua conexão.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Falha ao carregar perguntas: $error';
  }

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
      'Entre para sincronizar sua assinatura entre dispositivos e desbloquear conteúdo premium';

  @override
  String get signOutConfirm => 'Tem certeza de que deseja sair?';

  @override
  String get signedOutSuccess => 'Você saiu da conta';

  @override
  String get accountInformation => 'Informações da conta';

  @override
  String get email => 'E-mail';

  @override
  String get memberSince => 'Membro desde';

  @override
  String get notAvailable => 'Não disponível';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get subscriptionStatus => 'Status da assinatura';

  @override
  String get premiumMember => 'Membro Premium';

  @override
  String get freeAccount => 'Conta gratuita';

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
      'Falha ao entrar com Google. Tente novamente.';

  @override
  String get appleSignInFailed => 'Falha ao entrar com Apple. Tente novamente.';

  @override
  String get noCategoriesFound => 'Nenhuma categoria encontrada';

  @override
  String get welcomeBack => 'Bem-vindo de volta!';

  @override
  String get createAccount => 'Criar conta';

  @override
  String get displayName => 'Nome de exibição';

  @override
  String get password => 'Senha';

  @override
  String get signIn => 'Entrar';

  @override
  String get signUp => 'Registrar';

  @override
  String get dontHaveAccount => 'Não tem conta? Registre-se';

  @override
  String get alreadyHaveAccount => 'Já tem uma conta? Entrar';

  @override
  String get chooseYourMode => '1. Escolha o modo';

  @override
  String get chooseYourModeDesc =>
      'Escolha entre cinco experiências de conversa únicas:\n\n• Casal – Perguntas íntimas para aprofundar a conexão romântica\n• Amigos – Assuntos divertidos e envolventes, perfeitos para o seu grupo\n• Família – Conversas acolhedoras e leves para todas as idades\n• Pessoal – Crie seus próprios baralhos de perguntas (Premium)\n• Pandora – Jogo colaborativo multijogador com perguntas em tempo real';

  @override
  String get pickCategory => '2. Escolha uma categoria';

  @override
  String get pickCategoryDesc =>
      'Cada modo oferece várias categorias com baralhos de perguntas selecionadas:\n\n• Grátis: 3 categorias por modo (30 perguntas cada)\n• Prévia Premium: primeiras 5 perguntas das categorias premium\n• Premium: mais de 24 categorias (75 perguntas cada)\n• Pessoal: crie baralhos personalizados ilimitados com suas próprias perguntas';

  @override
  String get startTalking => '3. Comece a jogar';

  @override
  String get startTalkingDesc =>
      'As perguntas aparecem em tela cheia para conversas imersivas. Revezem-se lendo e respondendo com honestidade – não existem respostas erradas! O objetivo é conexão verdadeira e diversão.\n\nNo modo Pandora: todos os jogadores enviam perguntas de forma anônima e depois respondem juntos em tempo real.';

  @override
  String get navigateQuestions => '4. Navegue pelas perguntas';

  @override
  String get navigateQuestionsDesc =>
      '• Deslize em qualquer direção ou toque nas setas para mudar de pergunta\n• Toque no ícone de coração ❤️ para salvar como favorito\n• Premium: toque no ícone de lista de perguntas (canto superior direito) para pular para qualquer pergunta\n• Toque no botão Início para voltar ao menu principal a qualquer momento';

  @override
  String get premiumFeatures => '5. Recursos Premium';

  @override
  String get premiumFeaturesDesc =>
      'Desbloqueie a experiência completa do Connect:\n\n• Mensal: €6,99/mês\n• Anual: €59,99/ano (Poupe 29%!)\n\n✓ Todas as 24+ categorias premium em todos os modos\n✓ 75 perguntas por categoria (vs 30 na versão gratuita)\n✓ Sem anúncios para sempre\n✓ Pandora: jogadores e perguntas ilimitados\n✓ Pessoal: crie baralhos personalizados ilimitados\n✓ Navegação por perguntas – pule para qualquer pergunta\n✓ Apoie o desenvolvimento contínuo';

  @override
  String get proTips => 'Dicas';

  @override
  String get proTipsDesc =>
      '• Crie um ambiente confortável e sem distrações\n• Ouça ativamente e esteja presente\n• Seja honesto nas respostas e incentive os outros também\n• Respeite limites – está tudo bem pular perguntas\n• Use favoritos ❤️ para salvar as perguntas de que você mais gosta\n• Experimente modos diferentes para situações diferentes\n• Pandora é perfeito para festas e encontros em grupo\n• Divirta-se e aproveite a conexão!';

  @override
  String get aboutCredits => 'Sobre / Créditos';

  @override
  String get developedBy => 'Desenvolvido por TechyKoala';

  @override
  String get learnMore => 'Saiba mais sobre nós e nossos próximos apps';

  @override
  String get visitWebsite => 'Visite techykoala.com';

  @override
  String get madeWithLove => 'Feito com ❤️ para conversas significativas';

  @override
  String get personal => 'Pessoal';

  @override
  String get personalDesc =>
      'Crie seus próprios baralhos de perguntas personalizados';

  @override
  String get gameComplete => 'Jogo concluído!';

  @override
  String get noMoreQuestions =>
      'Você já passou por todas as perguntas deste baralho!';

  @override
  String get playAgain => 'Jogar novamente';

  @override
  String get mainMenu => 'Menu principal';

  @override
  String get thanksForPlaying => 'Obrigado por jogar!';

  @override
  String get hopeYouHadFun => 'Esperamos que você tenha se divertido! 🎉';

  @override
  String get backToMenu => 'Voltar ao menu';

  @override
  String get leaveGame => 'Sair do jogo?';

  @override
  String get leaveGameMessage =>
      'Tem certeza de que deseja sair? O jogo continuará para os outros jogadores.';

  @override
  String get leave => 'Sair';

  @override
  String get noQuestionsAvailable => 'Nenhuma pergunta disponível';

  @override
  String get showLess => 'Mostrar menos';

  @override
  String get readMore => 'Ler mais';

  @override
  String get tapToPlay => 'Toque para jogar';

  @override
  String get favorites => 'Favoritos';

  @override
  String get pandoraHostCreatePin =>
      'O anfitrião cria a sessão e compartilha o PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'Jogadores entram (máx. 6 no grátis, ilimitado no Premium)';

  @override
  String get pandoraHostSetsTimer =>
      'O anfitrião define o tempo por pergunta (1–15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Todos enviam perguntas (máx. 12 no grátis)';

  @override
  String get pandoraHostControls => 'O anfitrião controla o andamento do jogo';

  @override
  String get pandoraQuestionsDeleted => 'As perguntas são apagadas após o jogo';

  @override
  String get pandoraHost => 'Anfitrião';

  @override
  String get pandoraJoinGame => 'Entrar no jogo';

  @override
  String get pandoraPandoraBox => 'Caixa de Pandora';

  @override
  String get pleaseEnterName => 'Digite seu nome';

  @override
  String get hostSuffix => '(Anfitrião)';

  @override
  String get playersJoinWithNames => 'Os jogadores entram com seus nomes';

  @override
  String get everyoneSubmitsMin5 =>
      'Todos enviam perguntas (mín. 5, máx. 12 no grátis)';

  @override
  String get createSession => 'Criar sessão';

  @override
  String get creating => 'Criando...';

  @override
  String get yourName => 'Seu nome';

  @override
  String get enterDisplayName => 'Digite seu nome de exibição';

  @override
  String get howItWorks => 'Como funciona';

  @override
  String get pinCopied => 'PIN copiado para a área de transferência!';

  @override
  String get endSession => 'Encerrar sessão?';

  @override
  String get endSessionConfirm =>
      'Tem certeza de que deseja encerrar esta sessão do Pandora?';

  @override
  String get createCustomDeck => 'Criar baralho personalizado';

  @override
  String get deckName => 'Nome do baralho';

  @override
  String get enterDeckName => 'Digite o nome do baralho';

  @override
  String get create => 'Criar';

  @override
  String get deckCreated => 'Baralho criado!';

  @override
  String get failedToCreateDeck => 'Falha ao criar baralho';

  @override
  String get deleteDeck => 'Excluir baralho?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return 'Tem certeza de que deseja excluir \"$deckName\"? Isso vai apagar todas as perguntas deste baralho.';
  }

  @override
  String get delete => 'Excluir';

  @override
  String get deckDeleted => 'Baralho excluído';

  @override
  String get failedToDeleteDeck => 'Falha ao excluir baralho';

  @override
  String get myDecks => 'Meus baralhos';

  @override
  String get noDecksYet => 'Nenhum baralho ainda';

  @override
  String get createFirstDeck => 'Crie seu primeiro baralho personalizado!';

  @override
  String questionsCount(Object count) {
    return '$count perguntas';
  }

  @override
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perguntas',
      one: '1 pergunta',
      zero: '0 perguntas',
    );
    return '$_temp0';
  }

  @override
  String get questionAdded => 'Pergunta adicionada!';

  @override
  String get failedToAddQuestion => 'Falha ao adicionar pergunta';

  @override
  String get editQuestion => 'Editar pergunta';

  @override
  String get enterYourQuestion => 'Digite sua pergunta';

  @override
  String get save => 'Salvar';

  @override
  String get questionUpdated => 'Pergunta atualizada!';

  @override
  String get failedToUpdateQuestion => 'Falha ao atualizar pergunta';

  @override
  String get deleteQuestion => 'Excluir pergunta';

  @override
  String get deleteQuestionConfirm =>
      'Tem certeza de que deseja excluir esta pergunta?';

  @override
  String get questionDeleted => 'Pergunta excluída';

  @override
  String get failedToDeleteQuestion => 'Falha ao excluir pergunta';

  @override
  String get addQuestion => 'Adicionar pergunta';

  @override
  String get typeQuestionHere => 'Digite sua pergunta aqui...';

  @override
  String get add => 'Adicionar';

  @override
  String get noQuestionsYet => 'Nenhuma pergunta ainda';

  @override
  String get addFirstQuestion => 'Adicione sua primeira pergunta!';

  @override
  String get deckDescLoveTalks =>
      'Explore romance, química e conexão com perguntas emocionantes que celebram o relacionamento de vocês. De momentos de \"como nos conhecemos\" até o que faz você se sentir mais amado(a), essas cartas aprofundam a intimidade emocional.';

  @override
  String get deckDescDeepTalks =>
      'Estas cartas mergulham em valores, vulnerabilidade e o que significa crescer juntos. Elas ajudam o casal a refletir sobre independência, comunicação e propósito em comum.';

  @override
  String get deckDescSpicyTalks =>
      'Atrevido, divertido e íntimo — este baralho convida casais a explorar desejo, fantasias e paixão juntos. Cada pergunta foi criada para despertar conversas sinceras e empolgantes sobre o que acende a chama entre vocês.';

  @override
  String get deckDescDoYouDareTalks =>
      'Um baralho destemido que mistura honestidade emocional com temas delicados como confiança, religião, dinheiro e limites pessoais — tudo para revelar o que realmente importa para vocês dois. *Nota:* Algumas perguntas são diretas e intensas — joguem com abertura, empatia e respeito.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspirado nas cinco linguagens do amor, este baralho ajuda parceiros a expressar carinho de formas que realmente tocam o outro. Descubram como palavras, atitudes e gestos fortalecem a conexão.';

  @override
  String get deckDescSillyTalks =>
      'Pura diversão e risadas! Perguntas leves e malucas que revelam seus hábitos mais estranhos e pensamentos mais engraçados. Perfeito para amigos, família ou casais bem-humorados.';

  @override
  String get deckDescCarTalks =>
      'Perfeito para viagens de carro — estas cartas transformam o tempo na estrada em boas conversas. Espere perguntas divertidas, criativas e cheias de nostalgia sobre viagens, aventuras e manias.';

  @override
  String get deckDescCozyTalks =>
      'Perguntas quentinhas e tranquilas, perfeitas para noites aconchegantes. Crie momentos de conexão calma e sincera.';

  @override
  String get deckDescPartyNight =>
      'Perguntas cheias de energia, pensadas para grupos. Perfeito para festas e encontros com amigos.';

  @override
  String get deckDescUnpopularOpinions =>
      'O baralho que desafia você a dizer o que todo mundo pensa, mas ninguém fala. De cultura de influenciadores a normas sociais — estas cartas geram debates sinceros e opiniões surpreendentes. Ideal para amigos cheios de opinião.';

  @override
  String get deckDescPlotTwists =>
      'Este baralho joga você direto em situações do tipo \"o que você faria se...?\" — das mais engraçadas às mais difíceis. Respostas no impulso, instinto e muitas risadas garantidas!';

  @override
  String get deckDescAfterDark =>
      'Entre no lado mais sombrio das conversas com perguntas que dão arrepios. De coincidências estranhas a cenários de sobrevivência — perfeito para noites tarde com um toque de suspense.';

  @override
  String get deckDescHistoryTalks =>
      'Uma mistura nostálgica de memórias pessoais e momentos em família. Essas perguntas inspiram histórias, risadas e redescoberta das suas origens. Ótimo para encontros em família ou noites tranquilas.';

  @override
  String get deckDescTinyTalks =>
      'Feito para pais e pequenos! Perguntas simples e brincalhonas ajudam as crianças a se expressarem, enquanto os pais entendem melhor como elas pensam. Perfeito para idades de 3 a 9 anos.';

  @override
  String get deckDescGoodOldDays =>
      'Viaje de volta no tempo com perguntas sobre lembranças queridas, experiências passadas e como as coisas eram antes. Perfeito para todas as idades.';

  @override
  String get deckDescWouldYouRather =>
      'Dilemas clássicos que geram debates e revelam preferências. Escolha entre duas opções e descubra o que importa mais para cada um.';

  @override
  String get createNewDeck => 'Criar novo baralho';

  @override
  String get sessionPin => 'PIN da sessão';

  @override
  String get joinSession => 'Entrar na sessão';

  @override
  String get questionSubmitted => 'Pergunta enviada';

  @override
  String get sessionCancelled => 'Sessão cancelada';

  @override
  String get yourQuestion => 'Sua pergunta';

  @override
  String get reactionBreakdown => 'Detalhamento das reações';

  @override
  String get deckNameHint => 'Nome do baralho';

  @override
  String get deckCreatedSuccess => 'Baralho criado!';

  @override
  String get cancelSession => 'Cancelar sessão?';

  @override
  String get cancelSessionConfirm =>
      'Isso vai cancelar a sessão para todos os jogadores. Tem certeza?';

  @override
  String get no => 'Não';

  @override
  String get yesCancel => 'Sim, cancelar';

  @override
  String get hostQuestionCollection => 'Anfitrião – coleta de perguntas';

  @override
  String get questionCollection => 'Coleta de perguntas';

  @override
  String get endSessionButton => 'Encerrar sessão';

  @override
  String get noActiveSubscription => 'Nenhuma assinatura ativa';

  @override
  String get premium => 'Premium';

  @override
  String notEnoughQuestions(Object count) {
    return 'Número insuficiente de perguntas. Mínimo de 5. (Atualmente: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Recurso Premium';

  @override
  String get questionNavigationPremium =>
      'A navegação por perguntas é um recurso Premium. Assine para desbloquear a opção de pular para qualquer pergunta!';

  @override
  String get customDecks => 'Baralhos personalizados';

  @override
  String get noDecksYetMessage => 'Nenhum baralho ainda';

  @override
  String get createFirstDeckMessage =>
      'Toque em + para criar seu primeiro baralho';

  @override
  String get signInRequired => 'Login obrigatório';

  @override
  String get signInToUsePersonal =>
      'Faça login para usar o modo Pessoal e criar baralhos de perguntas personalizados.';

  @override
  String get collaborativeQuestionGame => 'Jogo colaborativo de perguntas';

  @override
  String get hostPandoraSession => 'Hospedar sessão Pandora';

  @override
  String get joinPandoraGame => 'Entrar em uma partida';

  @override
  String get yourDisplayName => 'Seu nome de exibição';

  @override
  String get enterYourName => 'Digite seu nome';

  @override
  String get selectQuestion => 'Selecione uma pergunta';

  @override
  String get joinTime => 'Tempo para entrar';

  @override
  String get participants => 'Participantes';

  @override
  String get loading => 'Carregando...';

  @override
  String needAtLeastPlayers(int current) {
    return 'São necessários pelo menos 2 jogadores ($current/2)';
  }

  @override
  String get continueToTimerSetup => 'Continuar para o temporizador';

  @override
  String get setQuestionTimer => 'Definir tempo por pergunta';

  @override
  String get questionCollectionTime => 'Tempo de coleta de perguntas';

  @override
  String get minutes => 'minutos';

  @override
  String get sessionWillEnd =>
      'A sessão será encerrada automaticamente se você não continuar em 5 minutos';

  @override
  String get startQuestionCollection => 'Iniciar coleta de perguntas';

  @override
  String questionsSubmitted(int count) {
    return '$count perguntas enviadas';
  }

  @override
  String get writeQuestionHere => 'Escreva sua pergunta aqui...';

  @override
  String get whoIsThisFor => 'Para quem é esta pergunta?';

  @override
  String get everyone => 'Todos';

  @override
  String get specific => 'Pessoa específica';

  @override
  String get submitQuestion => 'Enviar pergunta';

  @override
  String needMoreQuestions(int count) {
    return 'Faltam $count perguntas';
  }

  @override
  String get startGame => 'Iniciar jogo';

  @override
  String get selectPlayer => 'Selecione um jogador';

  @override
  String get unsubscribe => 'Cancelar assinatura';

  @override
  String get unsubscribeConfirm => 'Cancelar assinatura Premium?';

  @override
  String get unsubscribeWarning =>
      'Você perderá acesso a todos os recursos Premium, incluindo perguntas ilimitadas, todas as categorias, ausência de anúncios e jogadores ilimitados no Pandora. Você pode assinar novamente quando quiser.';

  @override
  String get yesUnsubscribe => 'Sim, cancelar';

  @override
  String get unsubscribeSuccess =>
      'Assinatura cancelada. Recursos Premium desativados.';

  @override
  String get unsubscribeError => 'Falha ao cancelar assinatura';

  @override
  String get questions => 'perguntas';

  @override
  String get preview => 'prévia';

  @override
  String get userId => 'ID de usuário';

  @override
  String get subscription => 'Assinatura';

  @override
  String get questionsCount75 => '75 perguntas';

  @override
  String get questionsCount30 => '30 perguntas';

  @override
  String get questionsCount5Preview => 'Prévia com 5 perguntas';

  @override
  String get unlockFullDeck => 'Desbloquear 75 perguntas';

  @override
  String get renameDeck => 'Renomear baralho';

  @override
  String get deckRenamed => 'Baralho renomeado com sucesso';

  @override
  String get failedToRenameDeck => 'Falha ao renomear baralho';

  @override
  String get shuffleQuestions => 'Embaralhar perguntas';

  @override
  String get resetOrder => 'Redefinir ordem';

  @override
  String get questionsShuffled => 'Perguntas embaralhadas!';

  @override
  String get orderReset => 'Ordem redefinida para a original';

  @override
  String get readyToPlay => 'Pronto para jogar';

  @override
  String get longPressReorder =>
      'Pressione e segure para arrastar e reorganizar as perguntas';

  @override
  String get noFavoritesYet => 'Ainda não há favoritos';

  @override
  String get heartQuestionsDuringGameplay =>
      'Toque no coração ❤️ nas cartas durante o jogo para salvá-las aqui!';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Adicione pelo menos $count perguntas para começar a jogar!';
  }

  @override
  String get heartQuestionsInfo =>
      'Marque perguntas com coração durante o jogo para adicioná-las aos seus Favoritos!';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Adicione pelo menos $count perguntas para jogar com este baralho';
  }

  @override
  String get removeFromFavorites => 'Remover dos favoritos';

  @override
  String get unlockEverything => 'Desbloquear tudo';

  @override
  String get premiumSubtitle =>
      'Tenha acesso ilimitado a todas as categorias, remova anúncios para sempre e desbloqueie recursos Premium';

  @override
  String get save32Percent => 'POUPE 29%';

  @override
  String get priceMonthly => '€6,99/mês';

  @override
  String get priceYearly => '€59,99/ano';

  @override
  String get billedAnnually => 'Cobrada anualmente';

  @override
  String get equivalentMonthly => 'Equivalente a apenas €5/mês';

  @override
  String get feature24Categories =>
      'Mais de 24 categorias premium desbloqueadas em todos os modos';

  @override
  String get feature75Questions =>
      '75 perguntas por categoria (vs 30 na versão gratuita)';

  @override
  String get featureNoAds => 'Sem anúncios para sempre – jogo ininterrupto';

  @override
  String get featureUnlimitedPlayers =>
      'Modo Pandora: jogadores e perguntas ilimitados';

  @override
  String get featureQuestionNavigation =>
      'Navegue e pule para qualquer pergunta durante o jogo';

  @override
  String get featureSupportDevelopment =>
      'Ajude a apoiar o desenvolvimento contínuo e novos recursos';

  @override
  String get error => 'Erro';

  @override
  String get premiumActivatedMessage =>
      'Premium ativado! Todas as categorias foram desbloqueadas.';

  @override
  String get featurePersonalDecks =>
      'Modo Pessoal: crie baralhos personalizados ilimitados com suas próprias perguntas';

  @override
  String get premiumPersonal =>
      'O modo Pessoal com baralhos personalizados é um recurso Premium. Faça upgrade para Premium e crie seus próprios baralhos de perguntas!';

  @override
  String deleteDeckConfirmation(String deckName) {
    return 'Tem certeza de que deseja excluir \"$deckName\"? Isso vai apagar todas as perguntas deste baralho.';
  }

  @override
  String needMore(int count) {
    return 'Ainda faltam $count';
  }

  @override
  String get editQuestions => 'Editar perguntas';

  @override
  String get addMore => 'Adicionar mais';

  @override
  String useMyConnectEmail(String email) {
    return 'Usar meu e-mail Connect: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Usuários gratuitos podem ter no máximo 6 jogadores. Faça upgrade para Premium para jogadores ilimitados!';

  @override
  String get freemiumQuestionLimit =>
      'Usuários gratuitos podem enviar no máximo 12 perguntas. Faça upgrade para Premium para perguntas ilimitadas!';

  @override
  String get yourQuestions => 'Suas perguntas';

  @override
  String waitingForHost(int count) {
    return 'Aguardando o anfitrião... ($count jogadores)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Faça upgrade para Premium para jogadores ilimitados';

  @override
  String get kickPlayer => 'Expulsar jogador';

  @override
  String kickPlayerConfirm(String playerName) {
    return 'Tem certeza de que deseja expulsar \"$playerName\" da sessão?';
  }

  @override
  String get kick => 'Expulsar';

  @override
  String playerKicked(String playerName) {
    return '$playerName foi expulso da sessão';
  }

  @override
  String get failedToKickPlayer => 'Falha ao expulsar jogador';

  @override
  String get cancelSessionForAll =>
      'Isso vai cancelar a sessão para todos os jogadores. Tem certeza?';

  @override
  String get youWereKicked => 'Você foi removido da sessão';

  @override
  String get you => 'Você';

  @override
  String get loginRequiredForPandora => 'Login obrigatório para jogar Pandora';

  @override
  String get login => 'Entrar';

  @override
  String get loginRequiredNote =>
      'É necessário fazer login para jogar Pandora (para rastrear os jogadores corretamente)';

  @override
  String get timeIsUp => 'O tempo acabou!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'Não foram enviadas perguntas suficientes ($current/$minimum mínimo).';
  }

  @override
  String get sessionQuestionLimit => 'Limite de perguntas da sessão atingido';

  @override
  String get sessionQuestionLimitMessage =>
      'Esta sessão atingiu o limite de 12 perguntas (anfitrião gratuito). Faça upgrade para Premium para perguntas ilimitadas!';

  @override
  String sessionQuestionCount(int current) {
    return 'Sessão: $current/12 perguntas';
  }

  @override
  String get pleaseEnterQuestion => 'Digite uma pergunta';

  @override
  String get rateThisDeck => 'Avalie este baralho';

  @override
  String get yourRating => 'Sua avaliação';

  @override
  String get skip => 'Pular';

  @override
  String get submit => 'Enviar';

  @override
  String get thankYouForFeedback => 'Obrigado pelo seu feedback!';

  @override
  String get failedToSubmitRating => 'Falha ao enviar avaliação';

  @override
  String get tapStarsToRate => 'Toque nas estrelas para avaliar';

  @override
  String get downloadForOffline => 'Baixar para uso offline';

  @override
  String get downloading => 'Baixando...';

  @override
  String get downloadedLanguages => 'Idiomas baixados';

  @override
  String get languageNotDownloaded => 'Idioma não baixado';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'Você não baixou $languageName para uso offline.\n\nVá para Configurações > Perfil > \"Baixar para uso offline\" enquanto estiver conectado à internet.';
  }

  @override
  String get offlineLanguageError =>
      'Este idioma não foi baixado para uso offline. Vá para Configurações > Perfil > \"Baixar para uso offline\" enquanto estiver conectado à internet.';

  @override
  String get downloadComplete => 'Download concluído!';

  @override
  String get downloadCompleteMessage =>
      'Todo o conteúdo foi baixado para uso offline.';

  @override
  String get addedToFavorites => 'Adicionado aos favoritos';

  @override
  String get removedFromFavorites => 'Removido dos favoritos';

  @override
  String get errorSavingFavorite => 'Erro ao salvar favorito';

  @override
  String get internetRequired => 'Internet necessária';

  @override
  String get internetRequiredMessage =>
      'Alguns recursos exigem conexão com a internet. Usuários Premium podem baixar conteúdo para uso offline nas Configurações.';

  @override
  String get goPremium => 'Obter Premium';

  @override
  String get pleaseEnterPin => 'Por favor, insira um PIN de 6 dígitos';

  @override
  String errorOccurred(String error) {
    return 'Erro: $error';
  }

  @override
  String get errorCreatingSession => 'Erro ao criar sessão';

  @override
  String get sessionTimedOut =>
      'Sessão expirada - anfitrião não definiu o temporizador';

  @override
  String get errorStarting => 'Erro ao iniciar';

  @override
  String get errorLoadingParticipants => 'Erro ao carregar participantes';

  @override
  String get sessionCancelledByHost => 'Sessão cancelada pelo anfitrião';

  @override
  String needAtLeast5Questions(int count) {
    return 'São necessárias pelo menos 5 perguntas para começar! (Atualmente: $count)';
  }

  @override
  String get errorStartingGame => 'Erro ao iniciar jogo';

  @override
  String get questionsAsked => 'Perguntas feitas';

  @override
  String get totalReactions => 'Reações totais';

  @override
  String get mostLovedQuestion => 'Pergunta mais amada';

  @override
  String get mostFunQuestion => 'Pergunta mais divertida';

  @override
  String get mostShockingQuestion => 'Pergunta mais chocante';

  @override
  String get mostLitQuestion => 'Pergunta mais legal';

  @override
  String get hotSeatAward => 'Prêmio Hot Seat';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Erro: Não foi possível identificar o jogador. Por favor, entre novamente na sessão.';

  @override
  String get createAiDeck => 'Criar Deck de AI';

  @override
  String get whatIsTheOccasion => 'Qual é a ocasião?';

  @override
  String get occasionHint =>
      'ex.: Festa de aniversário, Team building, Noite romântica';

  @override
  String get whatIsTheMood => 'Qual é o clima?';

  @override
  String get lighthearted => 'Descontraído';

  @override
  String get serious => 'Sério';

  @override
  String get mixed => 'Misturado';

  @override
  String get depthOfQuestions => 'Profundidade das perguntas?';

  @override
  String get surfaceLevel => 'Nível superficial';

  @override
  String get deep => 'Profundo';

  @override
  String get level => 'Nível';

  @override
  String get sizeOfGroup => 'Tamanho do grupo?';

  @override
  String get people => 'pessoas';

  @override
  String get anyOtherRemarks => 'Alguma outra observação? (opcional)';

  @override
  String get remarksHint =>
      'por exemplo, Amigável para a família, inclua algumas perguntas engraçadas';

  @override
  String get generateQuestions => 'Gerar Perguntas';

  @override
  String get aiDeckPremiumMessage =>
      'A geração de decks com AI é um recurso premium. Faça upgrade para criar decks de conversa ilimitados com tecnologia de AI!';

  @override
  String get pleaseEnterOccasion => 'Por favor, insira a ocasião';

  @override
  String errorGeneratingQuestions(String error) {
    return 'Erro ao gerar perguntas: $error';
  }

  @override
  String get generatingAiQuestions => 'Gerando perguntas de AI...';

  @override
  String get generatingMoreQuestions => 'Gerando mais perguntas...';

  @override
  String get batchComplete => 'Lote Completo!';

  @override
  String questionsInDeckMessage(int count) {
    return 'Você tem $count perguntas no seu baralho. Gerar mais 10?';
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
    return '$kept/$max';
  }

  @override
  String questionProgress(int current, int total) {
    return '$current/$total';
  }

  @override
  String batchNumber(int number) {
    return 'Lote #$number';
  }

  @override
  String get imDone => 'Estou Pronto';

  @override
  String get generateMore => 'Gerar Mais';

  @override
  String get maxQuestionsReached => 'Máx Perguntas (50)';

  @override
  String get namYourDeck => 'Nomeie Seu Baralho';

  @override
  String get goBack => 'Voltar';

  @override
  String get swipeInstructions =>
      'Deslize para a direita para manter • Deslize para a esquerda para descartar';

  @override
  String get discussionPoint => 'Ponto de Discussão';

  @override
  String get sparkMode => 'Modo Spark';

  @override
  String get sparkModeSubtitle => 'Iniciadores de Conversa com Tecnologia AI';

  @override
  String get sparkPremiumRequired => 'Modo Spark - Recurso Premium';

  @override
  String get sparkPremiumMessage =>
      'O Modo Spark está disponível para assinantes Premium e Premium+. Gere iniciadores de conversa impulsionados por AI adaptados à sua ocasião!';

  @override
  String sparkQuestionsRemaining(int remaining, int limit) {
    return '$remaining de $limit perguntas restantes';
  }

  @override
  String get howManyQuestions => 'Quantas perguntas?';

  @override
  String sparkQuestions(int count) {
    return '$count Perguntas';
  }

  @override
  String generateSparkQuestions(int count) {
    return 'Gerar $count Perguntas';
  }

  @override
  String get sparkLimitReached => 'Limite Mensal Atingido';

  @override
  String sparkLimitMessage(int remaining, int requested) {
    return 'Você só tem $remaining perguntas Spark restantes este mês. Você está tentando gerar $requested perguntas.\n\nFaça upgrade para Premium+ para 400 perguntas por mês!';
  }

  @override
  String get expiresIn24Hours => 'Expira em 24 horas';

  @override
  String get alreadyInFavorites => 'Já nos Favoritos';

  @override
  String addedToDeck(String deckName) {
    return 'Adicionado a $deckName!';
  }

  @override
  String get questionAlreadyInDeck => 'Pergunta já neste baralho';

  @override
  String get addToDeck => 'Adicionar ao Deck';

  @override
  String get favorite => 'Favorito';

  @override
  String get chooseDeck => 'Escolha um baralho para adicionar esta pergunta:';

  @override
  String get noDecksFound => 'Nenhum Deck Encontrado';

  @override
  String get noDecksMessage =>
      'Você ainda não tem nenhum baralho personalizado. Gostaria de criar um?';

  @override
  String get createDeck => 'Criar Baralho';

  @override
  String get createAndAdd => 'Criar & Adicionar';

  @override
  String get pleaseEnterDeckName => 'Por favor, insira um nome para o deck';

  @override
  String get tierBasic => 'Básico';

  @override
  String get tierPremium => 'Premium';

  @override
  String get tierPremiumPlus => 'Premium+';

  @override
  String get tierFree => 'Grátis';

  @override
  String get choosePlan => 'Escolha Seu Plano';

  @override
  String get choosePlanSubtitle =>
      'Desbloqueie recursos premium e conversas impulsionadas por AI';

  @override
  String get mostPopular => 'M MAIS POPULAR';

  @override
  String get perMonth => 'por mês';

  @override
  String get forever => 'Para sempre';

  @override
  String get continueWithBasic => 'Continuar com o Básico (Grátis)';

  @override
  String subscribeTo(String tier) {
    return 'Assine $tier';
  }

  @override
  String get cancelAnytime => 'Cancele a qualquer momento. Sem taxas ocultas.';

  @override
  String get basicTierTitle => 'Básico';

  @override
  String get basicTierPrice => '€6,99';

  @override
  String get basicTierDescription =>
      'Acesse todos os modos de jogo, exceto Spark';

  @override
  String get basicFeature1 =>
      'Todos os modos de jogo (Casal, Amigos, Família, Pessoal, Pandora)';

  @override
  String get basicFeature2 => 'Acesso a todas as 24+ categorias';

  @override
  String get basicFeature3 => 'Decks pessoais personalizados';

  @override
  String get basicFeature4 => 'Sem anúncios';

  @override
  String get basicFeature5 => 'Navegação de perguntas';

  @override
  String get premiumTierTitle => 'Premium';

  @override
  String get premiumTierPrice => '€11,99';

  @override
  String get premiumTierDescription => 'Tudo em Básico + Spark AI';

  @override
  String get premiumFeature6 => 'Salve favoritos em baralhos pessoais';

  @override
  String get premiumPlusTierTitle => 'Premium+';

  @override
  String get premiumPlusTierPrice => '€19,99';

  @override
  String get premiumPlusTierDescription => 'Máxima potência de AI';

  @override
  String get premiumPlusFeature1 => 'Tudo no Premium';

  @override
  String get premiumPlusFeature2 => '🚀 400 perguntas de AI por mês';

  @override
  String get premiumPlusFeature3 => '2,5x mais perguntas Spark';

  @override
  String get premiumPlusFeature4 => 'Perfeito para uso frequente';

  @override
  String get premiumPlusFeature5 => 'Suporte prioritário';
}
