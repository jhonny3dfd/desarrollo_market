import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/login_viewmodel.dart';
import '../data/repositories/user_repository_impl.dart';

import 'pages/login_page.dart';

class _LoginDependencies {
  static LoginViewModel builLoginViewModel() {
    final repository = UserRepositoryImpl();

    return LoginViewModel(repository: repository);
  }
}

class LoginModule extends StatelessWidget {
  const LoginModule({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) =>  _LoginDependencies.builLoginViewModel(),
      child: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => LoginPage()
          );
        },
      )
    );
  }
}