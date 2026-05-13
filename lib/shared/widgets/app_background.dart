import 'package:flutter/material.dart';

class _DotMatrix extends StatelessWidget {
  final Color color;

  const _DotMatrix({
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (_) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: List.generate(
              4,
              (_) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ConcentricCircles extends StatelessWidget {
  final List<Color> colors;

  const _ConcentricCircles({
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: Stack(
        alignment: Alignment.center,
        children: [

          Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[0],
            ),
          ),

          Container(
            width: 360,
            height: 360,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[1],
            ),
          ),
        ],
      ),
    );
  }
}

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    
    return Stack(
      children: [
        // Fondo base
        Container(decoration: BoxDecoration(color: Colors.white)),

        // gradiente
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                scheme.surface.withValues(alpha: 0.6),
                scheme.surfaceBright,
              ],
            ),
          ),
        ),

        // circulos concentricos 1
        Positioned(
          top: -250,
          left: -250,
          child: _ConcentricCircles(
            colors: [
              scheme.surfaceContainer,
              scheme.surfaceContainerHighest,
            ],
          ),
        ),

        // circulos concentricos 2
        Positioned(
          bottom: -250,
          right: -250,
          child: _ConcentricCircles(
            colors: [
              scheme.surfaceContainer,
              scheme.surfaceContainerHighest,
            ],
          ),
        ),

        // matriz de puntos 1
        Positioned(
          top: 40,
          right: 40,
          child: _DotMatrix(
            color: scheme.surfaceContainerHighest,
          ),
        ),

        // matriz de puntos 2
        Positioned(
          bottom: 40,
          left: 40,
          child: _DotMatrix(
            color: scheme.surfaceContainerHighest,
          ),
        ),

        // contenido
        SafeArea(child: child)
      ]
    );
  }
}