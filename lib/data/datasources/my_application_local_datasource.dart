import 'package:inovatask/data/models/user.dart';

import '../../../../../core/service/network_service.dart';
import '../../../../../core/service/cache_service.dart';

abstract class MyApplicationLocalDataSource {
  Future<void> saveUser(User user);
  Future<User?> getUser();
}

class MyApplicationLocalDataSourceImpl implements MyApplicationLocalDataSource {
  final CacheService _cacheService;

  MyApplicationLocalDataSourceImpl(this._cacheService);

  @override
  Future<void> saveUser(User user) {
    return _cacheService.saveUserData(user.toJson());
  }

  @override
  Future<User?> getUser() async {
    final userJson = await _cacheService.getUserData();

    return userJson != null ? User.fromJson(userJson) : null;
  }
}
