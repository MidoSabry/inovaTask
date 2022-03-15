import 'package:inovatask/domain/repositories/my_application_repository.dart';

class LoginUseCase {
  LoginUseCase(this.repository);

  final MyApplicationRepository repository;

  Future<bool> call(String email, String password) async {
    return repository.login(email, password);
  }
}
