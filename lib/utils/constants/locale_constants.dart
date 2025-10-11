
import '../imports/common_libs.dart';



class LocaleConstants {
  LocaleConstants._();

  /// Configuração base dos locales suportados
  static const List<MapEntry<Locale, String>> _baseLocales = [
    MapEntry(Locale('pt', 'BR'), '🇧🇷'),
    MapEntry(Locale('en', 'US'), '🇺🇸'),
    MapEntry(Locale('es', 'MX'), '🇲🇽'),
  ];

  /// Lista de LocaleData gerada dinamicamente
  static List<LocaleData> get supportedLocales => _baseLocales
      .map((entry) => LocaleData.fromLocale(entry.key, entry.value))
      .toList();

  // Removed unused tooltips, now using l10n directly in widgets
}