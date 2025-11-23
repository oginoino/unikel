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
  String get proceed => 'Start Exploring';

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
  String get onboarding_subtitle => 'Connect. Share. Discover.';

  @override
  String get onboarding_subtitle_1 => 'Connect with friends and family.';

  @override
  String get onboarding_subtitle_2 => 'Share your moments with the world.';

  @override
  String get onboarding_subtitle_3 => 'Discover new people and experiences.';

  @override
  String get register => 'Sign Up';

  @override
  String get login => 'Sign In';

  @override
  String get cta_to_register_screen_text => 'Join the Glassy community today!';

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
  String get phoneRequired => 'Phone number is required.';

  @override
  String get invalidPhoneMatch => 'Please enter a valid phone number.';

  @override
  String get labelPhoneCode => 'Phone Code';

  @override
  String get registerNameTitle => 'What is your name?';

  @override
  String get registerPhoneTitle => 'What is your phone number?';

  @override
  String get registerPhoneCodeTitle => 'What is your phone code?';

  @override
  String get phoneCodeValue => 'Phone Code';

  @override
  String get phoneCodeRequired => 'Phone code is required.';

  @override
  String get invalidPhoneCodeMatch =>
      'Please enter a valid 4-digit phone code.';

  @override
  String get previous => 'Previous';

  @override
  String get next => 'Next';

  @override
  String get submitRegister => 'Sign Up';

  @override
  String get selectCountryCode => 'Select country code';

  @override
  String get registerSecurityCodeTitle => 'Security code verification';

  @override
  String get labelSecurityCode => 'Security code';

  @override
  String get verifyingCode => 'Verifying code...';

  @override
  String get codeVerifiedSuccess => 'Code verified successfully!';

  @override
  String get codeInvalid => 'Invalid code.';

  @override
  String get errorVerifyingCode => 'Error verifying code.';

  @override
  String get editarTelefoneTextMessage => 'Edit phone number';

  @override
  String verifyPhoneNumberMessage(Object phoneNumber) {
    return 'We sent a message to the number $phoneNumber';
  }

  @override
  String get resendCode => 'Resend code';

  @override
  String get codeResendSuccess => 'Code resent successfully';

  @override
  String get errorResendingCode => 'Error sending code';

  @override
  String get profileTooltip => 'View profile';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileSubtitle => 'Manage your information and preferences.';

  @override
  String get profileAccountSectionTitle => 'Account information';

  @override
  String get profileContactSectionTitle => 'Contact information';

  @override
  String get profileIdLabel => 'Identifier';

  @override
  String get profileEmailLabel => 'Email';

  @override
  String get profileStatusActive => 'Active account';

  @override
  String get profileStatusInactive => 'Inactive account';

  @override
  String get profilePhoneVerified => 'Phone verified';

  @override
  String get profilePhoneUnverified => 'Phone not verified';

  @override
  String get profileMissingData => 'Information unavailable';

  @override
  String get loginPageTitle => 'Welcome back';

  @override
  String get loginPageSubtitle => 'Sign in with your email and password.';

  @override
  String get loginPageRegisterCta => 'Don\'t have an account? Sign Up';

  @override
  String get loginUserNotFound =>
      'We couldn\'t find an account with the provided email.';

  @override
  String get loginGenericError =>
      'We couldn\'t complete your login. Please try again.';

  @override
  String get logout => 'Log out';

  @override
  String get logoutError =>
      'We couldn\'t complete your sign out. Please try again.';

  @override
  String get registerTitle => 'Create your account';

  @override
  String get registerSubtitle => 'Join the Glassy community.';

  @override
  String get registerGenericError =>
      'We couldn\'t complete your registration. Please try again.';

  @override
  String get labelEmail => 'Email';

  @override
  String get labelPassword => 'Password';

  @override
  String get errorRequiredField => 'Field is required.';

  @override
  String get errorInvalidEmail => 'Please enter a valid email address.';

  @override
  String get errorPasswordTooShort =>
      'Password must be at least 6 characters long.';

  @override
  String get registerPageLoginCta => 'Already have an account? Sign In';
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
  String get phoneRequired => 'Phone number is required.';

  @override
  String get invalidPhoneMatch => 'Please enter a valid phone number.';

  @override
  String get labelPhoneCode => 'Phone Code';

  @override
  String get registerNameTitle => 'What is your name?';

  @override
  String get registerPhoneTitle => 'What is your phone number?';

  @override
  String get registerPhoneCodeTitle => 'What is your phone code?';

  @override
  String get phoneCodeValue => 'Phone Code';

  @override
  String get phoneCodeRequired => 'Phone code is required.';

  @override
  String get invalidPhoneCodeMatch =>
      'Please enter a valid 4-digit phone code.';

  @override
  String get previous => 'Previous';

  @override
  String get next => 'Next';

  @override
  String get submitRegister => 'Submit Register';

  @override
  String get selectCountryCode => 'Select country code';

  @override
  String get registerSecurityCodeTitle => 'Security code verification';

  @override
  String get labelSecurityCode => 'Security code';

  @override
  String get verifyingCode => 'Verifying code...';

  @override
  String get codeVerifiedSuccess => 'Code verified successfully!';

  @override
  String get codeInvalid => 'Invalid code.';

  @override
  String get errorVerifyingCode => 'Error verifying code.';

  @override
  String get editarTelefoneTextMessage => 'Edit phone number';

  @override
  String verifyPhoneNumberMessage(Object phoneNumber) {
    return 'We sent a message to the number $phoneNumber';
  }

  @override
  String get resendCode => 'Resend code';

  @override
  String get codeResendSuccess => 'Code resent successfully';

  @override
  String get errorResendingCode => 'Error sending code';

  @override
  String get profileTooltip => 'View profile';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileSubtitle => 'Manage your information and preferences.';

  @override
  String get profileAccountSectionTitle => 'Account information';

  @override
  String get profileContactSectionTitle => 'Contact information';

  @override
  String get profileIdLabel => 'Identifier';

  @override
  String get profileEmailLabel => 'Email';

  @override
  String get profileStatusActive => 'Active account';

  @override
  String get profileStatusInactive => 'Inactive account';

  @override
  String get profilePhoneVerified => 'Phone verified';

  @override
  String get profilePhoneUnverified => 'Phone not verified';

  @override
  String get profileMissingData => 'Information unavailable';

  @override
  String get loginPageTitle => 'Welcome back';

  @override
  String get loginPageSubtitle =>
      'Sign in with your registered phone number to continue.';

  @override
  String get loginPageRegisterCta => 'Don\'t have an account? Register';

  @override
  String get loginUserNotFound =>
      'We couldn\'t find an account with the provided phone number.';

  @override
  String get loginGenericError =>
      'We couldn\'t complete your login. Please try again.';

  @override
  String get logout => 'Log out';

  @override
  String get logoutError =>
      'We couldn\'t complete your sign out. Please try again.';
}
