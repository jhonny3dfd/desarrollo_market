import 'package:flutter/material.dart';

import 'user_to_login.dart';

class UserForm {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  UserForm();

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "El correo es obligatorio";
    }
    if (!value.contains("@") || !value.contains(".")) {
      return "Ingrese un correo valido";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "La contraseña es obligatoria";
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    String? res = passwordValidator(value);
    if (res != null) {return res;}

    return value == passwordController.text.trim() ? null : "Las contraseñas no coinciden";
  }

  void clearPasswords() {
    passwordController.clear();
    confirmPasswordController.clear();
  }

  User2Login toUser() {
    return User2Login(email: emailController.text.trim(), password: passwordController.text.trim());
  }
}