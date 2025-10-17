const Object _unset = Object();

/// Frontend representation of the backend `User` entity focused on consumer accounts.
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
  })  : id = _normalizeNonEmptyString(id),
        email = _normalizeEmail(email),
        customPermissions = _normalizePermissions(permissions),
        profileId = profileType == UserProfileType.serviceAccount
            ? null
            : _normalizeNullableString(profileId),
        consumerProfile = profileType == UserProfileType.consumer
            ? consumerProfile
            : null;

  factory UserData.fromJson(Map<String, dynamic> json) {
    final profileType = _parseProfileType(
      json['profileType'] ?? json['profile_type'],
    );

    final consumerPayload = json['consumerProfile'] ??
        json['consumer_profile'] ??
        json['profile'];

    return UserData(
      id: _normalizeNonEmptyString(
        json['id'] ?? json['_id'] ?? json['ID'] ?? '',
      ),
      email: _normalizeEmail(json['email']?.toString()),
      active: _parseBool(json['active'], fallback: false),
      role: _parseUserRole(json['role']),
      permissions: (json['permissions'] as Iterable?)
              ?.map((value) => value?.toString() ?? '')
              .where((value) => value.isNotEmpty) ??
          const <String>[],
      profileType: profileType,
      profileId: _normalizeNullableString(
        json['profileId'] ?? json['profileID'] ?? json['profile_id'],
      ),
      consumerProfile: profileType == UserProfileType.consumer &&
              consumerPayload is Map<String, dynamic>
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

  bool get isActive => active;

  bool get isConsumer => profileType == UserProfileType.consumer;

  String? get phoneNumber =>
      isConsumer ? consumerProfile?.phone : null;

  bool get hasPhoneNumber => phoneNumber?.isNotEmpty ?? false;

  bool get isPhoneVerified =>
      isConsumer ? (consumerProfile?.isPhoneVerified ?? false) : false;

  List<String> get rolePermissions =>
      _rolePermissions[role] ?? const <String>[];

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
    final normalized = _normalizePermission(permission);
    if (normalized == null) {
      return false;
    }
    if ((_rolePermissions[role] ?? const <String>[]).contains(normalized)) {
      return true;
    }
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
        : _normalizeEmail(email as String?);
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
    if (email != null) {
      result['email'] = email;
    }
    if (profileId != null) {
      result['profileId'] = profileId;
    }
    if (consumerProfile != null) {
      result['consumerProfile'] = consumerProfile!.toJson();
    }
    return result;
  }
}

class ConsumerProfileData {
  ConsumerProfileData({
    String? name,
    required String phone,
    this.isPhoneVerified = false,
  })  : name = _normalizeNullableString(name),
        phone = _normalizeRequiredPhone(phone);

  factory ConsumerProfileData.fromJson(Map<String, dynamic> json) {
    final rawPhone = json['phone'] ??
        json['phoneNumber'] ??
        json['phone_number'] ??
        json['mobile'];
    return ConsumerProfileData(
      name: json['name'] ??
          json['fullName'] ??
          json['full_name'] ??
          json['displayName'],
      phone: rawPhone?.toString() ?? '',
      isPhoneVerified: _parseBool(
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
      isFirstOpen: _parseBool(
        json['isFirstOpen'] ?? json['is_first_open'],
        fallback: true,
      ),
    );
  }

  final bool isFirstOpen;

  UserPreferences copyWith({bool? isFirstOpen}) {
    return UserPreferences(
      isFirstOpen: isFirstOpen ?? this.isFirstOpen,
    );
  }

  Map<String, dynamic> toJson() => {
        'isFirstOpen': isFirstOpen,
      };
}

enum UserRole { admin, manager, user }

extension UserRoleX on UserRole {
  String get value => name;
}

enum UserProfileType {
  serviceAccount,
  partnerManager,
  consumer,
}

extension UserProfileTypeX on UserProfileType {
  String get value => name;
}

abstract final class UserPermission {
  static const String manageUsers = 'users:manage';
  static const String manageProducts = 'products:manage';
  static const String managePartners = 'partners:manage';

  static const String editUsers = 'users:edit';
  static const String editProducts = 'products:edit';
  static const String editPartners = 'partners:edit';

  static const String viewUsers = 'users:view';
  static const String viewProducts = 'products:view';
  static const String viewPartners = 'partners:view';

  static const List<String> values = <String>[
    manageUsers,
    manageProducts,
    managePartners,
    editUsers,
    editProducts,
    editPartners,
    viewUsers,
    viewProducts,
    viewPartners,
  ];
}

const Map<UserRole, List<String>> _rolePermissions = <UserRole, List<String>>{
  UserRole.admin: <String>[
    UserPermission.manageUsers,
    UserPermission.manageProducts,
    UserPermission.managePartners,
    UserPermission.editUsers,
    UserPermission.editProducts,
    UserPermission.editPartners,
    UserPermission.viewUsers,
    UserPermission.viewProducts,
    UserPermission.viewPartners,
  ],
  UserRole.manager: <String>[
    UserPermission.editProducts,
    UserPermission.editPartners,
    UserPermission.viewUsers,
    UserPermission.viewProducts,
    UserPermission.viewPartners,
  ],
  UserRole.user: <String>[
    UserPermission.viewProducts,
  ],
};

String _normalizeNonEmptyString(String value) {
  final trimmed = value.trim();
  return trimmed.isEmpty ? '' : trimmed;
}

String? _normalizeEmail(String? email) {
  if (email == null) {
    return null;
  }
  final normalized = email.trim().toLowerCase();
  return normalized.isEmpty ? null : normalized;
}

String? _normalizeNullableString(dynamic value) {
  if (value == null) {
    return null;
  }
  final normalized = value.toString().trim();
  return normalized.isEmpty ? null : normalized;
}

String _normalizeRequiredPhone(String? value) {
  final normalized = _normalizeNullableString(value);
  if (normalized == null) {
    throw ArgumentError('Consumer phone number is required.');
  }
  return normalized;
}

List<String> _normalizePermissions(Iterable<String> permissions) {
  final normalized = <String>{};
  for (final permission in permissions) {
    final value = _normalizePermission(permission);
    if (value != null) {
      normalized.add(value);
    }
  }
  if (normalized.isEmpty) {
    return const <String>[];
  }
  final sorted = normalized.toList()..sort();
  return List.unmodifiable(sorted);
}

String? _normalizePermission(String? permission) {
  if (permission == null) {
    return null;
  }
  final normalized = permission.trim().toLowerCase();
  return normalized.isEmpty ? null : normalized;
}

UserRole _parseUserRole(dynamic role) {
  final candidate = _normalizePermission(role?.toString());
  if (candidate == null) {
    return UserRole.user;
  }
  return UserRole.values.firstWhere(
    (value) => value.name == candidate,
    orElse: () => UserRole.user,
  );
}

UserProfileType _parseProfileType(dynamic profileType) {
  final candidate = _normalizePermission(profileType?.toString());
  if (candidate == null) {
    return UserProfileType.serviceAccount;
  }
  return UserProfileType.values.firstWhere(
    (value) => value.name == candidate,
    orElse: () => UserProfileType.serviceAccount,
  );
}

bool _parseBool(dynamic value, {required bool fallback}) {
  if (value is bool) {
    return value;
  }
  if (value is num) {
    if (value == 1) return true;
    if (value == 0) return false;
  }
  if (value is String) {
    final normalized = value.trim().toLowerCase();
    if (normalized == 'true' || normalized == '1') {
      return true;
    }
    if (normalized == 'false' || normalized == '0') {
      return false;
    }
  }
  return fallback;
}
