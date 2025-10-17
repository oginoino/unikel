import 'package:get_it/get_it.dart';

import '../services/user_data_service.dart';
import '../utils/constants/app_constants.dart';
import '../utils/constants/ui_constants.dart';

class DependencyInjection {
  DependencyInjection._();

  static void registerDependencies() {
    _registerUtils();
    _registerServices();
  }

  static void _registerUtils() {
    GetIt.I.registerLazySingleton<UIConstants>(() => UIConstants());
    GetIt.I.registerLazySingleton<AppConstants>(() => AppConstants());
  }

  static void _registerServices() {
    GetIt.I.registerLazySingleton<UserDataService>(() => UserDataService());
  }
}

UIConstants get uiConstants => GetIt.I<UIConstants>();
AppConstants get appConstants => GetIt.I<AppConstants>();
