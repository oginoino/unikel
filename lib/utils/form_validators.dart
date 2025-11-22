import 'package:glassy/utils/imports/common_libs.dart';

class FormValidators {
  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.l10n.emailRequired;
    }
    // Regex for email validation
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return context.l10n.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.l10n.passwordRequired;
    }
    if (value.length < 6) {
      return context.l10n.passwordLength;
    }
    return null;
  }

  static String? validateRequired(
    String? value,
    String fieldName,
    BuildContext context,
  ) {
    if (value == null || value.isEmpty) {
      return context.l10n.fieldRequired(fieldName);
    }
    return null;
  }

  static String? validatePhone(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.l10n.phoneRequired;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return context.l10n.invalidPhoneMatch;
    }
    return null;
  }

  static String? validatePhoneCode(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.l10n.phoneCodeRequired;
    }
    if (!RegExp(r'^[0-9]{4}$').hasMatch(value)) {
      return context.l10n.invalidPhoneCodeMatch;
    }
    return null;
  }
}
