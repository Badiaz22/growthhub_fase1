import 'package:flutter/material.dart';
import 'package:cards_app/src/utils/app_colors.dart';

/// Obtiene el color de una tarjeta según su índice
///
/// Mapea un número de índice (1-6) a un color específico de la paleta.
/// Los índices fuera del rango retornan el color en el mapa o lanzan une xcepción.
///
/// Parámetros:
/// - [colorIndex]: Índice del color (1-6)
///
/// Retorna el [Color] correspondiente al índice proporcionado.
Color getCardColorByIndex(int colorIndex) {
  Map<int, Color> cardColor = {
    1: Colors.grey[500]!,
    2: AppColors.orangeCard,
    3: AppColors.blueCard,
    4: AppColors.pinkCard,
    5: AppColors.greenCard,
    6: AppColors.coralCard,
  };
  return cardColor[colorIndex]!;
}
