import 'package:des_movil_proyect/shared/entities/user.dart';
import 'package:des_movil_proyect/shared/entities/roles.dart'; // temporal, eliminar luego
import 'package:flutter/material.dart'; // temporal, eliminar luego

import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user_to_login.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  User login(User2Login user) {
    debugPrint("Correo: ${user.email}");
    debugPrint("Contrasena: ${user.password}");
    return User(user.email, "", Rol.administrativo);
  }
}