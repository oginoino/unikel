import '../utils/imports/common_libs.dart';

class OnboardingProvider extends ChangeNotifier {
  bool _isOnboardingComplete = false;
  bool _isFirstAccessComplete = false;

  bool get isOnboardingComplete => _isOnboardingComplete;
  bool get isFirstAccessComplete => _isFirstAccessComplete;

  void setOnboardingComplete(bool value) {
    _isOnboardingComplete = value;
    notifyListeners();
  }

  void setFirstAccessComplete(bool value) {
    _isFirstAccessComplete = value;
    notifyListeners();
  }
}
