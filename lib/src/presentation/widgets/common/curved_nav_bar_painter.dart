import 'package:flutter/material.dart';

/// CustomPainter para dibujar la navbar curvada con efectos visuales
///
/// Pinta la forma y apariencia visual de la barra de navegacion,
/// incluyendo color blanco semi-transparente, sombra y efecto de desenfoque.
class CurvedNavBarPainter extends CustomPainter {
  /// Pinta la navbar en el canvas proporcionado
  ///
  /// Dibuja:
  /// - Un path curvado con forma de navbar
  /// - Una sombra para efecto de profundidad
  /// - Color blanco semi-transparente
  /// - Desenfoque usando MaskFilter
  ///
  /// Parametros:
  /// - [canvas]: Superficie dona se dibuja
  /// - [size]: Tamaño disponible para dibujar
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(1))
      ..color = Colors.white.withValues(alpha: 0.6);
    var path = Path();

    path.moveTo(0, 40);
    path.quadraticBezierTo(0, 0, 40, 0);
    path.lineTo(size.width * 0.5 - 40, 0);
    path.arcToPoint(
      Offset(size.width * 0.5 + 40, 0),
      radius: const Radius.circular(10),
      clockwise: false,
    );
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.grey.withValues(alpha: 0.3), 1, false);
    canvas.drawPath(path, paint);
  }

  // Función de utilidad para convertir el radio de blur en sigma
  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
