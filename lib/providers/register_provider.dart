import '../utils/imports/common_libs.dart';
import 'onboarding_provider.dart';

class RegisterProvider {
  RegisterProvider._();

  static List<SingleChildWidget> registerProviders() {
    return [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ChangeNotifierProvider(create: (context) => OnboardingProvider()),
    ];
  }
}
