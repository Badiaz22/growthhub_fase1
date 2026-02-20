import 'package:flutter/material.dart';

/// Extensiones útiles para BuildContext
extension BuildContextExtensions on BuildContext {
  /// Obtiene el MediaQueryData del contexto
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Obtiene el ancho de la pantalla
  double get screenWidth => mediaQuery.size.width;

  /// Obtiene el alto de la pantalla
  double get screenHeight => mediaQuery.size.height;

  /// Verifica si el dispositivo está en modo landscape
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  /// Verifica si el dispositivo está en modo portrait
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;
}

/// Extensiones útiles para Strings
extension StringExtensions on String {
  /// Capitaliza la primera letra de la cadena
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Verifica si la cadena está vacía o solo contiene espacios
  bool get isEmptyOrWhitespace => trim().isEmpty;
}

/// Extensiones útiles para Lists
extension ListExtensions<T> on List<T> {
  /// Obtiene un elemento de forma segura sin lanzar excepciones
  T? getOrNull(int index) {
    return index >= 0 && index < length ? this[index] : null;
  }
}
