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
  String get locked => 'Categoría Bloqueada';

  @override
  String get lockedMessage =>
      '¡Esta categoría está bloqueada! ¡Actualiza a premium para desbloquear todas las categorías!';

  @override
  String get previewAvailable => 'Preview: First 5 questions available';

  @override
  String get upgradeNow => 'Upgrade Now';

  @override
  String get ok => 'Está bien';

  @override
  String get mayBeLater => 'Quizás más tarde';

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
  String get subscribe => 'Suscribirse';

  @override
  String get cancel => 'Cancelar';

  @override
  String subscriptionActivated(Object bundles) {
    return '¡Suscripción activada! $bundles desbloqueados.';
  }

  @override
  String get premiumActivated =>
      '¡Premium activado! Anuncios eliminados. Paquete desbloqueado.';

  @override
  String get demoNote =>
      'Demo: Los desbloqueos se restablecerán al reiniciar la app';

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
  String get swipeOrTap => 'Desliza o toca las flechas';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Siguiente';

  @override
  String get advertisement => 'Publicidad';

  @override
  String get watchAdMessage =>
      'Mira un anuncio corto para continuar, o disfruta sin anuncios con premium.';

  @override
  String get watchAd => 'Ver anuncio';

  @override
  String get goAdFree => 'Ir sin anuncios - 59 DKK/mes';

  @override
  String get removeAdsForever => 'Eliminar anuncios para siempre';

  @override
  String get adNotReady => 'Anuncio no disponible. Continuando sin anuncio.';

  @override
  String get adLoadingContinue => 'Cargando anuncios... Continuar';

  @override
  String get pricePerMonth => '59 DKK/mes';

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
  String get signOut => 'Cerrar sesión';

  @override
  String get notSignedIn => 'No has iniciado sesión';

  @override
  String get signInSignUp => 'Iniciar sesión / Registrarse';

  @override
  String get signInToSync =>
      'Inicia sesión para sincronizar tus suscripciones en todos los dispositivos y desbloquear contenido premium';

  @override
  String get signOutConfirm => '¿Estás seguro de que quieres cerrar sesión?';

  @override
  String get signedOutSuccess => 'Has cerrado sesión exitosamente';

  @override
  String get accountInformation => 'Información de la cuenta';

  @override
  String get email => 'Correo electrónico';

  @override
  String get memberSince => 'Miembro desde';

  @override
  String get notAvailable => 'No disponible';

  @override
  String get unknown => 'Desconocido';

  @override
  String get subscriptionStatus => 'Subscription Status';

  @override
  String get premiumMember => 'Miembro Premium';

  @override
  String get freeAccount => 'Cuenta gratuita';

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
  String get welcomeBack => '¡Bienvenido de nuevo!';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get displayName => 'Nombre para mostrar';

  @override
  String get password => 'Contraseña';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get signUp => 'Registrarse';

  @override
  String get dontHaveAccount => '¿No tienes una cuenta? Regístrate';

  @override
  String get alreadyHaveAccount => '¿Ya tienes una cuenta? Inicia sesión';

  @override
  String get chooseYourMode => '1. Elige tu modo';

  @override
  String get chooseYourModeDesc =>
      'Selecciona entre tres estilos de conversación:';

  @override
  String get pickCategory => '2. Elige una categoría';

  @override
  String get pickCategoryDesc =>
      'Cada modo tiene múltiples categorías con paquetes de preguntas únicos. Las categorías gratuitas están desbloqueadas, mientras que las categorías premium requieren una suscripción.';

  @override
  String get startTalking => '3. Comienza a hablar';

  @override
  String get startTalkingDesc =>
      'Las preguntas aparecen en pantalla completa. Tómense turnos para leer y responderlas honestamente. No hay respuestas incorrectas - ¡el objetivo es una conversación significativa!';

  @override
  String get navigateQuestions => '4. Navega por las preguntas';

  @override
  String get navigateQuestionsDesc =>
      '• Desliza a la derecha o toca \"Siguiente\" para la siguiente pregunta';

  @override
  String get premiumFeatures => '5. Características Premium';

  @override
  String get premiumFeaturesDesc =>
      'Desbloquea categorías de preguntas exclusivas con una suscripción:';

  @override
  String get proTips => 'Consejos Profesionales';

  @override
  String get proTipsDesc => '• Crea un ambiente cómodo y sin distracciones';

  @override
  String get personal => 'Personal';

  @override
  String get personalDesc =>
      'Crea tus propios mazos de preguntas personalizadas';

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
  String get pandoraPlayersJoinMax => 'Los jugadores se unen (máx. 15 min)';

  @override
  String get pandoraHostSetsTimer =>
      'El anfitrión establece el temporizador de preguntas (1-15 min)';

  @override
  String get pandoraEveryoneSubmits => 'Todos envían preguntas';

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
  String get everyoneSubmitsMin5 => 'Todos envían preguntas (mínimo 5)';

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
  String get endSession => '¿Finalizar sesión?';

  @override
  String get endSessionConfirm =>
      '¿Estás seguro de que quieres finalizar esta sesión de Pandora?';

  @override
  String get createCustomDeck => 'Create Custom Deck';

  @override
  String get deckName => 'Nombre del Mazo';

  @override
  String get enterDeckName => 'Ingresa el nombre del mazo';

  @override
  String get create => 'Crear';

  @override
  String get deckCreated => 'Deck created!';

  @override
  String get failedToCreateDeck => 'Error al crear el mazo';

  @override
  String get deleteDeck => 'Eliminar Mazo';

  @override
  String deleteDeckConfirm(Object name) {
    return '¿Estás seguro de que quieres eliminar \"$name\"? Esto eliminará todas las preguntas en este mazo.';
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
  String get deleteQuestion => 'Eliminar pregunta';

  @override
  String get deleteQuestionConfirm =>
      '¿Estás seguro de que quieres eliminar esta pregunta?';

  @override
  String get questionDeleted => 'Pregunta eliminada';

  @override
  String get failedToDeleteQuestion => 'Error al eliminar la pregunta';

  @override
  String get addQuestion => 'Agregar pregunta';

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
      'Un mazo valiente que combina honestidad emocional con temas delicados como confianza, religión, dinero y límites, para revelar lo que realmente importa. *Aviso:* Algunas preguntas son crudas — jueguen con apertura, empatía y respeto.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspirado en los cinco lenguajes del amor, este mazo ayuda a las parejas a expresar cariño de formas que realmente resuenen. Descubre cómo las palabras, acciones y gestos fortalecen la conexión.';

  @override
  String get deckDescSillyTalks =>
      '¡Diversión pura y risas! Estas preguntas ligeras y divertidas revelan tus hábitos más raros y pensamientos más graciosos. Perfectas para amigos, familia o parejas que no se toman la vida demasiado en serio.';

  @override
  String get deckDescCarTalks =>
      'Perfectas para viajes en carretera: estas cartas transforman el tiempo de conducción en grandes conversaciones. Espera preguntas divertidas, creativas y nostálgicas sobre viajes, aventuras y peculiaridades.';

  @override
  String get deckDescCozyTalks =>
      'Preguntas cálidas y acogedoras que te hacen sentir en casa. Despiertan charlas reconfortantes sobre pequeñas alegrías, recuerdos y sonrisas.';

  @override
  String get deckDescPartyNight =>
      'Tu baraja ideal para noches divertidas con amigos. Estas preguntas animadas provocan risas, historias y debates juguetones — desde fracasos en fiestas hasta quién es el más coqueto del grupo. Perfectas para mantener la diversión.';

  @override
  String get deckDescUnpopularOpinions =>
      'La baraja que te anima a decir lo que todos piensan pero nadie admite. Desde la fama de influencers hasta las normas sociales — estas cartas provocan debates sinceros y puntos de vista sorprendentes. Perfecta para amigos con carácter.';

  @override
  String get deckDescPlotTwists =>
      'Esta baraja te mete de lleno en los momentos más divertidos y complicados de la vida: \"¿Qué harías si…?\". Ideal para noches de grupo llenas de risas, sorpresas y reacciones inesperadas.';

  @override
  String get deckDescAfterDark =>
      'Entra en el lado oscuro de la conversación con preguntas que te pondrán los pelos de punta. Ideal para noches de miedo y escalofríos.';

  @override
  String get deckDescHistoryTalks =>
      'Una mezcla nostálgica de recuerdos personales y momentos familiares. Estas preguntas inspiran historias, risas y redescubrimiento de tus raíces.';

  @override
  String get deckDescTinyTalks =>
      'Hecho para padres y sus pequeños. Estas preguntas divertidas ayudan a los niños a expresarse y a los padres a comprender cómo piensan. Ideal para 3 a 9 años.';

  @override
  String get deckDescGoodOldDays =>
      'Un viaje nostálgico al pasado, desde recuerdos de infancia hasta cómo ha cambiado la vida. Perfecto para abuelos que quieran compartir sus recuerdos.';

  @override
  String get deckDescWouldYouRather =>
      'Una versión familiar del clásico juego \"¿Qué preferirías...?\". Llena de opciones divertidas e imaginativas que hacen pensar y reír.';

  @override
  String get createNewDeck => 'Crear Nuevo Mazo';

  @override
  String get sessionPin => 'PIN de sesión';

  @override
  String get joinSession => 'Unirse a la sesión';

  @override
  String get questionSubmitted => '¡Pregunta enviada!';

  @override
  String get sessionCancelled => 'Sesión cancelada';

  @override
  String get yourQuestion => 'Tu Pregunta';

  @override
  String get reactionBreakdown => 'Desglose de Reacciones';
}
