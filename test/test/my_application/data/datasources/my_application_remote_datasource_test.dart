import 'package:flutter_test/flutter_test.dart';


void main() {
  late MyApplicationRemoteDataSource _myApplicationRemoteDataSource;
  setUp(() {
    _myApplicationRemoteDataSource =
        MyApplicationRemoteDataSourceImpl(NetworkServiceImpl());
  });

  test('Should Login if use email and passwords are valide', () async {
    // arrange
    const email = 'test@test.com';
    const password = '123456';
    final user = User(id: 1,email:'test@test.com',name:"Ahmed Ali");
  
    // act
    final result = await _myApplicationRemoteDataSource.login(email, password);

    // assert
    expect(result, user);
  
  });



}