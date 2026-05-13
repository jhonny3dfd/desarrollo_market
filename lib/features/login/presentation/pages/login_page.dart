import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'forgot_page.dart';
import '../viewmodels/login_viewmodel.dart';
import '../widgets/form_container.dart';
import '../widgets/page_base.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  void _toForgotPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPassword()),
    );
  }

  void _sendForm(LoginViewModel vm) {
    final esValido = _formKey.currentState?.validate() ?? false;
    if (!esValido) {
      return;
    }

    vm.tryLogin(vm.user.toUser());
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();
    final scheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;

    return PageDesign(
      child: FormContainer(
        formKey: _formKey,
        footer:
            "Despues de 3 intentos fallidos, la cuenta se bloqueara temporalmente.",
        buttons: [
          FilledButton.icon(
            onPressed: () => {_sendForm(vm)},
            icon: const Icon(Icons.login),
            label: const Text("Iniciar sesión"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: .circular(8)),
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
          ),
          TextButton(
            onPressed: () => {_toForgotPassword(context)},
            child: Text(
              "¿Olvidaste tu contraseña?",
              style: textScheme.labelLarge?.copyWith(color: scheme.primary),
            ),
          ),
        ],
        children: [
          ...FormContainer.textInput(
            name: "Correo electrónico",
            hintText: "usuario@emaec.cl",
            prefixIcon: Icon(Icons.mail_outline),
            keyboardType: TextInputType.emailAddress,
            validator: vm.user.emailValidator,
            controller: vm.user.emailController,
            textScheme: textScheme,
          ),
          ...FormContainer.textInput(
            name: "Contraseña",
            hintText: "********",
            prefixIcon: Icon(Icons.lock_outline),
            keyboardType: TextInputType.visiblePassword,
            validator: vm.user.passwordValidator,
            controller: vm.user.passwordController,
            textScheme: textScheme,
            suffixIcon: IconButton(
              icon: Icon(
                vm.passwordEstaOculto
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
              onPressed: vm.togglePasswordVisibility,
            ),
            estaOculto: vm.passwordEstaOculto,
          ),
        ],
      ),
    );
  }
}
