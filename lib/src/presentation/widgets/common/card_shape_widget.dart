import 'package:flutter/material.dart';
import 'package:cards_app/src/utils/maps.dart';
import 'package:cards_app/src/utils/app_constants.dart';
import 'package:cards_app/src/domain/entities/card_entity.dart';

/// Widget que representa visualmente una tarjeta de información
///
/// Proporciona una visualización con:
/// - Hero animation para transiciones suaves
/// - Soporte para mostrar detalles completos o resumen
/// - Color dinámico según [card.colorIndex]
/// - Scroll automático en modo detalle
class CardShapeWidget extends StatelessWidget {
  /// Constructor del widget
  ///
  /// Parámetros requeridos:
  /// - [card] : Datos de la tarjeta a mostrar
  /// - [cardHeight] : Alto del contenedor de la tarjeta
  /// - [cardWidth] : Ancho del contenedor de la tarjeta
  /// - [titleSize] : Tamaño de fuente del título
  /// - [descriptionSize] : Tamaño de fuente de la descripción
  /// - [canShowDetail] : Si debe mostrar detalles completos o resumen
  const CardShapeWidget({
    super.key,
    required this.card,
    required this.cardHeight,
    required this.cardWidth,
    required this.titleSize,
    required this.descriptionSize,
    required this.canShowDetail,
  });

  /// Entidad de tarjeta a mostrar
  final CardEntity card;

  /// Alto de la tarjeta en píxeles
  final double cardHeight;

  /// Ancho de la tarjeta en píxeles
  final double cardWidth;

  /// Tamaño de fuente para el título
  final double titleSize;

  /// Tamaño de fuente para la descripción
  final double? descriptionSize;

  /// Flag que indica si mostrar descripción completa (true) o resumida (false)
  final bool canShowDetail;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: card.id,
      child: Material(
        elevation: 2,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppConstants.borderRadiusDefault),
        ),
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: getCardColorByIndex(card.colorIndex),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppConstants.borderRadiusDefault),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingDefault,
              vertical: AppConstants.paddingLarge,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Título de la tarjeta con ellipsis
                Text(
                  card.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleSize,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                /// Descripción con comportamiento diferente según modo
                Expanded(
                  child: SingleChildScrollView(
                    physics: canShowDetail
                        ? const BouncingScrollPhysics()
                        : const NeverScrollableScrollPhysics(),
                    child: Text(
                      card.description,
                      maxLines: canShowDetail ? null : 3,
                      style: TextStyle(fontSize: descriptionSize),
                      overflow: canShowDetail ? null : TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
