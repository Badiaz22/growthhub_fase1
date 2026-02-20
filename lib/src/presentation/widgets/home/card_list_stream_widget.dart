import 'package:cards_app/main.dart';
import 'package:flutter/material.dart';
import 'package:cards_app/src/di/dependency_provider.dart';
import 'package:cards_app/src/domain/entities/card_entity.dart';
import 'package:cards_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';
import 'package:cards_app/src/presentation/widgets/common/card_shape_widget.dart';
import 'package:cards_app/src/utils/app_colors.dart';
import 'package:cards_app/src/utils/app_constants.dart';

/// Widget que muestra una lista de tarjetas en grid usando Stream
///
/// Escucha los cambios del BLoC y actualiza automáticamente la UI
/// Maneja estados de carga y lista vacía
class CardsListStreamWidget extends StatelessWidget {
  /// Constructor del widget
  const CardsListStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;

    return SizedBox(
      height: size.height * AppConstants.cardListHeightRatio,
      child: StreamBuilder<CardsState>(
        stream: cardsBloc.streamController,
        builder: (context, snapshot) {
          final state = snapshot.data ?? cardsBloc.currentState;

          // Mostrar loading spinner
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.orangeCard),
            );
          }

          // Mostrar mensaje cuando la lista está vacía
          if (state.cards.isEmpty) {
            return const Center(
              child: Text(
                AppConstants.emptyListMessage,
                style: TextStyle(color: Colors.grey, fontSize: 25.0),
              ),
            );
          }

          // Mostrar grid de tarjetas
          return GridView.builder(
            padding: EdgeInsets.only(
              left: AppConstants.paddingLarge,
              right: AppConstants.paddingLarge,
              top: AppConstants.paddingSmall,
              bottom: size.width * AppConstants.gridBottomPaddingRatio,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: AppConstants.gridCrossAxisCount,
              childAspectRatio: AppConstants.gridChildAspectRatio,
              crossAxisSpacing: AppConstants.gridSpacing,
              mainAxisSpacing: AppConstants.gridSpacing,
            ),
            itemCount: state.cards.length,
            itemBuilder: (context, index) {
              final CardEntity card = state.cards[index];
              return _Card(
                card: card,
                index: index,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.detail,
                    arguments: (card: card),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

/// Widget privado que representa una tarjeta individual en el grid
class _Card extends StatelessWidget {
  /// Constructor de tarjeta individual
  ///
  /// Parámetros:
  /// - [card] : Datos de la tarjeta
  /// - [index] : Índice en la lista
  /// - [onPressed] : Callback cuando se toca la tarjeta
  const _Card({
    required this.card,
    required this.index,
    required this.onPressed,
  });

  /// Entidad de tarjeta
  final CardEntity card;

  /// Posición en la lista
  final int index;

  /// Callback a ejecutar al hacer tap
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: CardShapeWidget(
        card: card,
        cardHeight: size.height * 0.1,
        cardWidth: size.height * 0.1,
        titleSize: size.width * AppConstants.fontSizeDescriptionMultiplier,
        descriptionSize: size.width * AppConstants.fontSizeSubtitleMultiplier,
        canShowDetail: false,
      ),
    );
  }
}
