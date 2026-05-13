import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:des_movil_proyect/shared/widgets/successful_baner.dart';

import 'login_page.dart';
import '../viewmodels/login_viewmodel.dart';
import '../widgets/form_container.dart';
import '../widgets/page_base.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  void _updatePassword(BuildContext context, LoginViewModel vm) {
    final esValido = _formKey.currentState?.validate() ?? false;
    if (!esValido) {return;}

    _toLogin(context, vm);
  }

  void _toLogin(BuildContext context, LoginViewModel vm) {
    vm.user.clearPasswords();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage()
      ),
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();
    final scheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;

    return PageDesign(
      titulo: "Crear nueva contraseña",
      baner: SuccessfulBaner(icon: Icons.mail_outline, text: vm.user.emailController.text.trim(), maxWidth: 300),
      child: FormContainer(
        formKey: _formKey,
        footer: "Utilize una combinación de letras y numeros para crear una contraseña mas segura",
        description: "Ingresa una nueva contraseña segura para acceder nuevamente a tu cuenta.",
        buttons: [
          FilledButton.icon(
            onPressed: () => {_updatePassword(context, vm)},
            icon: const Icon(Icons.update),
            label: const Text("Actualizar contraseña"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: .circular(8)),
              padding: const EdgeInsets.symmetric(vertical: 20)
            )
          ),
          TextButton(
            onPressed: () => {_toLogin(context, vm)},
            child: Text("Volver al inicio de sesión", style: textScheme.labelLarge?.copyWith(color: scheme.primary))
          )
        ],
        children: [
          ...FormContainer.textInput(
            name: "Contraseña",
            hintText: "********",
            prefixIcon: Icon(Icons.lock_outline),
            keyboardType: TextInputType.visiblePassword,
            validator: vm.user.passwordValidator,
            controller: vm.user.passwordController,
            textScheme: textScheme,
            suffixIcon: IconButton(
              icon: Icon(vm.passwordEstaOculto ? Icons.visibility_outlined : Icons.visibility_off_outlined),
              onPressed: vm.togglePasswordVisibility,
            ),
            estaOculto: vm.passwordEstaOculto
          ),
          ...FormContainer.textInput(
            name: "Confirmar ontraseña",
            hintText: "********",
            prefixIcon: Icon(Icons.lock_outline),
            keyboardType: TextInputType.visiblePassword,
            validator: vm.user.confirmPasswordValidator,
            controller: vm.user.confirmPasswordController,
            textScheme: textScheme,
            estaOculto: true
          ),
        ]
      )
    );
  }
}