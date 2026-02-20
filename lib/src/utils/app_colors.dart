import 'package:flutter/material.dart';

/// Paleta de colores centralizada de la aplicación
class AppColors {
  AppColors._(); // Constructor privado para evitar instanciación

  // Colores principales
  static const Color blueCard = Color(0xff7ECBFF);
  static const Color orangeCard = Color(0xffFFA447);
  static const Color greenCard = Color(0xff1ECCC3);
  static const Color pinkCard = Color(0xffFFA6C4);
  static const Color coralCard = Color(0xffFFA3A3);

  // Colores neutros
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color grey = Colors.grey;

  // Sombras
  static const List<BoxShadow> cardShadow = [
    BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
  ];
}
