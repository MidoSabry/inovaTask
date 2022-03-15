import 'package:inovatask/presentation/providers/mainpage_provider.dart';
import 'package:inovatask/presentation/providers/user_provider.dart';

import 'core/service/cache_service.dart';
import 'core/service/network_service.dart';
import 'data/datasources/my_application_local_datasource.dart';
import 'data/datasources/my_application_remote_datasource.dart';
import 'data/repositories/my_application_repository_impl.dart';
import 'domain/repositories/my_application_repository.dart';
import 'domain/usecases/get_coach_data_usecase.dart';
import 'domain/usecases/login_usecase.dart';

class Injector {
  final _flyweightMap = <String, dynamic>{};
  static final _singleton = Injector._internal();

  Injector._internal();
  factory Injector() => _singleton;

  MainProvider get mainProvider => MainProvider(getCoachDataUseCase);

  GetCoachDataUseCase get getCoachDataUseCase =>
      _flyweightMap['getCoachDataUseCase'] ??=
          GetCoachDataUseCase(myApplicationRepository);

  UserProvider get userProvider => UserProvider(getLoginUseCase);

  LoginUseCase get getLoginUseCase => _flyweightMap['getLoginUseCase'] ??=
      LoginUseCase(myApplicationRepository);

  MyApplicationRepository get myApplicationRepository =>
      _flyweightMap['myApplicationRepository'] ??= MyApplicationRepositoryImpl(
        myApplicationRemoteDataSource,
        myApplicationLocalDataSource,
      );

  MyApplicationRemoteDataSource get myApplicationRemoteDataSource =>
      _flyweightMap['myApplicationRemoteDataSource'] ??=
          MyApplicationRemoteDataSourceImpl(networkService);

  MyApplicationLocalDataSource get myApplicationLocalDataSource =>
      _flyweightMap['myApplicationLocalDataSource'] ??=
          MyApplicationLocalDataSourceImpl(cacheService);

  NetworkService get networkService =>
      _flyweightMap['networkService'] ??= NetworkServiceImpl();

  CacheService get cacheService =>
      _flyweightMap['cacheService'] ??= CacheServiceImpl();
}
