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
  String get start => 'Iniciar';

  @override
  String get settings => 'Configuración';

  @override
  String get howToPlay => 'Cómo jugar';

  @override
  String get chooseGameMode => 'Elige tu modo de juego';

  @override
  String get family => 'Familia';

  @override
  String get couple => 'Pareja';

  @override
  String get friends => 'Amigos';

  @override
  String get chooseCategory => 'Elige una categoría';

  @override
  String get locked => 'Categoría Premium';

  @override
  String get lockedMessage =>
      'Esta es una categoría premium. Mejora a Premium para desbloquear todas las categorías y quitar los anuncios.';

  @override
  String get previewAvailable =>
      'Vista previa: primeras 5 preguntas disponibles';

  @override
  String get upgradeNow => 'Mejorar ahora';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Quizás después';

  @override
  String get getPremium => 'Obtener Premium';

  @override
  String get premiumTitle => 'Desbloquea todo';

  @override
  String get premiumDescription =>
      'Obtén acceso ilimitado a todas las categorías en todos los modos, elimina anuncios y disfruta de sesiones ilimitadas de Pandora.';

  @override
  String get premiumPriceMonthly => '€6,99/mes';

  @override
  String get premiumPriceYearly => '€59,99/año';

  @override
  String get saveWithYearly => 'Ahorra €23,89 con el plan anual.';

  @override
  String get monthly => 'Mensual';

  @override
  String get yearly => 'Anual';

  @override
  String get billedMonthly => 'Facturación mensual';

  @override
  String get billedYearly => 'Facturación anual';

  @override
  String get premiumFeature1 => '✓ Las 21 categorías premium desbloqueadas';

  @override
  String get premiumFeature2 => '✓ Sin anuncios para siempre';

  @override
  String get premiumFeature3 => '✓ 75 preguntas en todas las categorías';

  @override
  String get premiumFeature4 => '✓ Pandora: jugadores y preguntas ilimitados';

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
      '¡Premium activado! Todas las categorías están desbloqueadas.';

  @override
  String get premiumActivated => '¡Premium activado!';

  @override
  String get demoNote =>
      'Demo: la suscripción se reiniciará al reiniciar la app';

  @override
  String get freeTier => 'Versión gratuita';

  @override
  String get freeTierDesc =>
      '3 categorías por modo (30 preguntas cada una)\nVista previa de 5 preguntas de categorías premium\nAnuncios cada 7 preguntas';

  @override
  String get currentPlan => 'Plan actual';

  @override
  String get limitReached => 'Límite alcanzado';

  @override
  String get freeCategoryLimit =>
      'Has alcanzado el límite de 30 preguntas en categorías gratuitas. Mejora a Premium para obtener acceso ilimitado.';

  @override
  String get previewLimit =>
      'Ya has visto las 5 preguntas de vista previa. Mejora a Premium para continuar.';

  @override
  String get pandoraFreeLimit => 'Límite gratuito';

  @override
  String get pandoraFreeLimitMessage =>
      'Los anfitriones gratuitos pueden tener máximo 6 jugadores y 12 preguntas. Mejora a Premium para hacerlo ilimitado.';

  @override
  String get pandoraUpgradeMessage =>
      'Has llegado a 12 preguntas. Mejora a Premium para seguir jugando.';

  @override
  String get pandoraMaxPlayers =>
      'Se ha alcanzado el máximo de 6 jugadores (límite gratuito). Mejora a Premium para tener jugadores ilimitados.';

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
      'Mira un anuncio corto para continuar, o juega sin anuncios con Premium.';

  @override
  String get watchAd => 'Ver anuncio';

  @override
  String get goAdFree => 'Jugar sin anuncios con Premium';

  @override
  String get removeAdsForever => 'Quitar anuncios para siempre';

  @override
  String get adNotReady => 'El anuncio no está listo. Continuando sin anuncio.';

  @override
  String get adLoadingContinue => 'Cargando anuncio... Continuar';

  @override
  String get pricePerMonth => '€6,99/mes o €59,99/año';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'No se encontraron preguntas para $category en el modo $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Error al cargar las preguntas. Verifica tu conexión.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Error al cargar las preguntas: $error';
  }

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
      'Inicia sesión para sincronizar tu suscripción entre dispositivos y desbloquear contenido premium';

  @override
  String get signOutConfirm => '¿Seguro que quieres cerrar sesión?';

  @override
  String get signedOutSuccess => 'Sesión cerrada correctamente';

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
  String get subscriptionStatus => 'Estado de la suscripción';

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
      'Al continuar, aceptas nuestros Términos de servicio y Política de privacidad';

  @override
  String get googleSignInFailed =>
      'Error al iniciar sesión con Google. Inténtalo de nuevo.';

  @override
  String get appleSignInFailed =>
      'Error al iniciar sesión con Apple. Inténtalo de nuevo.';

  @override
  String get noCategoriesFound => 'No se encontraron categorías';

  @override
  String get welcomeBack => '¡Bienvenido de nuevo!';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get displayName => 'Nombre visible';

  @override
  String get password => 'Contraseña';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get signUp => 'Registrarse';

  @override
  String get dontHaveAccount => '¿No tienes cuenta? Regístrate';

  @override
  String get alreadyHaveAccount => '¿Ya tienes cuenta? Inicia sesión';

  @override
  String get chooseYourMode => '1. Elige tu modo';

  @override
  String get chooseYourModeDesc =>
      'Elige entre cinco experiencias de conversación únicas:\n\n• Pareja: preguntas íntimas para profundizar vuestra relación\n• Amigos: temas divertidos y dinámicos, perfectos para tu grupo\n• Familia: conversaciones cálidas y sanas para todas las edades\n• Personal: crea tus propios mazos de preguntas personalizados (Premium)\n• Pandora: juego multijugador colaborativo con preguntas en tiempo real';

  @override
  String get pickCategory => '2. Elige una categoría';

  @override
  String get pickCategoryDesc =>
      'Cada modo ofrece varias categorías con paquetes de preguntas seleccionadas:\n\n• Gratis: 3 categorías por modo (30 preguntas cada una)\n• Vista previa Premium: primeras 5 preguntas de las categorías premium\n• Premium: más de 24 categorías (75 preguntas cada una)\n• Personal: crea mazos personalizados ilimitados con tus propias preguntas';

  @override
  String get startTalking => '3. Empieza a jugar';

  @override
  String get startTalkingDesc =>
      'Las preguntas aparecen en pantalla completa para favorecer conversaciones profundas. Turnaos para leer y responder con honestidad: no hay respuestas incorrectas. El objetivo es conectar y divertirse.\n\nEn el modo Pandora: todos los jugadores envían preguntas de forma anónima y luego todos responden juntos en tiempo real.';

  @override
  String get navigateQuestions => '4. Navega entre las preguntas';

  @override
  String get navigateQuestionsDesc =>
      '• Desliza en cualquier dirección o toca las flechas para cambiar de pregunta\n• Toca el icono de corazón ❤️ para guardar tus favoritas\n• Premium: toca el icono de lista (arriba a la derecha) para saltar a cualquier pregunta\n• Toca el botón de inicio para volver al menú principal en cualquier momento';

  @override
  String get premiumFeatures => '5. Funciones Premium';

  @override
  String get premiumFeaturesDesc =>
      'Desbloquea toda la experiencia de Connect:\n\n• Mensual: €6,99/mes\n• Anual: €59,99/año (¡ahorra un 29 %!)\n\n✓ Todas las 24+ categorías premium en todos los modos\n✓ 75 preguntas por categoría (vs 30 en gratis)\n✓ Sin anuncios para siempre\n✓ Pandora: jugadores y preguntas ilimitados\n✓ Personal: crea mazos personalizados ilimitados\n✓ Navegación por preguntas: salta a cualquier pregunta\n✓ Apoya el desarrollo continuo';

  @override
  String get proTips => 'Consejos';

  @override
  String get proTipsDesc =>
      '• Crea un ambiente cómodo y sin distracciones\n• Escucha activamente y está presente\n• Responde con honestidad y anima a los demás a hacer lo mismo\n• Respeta los límites: está bien saltarse preguntas\n• Usa favoritos ❤️ para guardar tus preguntas favoritas\n• Prueba distintos modos según la ocasión\n• Pandora es perfecto para fiestas y reuniones de grupo\n• Disfruta y conéctate de verdad';

  @override
  String get aboutCredits => 'Acerca de / Créditos';

  @override
  String get developedBy => 'Desarrollado por TechyKoala';

  @override
  String get learnMore => 'Conoce más sobre nosotros y nuestras próximas apps';

  @override
  String get visitWebsite => 'Visita techykoala.com';

  @override
  String get madeWithLove => 'Hecho con ❤️ para conversaciones significativas';

  @override
  String get personal => 'Personal';

  @override
  String get personalDesc =>
      'Crea tus propios mazos de preguntas personalizados';

  @override
  String get gameComplete => '¡Partida completada!';

  @override
  String get noMoreQuestions =>
      'Ya has visto todas las preguntas de este mazo.';

  @override
  String get playAgain => 'Jugar de nuevo';

  @override
  String get mainMenu => 'Menú principal';

  @override
  String get thanksForPlaying => '¡Gracias por jugar!';

  @override
  String get hopeYouHadFun => '¡Esperamos que te hayas divertido! 🎉';

  @override
  String get backToMenu => 'Volver al menú';

  @override
  String get leaveGame => '¿Salir de la partida?';

  @override
  String get leaveGameMessage =>
      '¿Seguro que quieres salir? La partida continuará para los demás jugadores.';

  @override
  String get leave => 'Salir';

  @override
  String get noQuestionsAvailable => 'No hay preguntas disponibles';

  @override
  String get showLess => 'Ver menos';

  @override
  String get readMore => 'Ver más';

  @override
  String get tapToPlay => 'Toca para jugar';

  @override
  String get favorites => 'Favoritos';

  @override
  String get pandoraHostCreatePin =>
      'El anfitrión crea la sesión y comparte el PIN';

  @override
  String get pandoraPlayersJoinMax =>
      'Los jugadores se unen (máx. 6 en gratis, ilimitados en Premium)';

  @override
  String get pandoraHostSetsTimer =>
      'El anfitrión establece el temporizador de preguntas (1–15 min)';

  @override
  String get pandoraEveryoneSubmits =>
      'Todos envían preguntas (máx. 12 en gratis)';

  @override
  String get pandoraHostControls =>
      'El anfitrión controla el progreso de la partida';

  @override
  String get pandoraQuestionsDeleted =>
      'Las preguntas se borran después de la partida';

  @override
  String get pandoraHost => 'Anfitrión';

  @override
  String get pandoraJoinGame => 'Unirse a la partida';

  @override
  String get pandoraPandoraBox => 'Caja de Pandora';

  @override
  String get pleaseEnterName => 'Introduce tu nombre';

  @override
  String get hostSuffix => '(Anfitrión)';

  @override
  String get playersJoinWithNames => 'Los jugadores se unen con su nombre';

  @override
  String get everyoneSubmitsMin5 =>
      'Todos envían preguntas (mín. 5, máx. 12 en gratis)';

  @override
  String get createSession => 'Crear sesión';

  @override
  String get creating => 'Creando...';

  @override
  String get yourName => 'Tu nombre';

  @override
  String get enterDisplayName => 'Introduce tu nombre visible';

  @override
  String get howItWorks => 'Cómo funciona';

  @override
  String get pinCopied => '¡PIN copiado al portapapeles!';

  @override
  String get endSession => '¿Terminar sesión?';

  @override
  String get endSessionConfirm =>
      '¿Seguro que quieres terminar esta sesión de Pandora?';

  @override
  String get createCustomDeck => 'Crear mazo personalizado';

  @override
  String get deckName => 'Nombre del mazo';

  @override
  String get enterDeckName => 'Introduce el nombre del mazo';

  @override
  String get create => 'Crear';

  @override
  String get deckCreated => '¡Mazo creado!';

  @override
  String get failedToCreateDeck => 'No se pudo crear el mazo';

  @override
  String get deleteDeck => '¿Eliminar mazo?';

  @override
  String deleteDeckConfirm(Object deckName) {
    return '¿Seguro que quieres eliminar \"$deckName\"? Esto eliminará todas las preguntas de este mazo.';
  }

  @override
  String get delete => 'Eliminar';

  @override
  String get deckDeleted => 'Mazo eliminado';

  @override
  String get failedToDeleteDeck => 'No se pudo eliminar el mazo';

  @override
  String get myDecks => 'Mis mazos';

  @override
  String get noDecksYet => 'Todavía no tienes mazos';

  @override
  String get createFirstDeck => 'Crea tu primer mazo personalizado.';

  @override
  String questionsCount(Object count) {
    return '$count preguntas';
  }

  @override
  String questionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count preguntas',
      one: '1 pregunta',
      zero: '0 preguntas',
    );
    return '$_temp0';
  }

  @override
  String get questionAdded => 'Pregunta añadida.';

  @override
  String get failedToAddQuestion => 'No se pudo añadir la pregunta';

  @override
  String get editQuestion => 'Editar pregunta';

  @override
  String get enterYourQuestion => 'Introduce tu pregunta';

  @override
  String get save => 'Guardar';

  @override
  String get questionUpdated => 'Pregunta actualizada.';

  @override
  String get failedToUpdateQuestion => 'No se pudo actualizar la pregunta';

  @override
  String get deleteQuestion => 'Eliminar pregunta';

  @override
  String get deleteQuestionConfirm =>
      '¿Seguro que quieres eliminar esta pregunta?';

  @override
  String get questionDeleted => 'Pregunta eliminada';

  @override
  String get failedToDeleteQuestion => 'No se pudo eliminar la pregunta';

  @override
  String get addQuestion => 'Añadir pregunta';

  @override
  String get typeQuestionHere => 'Escribe tu pregunta aquí...';

  @override
  String get add => 'Añadir';

  @override
  String get noQuestionsYet => 'Todavía no hay preguntas';

  @override
  String get addFirstQuestion => 'Añade tu primera pregunta.';

  @override
  String get deckDescLoveTalks =>
      'Explora el romance, la química y la conexión a través de preguntas profundas que celebran vuestra relación. Desde momentos de \"cómo nos conocimos\" hasta lo que te hace sentir más querido/a, estas cartas profundizan en la intimidad emocional.';

  @override
  String get deckDescDeepTalks =>
      'Estas cartas profundizan en los valores, la vulnerabilidad y lo que significa crecer juntos. Ayudan a la pareja a reflexionar sobre independencia, comunicación y propósito compartido.';

  @override
  String get deckDescSpicyTalks =>
      'Coquetas, atrevidas e íntimas: estas cartas invitan a la pareja a explorar el deseo, las fantasías y la pasión juntos. Cada pregunta está diseñada para encender conversaciones honestas y emocionantes sobre lo que os atrae y os acerca.';

  @override
  String get deckDescDoYouDareTalks =>
      'Un mazo sin miedo que combina honestidad emocional con temas delicados como confianza, religión, dinero y límites personales, diseñado para revelar lo que realmente importa a ambos. *Nota:* algunas preguntas son muy directas — jugad con apertura, empatía y respeto.';

  @override
  String get deckDescLoveLanguagesTalks =>
      'Inspirado en los cinco lenguajes del amor, este mazo ayuda a las parejas a expresar cariño de la manera que más resuena con el otro. Descubre cómo las palabras, las acciones y los gestos pueden fortalecer vuestra conexión.';

  @override
  String get deckDescSillyTalks =>
      'Diversión pura y muchas risas. Estas preguntas ligeras y alocadas sacan a la luz vuestros hábitos más raros y pensamientos más divertidos. Perfecto para amigos, familia o parejas que no se toman la vida demasiado en serio.';

  @override
  String get deckDescCarTalks =>
      'Perfecto para viajes por carretera: estas cartas convierten el tiempo en el coche en buenas conversaciones. Espera preguntas divertidas, creativas y llenas de nostalgia sobre viajes, aventuras y manías.';

  @override
  String get deckDescCozyTalks =>
      'Conversaciones cálidas y relajadas, perfectas para noches acogedoras. Estas preguntas crean momentos de conexión cómoda y sincera.';

  @override
  String get deckDescPartyNight =>
      'Preguntas llenas de energía diseñadas para grupos. Perfectas para fiestas y reuniones con amigos.';

  @override
  String get deckDescUnpopularOpinions =>
      'El mazo que te desafía a decir en voz alta lo que todos piensan pero nadie dice. Desde la cultura de influencers hasta las normas sociales, estas cartas generan debates honestos y opiniones sorprendentes. Ideal para amigos con carácter.';

  @override
  String get deckDescPlotTwists =>
      'Este mazo te lanza directamente a los momentos más divertidos y más difíciles del tipo \"¿qué harías si...?\". Respuestas impulsivas, intuición y muchas risas garantizadas.';

  @override
  String get deckDescAfterDark =>
      'Adéntrate en el lado más oscuro de la conversación con preguntas que ponen la piel de gallina. Desde coincidencias inquietantes hasta escenarios de supervivencia, perfecto para noches tardías con un toque de misterio.';

  @override
  String get deckDescHistoryTalks =>
      'Una mezcla nostálgica de recuerdos personales y momentos en familia. Estas preguntas inspiran historias, risas y redescubrir tus raíces. Perfecto para reuniones familiares o noches tranquilas.';

  @override
  String get deckDescTinyTalks =>
      'Diseñado para padres y peques. Preguntas sencillas y divertidas ayudan a los niños a expresarse, mientras los padres descubren cómo piensan. Perfecto para edades de 3 a 9 años.';

  @override
  String get deckDescGoodOldDays =>
      'Viaja al pasado con preguntas sobre recuerdos especiales, experiencias vividas y cómo eran las cosas antes. Adecuado para todas las edades.';

  @override
  String get deckDescWouldYouRather =>
      'Preguntas clásicas de dilema que generan debate y revelan preferencias. Elige entre dos opciones y descubre qué es más importante para cada uno.';

  @override
  String get createNewDeck => 'Crear nuevo mazo';

  @override
  String get sessionPin => 'PIN de la sesión';

  @override
  String get joinSession => 'Unirse a la sesión';

  @override
  String get questionSubmitted => 'Pregunta enviada';

  @override
  String get sessionCancelled => 'Sesión cancelada';

  @override
  String get yourQuestion => 'Tu pregunta';

  @override
  String get reactionBreakdown => 'Resumen de reacciones';

  @override
  String get deckNameHint => 'Nombre del mazo';

  @override
  String get deckCreatedSuccess => '¡Mazo creado!';

  @override
  String get cancelSession => '¿Cancelar sesión?';

  @override
  String get cancelSessionConfirm =>
      'Esto cancelará la sesión para todos los jugadores. ¿Seguro?';

  @override
  String get no => 'No';

  @override
  String get yesCancel => 'Sí, cancelar';

  @override
  String get hostQuestionCollection => 'Anfitrión - recopilación de preguntas';

  @override
  String get questionCollection => 'Recopilación de preguntas';

  @override
  String get endSessionButton => 'Terminar sesión';

  @override
  String get noActiveSubscription => 'Sin suscripción activa';

  @override
  String get premium => 'PREMIUM';

  @override
  String notEnoughQuestions(Object count) {
    return 'No hay suficientes preguntas. Se requieren al menos 5. (Actualmente: $count)';
  }

  @override
  String get premiumFeatureTitle => 'Función Premium';

  @override
  String get questionNavigationPremium =>
      'La navegación por preguntas es una función Premium. Suscríbete para poder saltar a cualquier pregunta.';

  @override
  String get customDecks => 'Mazos personalizados';

  @override
  String get noDecksYetMessage => 'Aún no tienes mazos';

  @override
  String get createFirstDeckMessage => 'Toca + para crear tu primer mazo';

  @override
  String get signInRequired => 'Es necesario iniciar sesión';

  @override
  String get signInToUsePersonal =>
      'Inicia sesión para usar el modo Personal y crear mazos de preguntas personalizados.';

  @override
  String get collaborativeQuestionGame => 'Juego colaborativo de preguntas';

  @override
  String get hostPandoraSession => 'Ser anfitrión de una sesión Pandora';

  @override
  String get joinPandoraGame => 'Unirse a una partida';

  @override
  String get yourDisplayName => 'Tu nombre visible';

  @override
  String get enterYourName => 'Introduce tu nombre';

  @override
  String get selectQuestion => 'Selecciona una pregunta';

  @override
  String get joinTime => 'Tiempo para unirse';

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
      'Continuar a la configuración del temporizador';

  @override
  String get setQuestionTimer => 'Configurar temporizador de preguntas';

  @override
  String get questionCollectionTime => 'Tiempo para recopilar preguntas';

  @override
  String get minutes => 'minutos';

  @override
  String get sessionWillEnd =>
      'La sesión finalizará automáticamente si no continúas en 5 minutos';

  @override
  String get startQuestionCollection => 'Comenzar recopilación de preguntas';

  @override
  String questionsSubmitted(int count) {
    return '$count preguntas enviadas';
  }

  @override
  String get writeQuestionHere => 'Escribe tu pregunta aquí...';

  @override
  String get whoIsThisFor => '¿Para quién es esta pregunta?';

  @override
  String get everyone => 'Todos';

  @override
  String get specific => 'Alguien en concreto';

  @override
  String get submitQuestion => 'Enviar pregunta';

  @override
  String needMoreQuestions(int count) {
    return 'Faltan $count preguntas más';
  }

  @override
  String get startGame => 'Empezar partida';

  @override
  String get selectPlayer => 'Selecciona un jugador';

  @override
  String get unsubscribe => 'Cancelar suscripción';

  @override
  String get unsubscribeConfirm => '¿Cancelar la suscripción Premium?';

  @override
  String get unsubscribeWarning =>
      'Perderás acceso a todas las funciones Premium, incluidas preguntas ilimitadas, todas las categorías, experiencia sin anuncios y jugadores ilimitados en Pandora. Puedes volver a suscribirte cuando quieras.';

  @override
  String get yesUnsubscribe => 'Sí, cancelar';

  @override
  String get unsubscribeSuccess =>
      'Suscripción cancelada. Las funciones Premium se han desactivado.';

  @override
  String get unsubscribeError => 'Error al cancelar la suscripción';

  @override
  String get questions => 'preguntas';

  @override
  String get preview => 'vista previa';

  @override
  String get userId => 'ID de usuario';

  @override
  String get subscription => 'Suscripción';

  @override
  String get questionsCount75 => '75 preguntas';

  @override
  String get questionsCount30 => '30 preguntas';

  @override
  String get questionsCount5Preview => 'Vista previa de 5 preguntas';

  @override
  String get unlockFullDeck => 'Desbloquear 75 preguntas';

  @override
  String get renameDeck => 'Renombrar mazo';

  @override
  String get deckRenamed => 'Mazo renombrado correctamente';

  @override
  String get failedToRenameDeck => 'No se pudo renombrar el mazo';

  @override
  String get shuffleQuestions => 'Barajar preguntas';

  @override
  String get resetOrder => 'Restablecer orden';

  @override
  String get questionsShuffled => 'Preguntas barajadas.';

  @override
  String get orderReset => 'Orden restablecido al original';

  @override
  String get readyToPlay => 'Listo para jugar';

  @override
  String get longPressReorder =>
      'Mantén pulsado y arrastra para reordenar las preguntas';

  @override
  String get noFavoritesYet => 'Todavía no hay favoritos';

  @override
  String get heartQuestionsDuringGameplay =>
      'Toca el corazón ❤️ en las cartas durante la partida para guardarlas aquí.';

  @override
  String addAtLeastQuestions(Object count) {
    return 'Añade al menos $count preguntas para empezar a jugar.';
  }

  @override
  String get heartQuestionsInfo =>
      'Marca con corazón las preguntas durante la partida para añadirlas a tus favoritos.';

  @override
  String addAtLeastQuestionsToPlay(Object count) {
    return 'Añade al menos $count preguntas para jugar este mazo';
  }

  @override
  String get removeFromFavorites => 'Quitar de favoritos';

  @override
  String get unlockEverything => 'Desbloquear todo';

  @override
  String get premiumSubtitle =>
      'Obtén acceso ilimitado a todas las categorías, elimina los anuncios para siempre y desbloquea funciones Premium';

  @override
  String get save32Percent => 'AHORRA UN 29 %';

  @override
  String get priceMonthly => '€6,99/mes';

  @override
  String get priceYearly => '€59,99/año';

  @override
  String get billedAnnually => 'Facturación anual';

  @override
  String get equivalentMonthly => 'Equivalente a solo €5/mes';

  @override
  String get feature24Categories =>
      'Más de 24 categorías premium desbloqueadas en todos los modos';

  @override
  String get feature75Questions =>
      '75 preguntas por categoría (vs 30 en la versión gratuita)';

  @override
  String get featureNoAds => 'Sin anuncios para siempre: juego ininterrumpido';

  @override
  String get featureUnlimitedPlayers =>
      'Modo Pandora: jugadores y preguntas ilimitados';

  @override
  String get featureQuestionNavigation =>
      'Navega y salta a cualquier pregunta durante la partida';

  @override
  String get featureSupportDevelopment =>
      'Apoya el desarrollo continuo y nuevas funciones';

  @override
  String get error => 'Error';

  @override
  String get premiumActivatedMessage =>
      '¡Premium activado! Todas las categorías están desbloqueadas.';

  @override
  String get featurePersonalDecks =>
      'Modo Personal: crea mazos personalizados ilimitados con tus propias preguntas';

  @override
  String get premiumPersonal =>
      'El modo Personal con mazos personalizados es una función Premium. Mejora a Premium para crear y jugar con tus propios mazos de preguntas.';

  @override
  String deleteDeckConfirmation(String deckName) {
    return '¿Seguro que quieres eliminar \"$deckName\"? Esto eliminará todas las preguntas de este mazo.';
  }

  @override
  String needMore(int count) {
    return 'Faltan $count';
  }

  @override
  String get editQuestions => 'Editar preguntas';

  @override
  String get addMore => 'Añadir más';

  @override
  String useMyConnectEmail(String email) {
    return 'Usar mi correo de Connect: $email';
  }

  @override
  String get freemiumPlayerLimit =>
      'Los usuarios gratuitos pueden tener como máximo 6 jugadores. Mejora a Premium para tener jugadores ilimitados.';

  @override
  String get freemiumQuestionLimit =>
      'Los usuarios gratuitos pueden enviar como máximo 12 preguntas. Mejora a Premium para tener preguntas ilimitadas.';

  @override
  String get yourQuestions => 'Tus preguntas';

  @override
  String waitingForHost(int count) {
    return 'Esperando al anfitrión... ($count jugadores)';
  }

  @override
  String get upgradeForUnlimitedPlayers =>
      'Mejora a Premium para tener jugadores ilimitados';

  @override
  String get kickPlayer => 'Expulsar jugador';

  @override
  String kickPlayerConfirm(String playerName) {
    return '¿Seguro que quieres expulsar a \"$playerName\" de la sesión?';
  }

  @override
  String get kick => 'Expulsar';

  @override
  String playerKicked(String playerName) {
    return '$playerName ha sido expulsado de la sesión';
  }

  @override
  String get failedToKickPlayer => 'No se pudo expulsar al jugador';

  @override
  String get cancelSessionForAll =>
      'Esto cancelará la sesión para todos los jugadores. ¿Seguro?';

  @override
  String get youWereKicked => 'Has sido expulsado de la sesión';

  @override
  String get you => 'Tú';

  @override
  String get loginRequiredForPandora =>
      'Es necesario iniciar sesión para jugar a Pandora';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get loginRequiredNote =>
      'Es necesario iniciar sesión para jugar a Pandora (para registrar correctamente a los jugadores)';

  @override
  String get timeIsUp => '¡Se acabó el tiempo!';

  @override
  String notEnoughQuestionsSubmitted(int current, int minimum) {
    return 'No se enviaron suficientes preguntas ($current/$minimum mínimo).';
  }

  @override
  String get sessionQuestionLimit =>
      'Se alcanzó el límite de preguntas de la sesión';

  @override
  String get sessionQuestionLimitMessage =>
      'Esta sesión ha alcanzado el límite de 12 preguntas (anfitrión gratuito). Mejora a Premium para tener preguntas ilimitadas.';

  @override
  String sessionQuestionCount(int current) {
    return 'Sesión: $current/12 preguntas';
  }

  @override
  String get pleaseEnterQuestion => 'Introduce una pregunta';

  @override
  String get rateThisDeck => 'Valora este mazo';

  @override
  String get yourRating => 'Tu valoración';

  @override
  String get skip => 'Saltar';

  @override
  String get submit => 'Enviar';

  @override
  String get thankYouForFeedback => 'Gracias por tus comentarios.';

  @override
  String get failedToSubmitRating => 'No se pudo enviar la valoración';

  @override
  String get tapStarsToRate => 'Toca las estrellas para valorar';

  @override
  String get downloadForOffline => 'Descargar para usar sin conexión';

  @override
  String get downloading => 'Descargando...';

  @override
  String get downloadedLanguages => 'Idiomas descargados';

  @override
  String get languageNotDownloaded => 'Idioma no descargado';

  @override
  String languageNotDownloadedMessage(String languageName) {
    return 'No has descargado $languageName para uso sin conexión.\n\nVe a Configuración > Perfil > \"Descargar para usar sin conexión\" mientras estés conectado a internet.';
  }

  @override
  String get offlineLanguageError =>
      'Este idioma no se ha descargado para uso sin conexión. Ve a Configuración > Perfil > \"Descargar para usar sin conexión\" mientras estés conectado a internet.';

  @override
  String get downloadComplete => 'Descarga completa!';

  @override
  String get downloadCompleteMessage =>
      'Todo el contenido ha sido descargado para uso sin conexión.';

  @override
  String get addedToFavorites => 'Añadido a favoritos';

  @override
  String get removedFromFavorites => 'Eliminado de favoritos';

  @override
  String get errorSavingFavorite => 'Error al guardar favorito';

  @override
  String get internetRequired => 'Internet necesario';

  @override
  String get internetRequiredMessage =>
      'Algunas funciones requieren conexión a internet. Los usuarios Premium pueden descargar contenido para uso sin conexión en Configuración.';

  @override
  String get goPremium => 'Obtener Premium';

  @override
  String get pleaseEnterPin => 'Por favor, introduce un PIN de 6 dígitos';

  @override
  String errorOccurred(String error) {
    return 'Error: $error';
  }

  @override
  String get errorCreatingSession => 'Error al crear la sesión';

  @override
  String get sessionTimedOut =>
      'Sesión agotada - el anfitrión no configuró el temporizador';

  @override
  String get errorStarting => 'Error al iniciar';

  @override
  String get errorLoadingParticipants => 'Error al cargar participantes';

  @override
  String get sessionCancelledByHost => 'Sesión cancelada por el anfitrión';

  @override
  String needAtLeast5Questions(int count) {
    return 'Se necesitan al menos 5 preguntas para empezar! (Actualmente: $count)';
  }

  @override
  String get errorStartingGame => 'Error al iniciar el juego';

  @override
  String get questionsAsked => 'Preguntas realizadas';

  @override
  String get totalReactions => 'Reacciones totales';

  @override
  String get mostLovedQuestion => 'Pregunta más querida';

  @override
  String get mostFunQuestion => 'Pregunta más divertida';

  @override
  String get mostShockingQuestion => 'Pregunta más impactante';

  @override
  String get mostLitQuestion => 'Pregunta más genial';

  @override
  String get hotSeatAward => 'Premio Hot Seat';

  @override
  String get errorCouldNotIdentifyPlayer =>
      'Error: No se pudo identificar al jugador. Por favor, vuelve a unirte a la sesión.';

  @override
  String get createAiDeck => 'Crear mazo AI';

  @override
  String get whatIsTheOccasion => '¿Cuál es la ocasión?';

  @override
  String get occasionHint =>
      'por ejemplo, Fiesta de cumpleaños, Team building, Noche de cita';

  @override
  String get whatIsTheMood => '¿Cuál es el estado de ánimo?';

  @override
  String get lighthearted => 'Desenfadado';

  @override
  String get serious => 'Serio';

  @override
  String get mixed => 'Mezclado';

  @override
  String get depthOfQuestions => '¿Profundidad de las preguntas?';

  @override
  String get surfaceLevel => 'Nivel superficial';

  @override
  String get deep => 'Profundo';

  @override
  String get level => 'Nivel';

  @override
  String get sizeOfGroup => '¿Tamaño del grupo?';

  @override
  String get people => 'personas';

  @override
  String get anyOtherRemarks => '¿Alguna otra observación? (opcional)';

  @override
  String get remarksHint =>
      'por ejemplo, Apto para toda la familia, incluye algunas preguntas divertidas';

  @override
  String get generateQuestions => 'Generar Preguntas';

  @override
  String get aiDeckPremiumMessage =>
      'La generación de mazos con IA es una función premium. ¡Actualiza para crear mazos de conversación ilimitados impulsados por IA!';

  @override
  String get pleaseEnterOccasion => 'Por favor, ingresa la ocasión';

  @override
  String errorGeneratingQuestions(String error) {
    return 'Error al generar preguntas: $error';
  }

  @override
  String get generatingAiQuestions => 'Generando preguntas de AI...';

  @override
  String get generatingMoreQuestions => 'Generando más preguntas...';

  @override
  String get batchComplete => '¡Lote completo!';

  @override
  String questionsInDeckMessage(int count) {
    return 'Tienes $count preguntas en tu mazo. ¿Generar 10 más?';
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
  String get imDone => 'He terminado';

  @override
  String get generateMore => 'Generar Más';

  @override
  String get maxQuestionsReached => 'Máx. Preguntas (50)';

  @override
  String get namYourDeck => 'Nombra tu mazo';

  @override
  String get goBack => 'Regresar';

  @override
  String get swipeInstructions =>
      'Desliza a la derecha para mantener • Desliza a la izquierda para descartar';

  @override
  String get discussionPoint => 'Punto de discusión';

  @override
  String get sparkMode => 'Modo Spark';

  @override
  String get sparkModeSubtitle =>
      'Iniciadores de conversación impulsados por AI';

  @override
  String get sparkPremiumRequired => 'Modo Spark - Función Premium';

  @override
  String get sparkPremiumMessage =>
      'El Modo Spark está disponible para suscriptores Premium y Premium+. ¡Genera iniciadores de conversación impulsados por IA adaptados a tu ocasión!';

  @override
  String sparkQuestionsRemaining(int remaining, int limit) {
    return '$remaining de $limit preguntas restantes';
  }

  @override
  String get howManyQuestions => '¿Cuántas preguntas?';

  @override
  String sparkQuestions(int count) {
    return '$count Preguntas';
  }

  @override
  String generateSparkQuestions(int count) {
    return 'Generar $count preguntas';
  }

  @override
  String get sparkLimitReached => 'Límite Mensual Alcanzado';

  @override
  String sparkLimitMessage(int remaining, int requested) {
    return 'Solo te quedan $remaining preguntas Spark este mes. Estás intentando generar $requested preguntas.\n\n¡Actualiza a Premium+ por 400 preguntas al mes!';
  }

  @override
  String get expiresIn24Hours => 'Expira en 24 horas';

  @override
  String get alreadyInFavorites => 'Ya en Favoritos';

  @override
  String addedToDeck(String deckName) {
    return '¡Añadido a $deckName!';
  }

  @override
  String get questionAlreadyInDeck => 'Pregunta ya en este mazo';

  @override
  String get addToDeck => 'Agregar al mazo';

  @override
  String get favorite => 'Favorito';

  @override
  String get chooseDeck => 'Elige un mazo para agregar esta pregunta:';

  @override
  String get noDecksFound => 'No se encontraron mazos';

  @override
  String get noDecksMessage =>
      'No tienes ningún mazo personalizado aún. ¿Te gustaría crear uno?';

  @override
  String get createDeck => 'Crear mazo';

  @override
  String get createAndAdd => 'Crear y Añadir';

  @override
  String get pleaseEnterDeckName => 'Por favor, introduce un nombre de mazo';

  @override
  String get tierBasic => 'Básico';

  @override
  String get tierPremium => 'Premium';

  @override
  String get tierPremiumPlus => 'Premium+';

  @override
  String get tierFree => 'Gratis';

  @override
  String get choosePlan => 'Elige Tu Plan';

  @override
  String get choosePlanSubtitle =>
      'Desbloquea funciones premium y conversaciones impulsadas por IA';

  @override
  String get mostPopular => 'MÁS POPULAR';

  @override
  String get perMonth => 'por mes';

  @override
  String get forever => 'Para siempre';

  @override
  String get continueWithBasic => 'Continuar con Basic (Gratis)';

  @override
  String subscribeTo(String tier) {
    return 'Suscríbete a $tier';
  }

  @override
  String get cancelAnytime =>
      'Cancela en cualquier momento. Sin tarifas ocultas.';

  @override
  String get basicTierTitle => 'Básico';

  @override
  String get basicTierPrice => '€6.99';

  @override
  String get basicTierDescription =>
      'Accede a todos los modos de juego excepto Spark';

  @override
  String get basicFeature1 =>
      'Todos los modos de juego (Pareja, Amigos, Familia, Personal, Pandora)';

  @override
  String get basicFeature2 => 'Acceso a todas las 24+ categorías';

  @override
  String get basicFeature3 => 'Barajas personales personalizadas';

  @override
  String get basicFeature4 => 'Sin anuncios';

  @override
  String get basicFeature5 => 'Navegación de preguntas';

  @override
  String get premiumTierTitle => 'Premium';

  @override
  String get premiumTierPrice => '€11.99';

  @override
  String get premiumTierDescription => 'Todo en Basic + Spark AI';

  @override
  String get premiumFeature6 => 'Guarda favoritos en mazos personales';

  @override
  String get premiumPlusTierTitle => 'Premium+';

  @override
  String get premiumPlusTierPrice => '€19.99';

  @override
  String get premiumPlusTierDescription => 'Máxima potencia de AI';

  @override
  String get premiumPlusFeature1 => 'Todo en Premium';

  @override
  String get premiumPlusFeature2 => '🚀 400 preguntas de AI por mes';

  @override
  String get premiumPlusFeature3 => '2.5x más preguntas Spark';

  @override
  String get premiumPlusFeature4 => 'Perfecto para uso frecuente';

  @override
  String get premiumPlusFeature5 => 'Soporte prioritario';
}
