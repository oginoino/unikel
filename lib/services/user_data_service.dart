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
  String? _currentUserId;

  Future<void> ensureInitialized() => _initialization;

  Future<List<UserData>> fetchUsers() async {
    await ensureInitialized();
    return List.unmodifiable(_registeredUsers);
  }

  Future<UserData?> fetchCurrentUser() async {
    await ensureInitialized();
    if (_currentUserId == null) {
      return null;
    }
    for (final user in _registeredUsers) {
      if (user.id == _currentUserId) {
        return user;
      }
    }
    return null;
  }

  Future<UserData> registerConsumer({
    required String name,
    required String phone,
    String? email,
    bool isPhoneVerified = false,
  }) async {
    await ensureInitialized();

    final normalizedPhone = _normalizePhone(phone);
    final phoneInUse = _registeredUsers.any(
      (user) => user.consumerProfile?.phone == normalizedPhone,
    );
    if (phoneInUse) {
      throw StateError(
        'Já existe um usuário registrado com o telefone informado.',
      );
    }

    await Future<void>.delayed(const Duration(milliseconds: 300));

    final user = UserData(
      id: _generateUserId(),
      email: email,
      active: true,
      role: UserRole.user,
      profileType: UserProfileType.consumer,
      consumerProfile: ConsumerProfileData(
        name: name,
        phone: normalizedPhone,
        isPhoneVerified: isPhoneVerified,
      ),
      preferences: const UserPreferences(isFirstOpen: false),
      permissions: const <String>[UserPermission.viewProducts],
    );

    _registeredUsers.add(user);
    _currentUserId = user.id;
    await _persist();
    return user;
  }

  Future<UserData> loginConsumer({
    required String phone,
  }) async {
    await ensureInitialized();

    final normalizedPhone = _normalizePhone(phone);
    final user = _registeredUsers.firstWhere(
      (candidate) => candidate.consumerProfile?.phone == normalizedPhone,
      orElse: () => throw StateError(
        'Nenhum usuário encontrado com o telefone informado.',
      ),
    );

    await Future<void>.delayed(const Duration(milliseconds: 200));

    _currentUserId = user.id;
    await _persist();
    return user;
  }

  Future<void> logout() async {
    await ensureInitialized();
    _currentUserId = null;
    await _persist();
  }

  Future<void> clearAll() async {
    await ensureInitialized();
    _registeredUsers.clear();
    _currentUserId = null;
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
          final currentUserId = payload['currentUserId'];
          if (currentUserId is String &&
              currentUserId.isNotEmpty &&
              _registeredUsers.any((user) => user.id == currentUserId)) {
            _currentUserId = currentUserId;
          } else {
            _currentUserId = null;
          }
        } catch (_) {
          // If decoding fails we reset the file with default data.
          _registeredUsers.clear();
          _currentUserId = null;
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
    if (_currentUserId != null) {
      payload['currentUserId'] = _currentUserId;
    }
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

  String _normalizePhone(String value) {
    final sanitized = value.replaceAll(RegExp(r'[^0-9+]'), '');
    final trimmed = sanitized.trim();
    if (trimmed.isEmpty) {
      throw ArgumentError('O telefone informado é inválido.');
    }
    return trimmed;
  }
}
