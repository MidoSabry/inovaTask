import 'package:flutter/cupertino.dart';
import 'package:inovatask/domain/usecases/login_usecase.dart';

class UserProvider with ChangeNotifier {
  UserProvider(this._loginUseCase);

  final LoginUseCase _loginUseCase;
  void login(String email, String password, Function onSuccess) async {
    var result = await _loginUseCase(email, password);

    if (result) {
      onSuccess();
    }
  }
}
