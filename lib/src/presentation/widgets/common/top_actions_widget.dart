import 'package:cards_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cards_app/src/di/dependency_provider.dart';
import 'package:cards_app/src/domain/entities/card_entity.dart';
import 'package:cards_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';
import 'package:cards_app/src/utils/app_colors.dart';
import 'package:cards_app/src/utils/app_constants.dart';

/// Widget de barra superior que muestra acciones contextuales
///
/// Proporciona:
/// - Botón de atrás en ambos modos
/// - Botones de editar y eliminar en modo detalles
class TopActionsWidget extends StatelessWidget {
  /// Constructor del widget
  ///
  /// Parámetros:
  /// - [isDetailScreen] : true si es pantalla de detalles, false si es formulario
  /// - [card] : Tarjeta actual (requerida si isDetailScreen es true)
  const TopActionsWidget({super.key, required this.isDetailScreen, this.card});

  /// Indica si se está en pantalla de detalles
  final bool isDetailScreen;

  /// Tarjeta actual (solo usado en detalles)
  final CardEntity? card;

  /// Muestra diálogo de confirmación de eliminación
  /// Retorna Future que se resuelve cuando el usuario responde
  Future<dynamic> _showDeleteDialog(BuildContext context) {
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.delete,
              color: AppColors.orangeCard,
              size: AppConstants.iconSizeLarge,
            ),
            const Text(
              AppConstants.deleteConfirmationTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            child: const Text(
              AppConstants.deleteNo,
              style: TextStyle(color: AppColors.black),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(
              AppConstants.deleteYes,
              style: TextStyle(color: AppColors.orangeCard),
            ),
            onPressed: () {
              cardsBloc.deleteCard(card!);
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * AppConstants.headerHeightRatio,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Botón de atrás
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const SizedBox(
                  width: 40.0,
                  child: Icon(
                    CupertinoIcons.back,
                    size: AppConstants.iconSizeMedium,
                  ),
                ),
              ),

              /// Botones de acción (solo en detalles)
              if (isDetailScreen)
                Row(
                  children: [
                    /// Botón de editar
                    _ActionButton(
                      card: card,
                      tooltipText: 'Edit',
                      icon: CupertinoIcons.pen,
                      onPressed: () {
                        cardsBloc.updateColorSelection(card!.colorIndex);
                        cardsBloc.updateTitleCardToSaveEdit(card!.title);
                        cardsBloc.updateDescriptionCardToSaveEdit(
                          card!.description,
                        );
                        cardsBloc.updateCardToEdit(card!);
                        Navigator.pushNamed(
                          context,
                          AppRoutes.form,
                          arguments: (card: card, isEditMode: true),
                        );
                      },
                    ),
                    const SizedBox(width: AppConstants.paddingLarge),

                    /// Botón de eliminar
                    _ActionButton(
                      card: card,
                      tooltipText: 'Delete',
                      icon: CupertinoIcons.delete,
                      onPressed: () => _showDeleteDialog(context),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget privado para botones de acción individuales
class _ActionButton extends StatelessWidget {
  /// Constructor del botón
  ///
  /// Parámetros:
  /// - [icon] : Icono a mostrar
  /// - [onPressed] : Callback al hacer tap
  /// - [tooltipText] : Texto del tooltip
  /// - [card] : Tarjeta opcional para acceso de contexto
  const _ActionButton({
    required this.card,
    required this.onPressed,
    required this.icon,
    required this.tooltipText,
  });

  /// Tarjeta asociada al botón
  final CardEntity? card;

  /// Callback de tap
  final VoidCallback onPressed;

  /// Icono del botón
  final IconData icon;

  /// Texto explicativo del tooltip
  final String tooltipText;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipText,
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          width: AppConstants.iconSizeMedium,
          child: Icon(icon, size: AppConstants.iconSizeMedium),
        ),
      ),
    );
  }
}
