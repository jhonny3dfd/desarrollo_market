import 'package:flutter/material.dart';

class _AppColors {
  final MaterialColor seed = Colors.green;
}

String _toHex(Color c) {
  return '#${c.toARGB32().toRadixString(16).padLeft(8, '0')}';
}

final basic = ThemeData(
  colorScheme: .fromSeed(
    seedColor: _AppColors().seed,
    surfaceBright: Colors.white,
  ),
  useMaterial3: true,
);

void printColors() {
  final scheme = ColorScheme.fromSeed(seedColor: _AppColors().seed);
  debugPrint('''
  primary: ${_toHex(scheme.primary)}
  secondary: ${_toHex(scheme.secondary)}
  tertiary: ${_toHex(scheme.tertiary)}

  surface: ${_toHex(scheme.surface)}
  error: ${_toHex(scheme.error)}

  onPrimary: ${_toHex(scheme.onPrimary)}
  onSecondary: ${_toHex(scheme.onSecondary)}
  onSurface: ${_toHex(scheme.onSurface)}
  ''');
}