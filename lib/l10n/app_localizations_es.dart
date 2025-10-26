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
  String get ok => 'Está bien';

  @override
  String get mayBeLater => 'Quizás más tarde';

  @override
  String get chooseSubscription => 'Elige tu suscripción';

  @override
  String get subscriptionDescription =>
      'Desbloquea categorías premium y accede a paquetes de preguntas exclusivos';

  @override
  String get chooseBundleOne => 'Elige 1 paquete de categorías';

  @override
  String get chooseBundleTwo => 'Elige 2 paquetes de categorías';

  @override
  String get chooseBundleThree => 'Los 3 paquetes de categorías';

  @override
  String get perMonth => '/mes';

  @override
  String get bestValue => 'MEJOR VALOR';

  @override
  String get unlockAllBundles => 'Desbloquear Todos los Paquetes';

  @override
  String get selectYourBundle => 'Selecciona Tu Paquete';

  @override
  String selectBundles(Object count, Object plural) {
    return 'Selecciona $count Paquete$plural';
  }

  @override
  String get premiumCategories => '4 categorías premium';

  @override
  String get cancel => 'Cancelar';

  @override
  String get subscribe => 'Suscribirse';

  @override
  String subscriptionActivated(Object bundles) {
    return '¡Suscripción activada! $bundles desbloqueados.';
  }

  @override
  String get demoNote =>
      'Demo: Los desbloqueos se restablecerán al reiniciar la app';

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
  String get chooseOneBundle =>
      'Elige 1 paquete para desbloquear y eliminar todos los anuncios';

  @override
  String get noAdsForever => 'Sin anuncios para siempre';

  @override
  String premiumActivated(Object bundle) {
    return '¡Premium activado! Anuncios eliminados. Paquete $bundle desbloqueado.';
  }

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
  String get activeSubscriptions => 'Suscripciones activas';

  @override
  String bundlesUnlocked(Object count, Object plural) {
    return '$count Paquete$plural desbloqueado';
  }

  @override
  String bundle(Object name) {
    return 'Paquete de $name';
  }

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
  String selectBundlePlural(Object plural) {
    return 'Selecciona el paquete de categorías$plural que deseas desbloquear';
  }

  @override
  String get getAccessAllBundles =>
      '¡Obtén acceso a todas las categorías premium en los 3 paquetes!';

  @override
  String subscriptionActivatedFull(Object bundles) {
    return '¡Suscripción activada! $bundles desbloqueados.';
  }

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
  String get coupleBundle => 'Paquete de Parejas';

  @override
  String get friendsBundle => 'Paquete de Amigos';

  @override
  String get familyBundle => 'Paquete Familiar';

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
  String get end => 'Finalizar';

  @override
  String get sessionPin => 'PIN de sesión';

  @override
  String get sharePin => 'Comparte este PIN con los jugadores';

  @override
  String get waitingForPlayers => 'Esperando a los jugadores...';

  @override
  String get startGame => 'Iniciar juego';

  @override
  String get lobby => 'Sala de espera';

  @override
  String get hostLabel => '(Anfitrión)';

  @override
  String get selectTimer => 'Seleccionar Temporizador';

  @override
  String get timerQuestion =>
      '¿Cuánto tiempo deberían tener los jugadores para enviar preguntas?';

  @override
  String get minutes => 'minutos';

  @override
  String get startCollectingQuestions => 'Comenzar a Recoger Preguntas';

  @override
  String get sessionCancelled => 'Sesión cancelada';

  @override
  String get questionCannotBeEmpty => 'La pregunta no puede estar vacía';

  @override
  String get questionSubmitted => '¡Pregunta enviada!';

  @override
  String get failedToSubmit => 'Error al enviar la pregunta';

  @override
  String notEnoughQuestions(Object count) {
    return 'No hay suficientes preguntas. Se requieren un mínimo de 5. (Actualmente: $count)';
  }

  @override
  String get submitQuestions => 'Enviar Preguntas';

  @override
  String get submitMinimum5 =>
      'Envía al menos 5 preguntas para comenzar el juego';

  @override
  String get yourQuestion => 'Tu Pregunta';

  @override
  String get enterQuestionHere => 'Escribe tu pregunta aquí...';

  @override
  String get forEveryone => 'Para Todos';

  @override
  String get forSpecificPerson => 'Para Persona Específica';

  @override
  String get submit => 'Enviar';

  @override
  String questionsRemaining(Object count) {
    return '$count preguntas restantes';
  }

  @override
  String questionRemaining(Object count) {
    return '$count pregunta restante';
  }

  @override
  String get startGameExclamation => '¡Comenzar Juego!';

  @override
  String get cancelSession => 'Cancelar Sesión';

  @override
  String get timeRemaining => 'Tiempo restante';

  @override
  String get pleaseEnterPin => 'Por favor, ingresa un PIN';

  @override
  String get sessionNotFound => 'Sesión no encontrada';

  @override
  String get sessionEnded => 'La sesión ha terminado';

  @override
  String get sessionStarted => 'La sesión ya ha comenzado';

  @override
  String get failedToJoin => 'Error al unirse a la sesión';

  @override
  String get joinSession => 'Unirse a la sesión';

  @override
  String get joining => 'Uniéndote...';

  @override
  String get enterPin => 'Ingresa un PIN de 6 dígitos';

  @override
  String get join => 'Unirse';

  @override
  String get reactionBreakdown => 'Desglose de Reacciones';

  @override
  String get laugh => 'Risa';

  @override
  String get shock => 'Sorpresa';

  @override
  String get heart => 'Corazón';

  @override
  String get fire => 'Fuego';

  @override
  String get mostLaughs => 'Más Risas';

  @override
  String get mostShocked => 'Más Sorprendido';

  @override
  String get mostHearts => 'Más Corazones';

  @override
  String get sessionComplete => '¡Sesión Completa!';

  @override
  String get thanksForPlayingPandora => '¡Gracias por jugar Pandora Box!';

  @override
  String get returnToMenu => 'Regresar al Menú';

  @override
  String get failedToCreateDeck => 'Error al crear el mazo';

  @override
  String get createNewDeck => 'Crear Nuevo Mazo';

  @override
  String get deckName => 'Nombre del Mazo';

  @override
  String get enterDeckName => 'Ingresa el nombre del mazo';

  @override
  String get create => 'Crear';

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
}
