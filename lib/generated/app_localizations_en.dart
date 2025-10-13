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

  @override
  String get register => 'Register';

  @override
  String get login => 'Login';

  @override
  String get cta_to_register_screen_text =>
      'Ready to take control of your finances? Register now!';

  @override
  String get emailRequired => 'Email is required.';

  @override
  String get invalidEmail => 'Please enter a valid email.';

  @override
  String get passwordRequired => 'Password is required.';

  @override
  String get passwordLength => 'Password must be at least 6 characters long.';

  @override
  String fieldRequired(Object fieldName) {
    return '$fieldName is required.';
  }

  @override
  String get labelName => 'Name';

  @override
  String get nameValue => 'Name';

  @override
  String get labelPhone => 'Phone';

  @override
  String get phoneValue => 'Phone';

  @override
  String get invalidPhoneMatch => 'Please enter a valid phone number.';

  @override
  String get labelPhoneCode => 'Phone Code';

  @override
  String get phoneCodeValue => 'Phone Code';

  @override
  String get invalidPhoneCodeMatch =>
      'Please enter a valid 4-digit phone code.';

  @override
  String get previous => 'Previous';

  @override
  String get next => 'Next';

  @override
  String get submitRegister => 'Submit Register';
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

  @override
  String get register => 'Register';

  @override
  String get login => 'Login';

  @override
  String get cta_to_register_screen_text =>
      'Ready to take control of your finances? Register now!';

  @override
  String get emailRequired => 'Email is required.';

  @override
  String get invalidEmail => 'Please enter a valid email address.';

  @override
  String get passwordRequired => 'Password is required.';

  @override
  String get passwordLength => 'Password must be at least 6 characters long.';

  @override
  String fieldRequired(Object fieldName) {
    return '$fieldName is required.';
  }

  @override
  String get labelName => 'Name';

  @override
  String get nameValue => 'Name';

  @override
  String get labelPhone => 'Phone';

  @override
  String get phoneValue => 'Phone';

  @override
  String get invalidPhoneMatch => 'Please enter a valid phone number.';

  @override
  String get labelPhoneCode => 'Phone Code';

  @override
  String get phoneCodeValue => 'Phone Code';

  @override
  String get invalidPhoneCodeMatch =>
      'Please enter a valid 4-digit phone code.';

  @override
  String get previous => 'Previous';

  @override
  String get next => 'Next';

  @override
  String get submitRegister => 'Submit Register';
}
