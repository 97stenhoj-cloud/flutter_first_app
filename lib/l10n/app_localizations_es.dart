// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Comenzar';

  @override
  String get settings => 'Configuraciones';

  @override
  String get howToPlay => 'Cómo Jugar';

  @override
  String get chooseGameMode => 'Elige tu modo de juego';

  @override
  String get family => 'Familia';

  @override
  String get couple => 'Pareja';

  @override
  String get friends => 'Amigos';

  @override
  String get chooseCategory => 'Elige una Categoría';

  @override
  String get locked => 'Categoría Premium';

  @override
  String get lockedMessage =>
      'Esta es una categoría premium. ¡Actualiza para desbloquear todas las categorías y eliminar anuncios!';

  @override
  String get previewAvailable =>
      'Vista previa: Primeras 5 preguntas disponibles';

  @override
  String get upgradeNow => 'Actualizar Ahora';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Quizás más tarde';

  @override
  String get getPremium => 'Obtener Premium';

  @override
  String get premiumTitle => 'Desbloquear Todo';

  @override
  String get premiumDescription =>
      'Obtén acceso ilimitado a todas las categorías en todos los modos, elimina anuncios y disfruta de sesiones ilimitadas de Pandora.';

  @override
  String get premiumPriceMonthly => '49 DKK/mes';

  @override
  String get premiumPriceYearly => '399 DKK/año';

  @override
  String get saveWithYearly => '¡Ahorra 189 DKK con el plan anual!';

  @override
  String get monthly => 'Mensual';

  @override
  String get yearly => 'Anual';

  @override
  String get billedMonthly => 'Facturado mensualmente';

  @override
  String get billedYearly => 'Facturado anualmente';

  @override
  String get premiumFeature1 => '✓ Las 21 categorías premium desbloqueadas';

  @override
  String get premiumFeature2 => '✓ Sin anuncios para siempre';

  @override
  String get premiumFeature3 =>
      '✓ Preguntas ilimitadas en todas las categorías';

  @override
  String get premiumFeature4 => '✓ Pandora: Jugadores y preguntas ilimitadas';

  @override
  String get premiumFeature5 => '✓ Apoya el desarrollo continuo';

  @override
  String get subscribePremium => 'Suscribirse a Premium';

  @override
  String get subscribe => 'Suscribirse';

  @override
  String get cancel => 'Cancelar';

  @override
  String get subscriptionActivated =>
      '¡Premium activado! Todas las categorías desbloqueadas.';

  @override
  String get premiumActivated => '¡Premium Activado!';

  @override
  String get demoNote =>
      'Demo: La suscripción se restablecerá al reiniciar la app';

  @override
  String get freeTier => 'Nivel Gratuito';

  @override
  String get freeTierDesc =>
      '3 categorías por modo (30 preguntas cada una)\nVistas previas de 5 preguntas de categorías premium\nAnuncios cada 7 preguntas';

  @override
  String get currentPlan => 'Plan Actual';

  @override
  String get limitReached => 'Límite Alcanzado';

  @override
  String get freeCategoryLimit =>
      '¡Has alcanzado el límite de 30 preguntas para categorías gratuitas! ¡Actualiza a Premium para acceso ilimitado!';

  @override
  String get previewLimit =>
      '¡Has visto las 5 preguntas de vista previa! ¡Actualiza a Premium para continuar!';

  @override
  String get pandoraFreeLimit => 'Límite Gratuito';

  @override
  String get pandoraFreeLimitMessage =>
      'Los anfitriones gratuitos pueden tener máx. 6 jugadores y 12 preguntas. ¡Actualiza a Premium para acceso ilimitado!';

  @override
  String get pandoraUpgradeMessage =>
      '¡Has alcanzado 12 preguntas! ¡Actualiza a Premium para seguir jugando!';

  @override
  String get pandoraMaxPlayers =>
      '¡Máximo de 6 jugadores alcanzado (límite gratuito)! ¡Actualiza a Premium para jugadores ilimitados!';

  @override
  String get swipeOrTap => 'Desliza o toca las flechas';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Siguiente';

  @override
  String get advertisement => 'Publicidad';

  @override
  String get watchAdMessage =>
      '¡Mira un anuncio corto para continuar, o disfruta sin anuncios con premium!';

  @override
  String get watchAd => 'Ver Anuncio';

  @override
  String get goAdFree => 'Sin Anuncios con Premium';

  @override
  String get removeAdsForever => 'Eliminar Anuncios Para Siempre';

  @override
  String get adNotReady => 'Anuncio no disponible. Continuando sin anuncio.';

  @override
  String get adLoadingContinue => 'Cargando anuncios... Continuar';

  @override
  String get pricePerMonth => '49 DKK/mes o 399 DKK/año';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'No se encontraron preguntas para $category en modo $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Error al cargar preguntas. Por favor, verifica tu conexión.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Error al cargar preguntas: $error';
  }

  @override
  String get madeForWife => 'Hecho para mi hermosa esposa';

  @override
  String get otiLia => 'Otilia Stenhøj';

  @override
  String get withLoveAndConversations => 'Con amor y conversaciones';

  @override
  String get howManyPlayers => '¿Cuántos jugadores?';

  @override
  String get players => 'Jugadores';

  @override
  String get continueButton => 'Continuar';

  @override
  String get language => 'Idioma';

  @override
  String languageChanged(Object language) {
    return 'Idioma cambiado a $language';
  }

  @override
  String get profile => 'Perfil';

  @override
  String get signOut => 'Cerrar Sesión';

  @override
  String get notSignedIn => 'No Has Iniciado Sesión';

  @override
  String get signInSignUp => 'Iniciar Sesión / Registrarse';

  @override
  String get signInToSync =>
      'Inicia sesión para sincronizar tu suscripción en todos los dispositivos y desbloquear contenido premium';

  @override
  String get signOutConfirm => '¿Estás seguro de que quieres cerrar sesión?';

  @override
  String get signedOutSuccess => 'Sesión cerrada exitosamente';

  @override
  String get accountInformation => 'Información de la Cuenta';

  @override
  String get email => 'Correo Electrónico';

  @override
  String get memberSince => 'Miembro Desde';

  @override
  String get notAvailable => 'No disponible';

  @override
  String get unknown => 'Desconocido';

  @override
  String get subscriptionStatus => 'Estado de Suscripción';

  @override
  String get premiumMember => 'Miembro Premium';

  @override
  String get freeAccount => 'Cuenta Gratuita';

  @override
  String get welcomeToConnect => '¡Bienvenido a Connect!';

  @override
  String get continueWithApple => 'Continuar con Apple';

  @override
  String get continueWithGoogle => 'Continuar con Google';

  @override
  String get skipForNow => 'Saltar por ahora';

  @override
  String get byContining =>
      'Al continuar, aceptas nuestros Términos de Servicio y Política de Privacidad';

  @override
  String get googleSignInFailed =>
      'Error al iniciar sesión con Google. Por favor, intenta de nuevo.';

  @override
  String get appleSignInFailed =>
      'Error al iniciar sesión con Apple. Por favor, intenta de nuevo.';

  @override
  String get noCategoriesFound => 'No se encontraron categorías';

  @override
  String get aboutCredits => 'Acerca de / Créditos';

  @override
  String get welcomeBack => '¡Bienvenido de Nuevo!';

  @override
  String get createAccount => 'Crear Cuenta';

  @override
  String get displayName => 'Nombre para Mostrar';

  @override
  String get password => 'Contraseña';

  @override
  String get signIn => 'Iniciar Sesión';

  @override
  String get signUp => 'Registrarse';

  @override
  String get dontHaveAccount => '¿No tienes una cuenta? Regístrate';

  @override
  String get alreadyHaveAccount => '¿Ya tienes una cuenta? Inicia sesión';

  @override
  String get chooseYourMode => '1. Elige Tu Modo';

  @override
  String get chooseYourModeDesc =>
      'Selecciona entre tres estilos de conversación:\n\n• Familia - Conversaciones cálidas y sanas perfectas para todas las edades\n• Pareja - Preguntas íntimas y románticas para profundizar tu conexión\n• Amigos - Temas divertidos y entretenidos para tu grupo';

  @override
  String get pickCategory => '2. Elige una Categoría';

  @override
  String get pickCategoryDesc =>
      'Cada modo tiene múltiples categorías con paquetes de preguntas únicos. 3 categorías gratuitas por modo (30 preguntas cada una), con vistas previas de 5 preguntas de categorías premium.';

  @override
  String get startTalking => '3. Comienza a Hablar';

  @override
  String get startTalkingDesc =>
      'Las preguntas aparecen en pantalla completa. Túrnense para leerlas y responderlas honestamente. No hay respuestas incorrectas - ¡el objetivo es una conversación significativa!';

  @override
  String get navigateQuestions => '4. Navega por las Preguntas';

  @override
  String get navigateQuestionsDesc =>
      '• Desliza a la derecha o toca \"Siguiente\" para la siguiente pregunta\n• Desliza a la izquierda o toca \"Anterior\" para revisar preguntas\n• Toca el botón de inicio para volver al menú principal en cualquier momento';

  @override
  String get premiumFeatures => '5. Características Premium';

  @override
  String get premiumFeaturesDesc =>
      'Desbloquea las 24 categorías con Premium:\n\n• Mensual: 49 DKK/mes\n• Anual: 399 DKK/año (¡ahorra 189 DKK!)\n\n✓ Todas las categorías desbloqueadas\n✓ Sin anuncios\n✓ Preguntas ilimitadas\n✓ Sesiones ilimitadas de Pandora';

  @override
  String get proTips => 'Consejos Profesionales';

  @override
  String get proTipsDesc =>
      '• Crea un ambiente cómodo y sin distracciones\n• Escucha activamente y mantente presente\n• Comparte honestamente y anima a otros a hacer lo mismo\n• Respeta los límites - salta preguntas si es necesario\n• ¡Diviértete y disfruta de la conexión!';

  @override
  String get personal => 'Personal';

  @override
  String get personalDesc =>
      'Crea tus propios mazos de preguntas personalizados';

  @override
  String get gameComplete => '¡Juego Completo!';

  @override
  String get noMoreQuestions =>
      '¡Has pasado por todas las preguntas de este mazo!';

  @override
  String get playAgain => 'Jugar de Nuevo';

  @override
  String get mainMenu => 'Menú Principal';

  @override
  String get thanksForPlaying => '¡Gracias por Jugar!';

  @override
  String get hopeYouHadFun => '¡Espero que te hayas divertido! 🎉';

  @override
  String get backToMenu => 'Volver al Menú';

  @override
  String get leaveGame => '¿Salir del Juego?';

  @override
  String get leaveGameMessage =>
      '¿Estás seguro de que quieres salir? El juego continuará para los demás jugadores.';

  @override
  String get leave => 'Salir';

  @override
  String get noQuestionsAvailable => 'No hay preguntas disponibles';

  @override
  String get showLess => 'Mostrar Menos';

  @override
  String get readMore => 'Leer Más';

  @override
  String get tapToPlay => 'Toca para Jugar';

  @override
  String get favorites => 'Favoritos';

  @override
  String get pandoraHostCreatePin =>
      'El anfitrión crea la sesión y comparte el PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'Los jugadores se unen (máx. 6 gratis, ilimitado premium)';

  @override
  String get pandoraHostSetsTimer =>
      'El anfitrión establece el temporizador de preguntas (1-15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Todos envían preguntas (máx. 12 gratis)';

  @override
  String get pandoraHostControls =>
      'El anfitrión controla el progreso del juego';

  @override
  String get pandoraQuestionsDeleted =>
      'Preguntas eliminadas después del juego';

  @override
  String get pandoraHost => 'Anfitrión';

  @override
  String get pandoraJoinGame => 'Unirse al Juego';

  @override
  String get pandoraPandoraBox => 'Caja de Pandora';

  @override
  String get pleaseEnterName => 'Por favor, ingresa tu nombre';

  @override
  String get hostSuffix => '(Anfitrión)';

  @override
  String get playersJoinWithNames => 'Los jugadores se unen con sus nombres';

  @override
  String get everyoneSubmitsMin5 =>
      'Todos envían preguntas (mín 5, máx 12 gratis)';

  @override
  String get createSession => 'Crear Sesión';

  @override
  String get creating => 'Creando...';

  @override
  String get yourName => 'Tu Nombre';

  @override
  String get enterDisplayName => 'Ingresa tu nombre de usuario';

  @override
  String get howItWorks => 'Cómo Funciona';

  @override
  String get pinCopied => '¡PIN copiado al portapapeles!';

  @override
  String get endSession => '¿Finalizar Sesión?';

  @override
  String get endSessionConfirm =>
      '¿Estás seguro de que quieres finalizar esta sesión de Pandora?';

  @override
  String get createCustomDeck => 'Crear Mazo Personalizado';

  @override
  String get deckName => 'Nombre del Mazo';

  @override
  String get enterDeckName => 'Ingresa el nombre del mazo';

  @override
  String get create => 'Crear';

  @override
  String get deckCreated => '¡Mazo creado!';

  @override
  String get failedToCreateDeck => 'Error al crear el mazo';

  @override
  String get deleteDeck => '¿Eliminar Mazo?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return '¿Estás seguro de que quieres eliminar \"$deckName\"? Esto eliminará todas las preguntas de este mazo.';
  }

  @override
  String get delete => 'Eliminar';

  @override
  String get deckDeleted => 'Mazo eliminado';

  @override
  String get failedToDeleteDeck => 'Error al eliminar el mazo';

  @override
  String get myDecks => 'Mis Mazos';

  @override
  String get noDecksYet => 'Aún no hay mazos';

  @override
  String get createFirstDeck => '¡Crea tu primer mazo personalizado!';

  @override
  String questionsCount(Object count) {
    return '$count preguntas';
  }

  @override
  String questionCount(Object count) {
    return '$count pregunta';
  }

  @override
  String get questionAdded => '¡Pregunta añadida!';

  @override
  String get failedToAddQuestion => 'Error al añadir la pregunta';

  @override
  String get editQuestion => 'Editar Pregunta';

  @override
  String get enterYourQuestion => 'Ingresa tu pregunta';

  @override
  String get save => 'Guardar';

  @override
  String get questionUpdated => '¡Pregunta actualizada!';

  @override
  String get failedToUpdateQuestion => 'Error al actualizar la pregunta';

  @override
  String get deleteQuestion => 'Eliminar Pregunta';

  @override
  String get deleteQuestionConfirm =>
      '¿Estás seguro de que quieres eliminar esta pregunta?';

  @override
  String get questionDeleted => 'Pregunta eliminada';

  @override
  String get failedToDeleteQuestion => 'Error al eliminar la pregunta';

  @override
  String get addQuestion => 'Agregar Pregunta';

  @override
  String get typeQuestionHere => 'Escribe tu pregunta aquí...';

  @override
  String get add => 'Agregar';

  @override
  String get noQuestionsYet => 'Aún no hay preguntas';

  @override
  String get addFirstQuestion => '¡Agrega tu primera pregunta!';

  @override
  String get deckDescLoveTalks =>
      'Explora el romance, la química y la conexión a través de preguntas sinceras que celebran tu relación. Desde \"cómo nos conocimos\" hasta lo que te hace sentir más amado, estas cartas profundizan la intimidad emocional.';

  @override
  String get deckDescDeepTalks =>
      'Estas cartas profundizan en valores, vulnerabilidad y lo que significa crecer juntos. Ayudan a las parejas a reflexionar sobre independencia, comunicación y propósito compartido.';

  @override
  String get deckDescSpicyTalks =>
      'Atrevidas, audaces e íntimas: estas cartas invitan a las parejas a explorar el deseo, las fantasías y la pasión juntos. Cada pregunta está diseñada para provocar conversaciones sinceras y emocionantes que los acerquen más.';

  @override
  String get deckDescDoYouDareTalks =>
      'Un mazo valiente que combina honestidad emocional con temas delicados como confianza, religión, dinero y límites personales — todo diseñado para revelar lo que realmente importa. *Nota:* Algunas preguntas son crudas y sin filtros — jueguen con apertura, empatía y respeto.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspirado en los cinco lenguajes del amor, este mazo ayuda a las parejas a expresar afecto de formas que realmente resuenan. Descubre cómo las palabras, acciones y gestos fortalecen tu conexión.';

  @override
  String get deckDescSillyTalks =>
      '¡Diversión pura y risas! Estas preguntas ligeras y divertidas revelan tus hábitos más raros y pensamientos más graciosos. Perfectas para amigos, familia o parejas que no se toman la vida demasiado en serio.';

  @override
  String get deckDescCarTalks =>
      'Perfectas para viajes en carretera: estas cartas transforman el tiempo de conducción en grandes conversaciones. Espera preguntas divertidas, creativas y nostálgicas sobre viajes, aventuras y peculiaridades.';

  @override
  String get deckDescCozyTalks =>
      'Conversaciones cálidas y relajadas perfectas para noches acogedoras. Estas preguntas crean momentos cómodos y sinceros de conexión.';

  @override
  String get deckDescPartyNight =>
      'Preguntas de alta energía diseñadas para ambientes grupales divertidos. Perfectas para fiestas y reuniones sociales con amigos.';

  @override
  String get deckDescUnpopularOpinions =>
      'El mazo que te desafía a decir lo que todos piensan pero nadie admite. Desde la cultura de influencers hasta las normas sociales — estas cartas provocan debates honestos y perspectivas sorprendentes. Perfectas para amigos con opiniones.';

  @override
  String get deckDescPlotTwists =>
      'Este mazo te lanza directamente a los momentos más divertidos y difíciles de \"¿qué harías?\". Pensamiento rápido, instintos y risas garantizadas. Perfecto para noches de grupo llenas de sorpresas y risas.';

  @override
  String get deckDescAfterDark =>
      'Adéntrate en el lado oscuro de la conversación con preguntas que te ponen los pelos de punta. Desde coincidencias escalofriantes hasta escenarios de supervivencia — perfectas para noches tardías con emoción.';

  @override
  String get deckDescHistoryTalks =>
      'Una mezcla nostálgica de recuerdos personales y momentos familiares. Estas preguntas inspiran historias, risas y redescubrir tus raíces. Perfectas para reuniones familiares o noches acogedoras.';

  @override
  String get deckDescTinyTalks =>
      '¡Diseñadas para padres e hijos pequeños! Estas preguntas simples y juguetonas ayudan a los niños a expresarse mientras los padres aprenden cómo piensan. Perfectas para edades de 3 a 9 años.';

  @override
  String get deckDescGoodOldDays =>
      'Viaja en el tiempo con preguntas sobre recuerdos queridos, experiencias pasadas y cómo solían ser las cosas. Perfectas para todas las edades.';

  @override
  String get deckDescWouldYouRather =>
      'Preguntas clásicas de dilemas que provocan debates y revelan preferencias. Elige entre dos opciones y descubre qué es lo más importante.';

  @override
  String get createNewDeck => 'Crear Nuevo Mazo';

  @override
  String get sessionPin => 'PIN de Sesión';

  @override
  String get joinSession => 'Unirse a Sesión';

  @override
  String get questionSubmitted => 'Pregunta Enviada';

  @override
  String get sessionCancelled => 'Sesión Cancelada';

  @override
  String get yourQuestion => 'Tu Pregunta';

  @override
  String get reactionBreakdown => 'Desglose de Reacciones';

  @override
  String get deckNameHint => 'Nombre del mazo';

  @override
  String get deckCreatedSuccess => '¡Mazo creado!';

  @override
  String get cancelSession => '¿Cancelar Sesión?';

  @override
  String get cancelSessionConfirm =>
      'Esto cancelará la sesión para todos los jugadores. ¿Estás seguro?';

  @override
  String get no => 'No';

  @override
  String get yesCancel => 'Sí, Cancelar';

  @override
  String get hostQuestionCollection => 'Anfitrión - Recolección de Preguntas';

  @override
  String get questionCollection => 'Recolección de Preguntas';

  @override
  String get endSessionButton => 'Finalizar Sesión';

  @override
  String get noActiveSubscription => 'Sin Suscripción Activa';

  @override
  String get premium => 'Premium';

  @override
  String notEnoughQuestions(Object count) {
    return 'Not enough questions. Minimum 5 required. (Currently: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Característica Premium';

  @override
  String get questionNavigationPremium =>
      'La navegación de preguntas es una característica premium. ¡Suscríbete para desbloquear la capacidad de saltar a cualquier pregunta!';

  @override
  String get customDecks => 'Mazos Personalizados';

  @override
  String get noDecksYetMessage => 'Aún no hay mazos';

  @override
  String get createFirstDeckMessage => 'Toca + para crear tu primer mazo';

  @override
  String get signInRequired => 'Inicio de Sesión Requerido';

  @override
  String get signInToUsePersonal =>
      'Por favor, inicia sesión para usar el modo Personal y crear mazos de preguntas personalizados.';

  @override
  String get collaborativeQuestionGame => 'Juego Colaborativo de Preguntas';

  @override
  String get hostPandoraSession => 'Alojar Sesión de Pandora';

  @override
  String get joinPandoraGame => 'Unirse a un Juego';

  @override
  String get yourDisplayName => 'Tu Nombre de Usuario';

  @override
  String get enterYourName => 'Ingresa tu nombre';

  @override
  String get selectQuestion => 'Seleccionar Pregunta';

  @override
  String get joinTime => 'Tiempo para Unirse';

  @override
  String get participants => 'Participantes';

  @override
  String get loading => 'Cargando...';

  @override
  String needAtLeastPlayers(int current) {
    return 'Se necesitan al menos 2 jugadores ($current/2)';
  }

  @override
  String get continueToTimerSetup =>
      'Continuar a Configuración del Temporizador';
}
