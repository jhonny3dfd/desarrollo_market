import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // El archivo que acaba de crear el CLI
// import 'package:provider/provider.dart';

// import 'package:des_movil_proyect/core/network/firebase_baas.dart';

// import 'core/di/app_dependencies.dart';
import 'features/login/presentation/login_module.dart';
import 'app/theme/app_theme.dart' as theme;

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  theme.printColors();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    // return ChangeNotifierProvider<something>(
    //   create: (_) => AppDependencies.builAppDependencies(),
    //   child: MaterialApp(
    //     title: "EMAEC App",
    //     theme: theme.basic,
    //     home: const LoginModule(),
    //   ),
    // );
    return MaterialApp(
      title: "EMAEC App",
      theme: theme.basic,
      home: const LoginModule(),
    );
  }
}
