import '../utils/imports/common_libs.dart';
import 'package:unikel/generated/app_localizations.dart';
import 'package:country_code_picker/country_code_picker.dart';

class LocaleConfig {
  LocaleConfig._();

  /// Get the app localization delegates
  static List<LocalizationsDelegate<dynamic>> get localizationDelegates => [
    AppLocalizations.delegate,
    CountryLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  /// Get the app supported locales
  static List<Locale> get supportedLocales => LocaleConstants.supportedLocales
      .map((localeData) => localeData.locale)
      .toList();
}
