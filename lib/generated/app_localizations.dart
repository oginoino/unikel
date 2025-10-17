import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en', 'US'),
    Locale('pt', 'BR'),
    Locale('es', 'MX'),
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// No description provided for @languageSelection.
  ///
  /// In en_US, this message translates to:
  /// **'Select Language'**
  String get languageSelection;

  /// No description provided for @lightMode.
  ///
  /// In en_US, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en_US, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @proceed.
  ///
  /// In en_US, this message translates to:
  /// **'Proceed'**
  String get proceed;

  /// No description provided for @languageNamePortuguese.
  ///
  /// In en_US, this message translates to:
  /// **'Portuguese'**
  String get languageNamePortuguese;

  /// No description provided for @languageNameEnglish.
  ///
  /// In en_US, this message translates to:
  /// **'English'**
  String get languageNameEnglish;

  /// No description provided for @languageNameSpanish.
  ///
  /// In en_US, this message translates to:
  /// **'Spanish'**
  String get languageNameSpanish;

  /// No description provided for @languageTooltipPortugueseBrazil.
  ///
  /// In en_US, this message translates to:
  /// **'Portuguese (Brazil)'**
  String get languageTooltipPortugueseBrazil;

  /// No description provided for @languageTooltipEnglishUnitedStates.
  ///
  /// In en_US, this message translates to:
  /// **'English (United States)'**
  String get languageTooltipEnglishUnitedStates;

  /// No description provided for @languageTooltipSpanishMexico.
  ///
  /// In en_US, this message translates to:
  /// **'Spanish (Mexico)'**
  String get languageTooltipSpanishMexico;

  /// No description provided for @onboarding_subtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Your financial journey, simplified.'**
  String get onboarding_subtitle;

  /// No description provided for @onboarding_subtitle_1.
  ///
  /// In en_US, this message translates to:
  /// **'Your financial journey, simplified.'**
  String get onboarding_subtitle_1;

  /// No description provided for @onboarding_subtitle_2.
  ///
  /// In en_US, this message translates to:
  /// **'Track your expenses with ease.'**
  String get onboarding_subtitle_2;

  /// No description provided for @onboarding_subtitle_3.
  ///
  /// In en_US, this message translates to:
  /// **'Achieve your financial goals.'**
  String get onboarding_subtitle_3;

  /// No description provided for @register.
  ///
  /// In en_US, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @login.
  ///
  /// In en_US, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @cta_to_register_screen_text.
  ///
  /// In en_US, this message translates to:
  /// **'Ready to take control of your finances? Register now!'**
  String get cta_to_register_screen_text;

  /// No description provided for @emailRequired.
  ///
  /// In en_US, this message translates to:
  /// **'Email is required.'**
  String get emailRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en_US, this message translates to:
  /// **'Please enter a valid email address.'**
  String get invalidEmail;

  /// No description provided for @passwordRequired.
  ///
  /// In en_US, this message translates to:
  /// **'Password is required.'**
  String get passwordRequired;

  /// No description provided for @passwordLength.
  ///
  /// In en_US, this message translates to:
  /// **'Password must be at least 6 characters long.'**
  String get passwordLength;

  /// No description provided for @fieldRequired.
  ///
  /// In en_US, this message translates to:
  /// **'{fieldName} is required.'**
  String fieldRequired(Object fieldName);

  /// No description provided for @labelName.
  ///
  /// In en_US, this message translates to:
  /// **'Name'**
  String get labelName;

  /// No description provided for @nameValue.
  ///
  /// In en_US, this message translates to:
  /// **'Name'**
  String get nameValue;

  /// No description provided for @labelPhone.
  ///
  /// In en_US, this message translates to:
  /// **'Phone'**
  String get labelPhone;

  /// No description provided for @phoneValue.
  ///
  /// In en_US, this message translates to:
  /// **'Phone'**
  String get phoneValue;

  /// No description provided for @phoneRequired.
  ///
  /// In en_US, this message translates to:
  /// **'Phone number is required.'**
  String get phoneRequired;

  /// No description provided for @invalidPhoneMatch.
  ///
  /// In en_US, this message translates to:
  /// **'Please enter a valid phone number.'**
  String get invalidPhoneMatch;

  /// No description provided for @labelPhoneCode.
  ///
  /// In en_US, this message translates to:
  /// **'Phone Code'**
  String get labelPhoneCode;

  /// No description provided for @registerNameTitle.
  ///
  /// In en_US, this message translates to:
  /// **'What is your name?'**
  String get registerNameTitle;

  /// No description provided for @registerPhoneTitle.
  ///
  /// In en_US, this message translates to:
  /// **'What is your phone number?'**
  String get registerPhoneTitle;

  /// No description provided for @registerPhoneCodeTitle.
  ///
  /// In en_US, this message translates to:
  /// **'What is your phone code?'**
  String get registerPhoneCodeTitle;

  /// No description provided for @phoneCodeValue.
  ///
  /// In en_US, this message translates to:
  /// **'Phone Code'**
  String get phoneCodeValue;

  /// No description provided for @phoneCodeRequired.
  ///
  /// In en_US, this message translates to:
  /// **'Phone code is required.'**
  String get phoneCodeRequired;

  /// No description provided for @invalidPhoneCodeMatch.
  ///
  /// In en_US, this message translates to:
  /// **'Please enter a valid 4-digit phone code.'**
  String get invalidPhoneCodeMatch;

  /// No description provided for @previous.
  ///
  /// In en_US, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @next.
  ///
  /// In en_US, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @submitRegister.
  ///
  /// In en_US, this message translates to:
  /// **'Submit Register'**
  String get submitRegister;

  /// No description provided for @selectCountryCode.
  ///
  /// In en_US, this message translates to:
  /// **'Select country code'**
  String get selectCountryCode;

  /// No description provided for @registerSecurityCodeTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Security code verification'**
  String get registerSecurityCodeTitle;

  /// No description provided for @labelSecurityCode.
  ///
  /// In en_US, this message translates to:
  /// **'Security code'**
  String get labelSecurityCode;

  /// No description provided for @verifyingCode.
  ///
  /// In en_US, this message translates to:
  /// **'Verifying code...'**
  String get verifyingCode;

  /// No description provided for @codeVerifiedSuccess.
  ///
  /// In en_US, this message translates to:
  /// **'Code verified successfully!'**
  String get codeVerifiedSuccess;

  /// No description provided for @codeInvalid.
  ///
  /// In en_US, this message translates to:
  /// **'Invalid code.'**
  String get codeInvalid;

  /// No description provided for @errorVerifyingCode.
  ///
  /// In en_US, this message translates to:
  /// **'Error verifying code.'**
  String get errorVerifyingCode;

  /// No description provided for @editarTelefoneTextMessage.
  ///
  /// In en_US, this message translates to:
  /// **'Edit phone number'**
  String get editarTelefoneTextMessage;

  /// No description provided for @verifyPhoneNumberMessage.
  ///
  /// In en_US, this message translates to:
  /// **'We sent a message to the number {phoneNumber}'**
  String verifyPhoneNumberMessage(Object phoneNumber);

  /// No description provided for @resendCode.
  ///
  /// In en_US, this message translates to:
  /// **'Resend code'**
  String get resendCode;

  /// No description provided for @codeResendSuccess.
  ///
  /// In en_US, this message translates to:
  /// **'Code resent successfully'**
  String get codeResendSuccess;

  /// No description provided for @errorResendingCode.
  ///
  /// In en_US, this message translates to:
  /// **'Error sending code'**
  String get errorResendingCode;

  /// No description provided for @profileTooltip.
  ///
  /// In en_US, this message translates to:
  /// **'View profile'**
  String get profileTooltip;

  /// No description provided for @profileTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Manage your information and preferences.'**
  String get profileSubtitle;

  /// No description provided for @profileAccountSectionTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Account information'**
  String get profileAccountSectionTitle;

  /// No description provided for @profileContactSectionTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Contact information'**
  String get profileContactSectionTitle;

  /// No description provided for @profileIdLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Identifier'**
  String get profileIdLabel;

  /// No description provided for @profileEmailLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Email'**
  String get profileEmailLabel;

  /// No description provided for @profileStatusActive.
  ///
  /// In en_US, this message translates to:
  /// **'Active account'**
  String get profileStatusActive;

  /// No description provided for @profileStatusInactive.
  ///
  /// In en_US, this message translates to:
  /// **'Inactive account'**
  String get profileStatusInactive;

  /// No description provided for @profilePhoneVerified.
  ///
  /// In en_US, this message translates to:
  /// **'Phone verified'**
  String get profilePhoneVerified;

  /// No description provided for @profilePhoneUnverified.
  ///
  /// In en_US, this message translates to:
  /// **'Phone not verified'**
  String get profilePhoneUnverified;

  /// No description provided for @profileMissingData.
  ///
  /// In en_US, this message translates to:
  /// **'Information unavailable'**
  String get profileMissingData;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en':
      {
        switch (locale.countryCode) {
          case 'US':
            return AppLocalizationsEnUs();
        }
        break;
      }
    case 'es':
      {
        switch (locale.countryCode) {
          case 'MX':
            return AppLocalizationsEsMx();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
