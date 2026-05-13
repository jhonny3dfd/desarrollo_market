import 'package:flutter/material.dart';

import 'package:des_movil_proyect/shared/widgets/app_background.dart';

class PageDesign extends StatelessWidget {
  final Widget child;
  final Widget? baner;
  final String titulo;
  final String? subTitulo;

  const PageDesign({
    required this.child,
    this.titulo = "Gestion de inventario y ventas",
    this.subTitulo,
    this.baner,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;

    return Scaffold(
      body: AppBackground(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Logo
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: scheme.surfaceContainerLowest,
                      borderRadius: .circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: scheme.shadow.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 50,
                          color: scheme.primary,
                        ),
                        Text(
                          "EMAEC",
                          style: textScheme.headlineSmall?.copyWith(
                            color: scheme.primary,
                            fontWeight: .bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    titulo,
                    textAlign: .center,
                    style: textScheme.headlineSmall?.copyWith(
                      fontWeight: .bold,
                    ),
                  ),
                  if (subTitulo != null) const SizedBox(height: 4),
                  if (subTitulo != null) Text(
                    subTitulo!,
                    textAlign: .center,
                    style: textScheme.titleMedium?.copyWith(
                      color: scheme.outline,
                    ),
                  ),
                  if (baner != null) const SizedBox(height: 6),
                  baner ?? SizedBox.shrink(),
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
