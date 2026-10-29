import 'dart:convert';

import 'package:himah/core/databases/cache/cache_helper.dart';
import 'package:himah/core/errors/expentions.dart';
import 'package:himah/features/on_boarding/data/models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cache;
  static const String _key = 'CachedUser';

  UserLocalDataSource({required this.cache});

  Future<void> cacheUser(UserModel user) async {
    final success = await cache.saveData(
      key: _key,
      value: json.encode(user.toJson()),
    );
    if (!success) {
      throw CacheExeption(errorMessage: 'Failed to cache user');
    }
  }

  Future<UserModel?> getCurrentUser() async {
    final jsonString = cache.getDataString(key: _key);
    if (jsonString == null) return null;

    try {
      return UserModel.fromJson(json.decode(jsonString));
    } catch (_) {
      throw CacheExeption(errorMessage: 'Failed to read cached user');
    }
  }
}
