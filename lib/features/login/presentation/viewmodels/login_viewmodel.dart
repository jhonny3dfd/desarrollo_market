import 'package:flutter/material.dart';

import '../../domain/entities/user_form.dart';
import '../../domain/entities/user_to_login.dart';
import '../../domain/repositories/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository repository;

  bool passwordEstaOculto = true;
  UserForm user = UserForm();

  LoginViewModel({required this.repository});

  void tryLogin(User2Login user) {
    repository.login(user);
  }

  void togglePasswordVisibility() {
    passwordEstaOculto = !passwordEstaOculto;
    notifyListeners();
  }
}