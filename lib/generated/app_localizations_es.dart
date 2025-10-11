// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get languageSelection => 'Seleccionar Idioma';

  @override
  String get lightMode => 'Modo Claro';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get proceed => 'Proceder';

  @override
  String get languageNamePortuguese => 'Portugués';

  @override
  String get languageNameEnglish => 'Inglés';

  @override
  String get languageNameSpanish => 'Español';

  @override
  String get languageTooltipPortugueseBrazil => 'Portugués (Brasil)';

  @override
  String get languageTooltipEnglishUnitedStates => 'Inglés (Estados Unidos)';

  @override
  String get languageTooltipSpanishMexico => 'Español (México)';
}

/// The translations for Spanish Castilian, as used in Mexico (`es_MX`).
class AppLocalizationsEsMx extends AppLocalizationsEs {
  AppLocalizationsEsMx() : super('es_MX');

  @override
  String get languageSelection => 'Seleccionar Idioma';

  @override
  String get lightMode => 'Modo Claro';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get proceed => 'Proceder';

  @override
  String get languageNamePortuguese => 'Portugués';

  @override
  String get languageNameEnglish => 'Inglés';

  @override
  String get languageNameSpanish => 'Español';

  @override
  String get languageTooltipPortugueseBrazil => 'Portugués (Brasil)';

  @override
  String get languageTooltipEnglishUnitedStates => 'Inglés (Estados Unidos)';

  @override
  String get languageTooltipSpanishMexico => 'Español (México)';
}
