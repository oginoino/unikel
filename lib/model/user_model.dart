import 'user_enums.dart';
import 'user_parsers.dart';

const Object _unset = Object();

class UserData {
  UserData({
    required String id,
    String? email,
    this.active = true,
    this.role = UserRole.user,
    Iterable<String> permissions = const [],
    this.profileType = UserProfileType.consumer,
    String? profileId,
    ConsumerProfileData? consumerProfile,
    this.preferences = const UserPreferences(),
  }) : id = UserParsers.normalizeId(id),
       email = UserParsers.normalizeEmail(email),
       customPermissions = UserParsers.normalizePermissionsList(permissions),
       profileId = profileType == UserProfileType.serviceAccount
           ? null
           : UserParsers.normalizeNonEmptyString(profileId),
       consumerProfile = profileType == UserProfileType.consumer
           ? consumerProfile
           : null;

  factory UserData.fromJson(Map<String, dynamic> json) {
    final profileType = UserParsers.parseProfileType(
      json['profileType'] ?? json['profile_type'],
    );

    final consumerPayload =
        json['consumerProfile'] ?? json['consumer_profile'] ?? json['profile'];

    return UserData(
      id: json['id'] ?? json['_id'] ?? json['ID'] ?? '',
      email: json['email']?.toString(),
      active: UserParsers.parseBool(json['active'], fallback: false),
      role: UserParsers.parseUserRole(json['role']),
      permissions:
          (json['permissions'] as Iterable?)?.map((e) => e.toString()) ??
          const [],
      profileType: profileType,
      profileId:
          json['profileId']?.toString() ??
          json['profileID']?.toString() ??
          json['profile_id']?.toString(),
      consumerProfile:
          (profileType == UserProfileType.consumer &&
              consumerPayload is Map<String, dynamic>)
          ? ConsumerProfileData.fromJson(consumerPayload)
          : null,
      preferences: json['preferences'] is Map<String, dynamic>
          ? UserPreferences.fromJson(
              json['preferences'] as Map<String, dynamic>,
            )
          : const UserPreferences(),
    );
  }

  final String id;
  final String? email;
  final bool active;
  final UserRole role;

  /// Custom permissions granted beyond role-based defaults.
  final List<String> customPermissions;

  final UserProfileType profileType;
  final String? profileId;
  final ConsumerProfileData? consumerProfile;
  final UserPreferences preferences;

  // --- Domain Logic & Getters ---

  bool get isActive => active;
  bool get isConsumer => profileType == UserProfileType.consumer;

  String? get phoneNumber => isConsumer ? consumerProfile?.phone : null;
  bool get hasPhoneNumber => phoneNumber?.isNotEmpty ?? false;

  bool get isPhoneVerified =>
      isConsumer ? (consumerProfile?.isPhoneVerified ?? false) : false;

  List<String> get rolePermissions =>
      defaultRolePermissions[role] ?? const <String>[];

  List<String> get effectivePermissions {
    if (customPermissions.isEmpty) {
      return rolePermissions;
    }
    final merged = <String>{...rolePermissions, ...customPermissions}.toList()
      ..sort();
    return List.unmodifiable(merged);
  }

  bool hasRole(UserRole candidate) => role == candidate;

  bool hasAnyRole(Iterable<UserRole> roles) =>
      roles.any((candidate) => role == candidate);

  bool hasPermission(String permission) {
    final normalized = UserParsers.normalizePermission(permission);
    if (normalized == null) return false;

    if (rolePermissions.contains(normalized)) return true;
    return customPermissions.contains(normalized);
  }

  bool hasAllPermissions(Iterable<String> permissions) =>
      permissions.every(hasPermission);

  bool hasAnyPermission(Iterable<String> permissions) =>
      permissions.any(hasPermission);

  UserData copyWith({
    String? id,
    Object? email = _unset,
    bool? active,
    UserRole? role,
    Iterable<String>? permissions,
    UserProfileType? profileType,
    String? profileId,
    ConsumerProfileData? consumerProfile,
    UserPreferences? preferences,
  }) {
    final nextProfileType = profileType ?? this.profileType;

    final normalizedEmail = identical(email, _unset)
        ? this.email
        : UserParsers.normalizeEmail(email as String?);

    return UserData(
      id: id ?? this.id,
      email: normalizedEmail,
      active: active ?? this.active,
      role: role ?? this.role,
      permissions: permissions ?? customPermissions,
      profileType: nextProfileType,
      profileId: profileId ?? this.profileId,
      consumerProfile: nextProfileType == UserProfileType.consumer
          ? consumerProfile ?? this.consumerProfile
          : null,
      preferences: preferences ?? this.preferences,
    );
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{
      'id': id,
      'active': active,
      'role': role.value,
      'permissions': customPermissions,
      'profileType': profileType.value,
      'preferences': preferences.toJson(),
    };
    if (email != null) result['email'] = email;
    if (profileId != null) result['profileId'] = profileId;
    if (consumerProfile != null) {
      result['consumerProfile'] = consumerProfile!.toJson();
    }
    return result;
  }
}

// --- Sub Models ---

class ConsumerProfileData {
  ConsumerProfileData({
    String? name,
    required String phone,
    this.isPhoneVerified = false,
  }) : name = UserParsers.normalizeNonEmptyString(name),
       phone = UserParsers.normalizeRequiredPhone(phone);

  factory ConsumerProfileData.fromJson(Map<String, dynamic> json) {
    final rawPhone =
        json['phone'] ??
        json['phoneNumber'] ??
        json['phone_number'] ??
        json['mobile'];

    return ConsumerProfileData(
      name:
          json['name'] ??
          json['fullName'] ??
          json['full_name'] ??
          json['displayName']?.toString(),
      phone: rawPhone?.toString() ?? '',
      isPhoneVerified: UserParsers.parseBool(
        json['isPhoneVerified'] ??
            json['phoneVerified'] ??
            json['phone_verified'],
        fallback: false,
      ),
    );
  }

  final String? name;
  final String phone;
  final bool isPhoneVerified;

  ConsumerProfileData copyWith({
    String? name,
    String? phone,
    bool? isPhoneVerified,
  }) {
    return ConsumerProfileData(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
    );
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{
      'name': name,
      'phone': phone,
      'isPhoneVerified': isPhoneVerified,
    };
    result.removeWhere((_, value) => value == null);
    return result;
  }
}

class UserPreferences {
  const UserPreferences({this.isFirstOpen = true});

  factory UserPreferences.fromJson(Map<String, dynamic> json) {
    return UserPreferences(
      isFirstOpen: UserParsers.parseBool(
        json['isFirstOpen'] ?? json['is_first_open'],
        fallback: true,
      ),
    );
  }

  final bool isFirstOpen;

  UserPreferences copyWith({bool? isFirstOpen}) {
    return UserPreferences(isFirstOpen: isFirstOpen ?? this.isFirstOpen);
  }

  Map<String, dynamic> toJson() => {'isFirstOpen': isFirstOpen};
}
