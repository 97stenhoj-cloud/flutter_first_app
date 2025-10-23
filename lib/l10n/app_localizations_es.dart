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
  String get settings => 'Configuración';

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
      'Esta categoría está bloqueada. ¡Actualiza a premium para desbloquear todas las categorías!';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Quizás Después';

  @override
  String get chooseSubscription => 'Elige tu Suscripción';

  @override
  String get subscriptionDescription =>
      'Desbloquea categorías premium y obtén acceso a paquetes exclusivos de preguntas';

  @override
  String get chooseBundleOne => 'Elige 1 paquete de categorías';

  @override
  String get chooseBundleTwo => 'Elige 2 paquetes de categorías';

  @override
  String get chooseBundleThree => 'Los 3 paquetes';

  @override
  String get perMonth => '/mes';

  @override
  String get bestValue => 'MEJOR VALOR';

  @override
  String get unlockAllBundles => 'Desbloquear Todos los Paquetes';

  @override
  String get selectYourBundle => 'Selecciona tu Paquete';

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
    return '¡Suscripción activada! $bundles desbloqueado.';
  }

  @override
  String get demoNote =>
      'Demo: Los desbloqueos se restablecerán al reiniciar la aplicación';

  @override
  String get swipeOrTap => 'Desliza o toca las flechas';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Siguiente';

  @override
  String get advertisement => 'Anuncio';

  @override
  String get watchAdMessage =>
      '¡Mira un anuncio corto para continuar, o disfruta sin anuncios con premium!';

  @override
  String get watchAd => 'Ver Anuncio';

  @override
  String get goAdFree => 'Sin Anuncios - 59 DKK/mes';

  @override
  String get removeAdsForever => 'Eliminar Anuncios para Siempre';

  @override
  String get chooseOneBundle =>
      'Elige 1 paquete para desbloquear y eliminar todos los anuncios';

  @override
  String get noAdsForever => 'Sin Anuncios para Siempre';

  @override
  String premiumActivated(Object bundle) {
    return '¡Premium activado! Anuncios eliminados. Paquete $bundle desbloqueado.';
  }

  @override
  String get adNotReady => 'Anuncio no está listo. Continuando sin anuncio.';

  @override
  String get adLoadingContinue => 'Anuncio Cargando... Continuar';

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
  String get signOut => 'Cerrar Sesión';

  @override
  String get notSignedIn => 'No Has Iniciado Sesión';

  @override
  String get signInSignUp => 'Iniciar Sesión / Registrarse';

  @override
  String get signInToSync =>
      'Inicia sesión para sincronizar tus suscripciones en todos los dispositivos y desbloquear contenido premium';

  @override
  String get signOutConfirm => '¿Estás seguro de que quieres cerrar sesión?';

  @override
  String get signedOutSuccess => 'Sesión cerrada con éxito';

  @override
  String get accountInformation => 'Información de la Cuenta';

  @override
  String get email => 'Correo Electrónico';

  @override
  String get memberSince => 'Miembro desde';

  @override
  String get notAvailable => 'No disponible';

  @override
  String get unknown => 'Desconocido';

  @override
  String get activeSubscriptions => 'Suscripciones Activas';

  @override
  String bundlesUnlocked(Object count, Object plural) {
    return '$count Paquete$plural Desbloqueado';
  }

  @override
  String bundle(Object name) {
    return 'Paquete $name';
  }

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
  String get skipForNow => 'Omitir por ahora';

  @override
  String get byContining =>
      'Al continuar, aceptas nuestros Términos de Servicio y Política de Privacidad';

  @override
  String get googleSignInFailed =>
      'Error al iniciar sesión con Google. Por favor, inténtalo de nuevo.';

  @override
  String get appleSignInFailed =>
      'Error al iniciar sesión con Apple. Por favor, inténtalo de nuevo.';

  @override
  String get noCategoriesFound => 'No se encontraron categorías';

  @override
  String selectBundlePlural(Object plural) {
    return 'Selecciona el/los paquete$plural de categorías que deseas desbloquear';
  }

  @override
  String get getAccessAllBundles =>
      '¡Obtén acceso a todas las categorías premium en los 3 paquetes!';

  @override
  String subscriptionActivatedFull(Object bundles) {
    return '¡Suscripción activada! $bundles desbloqueado.';
  }

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
  String get dontHaveAccount => '¿No tienes cuenta? Regístrate';

  @override
  String get alreadyHaveAccount => '¿Ya tienes cuenta? Inicia Sesión';

  @override
  String get chooseYourMode => '1. Elige tu Modo';

  @override
  String get chooseYourModeDesc =>
      'Selecciona entre tres estilos de conversación:\n\n• Familia - Conversaciones cálidas y acogedoras perfectas para todas las edades\n• Pareja - Preguntas íntimas y románticas para profundizar vuestra conexión\n• Amigos - Temas divertidos y entretenidos para tu grupo';

  @override
  String get pickCategory => '2. Elige una Categoría';

  @override
  String get pickCategoryDesc =>
      'Cada modo tiene múltiples categorías con paquetes únicos de preguntas. Las categorías gratuitas están desbloqueadas, mientras que las categorías premium requieren una suscripción.';

  @override
  String get startTalking => '3. Comienza a Hablar';

  @override
  String get startTalkingDesc =>
      'Las preguntas aparecen en pantalla completa. Túrnense para leer y responder honestamente. No hay respuestas incorrectas - ¡el objetivo es una conversación significativa!';

  @override
  String get navigateQuestions => '4. Navega por las Preguntas';

  @override
  String get navigateQuestionsDesc =>
      '• Desliza a la derecha o toca \"Siguiente\" para la siguiente pregunta\n• Desliza a la izquierda o toca \"Anterior\" para revisitar preguntas\n• Toca el botón de inicio para volver al menú principal en cualquier momento';

  @override
  String get premiumFeatures => '5. Funciones Premium';

  @override
  String get premiumFeaturesDesc =>
      'Desbloquea categorías exclusivas de preguntas con una suscripción:\n\n• 1 Paquete (4 categorías) - 59 DKK/mes\n• 2 Paquetes (8 categorías) - 109 DKK/mes\n• 3 Paquetes (12 categorías) - 149 DKK/mes';

  @override
  String get proTips => 'Consejos Pro';

  @override
  String get proTipsDesc =>
      '• Crea un ambiente cómodo y sin distracciones\n• Escucha activamente y está presente\n• Comparte honestamente y anima a otros a hacer lo mismo\n• Respeta los límites - salta preguntas si es necesario\n• ¡Diviértete y disfruta conectando!';

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
