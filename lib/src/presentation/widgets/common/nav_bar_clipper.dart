import 'package:flutter/material.dart';

/// CustomClipper para crear bordes curvos en la barra de navegacion
///
/// Define la forma personalizada de la navbar con un arco curvado en el centro
/// para acomodar el boton flotante de acciones. Crea un efecto visual distintivo
/// que mejora la UX.
class NavBarClipper extends CustomClipper<Path> {
  /// Recorta el path segun la forma deseada de la navbar
  ///
  /// Crea una forma de navbar con:
  /// - Esquinas redondeadas arriba
  /// - Un arco curvado en el centro para el boton flotante
  ///
  /// Parametros:
  /// - [size]: Tamaño del area a recortar
  ///
  /// Retorna el [Path] con la forma definida.
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 40);
    path.quadraticBezierTo(0, 0, 40, 0);
    path.lineTo(size.width * 0.5 - 40, 0);
    path.arcToPoint(
      Offset(size.width * 0.5 + 40, 0),
      radius: const Radius.circular(40),
      clockwise: false,
    );
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
