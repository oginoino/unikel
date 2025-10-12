import '../utils/imports/common_libs.dart';

class OnboardingProvider extends ChangeNotifier {
  bool _isOnboardingComplete = false;

  bool get isOnboardingComplete => _isOnboardingComplete;

  void setOnboardingComplete(bool value) {
    _isOnboardingComplete = value;
    notifyListeners();
  }
}
