import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'my_application_repository_impl_test.mocks.dart';

@GenerateMocks([MyApplicationRemoteDataSource,MyApplicationLocalDataSource])
void main() {
  late MockMyApplicationRemoteDataSource _mockMyApplicationRemoteDataSource;
  late MockMyApplicationLocalDataSource _mockMyApplicationLocalDataSource;
  late MyApplicationRepository _myApplicationRepository;
  setUp(() {
    _mockMyApplicationRemoteDataSource = MockMyApplicationRemoteDataSource();
    _mockMyApplicationLocalDataSource = MockMyApplicationRemoteDataSource();
    _myApplicationRepository = MyApplicationRepositoryImpl(_mockMyApplicationRemoteDataSource,_mockMyApplicationLocalDataSource);
  });

  test('Should Login if use email and passwords are valid and save the user data to cache', () async {
    // arrange
    const email = 'test@test.com';
    const password = '123456';

    //act 
    final result =await _myApplicationRepository.login(email, password);

    // assert
    expect(result, true);
});
}