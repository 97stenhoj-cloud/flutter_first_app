// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Connect';

  @override
  String get start => 'Start';

  @override
  String get settings => 'Setări';

  @override
  String get howToPlay => 'Cum se joacă';

  @override
  String get chooseGameMode => 'Alege modul de joc';

  @override
  String get family => 'Familie';

  @override
  String get couple => 'Cuplu';

  @override
  String get friends => 'Prieteni';

  @override
  String get chooseCategory => 'Alege o categorie';

  @override
  String get locked => 'Categorie blocată';

  @override
  String get lockedMessage =>
      'Această categorie este blocată. Actualizează la premium pentru a debloca toate categoriile!';

  @override
  String get ok => 'OK';

  @override
  String get mayBeLater => 'Poate mai târziu';

  @override
  String get chooseSubscription => 'Alege abonamentul';

  @override
  String get subscriptionDescription =>
      'Deblochează categorii premium și obține acces la pachete exclusive de întrebări';

  @override
  String get chooseBundleOne => 'Alege 1 pachet de categorii';

  @override
  String get chooseBundleTwo => 'Alege 2 pachete de categorii';

  @override
  String get chooseBundleThree => 'Toate cele 3 pachete';

  @override
  String get perMonth => '/lună';

  @override
  String get bestValue => 'CEL MAI BUNĂ OFERTĂ';

  @override
  String get unlockAllBundles => 'Deblochează toate pachetele';

  @override
  String get selectYourBundle => 'Selectează pachetul tău';

  @override
  String selectBundles(Object count, Object plural) {
    return 'Selectează $count pachet$plural';
  }

  @override
  String get premiumCategories => '4 categorii premium';

  @override
  String get cancel => 'Anulează';

  @override
  String get subscribe => 'Abonează-te';

  @override
  String subscriptionActivated(Object bundles) {
    return 'Abonament activat! $bundles deblocat.';
  }

  @override
  String get demoNote =>
      'Demo: Deblocările se vor reseta la repornirea aplicației';

  @override
  String get swipeOrTap => 'Glisează sau apasă săgețile';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Următorul';

  @override
  String get advertisement => 'Reclamă';

  @override
  String get watchAdMessage =>
      'Vizionează o reclamă scurtă pentru a continua, sau elimină reclamele cu premium!';

  @override
  String get watchAd => 'Vizionează reclama';

  @override
  String get goAdFree => 'Fără reclame - 59 DKK/lună';

  @override
  String get removeAdsForever => 'Elimină reclamele pentru totdeauna';

  @override
  String get chooseOneBundle =>
      'Alege 1 pachet pentru a debloca și elimina toate reclamele';

  @override
  String get noAdsForever => 'Fără reclame niciodată';

  @override
  String premiumActivated(Object bundle) {
    return 'Premium activat! Reclame eliminate. Pachetul $bundle deblocat.';
  }

  @override
  String get adNotReady =>
      'Reclama nu este pregătită. Se continuă fără reclamă.';

  @override
  String get adLoadingContinue => 'Reclama se încarcă... Continuă';

  @override
  String get pricePerMonth => '59 DKK/lună';

  @override
  String noQuestionsFoundMessage(Object category, Object mode) {
    return 'Nu s-au găsit întrebări pentru $category în modul $mode';
  }

  @override
  String get errorLoadingQuestions =>
      'Eroare la încărcarea întrebărilor. Te rugăm verifică conexiunea.';

  @override
  String failedToLoadQuestions(Object error) {
    return 'Încărcarea întrebărilor a eșuat: $error';
  }

  @override
  String get madeForWife => 'Creat pentru frumoasa mea soție';

  @override
  String get otiLia => 'Otilia Stenhøj';

  @override
  String get withLoveAndConversations => 'Cu dragoste și conversații';

  @override
  String get howManyPlayers => 'Câți jucători?';

  @override
  String get players => 'Jucători';

  @override
  String get continueButton => 'Continuă';

  @override
  String get language => 'Limba';

  @override
  String languageChanged(Object language) {
    return 'Limba schimbată în $language';
  }

  @override
  String get profile => 'Profil';

  @override
  String get signOut => 'Deconectare';

  @override
  String get notSignedIn => 'Nu ești autentificat';

  @override
  String get signInSignUp => 'Autentificare / Înregistrare';

  @override
  String get signInToSync =>
      'Autentifică-te pentru a sincroniza abonamentele pe toate dispozitivele și a debloca conținut premium';

  @override
  String get signOutConfirm => 'Ești sigur că vrei să te deconectezi?';

  @override
  String get signedOutSuccess => 'Deconectat cu succes';

  @override
  String get accountInformation => 'Informații cont';

  @override
  String get email => 'Email';

  @override
  String get memberSince => 'Membru din';

  @override
  String get notAvailable => 'Indisponibil';

  @override
  String get unknown => 'Necunoscut';

  @override
  String get activeSubscriptions => 'Abonamente active';

  @override
  String bundlesUnlocked(Object count, Object plural) {
    return '$count pachet$plural deblocat';
  }

  @override
  String bundle(Object name) {
    return 'Pachetul $name';
  }

  @override
  String get premiumMember => 'Membru premium';

  @override
  String get freeAccount => 'Cont gratuit';

  @override
  String get welcomeToConnect => 'Bun venit la Connect!';

  @override
  String get continueWithApple => 'Continuă cu Apple';

  @override
  String get continueWithGoogle => 'Continuă cu Google';

  @override
  String get skipForNow => 'Omite deocamdată';

  @override
  String get byContining =>
      'Continuând, accepți Termenii de serviciu și Politica de confidențialitate';

  @override
  String get googleSignInFailed =>
      'Autentificarea Google a eșuat. Te rugăm încearcă din nou.';

  @override
  String get appleSignInFailed =>
      'Autentificarea Apple a eșuat. Te rugăm încearcă din nou.';

  @override
  String get noCategoriesFound => 'Nu s-au găsit categorii';

  @override
  String selectBundlePlural(Object plural) {
    return 'Selectează pachetul$plural de categorii pe care vrei să îl deblochezi';
  }

  @override
  String get getAccessAllBundles =>
      'Obține acces la toate categoriile premium din toate cele 3 pachete!';

  @override
  String subscriptionActivatedFull(Object bundles) {
    return 'Abonament activat! $bundles deblocat.';
  }

  @override
  String get aboutCredits => 'Despre / Credite';

  @override
  String get welcomeBack => 'Bine ai revenit!';

  @override
  String get createAccount => 'Creează cont';

  @override
  String get displayName => 'Nume afișat';

  @override
  String get password => 'Parolă';

  @override
  String get signIn => 'Autentificare';

  @override
  String get signUp => 'Înregistrare';

  @override
  String get dontHaveAccount => 'Nu ai cont? Înregistrează-te';

  @override
  String get alreadyHaveAccount => 'Ai deja cont? Autentifică-te';

  @override
  String get chooseYourMode => '1. Alege modul tău';

  @override
  String get chooseYourModeDesc =>
      'Selectează dintre cele trei stiluri de conversație:\n\n• Familie - Conversații calde și plăcute, perfecte pentru toate vârstele\n• Cuplu - Întrebări intime și romantice pentru a aprofunda legătura\n• Prieteni - Subiecte distractive și antrenante pentru grupul tău';

  @override
  String get pickCategory => '2. Alege o categorie';

  @override
  String get pickCategoryDesc =>
      'Fiecare mod are mai multe categorii cu pachete unice de întrebări. Categoriile gratuite sunt deblocate, în timp ce categoriile premium necesită abonament.';

  @override
  String get startTalking => '3. Începe să vorbești';

  @override
  String get startTalkingDesc =>
      'Întrebările apar pe tot ecranul. Pe rând, citiți și răspundeți sincer. Nu există răspunsuri greșite - scopul este o conversație profundă!';

  @override
  String get navigateQuestions => '4. Navighează întrebările';

  @override
  String get navigateQuestionsDesc =>
      '• Glisează la dreapta sau apasă \"Următorul\" pentru întrebarea următoare\n• Glisează la stânga sau apasă \"Anterior\" pentru a revizita întrebările\n• Apasă butonul home pentru a reveni la meniul principal oricând';

  @override
  String get premiumFeatures => '5. Funcții premium';

  @override
  String get premiumFeaturesDesc =>
      'Deblochează categorii exclusive de întrebări cu un abonament:\n\n• 1 pachet (4 categorii) - 59 DKK/lună\n• 2 pachete (8 categorii) - 109 DKK/lună\n• 3 pachete (12 categorii) - 149 DKK/lună';

  @override
  String get proTips => 'Sfaturi Pro';

  @override
  String get proTipsDesc =>
      '• Creează un mediu confortabil, fără distrageri\n• Ascultă activ și fii prezent\n• Împărtășește sincer și încurajează pe alții să facă la fel\n• Respectă limitele - omite întrebări dacă este necesar\n• Distrează-te și bucură-te de conexiune!';
}
