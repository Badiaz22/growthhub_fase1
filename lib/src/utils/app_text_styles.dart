import 'package:flutter/material.dart';

/// Estilos de texto centralizados para la aplicación
///
/// Define una paleta de estilos de texto reutilizables que mantienen
/// consistencia tipográfica en toda la aplicación.
/// Facilita cambios globales de fuentes y tamaños.
class AppTextStyles {
  /// Constructor privado para evitar instanciación de la clase
  AppTextStyles._();

  // Títulos grandes
  static const TextStyle titleLarge = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Títulos medianos
  static const TextStyle titleMedium = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Títulos pequeños
  static const TextStyle titleSmall = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Texto corporal grande
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  // Texto corporal medio
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  // Texto corporal pequeño
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  // Texto de hint
  static const TextStyle hint = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  // Texto de error
  static const TextStyle error = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    color: Colors.red,
  );
}
