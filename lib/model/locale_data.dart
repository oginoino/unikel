import '../utils/imports/common_libs.dart';

class LocaleData {
  final Locale locale;
  final String flag;

  const LocaleData({required this.locale, required this.flag});

  String getDisplayName(BuildContext context) {
    final l10n = context.l10n;
    switch (locale.toString()) {
      case 'pt_BR':
        return l10n.languageNamePortuguese;
      case 'en_US':
        return l10n.languageNameEnglish;
      case 'es_MX':
        return l10n.languageNameSpanish;
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
