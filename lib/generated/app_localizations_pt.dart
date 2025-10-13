// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get languageSelection => 'Selecionar Idioma';

  @override
  String get lightMode => 'Modo Claro';

  @override
  String get darkMode => 'Modo Escuro';

  @override
  String get proceed => 'Prosseguir';

  @override
  String get languageNamePortuguese => 'Português';

  @override
  String get languageNameEnglish => 'Inglês';

  @override
  String get languageNameSpanish => 'Espanhol';

  @override
  String get languageTooltipPortugueseBrazil => 'Português (Brasil)';

  @override
  String get languageTooltipEnglishUnitedStates => 'Inglês (Estados Unidos)';

  @override
  String get languageTooltipSpanishMexico => 'Espanhol (México)';

  @override
  String get onboarding_subtitle => 'Sua jornada financeira, simplificada.';

  @override
  String get onboarding_subtitle_1 => 'Sua jornada financeira, simplificada.';

  @override
  String get onboarding_subtitle_2 => 'Controle seus gastos com facilidade.';

  @override
  String get onboarding_subtitle_3 => 'Alcance seus objetivos financeiros.';

  @override
  String get register => 'Cadastre-se';

  @override
  String get login => 'Entrar';

  @override
  String get cta_to_register_screen_text =>
      'Cadastre-se para começar a gerenciar suas finanças.';

  @override
  String get emailRequired => 'Email é obrigatório.';

  @override
  String get invalidEmail => 'Por favor, insira um email válido.';

  @override
  String get passwordRequired => 'Senha é obrigatória.';

  @override
  String get passwordLength => 'A senha deve ter pelo menos 6 caracteres.';

  @override
  String fieldRequired(Object fieldName) {
    return '$fieldName é obrigatório.';
  }

  @override
  String get labelName => 'Nome';

  @override
  String get nameValue => 'Nome';

  @override
  String get labelPhone => 'Telefone';

  @override
  String get phoneValue => 'Telefone';

  @override
  String get invalidPhoneMatch =>
      'Por favor, insira um número de telefone válido.';

  @override
  String get labelPhoneCode => 'Código do Telefone';

  @override
  String get phoneCodeValue => 'Código do Telefone';

  @override
  String get invalidPhoneCodeMatch =>
      'Por favor, insira um código de telefone válido de 4 dígitos.';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Próximo';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get languageSelection => 'Selecionar Idioma';

  @override
  String get lightMode => 'Modo Claro';

  @override
  String get darkMode => 'Modo Escuro';

  @override
  String get proceed => 'Prosseguir';

  @override
  String get languageNamePortuguese => 'Português';

  @override
  String get languageNameEnglish => 'Inglês';

  @override
  String get languageNameSpanish => 'Espanhol';

  @override
  String get languageTooltipPortugueseBrazil => 'Português (Brasil)';

  @override
  String get languageTooltipEnglishUnitedStates => 'Inglês (Estados Unidos)';

  @override
  String get languageTooltipSpanishMexico => 'Espanhol (México)';

  @override
  String get onboarding_subtitle => 'Sua jornada financeira, simplificada.';

  @override
  String get onboarding_subtitle_1 => 'Sua jornada financeira, simplificada.';

  @override
  String get onboarding_subtitle_2 => 'Controle seus gastos com facilidade.';

  @override
  String get onboarding_subtitle_3 => 'Alcance seus objetivos financeiros.';

  @override
  String get register => 'Cadastre-se';

  @override
  String get login => 'Entrar';

  @override
  String get cta_to_register_screen_text =>
      'Cadastre-se para começar a gerenciar seus gastos.';

  @override
  String get emailRequired => 'Email é obrigatório.';

  @override
  String get invalidEmail => 'Por favor, insira um email válido.';

  @override
  String get passwordRequired => 'Senha é obrigatória.';

  @override
  String get passwordLength => 'A senha deve ter pelo menos 6 caracteres.';

  @override
  String fieldRequired(Object fieldName) {
    return '$fieldName é obrigatório.';
  }

  @override
  String get labelName => 'Nome';

  @override
  String get nameValue => 'Nome';

  @override
  String get labelPhone => 'Telefone';

  @override
  String get phoneValue => 'Telefone';

  @override
  String get invalidPhoneMatch =>
      'Por favor, insira um número de telefone válido.';

  @override
  String get labelPhoneCode => 'Código do Telefone';

  @override
  String get phoneCodeValue => 'Código do Telefone';

  @override
  String get invalidPhoneCodeMatch =>
      'Por favor, insira um código de telefone válido de 4 dígitos.';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Próximo';
}
