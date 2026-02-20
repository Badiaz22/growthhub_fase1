import 'package:cards_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cards_app/src/domain/entities/card_entity.dart';

/// Pantalla de detalles de una tarjeta
///
/// Muestra una tarjeta en tamaño completo con toda su informacion.
/// Permite editar o eliminar la tarjeta mediante los botones en la barra superior.
class DetailsScreen extends StatelessWidget {
  /// Tarjeta a mostrar
  final CardEntity card;

  /// Constructor de DetailsScreen
  ///
  /// Parametros:
  /// - [card]: Tarjeta cuyos detalles se mostraran
  const DetailsScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopActionsWidget(isDetailScreen: true, card: card),
            CardShapeWidget(
              card: card,
              cardHeight: size.height * 0.75,
              cardWidth: size.width,
              titleSize: size.width * 0.1,
              descriptionSize: size.width * 0.05,
              canShowDetail: true,
            ),
          ],
        ),
      ),
    );
  }
}
