import 'user_enums.dart';

abstract final class UserParsers {
  static String normalizeId(dynamic value) {
    return normalizeNonEmptyString(value?.toString() ?? '') ?? '';
  }

  static String? normalizeNonEmptyString(String? value) {
    if (value == null) return null;
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  static String normalizeRequiredPhone(String? value) {
    final normalized = normalizeNonEmptyString(value);
    if (normalized == null) {
      throw ArgumentError('Consumer phone number is required.');
    }
    return normalized;
  }

  static String? normalizeEmail(String? email) {
    if (email == null) return null;
    final normalized = email.trim().toLowerCase();
    return normalized.isEmpty ? null : normalized;
  }

  static String? normalizePermission(String? permission) {
    if (permission == null) return null;
    final normalized = permission.trim().toLowerCase();
    return normalized.isEmpty ? null : normalized;
  }

  static List<String> normalizePermissionsList(Iterable? permissions) {
    if (permissions == null) return const [];

    final normalized = <String>{};
    for (final p in permissions) {
      final value = normalizePermission(p?.toString());
      if (value != null) {
        normalized.add(value);
      }
    }

    if (normalized.isEmpty) return const [];

    final sorted = normalized.toList()..sort();
    return List.unmodifiable(sorted);
  }

  static UserRole parseUserRole(dynamic role) {
    final candidate = normalizePermission(role?.toString());
    if (candidate == null) return UserRole.user;

    return UserRole.values.firstWhere(
      (value) => value.name == candidate,
      orElse: () => UserRole.user,
    );
  }

  static UserProfileType parseProfileType(dynamic profileType) {
    final candidate = normalizePermission(profileType?.toString());
    if (candidate == null) return UserProfileType.serviceAccount;

    return UserProfileType.values.firstWhere(
      (value) => value.name == candidate,
      orElse: () => UserProfileType.serviceAccount,
    );
  }

  static bool parseBool(dynamic value, {required bool fallback}) {
    if (value is bool) return value;
    if (value is num) {
      if (value == 1) return true;
      if (value == 0) return false;
    }
    if (value is String) {
      final normalized = value.trim().toLowerCase();
      if (normalized == 'true' || normalized == '1') return true;
      if (normalized == 'false' || normalized == '0') return false;
    }
    return fallback;
  }
}
