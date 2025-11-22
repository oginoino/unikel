enum UserRole { admin, manager, user }

extension UserRoleX on UserRole {
  String get value => name;
}

enum UserProfileType { serviceAccount, partnerManager, consumer }

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

  static const List<String> values = [
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

/// Definição das permissões padrão por Role
const Map<UserRole, List<String>> defaultRolePermissions = {
  UserRole.admin: [
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
  UserRole.manager: [
    UserPermission.editProducts,
    UserPermission.editPartners,
    UserPermission.viewUsers,
    UserPermission.viewProducts,
    UserPermission.viewPartners,
  ],
  UserRole.user: [UserPermission.viewProducts],
};
