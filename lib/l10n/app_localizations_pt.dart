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
  String get chooseSubscription => 'Escolha Sua Assinatura';

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
    return 'Assinatura ativada! $bundles desbloqueado.';
  }

  @override
  String get demoNote =>
      'Demo: Os desbloqueios serão redefinidos ao reiniciar o app';

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
}
