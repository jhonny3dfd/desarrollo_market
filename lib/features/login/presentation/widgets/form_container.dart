import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> children;
  final List<Widget> buttons;
  final String footer;
  final String? description;

  const FormContainer({
    required this.formKey,
    required this.children,
    required this.buttons,
    required this.footer,
    this.description,
    super.key
  });

  static List<Widget> simpleContainer({
    required String name,
    required TextTheme textScheme,
    required Widget child
  }){
    return [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(name, style: textScheme.titleMedium),
      ),
      const SizedBox(height: 8),
      child,
      const SizedBox(height: 24),
    ];
  }

  static List<Widget> textInput({
    required String name,
    required String hintText,
    required Icon prefixIcon,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
    required TextEditingController controller,
    required TextTheme textScheme,
    Widget? suffixIcon,
    bool? estaOculto
  }){
    return simpleContainer(name: name, textScheme: textScheme, child: TextFormField(
      controller: controller,
      obscureText: estaOculto ?? false,
      decoration: InputDecoration(
        // labelText: "Correo electronico",
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(),
        suffixIcon: suffixIcon
      ),
      keyboardType: keyboardType,
      validator: validator,
    ));
  }

  @override
  Widget build(BuildContext context){
    final scheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;
    
    return Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Container(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLowest,
        borderRadius: .circular(20),
        boxShadow: [BoxShadow(color: scheme.shadow.withValues(alpha: 0.3), blurRadius: 12, offset: Offset(0, 4))]
      ),
      child: Padding(padding: EdgeInsets.all(20), child: Form(
        key: formKey,
        child: Column(children: [
          ...children,

          // descripcion
          if (description != null) Container(
            alignment: Alignment.centerLeft,
            child: Text(
              description!,
              style: textScheme.bodyMedium?.copyWith(
                // Cambiamos titleMedium por bodyMedium
                // color: Colors
                //     .black54, // Ajusta el color aquí (ej: un gris suave)
                color: scheme.onSurfaceVariant.withValues(alpha: 0.6),
                height: 1.2,
              ),
            ),
          ),
          if (description != null) const SizedBox(height: 24),

          ...buttons.map((button) => Column(mainAxisSize: .min, children: [
            Row(children: [Expanded(child: button)]),
            const SizedBox(height: 14,),
          ])),

          // footer
          const Divider(),
          const SizedBox(height: 14,),

          Row(children: [
            const SizedBox(width: 10),
            Icon(Icons.shield_outlined, size: 35, color: scheme.outline),
            const SizedBox(width: 8),
            Expanded(
              child: Text(footer,
                          style: textScheme.labelLarge?.copyWith(color: scheme.outline))
            ),
            const SizedBox(width: 10),
          ]),
        ]),
      )),
    )));
  }
}
