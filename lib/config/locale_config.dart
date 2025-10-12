import '../utils/imports/common_libs.dart';
import 'package:unikel/generated/app_localizations.dart';

class LocaleConfig {
  LocaleConfig._();

  /// Get the app localization delegates
  static List<LocalizationsDelegate<dynamic>> get localizationDelegates => [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  /// Get the app supported locales
  static List<Locale> get supportedLocales => LocaleConstants.supportedLocales
      .map((localeData) => localeData.locale)
      .toList();
}
