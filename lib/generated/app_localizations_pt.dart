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
  String get phoneRequired => 'O número de telefone é obrigatório.';

  @override
  String get invalidPhoneMatch =>
      'Por favor, insira um número de telefone válido.';

  @override
  String get labelPhoneCode => 'Código do Telefone';

  @override
  String get registerNameTitle => 'Qual é o seu nome?';

  @override
  String get registerPhoneTitle => 'Qual é o seu telefone?';

  @override
  String get registerPhoneCodeTitle => 'Qual é o código do seu telefone?';

  @override
  String get phoneCodeValue => 'Código do Telefone';

  @override
  String get phoneCodeRequired => 'O código do telefone é obrigatório.';

  @override
  String get invalidPhoneCodeMatch =>
      'Por favor, insira um código de telefone válido de 4 dígitos.';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Próximo';

  @override
  String get submitRegister => 'Registrar';

  @override
  String get selectCountryCode => 'Selecione o código do país';

  @override
  String get registerSecurityCodeTitle => 'Verificação do código de segurança';

  @override
  String get labelSecurityCode => 'Código de segurança';

  @override
  String get verifyingCode => 'Verificando código...';

  @override
  String get codeVerifiedSuccess => 'Código verificado com sucesso!';

  @override
  String get codeInvalid => 'Código inválido. Tente novamente.';

  @override
  String get errorVerifyingCode => 'Erro ao verificar código. Tente novamente.';

  @override
  String get editarTelefoneTextMessage => 'Editar número de telefone';

  @override
  String verifyPhoneNumberMessage(Object phoneNumber) {
    return 'Enviamos uma mensagem para o número $phoneNumber';
  }

  @override
  String get resendCode => 'Enviar novamente';

  @override
  String get codeResendSuccess => 'Code resent successfully';

  @override
  String get errorResendingCode => 'Error sending code';

  @override
  String get profileTooltip => 'Abrir perfil';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileSubtitle => 'Gerencie seus dados e preferências.';

  @override
  String get profileAccountSectionTitle => 'Informações da conta';

  @override
  String get profileContactSectionTitle => 'Informações de contato';

  @override
  String get profileIdLabel => 'Identificador';

  @override
  String get profileEmailLabel => 'E-mail';

  @override
  String get profileStatusActive => 'Conta ativa';

  @override
  String get profileStatusInactive => 'Conta inativa';

  @override
  String get profilePhoneVerified => 'Telefone verificado';

  @override
  String get profilePhoneUnverified => 'Telefone não verificado';

  @override
  String get profileMissingData => 'Informação indisponível';

  @override
  String get loginPageTitle => 'Bem-vindo de volta';

  @override
  String get loginPageSubtitle =>
      'Entre com o telefone cadastrado para continuar.';

  @override
  String get loginPageRegisterCta => 'Não tem conta? Cadastre-se';

  @override
  String get loginUserNotFound =>
      'Não encontramos uma conta associada ao telefone informado.';

  @override
  String get loginGenericError =>
      'Não foi possível concluir o login. Tente novamente.';

  @override
  String get logout => 'Sair';

  @override
  String get logoutError =>
      'Não foi possível encerrar a sessão. Tente novamente.';
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
  String get phoneRequired => 'O número de telefone é obrigatório.';

  @override
  String get invalidPhoneMatch =>
      'Por favor, insira um número de telefone válido.';

  @override
  String get labelPhoneCode => 'Código do Telefone';

  @override
  String get registerNameTitle => 'Qual é o seu nome?';

  @override
  String get registerPhoneTitle => 'Qual é o seu telefone?';

  @override
  String get registerPhoneCodeTitle => 'Qual é o código do seu telefone?';

  @override
  String get phoneCodeValue => 'Código do Telefone';

  @override
  String get phoneCodeRequired => 'O código do telefone é obrigatório.';

  @override
  String get invalidPhoneCodeMatch =>
      'Por favor, insira um código de telefone válido de 4 dígitos.';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Próximo';

  @override
  String get submitRegister => 'Cadastrar';

  @override
  String get selectCountryCode => 'Selecione o código do país';

  @override
  String get registerSecurityCodeTitle => 'Verificação do código de segurança';

  @override
  String get labelSecurityCode => 'Código de segurança';

  @override
  String get verifyingCode => 'Verificando código...';

  @override
  String get codeVerifiedSuccess => 'Código verificado com sucesso!';

  @override
  String get codeInvalid => 'Código inválido. Tente novamente.';

  @override
  String get errorVerifyingCode =>
      'Erro ao verificar o código. Tente novamente.';

  @override
  String get editarTelefoneTextMessage => 'Editar número de telefone';

  @override
  String verifyPhoneNumberMessage(Object phoneNumber) {
    return 'Enviamos uma mensagem para o número $phoneNumber';
  }

  @override
  String get resendCode => 'Enviar novamente';

  @override
  String get codeResendSuccess => 'Código reenviado com sucesso';

  @override
  String get errorResendingCode => 'Erro ao tentar reenviar';

  @override
  String get profileTooltip => 'Abrir perfil';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileSubtitle => 'Gerencie seus dados e preferências.';

  @override
  String get profileAccountSectionTitle => 'Informações da conta';

  @override
  String get profileContactSectionTitle => 'Informações de contato';

  @override
  String get profileIdLabel => 'Identificador';

  @override
  String get profileEmailLabel => 'E-mail';

  @override
  String get profileStatusActive => 'Conta ativa';

  @override
  String get profileStatusInactive => 'Conta inativa';

  @override
  String get profilePhoneVerified => 'Telefone verificado';

  @override
  String get profilePhoneUnverified => 'Telefone não verificado';

  @override
  String get profileMissingData => 'Informação indisponível';

  @override
  String get loginPageTitle => 'Bem-vindo de volta';

  @override
  String get loginPageSubtitle =>
      'Entre com o telefone cadastrado para continuar.';

  @override
  String get loginPageRegisterCta => 'Não tem conta? Cadastre-se';

  @override
  String get loginUserNotFound =>
      'Não encontramos uma conta associada ao telefone informado.';

  @override
  String get loginGenericError =>
      'Não foi possível concluir o login. Tente novamente.';

  @override
  String get logout => 'Sair';

  @override
  String get logoutError =>
      'Não foi possível encerrar a sessão. Tente novamente.';
}
