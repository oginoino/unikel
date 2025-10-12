// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get languageSelection => 'Select Language';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get proceed => 'Proceed';

  @override
  String get languageNamePortuguese => 'Portuguese';

  @override
  String get languageNameEnglish => 'English';

  @override
  String get languageNameSpanish => 'Spanish';

  @override
  String get languageTooltipPortugueseBrazil => 'Portuguese (Brazil)';

  @override
  String get languageTooltipEnglishUnitedStates => 'English (United States)';

  @override
  String get languageTooltipSpanishMexico => 'Spanish (Mexico)';

  @override
  String get onboarding_subtitle => 'Your financial journey, simplified.';

  @override
  String get onboarding_subtitle_1 => 'Your financial journey, simplified.';

  @override
  String get onboarding_subtitle_2 => 'Track your expenses with ease.';

  @override
  String get onboarding_subtitle_3 => 'Achieve your financial goals.';
}

/// The translations for English, as used in the United States (`en_US`).
class AppLocalizationsEnUs extends AppLocalizationsEn {
  AppLocalizationsEnUs() : super('en_US');

  @override
  String get languageSelection => 'Select Language';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get proceed => 'Proceed';

  @override
  String get languageNamePortuguese => 'Portuguese';

  @override
  String get languageNameEnglish => 'English';

  @override
  String get languageNameSpanish => 'Spanish';

  @override
  String get languageTooltipPortugueseBrazil => 'Portuguese (Brazil)';

  @override
  String get languageTooltipEnglishUnitedStates => 'English (United States)';

  @override
  String get languageTooltipSpanishMexico => 'Spanish (Mexico)';

  @override
  String get onboarding_subtitle => 'Your financial journey, simplified.';

  @override
  String get onboarding_subtitle_1 => 'Your financial journey, simplified.';

  @override
  String get onboarding_subtitle_2 => 'Track your expenses with ease.';

  @override
  String get onboarding_subtitle_3 => 'Achieve your financial goals.';
}
