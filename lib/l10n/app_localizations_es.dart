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
  String get start => 'Empezar';

  @override
  String get settings => 'Ajustes';

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
  String get chooseSubscription => 'Elige Tu Suscripción';

  @override
  String get subscriptionDescription =>
      'Desbloquea categorías premium y obtén acceso a paquetes de preguntas exclusivos';

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
    return '¡Suscripción activada! $bundles desbloqueado.';
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
  String get advertisement => 'Anuncio';

  @override
  String get watchAdMessage =>
      '¡Mira un anuncio corto para continuar, o hazte premium sin anuncios!';

  @override
  String get watchAd => 'Ver Anuncio';

  @override
  String get goAdFree => 'Sin Anuncios - 59 DKK/mes';

  @override
  String get removeAdsForever => 'Eliminar Anuncios Para Siempre';

  @override
  String get chooseOneBundle =>
      'Elige 1 paquete para desbloquear y eliminar todos los anuncios';

  @override
  String get noAdsForever => 'Sin Anuncios Para Siempre';

  @override
  String premiumActivated(Object bundle) {
    return '¡Premium activado! Anuncios eliminados. Paquete $bundle desbloqueado.';
  }
}
