class User2Login {
  final String email;
  final String password;

  User2Login({required this.email, required String password}) :
    password = _encrypt(password);

  static String _encrypt(String password) {
    return password;
  }
}