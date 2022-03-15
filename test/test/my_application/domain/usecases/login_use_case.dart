import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([MyApplicationRepository])
void main() {
  late MockMyApplicationRepository _mockMyApplicationRepository;
  late LoginUseCase useCase;

  setUp(() {
    _mockMyApplicationRepository = MockMyApplicationRepository();
    useCase = LoginUseCase(_mockMyApplicationRepository);
  });

  test('Should login if the user data is valid', () async {
    // arrange
    const email = 'test@gmail.com';
    const password = 'q12345678';
    when(_mockMyApplicationRepository.login(email, password))
        .thenAnswer((_) => Future.value(true));

    // act
   final result = await useCase(email, password);

    // assert
    expect(result, true);
    verify(_mockMyApplicationRepository.login(email, password));
    verifyNoMoreInteractions(_mockMyApplicationRepository);
  });
}
