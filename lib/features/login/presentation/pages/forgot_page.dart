import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'email_verification_page.dart';

import '../viewmodels/login_viewmodel.dart';
import '../widgets/form_container.dart';
import '../widgets/page_base.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  void _toVerificationPage(BuildContext context, LoginViewModel vm) {
    final esValido = _formKey.currentState?.validate() ?? false;
    if (!esValido) {return;}

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailVerificationPage()
      )
    );
  }

  void _back(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();
    final scheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;

    return PageDesign(
      titulo: "¿Olvidaste tu contraseña?",
      child: FormContainer(
        formKey: _formKey,
        footer: "Por seguridad, el enlace o código tendrá una validez limitada.",
        description: "Ingresa tu correo electrónico y te enviaremos un correo para restablecer tu contraseña.",
        buttons: [
          FilledButton.icon(
            onPressed: () => {_toVerificationPage(context, vm)},
            icon: const Icon(Icons.send),
            label: const Text("Enviar código"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: .circular(8)),
              padding: const EdgeInsets.symmetric(vertical: 20)
            )
          ),
          TextButton(
            onPressed: () => {_back(context)},
            child: Text("Volver al inicio de sesión", style: textScheme.labelLarge?.copyWith(color: scheme.primary))
          )
        ],
        children: [
          ...FormContainer.textInput(
            name: "Correo electrónico",
            hintText: "usuario@emaec.cl",
            prefixIcon: Icon(Icons.mail_outline),
            keyboardType: TextInputType.emailAddress,
            validator: vm.user.emailValidator,
            controller: vm.user.emailController,
            textScheme: textScheme
          ),
        ]
      )
    );
  }
}
