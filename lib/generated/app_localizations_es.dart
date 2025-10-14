// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get languageSelection => 'Seleccionar Idioma';

  @override
  String get lightMode => 'Modo Claro';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get proceed => 'Proceder';

  @override
  String get languageNamePortuguese => 'Portugués';

  @override
  String get languageNameEnglish => 'Inglés';

  @override
  String get languageNameSpanish => 'Español';

  @override
  String get languageTooltipPortugueseBrazil => 'Portugués (Brasil)';

  @override
  String get languageTooltipEnglishUnitedStates => 'Inglés (Estados Unidos)';

  @override
  String get languageTooltipSpanishMexico => 'Español (México)';

  @override
  String get onboarding_subtitle => 'Tu viaje financiero, simplificado.';

  @override
  String get onboarding_subtitle_1 => 'Tu viaje financiero, simplificado.';

  @override
  String get onboarding_subtitle_2 => 'Controla tus gastos con facilidad.';

  @override
  String get onboarding_subtitle_3 => 'Alcanza tus metas financieras.';

  @override
  String get register => 'Registro';

  @override
  String get login => 'Inicio de Sesión';

  @override
  String get cta_to_register_screen_text =>
      '¿No tienes cuenta? Regístrate ahora.';

  @override
  String get emailRequired => 'El correo electrónico es obligatorio.';

  @override
  String get invalidEmail =>
      'Por favor, introduce un correo electrónico válido.';

  @override
  String get passwordRequired => 'La contraseña es obligatoria.';

  @override
  String get passwordLength =>
      'La contraseña debe tener al menos 6 caracteres.';

  @override
  String fieldRequired(Object fieldName) {
    return '$fieldName es obligatorio.';
  }

  @override
  String get labelName => 'Nombre';

  @override
  String get nameValue => 'Nombre';

  @override
  String get labelPhone => 'Teléfono';

  @override
  String get phoneValue => 'Teléfono';

  @override
  String get phoneRequired => 'El número de teléfono es obligatorio.';

  @override
  String get invalidPhoneMatch =>
      'Por favor, introduce un número de teléfono válido.';

  @override
  String get labelPhoneCode => 'Código telefónico';

  @override
  String get registerNameTitle => '¿Cuál es tu nombre?';

  @override
  String get registerPhoneTitle => '¿Cuál es tu número de teléfono?';

  @override
  String get registerPhoneCodeTitle => '¿Cuál es el código de tu teléfono?';

  @override
  String get phoneCodeValue => 'Código telefónico';

  @override
  String get phoneCodeRequired => 'El código telefónico es obligatorio.';

  @override
  String get invalidPhoneCodeMatch =>
      'Por favor, introduce un código telefónico válido de 4 dígitos.';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Siguiente';

  @override
  String get submitRegister => 'Registrar';

  @override
  String get selectCountryCode => 'Seleccionar código de país';

  @override
  String get registerSecurityCodeTitle => 'Verificación de código de seguridad';

  @override
  String get labelSecurityCode => 'Código de seguridad';

  @override
  String get verifyingCode => 'Verificando código...';

  @override
  String get codeVerifiedSuccess => 'Código verificado con éxito!';

  @override
  String get codeInvalid => 'Código inválido. Inténtalo de nuevo.';

  @override
  String get errorVerifyingCode =>
      'Error al verificar el código. Inténtalo de nuevo.';

  @override
  String get editarTelefoneTextMessage => 'Editar número de teléfono';

  @override
  String verifyPhoneNumberMessage(Object phoneNumber) {
    return 'Enviamos un mensaje al número $phoneNumber';
  }

  @override
  String get resendCode => 'Reenviar código';

  @override
  String get codeResendSuccess => 'Código reenviado exitosamente';

  @override
  String get errorResendingCode => 'Error al enviar el código';
}

/// The translations for Spanish Castilian, as used in Mexico (`es_MX`).
class AppLocalizationsEsMx extends AppLocalizationsEs {
  AppLocalizationsEsMx() : super('es_MX');

  @override
  String get languageSelection => 'Seleccionar Idioma';

  @override
  String get lightMode => 'Modo Claro';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get proceed => 'Proceder';

  @override
  String get languageNamePortuguese => 'Portugués';

  @override
  String get languageNameEnglish => 'Inglés';

  @override
  String get languageNameSpanish => 'Español';

  @override
  String get languageTooltipPortugueseBrazil => 'Portugués (Brasil)';

  @override
  String get languageTooltipEnglishUnitedStates => 'Inglés (Estados Unidos)';

  @override
  String get languageTooltipSpanishMexico => 'Español (México)';

  @override
  String get onboarding_subtitle => 'Tu viaje financiero, simplificado.';

  @override
  String get onboarding_subtitle_1 => 'Tu viaje financiero, simplificado.';

  @override
  String get onboarding_subtitle_2 => 'Controla tus gastos con facilidad.';

  @override
  String get onboarding_subtitle_3 => 'Alcanza tus metas financieras.';

  @override
  String get register => 'Registro';

  @override
  String get login => 'Inicio de Sesión';

  @override
  String get cta_to_register_screen_text =>
      '¿No tienes una cuenta? Regístrate ahora.';

  @override
  String get emailRequired => 'El correo electrónico es obligatorio.';

  @override
  String get invalidEmail =>
      'Por favor, introduce un correo electrónico válido.';

  @override
  String get passwordRequired => 'La contraseña es obligatoria.';

  @override
  String get passwordLength =>
      'La contraseña debe tener al menos 6 caracteres.';

  @override
  String fieldRequired(Object fieldName) {
    return '$fieldName es obligatorio.';
  }

  @override
  String get labelName => 'Nombre';

  @override
  String get nameValue => 'Nombre';

  @override
  String get labelPhone => 'Teléfono';

  @override
  String get phoneValue => 'Teléfono';

  @override
  String get phoneRequired => 'El número de teléfono es obligatorio.';

  @override
  String get invalidPhoneMatch =>
      'Por favor, introduce un número de teléfono válido.';

  @override
  String get labelPhoneCode => 'Código telefónico';

  @override
  String get registerNameTitle => '¿Cuál es tu nombre?';

  @override
  String get registerPhoneTitle => '¿Cuál es tu número de teléfono?';

  @override
  String get registerPhoneCodeTitle => '¿Cuál es el código de tu teléfono?';

  @override
  String get phoneCodeValue => 'Código telefónico';

  @override
  String get phoneCodeRequired => 'El código telefónico es obligatorio.';

  @override
  String get invalidPhoneCodeMatch =>
      'Por favor, introduce un código telefónico válido de 4 dígitos.';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Siguiente';

  @override
  String get submitRegister => 'Registrar';

  @override
  String get selectCountryCode => 'Seleccionar código de país';

  @override
  String get registerSecurityCodeTitle => 'Verificación de código de seguridad';

  @override
  String get labelSecurityCode => 'Código de seguridad';

  @override
  String get verifyingCode => 'Verificando código...';

  @override
  String get codeVerifiedSuccess => 'Código verificado con éxito!';

  @override
  String get codeInvalid => 'Código inválido. Inténtalo de nuevo.';

  @override
  String get errorVerifyingCode =>
      'Error al verificar el código. Inténtalo de nuevo.';

  @override
  String get editarTelefoneTextMessage => 'Editar número de teléfono';

  @override
  String verifyPhoneNumberMessage(Object phoneNumber) {
    return 'Enviamos un mensaje al número $phoneNumber';
  }

  @override
  String get resendCode => 'Reenviar código';

  @override
  String get codeResendSuccess => 'Código reenviado exitosamente';

  @override
  String get errorResendingCode => 'Error al enviar el código';
}
