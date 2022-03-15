import 'package:inovatask/data/datasources/my_application_local_datasource.dart';
import 'package:inovatask/data/models/trainingseries.dart';

import '../../domain/repositories/my_application_repository.dart';
import '../datasources/my_application_remote_datasource.dart';

class MyApplicationRepositoryImpl implements MyApplicationRepository {
  final MyApplicationRemoteDataSource _myApplicationRemoteDataSource;
  final MyApplicationLocalDataSource _myApplicationLocalDataSource;
  MyApplicationRepositoryImpl(
      this._myApplicationRemoteDataSource, this._myApplicationLocalDataSource);

  @override
  Future<bool> login(String email, String password) async {
    final user = await _myApplicationRemoteDataSource.login(email, password);

    if (user == null) {
      return false;
    }

    _myApplicationLocalDataSource.saveUser(user);
    return user != null;
  }

  @override
  Future<TrainingSeries> getData() {
    return _myApplicationRemoteDataSource.getCoachData();
  }
}
