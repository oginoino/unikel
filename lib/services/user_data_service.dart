import 'dart:convert';
import 'dart:io';

import '../model/user_data.dart';

/// File-backed service responsible for managing [UserData] instances.
///
/// The service serializes data into a local JSON document that simulates
/// persistence while keeping the implementation self-contained.
class UserDataService {
  UserDataService() {
    _initialization = _loadFromDisk();
  }

  static const String _storageFolderName = 'unikel_data';
  static const String _storageFileName = 'user_data_store.json';

  late final Future<void> _initialization;
  final List<UserData> _registeredUsers = <UserData>[];

  Future<void> ensureInitialized() => _initialization;

  Future<List<UserData>> fetchUsers() async {
    await ensureInitialized();
    return List.unmodifiable(_registeredUsers);
  }

  Future<UserData?> fetchCurrentUser() async {
    await ensureInitialized();
    return _registeredUsers.isEmpty ? null : _registeredUsers.last;
  }

  Future<UserData> registerConsumer({
    required String name,
    required String phone,
    String? email,
    bool isPhoneVerified = false,
  }) async {
    await ensureInitialized();

    await Future<void>.delayed(const Duration(milliseconds: 300));

    final user = UserData(
      id: _generateUserId(),
      email: email,
      active: true,
      role: UserRole.user,
      profileType: UserProfileType.consumer,
      consumerProfile: ConsumerProfileData(
        name: name,
        phone: phone,
        isPhoneVerified: isPhoneVerified,
      ),
      preferences: const UserPreferences(isFirstOpen: false),
      permissions: const <String>[UserPermission.viewProducts],
    );

    _registeredUsers.add(user);
    await _persist();
    return user;
  }

  Future<void> clearAll() async {
    await ensureInitialized();
    _registeredUsers.clear();
    await _persist();
  }

  Future<void> _loadFromDisk() async {
    final file = await _storageFile;
    if (await file.exists()) {
      final content = await file.readAsString();
      if (content.trim().isNotEmpty) {
        try {
          final Map<String, dynamic> payload =
              jsonDecode(content) as Map<String, dynamic>;
          final users = payload['users'];
          if (users is List) {
            _registeredUsers
              ..clear()
              ..addAll(
                users
                    .whereType<Map<String, dynamic>>()
                    .map(UserData.fromJson),
              );
          }
        } catch (_) {
          // If decoding fails we reset the file with default data.
          _registeredUsers.clear();
        }
      }
    }

    if (_registeredUsers.isEmpty) {
      await _persist();
    }
  }

  Future<void> _persist() async {
    final file = await _storageFile;
    final payload = <String, dynamic>{
      'updatedAt': DateTime.now().toUtc().toIso8601String(),
      'users': _registeredUsers.map((user) => user.toJson()).toList(),
    };
    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(payload),
    );
  }

  Future<File> get _storageFile async {
    final Directory baseDir = Directory.systemTemp;
    final Directory storageDir =
        Directory('${baseDir.path}/$_storageFolderName');
    if (!await storageDir.exists()) {
      await storageDir.create(recursive: true);
    }
    final File file = File('${storageDir.path}/$_storageFileName');
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    return file;
  }

  String _generateUserId() =>
      'consumer-${DateTime.now().millisecondsSinceEpoch}';
}
