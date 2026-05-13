import 'package:flutter/material.dart';

import '../../domain/entities/user_form.dart';
import '../../domain/entities/user_to_login.dart';
import '../../domain/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart'; // <--- ESTA ES LA PARTE EXACTA
import '../pages/forgot_page.dart';
import '../viewmodels/login_viewmodel.dart';
// ... el resto de tus imports

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