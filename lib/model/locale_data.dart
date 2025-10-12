import '../utils/imports/common_libs.dart';

class LocaleData {
  final Locale locale;
  final String flag; // Changed from IconData to String

  const LocaleData({required this.locale, required this.flag});

  String getDisplayName(BuildContext context) {
    switch (locale.toString()) {
      case 'pt_BR':
        return 'Português (Brasil)';
      case 'en_US':
        return 'English (United States)';
      case 'es_MX':
        return 'Español (México)';
      default:
        return locale.languageCode;
    }
  }

  String getTooltip(BuildContext context) {
    final l10n = context.l10n;
    switch (locale.toString()) {
      case 'pt_BR':
        return l10n.languageTooltipPortugueseBrazil;
      case 'en_US':
        return l10n.languageTooltipEnglishUnitedStates;
      case 'es_MX':
        return l10n.languageTooltipSpanishMexico;
      default:
        return locale.toString();
    }
  }

  factory LocaleData.fromLocale(Locale locale, String flag) {
    return LocaleData(locale: locale, flag: flag);
  }
}
