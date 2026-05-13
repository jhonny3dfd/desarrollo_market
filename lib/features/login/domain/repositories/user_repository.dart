import 'package:des_movil_proyect/shared/entities/user.dart';
import '../entities/user_to_login.dart';

abstract class UserRepository {
  User login(User2Login user);
}