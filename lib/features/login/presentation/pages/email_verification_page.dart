import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:des_movil_proyect/shared/widgets/successful_baner.dart';

import '../viewmodels/login_viewmodel.dart';
import 'new_password_page.dart';
import '../widgets/form_container.dart';
import '../widgets/page_base.dart';

// Falta validar el codigo, y crear logica que muestre el banner de codigo invalido.
// Agregar boton de reenviar codigo

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
} 

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final _formKey = GlobalKey<FormState>();

  final int length = 6;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();

    controllers =
        List.generate(length, (_) => TextEditingController());

    focusNodes =
        List.generate(length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }

    for (var f in focusNodes) {
      f.dispose();
    }

    super.dispose();
  }

  Widget buildOtpBox(int index) {
    return SizedBox(
      width: 40,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10)
        ),
        onChanged: (value) {
          // Avanzar al siguiente campo
          if (value.isNotEmpty && index < length - 1) {
            FocusScope.of(context)
                .requestFocus(focusNodes[index + 1]);
          }

          // Volver al anterior si se borra
          if (value.isEmpty && index > 0) {
            FocusScope.of(context)
                .requestFocus(focusNodes[index - 1]);
          }
        },
      ),
    );
  }

  void _get() {
    String code = controllers.map((c) => c.text).join();
    debugPrint(code);
  }

  void _back(BuildContext context) {
    Navigator.pop(context);
  }

  void _validarCodigo(LoginViewModel vm) {
    vm.user.clearPasswords();
    _get();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NewPasswordPage()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();
    final scheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;

    return PageDesign(
      titulo: "Verifica tu correo",
      baner: SuccessfulBaner(icon: Icons.mail_outline, text: vm.user.emailController.text.trim(), maxWidth: 300),
      child: FormContainer(
        formKey: _formKey,
        footer: "Por seguridad, el enlace o código tendrá una validez limitada.",
        description: "Ingresa el código que enviamos a tu correo para restablecer tu contraseña.",
        buttons: [
          FilledButton.icon(
            onPressed: () => {_validarCodigo(vm)},
            icon: const Icon(Icons.check_circle_outline_outlined),
            label: const Text("Validar código"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: .circular(8)),
              padding: const EdgeInsets.symmetric(vertical: 20)
            )
          ),
          TextButton(
            onPressed: () => {_back(context)},
            child: Text("Volver", style: textScheme.labelLarge?.copyWith(color: scheme.primary))
          )
        ],
        children: [
          ...FormContainer.simpleContainer(
            name: "Código de verificación",
            textScheme: textScheme,
            child: Row(
              mainAxisAlignment: .center,
              children: List.generate(
                length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: buildOtpBox(index),
                )
              ),
            )
          )
        ]
      )
    );
  }
}