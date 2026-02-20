import 'package:flutter/material.dart';
import 'package:cards_app/src/di/dependency_provider.dart';
import 'package:cards_app/src/domain/entities/card_entity.dart';
import 'package:cards_app/src/presentation/widgets/widgets.dart';
import 'package:cards_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';

/// Pantalla de creacion y edicion de tarjetas
///
/// Proporciona un formulario para crear una nueva tarjeta o editar
/// una existente. Incluye seleccion de color y campos validados.
class FormScreen extends StatelessWidget {
  /// Tarjeta a editar (null si es creacion)
  final CardEntity? card;

  /// Indica si estamos editando una tarjeta existente
  final bool isEditMode;

  /// Constructor de FormScreen
  ///
  /// Parametros:
  /// - [card]: Tarjeta a editar (opcional)
  /// - [isEditMode]: true si es edicion, false si es creacion
  const FormScreen({super.key, this.card, required this.isEditMode});

  @override
  Widget build(BuildContext context) {
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TopActionsWidget(isDetailScreen: false),
                  CreateEditFormWidget(cardsController: cardsBloc, card: card),
                ],
              ),
            ),
          ),
          FormNavbarWidget(isEditMode: isEditMode),
        ],
      ),
    );
  }
}
