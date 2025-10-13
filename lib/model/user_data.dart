class UserData {
  final String id;
  final String name;
  final String phone;
  final bool isPhoneVerified;

  UserData({
    required this.id,
    required this.name,
    required this.phone,
    required this.isPhoneVerified,
  });
}

class UserPreferences {
  final bool isFirstOpen; 

  UserPreferences({required this.isFirstOpen});
}
