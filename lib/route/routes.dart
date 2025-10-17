class RouteInfo {
  final String name;
  final String path;

  const RouteInfo({required this.name, required this.path});
}

class Routes {
  static const List<RouteInfo> routes = [
    RouteInfo(name: 'Home', path: '/'),
    RouteInfo(name: 'Onboarding', path: '/onboarding'),
    RouteInfo(name: 'FirstAccessCtaToRegister', path: '/first-access'),
    RouteInfo(name: 'RegisterUser', path: '/register-user'),
    RouteInfo(name: 'Profile', path: '/profile'),
    RouteInfo(name: 'Login', path: '/login'),
  ];

  // Helper method to get route by name
  static String getPathByName(String name) {
    return routes.firstWhere((route) => route.name == name).path;
  }

  // Helper method to get all route names
  static List<String> get allRouteNames =>
      routes.map((route) => route.name).toList();

  // Convenience getters for easy access
  static String get home =>
      routes.firstWhere((route) => route.name == 'Home').path;
  static String get onboarding =>
      routes.firstWhere((route) => route.name == 'Onboarding').path;
  static String get firstAccessCtaToRegister => routes
      .firstWhere((route) => route.name == 'FirstAccessCtaToRegister')
      .path;
  static String get registerUser =>
      routes.firstWhere((route) => route.name == 'RegisterUser').path;
  static String get profile =>
      routes.firstWhere((route) => route.name == 'Profile').path;
  static String get login =>
      routes.firstWhere((route) => route.name == 'Login').path;
}
