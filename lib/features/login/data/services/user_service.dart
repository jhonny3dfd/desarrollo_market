import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Esta función se encarga solo de hablar con Firebase
  Future<void> registrarUsuarioConRol({
    required String nombre,
    required String correo,
    required String rol,
  }) async {
    try {
      await _firestore.collection('usuarios').add({
        'nombre': nombre,
        'correo': correo,
        'rol': rol,
        'fechaCreacion': DateTime.now(),
      });
      debugPrint("✅ Usuario guardado en la colección 'usuarios'");
    } catch (e) {
      debugPrint("❌ Error en UserService: $e");
      rethrow; // Para que la interfaz sepa que hubo un error si es necesario
    }
  }
}