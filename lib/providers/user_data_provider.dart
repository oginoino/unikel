import '../model/user_model.dart';
import '../services/user_data_service.dart';
import '../utils/imports/common_libs.dart';

class UserDataProvider extends ChangeNotifier {
  UserDataProvider({UserDataService? service})
    : _service = service ?? GetIt.I<UserDataService>() {
    unawaited(_initialize());
  }

  final UserDataService _service;

  List<UserData> _registeredUsers = const <UserData>[];
  UserData? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  List<UserData> get registeredUsers => _registeredUsers;
  UserData? get currentUser => _currentUser;
  bool get hasUser => _currentUser != null;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> _initialize() async {
    _isLoading = true;
    notifyListeners();
    try {
      await _service.ensureInitialized();
      _registeredUsers = await _service.fetchUsers();
      _currentUser = await _service.fetchCurrentUser();
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<UserData> registerConsumer({
    required String name,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = await _service.registerConsumer(
        name: name,
        email: email,
        password: password,
      );
      _currentUser = user;
      _registeredUsers = await _service.fetchUsers();
      return user;
    } catch (error) {
      _errorMessage = error.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> reload() async {
    await _initialize();
  }

  Future<UserData> login({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = await _service.loginConsumer(
        email: email,
        password: password,
      );
      _currentUser = user;
      _registeredUsers = await _service.fetchUsers();
      return user;
    } catch (error) {
      _errorMessage = error.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      await _service.logout();
      _currentUser = null;
    } catch (error) {
      _errorMessage = error.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> clear() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      await _service.clearAll();
      _registeredUsers = await _service.fetchUsers();
      _currentUser = await _service.fetchCurrentUser();
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
