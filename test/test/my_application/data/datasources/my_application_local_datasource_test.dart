import 'package:flutter_test/flutter_test.dart';



@GenerateMocks([CacheService])
void main() {
  late MyApplicationLocalDataSource _myApplicationLocalDataSource;
  setUp(() {
    _myApplicationLocalDataSource =
        MyApplicationLocalDataSourceImpl(CacheServiceImpl());
  });

  test('Should save user data to cache after login', () async {
    // arrange
    final user = User(id: 1,email:'test@test.com',name:"Ahmed Ali");
  
    // act
     await _myApplicationLocalDataSource.saveUser(user);
  
  });



}