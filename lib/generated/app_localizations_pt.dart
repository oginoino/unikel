// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get languageSelection => 'Selecionar Idioma';

  @override
  String get lightMode => 'Modo Claro';

  @override
  String get darkMode => 'Modo Escuro';

  @override
  String get proceed => 'Prosseguir';

  @override
  String get languageNamePortuguese => 'Português';

  @override
  String get languageNameEnglish => 'Inglês';

  @override
  String get languageNameSpanish => 'Espanhol';

  @override
  String get languageTooltipPortugueseBrazil => 'Português (Brasil)';

  @override
  String get languageTooltipEnglishUnitedStates => 'Inglês (Estados Unidos)';

  @override
  String get languageTooltipSpanishMexico => 'Espanhol (México)';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get languageSelection => 'Selecionar Idioma';

  @override
  String get lightMode => 'Modo Claro';

  @override
  String get darkMode => 'Modo Escuro';

  @override
  String get proceed => 'Prosseguir';

  @override
  String get languageNamePortuguese => 'Português';

  @override
  String get languageNameEnglish => 'Inglês';

  @override
  String get languageNameSpanish => 'Espanhol';

  @override
  String get languageTooltipPortugueseBrazil => 'Português (Brasil)';

  @override
  String get languageTooltipEnglishUnitedStates => 'Inglês (Estados Unidos)';

  @override
  String get languageTooltipSpanishMexico => 'Espanhol (México)';
}
