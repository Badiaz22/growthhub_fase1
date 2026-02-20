import 'package:flutter/material.dart';
import 'package:cards_app/src/di/dependency_provider.dart';
import 'package:cards_app/src/domain/entities/card_entity.dart';
import 'package:cards_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';
import 'package:cards_app/src/utils/app_constants.dart';
import 'package:cards_app/src/utils/form_validators.dart';

/// Widget para crear o editar una tarjeta
/// Proporciona formulario con validación de título y descripción
class CreateEditFormWidget extends StatefulWidget {
  /// Constructor del widget
  ///
  /// Parámetros:
  /// - [cardsController] : BLoC para manejar estado de tarjetas
  /// - [card] : Tarjeta a editar (null si es creación)
  const CreateEditFormWidget({
    super.key,
    required this.cardsController,
    required this.card,
  });

  final CardsBloc cardsController;
  final CardEntity? card;

  @override
  State<CreateEditFormWidget> createState() => _CreateEditFormWidgetState();
}

class _CreateEditFormWidgetState extends State<CreateEditFormWidget> {
  /// GlobalKey para validar el formulario
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Campo de título
  String? _title;

  /// Campo de descripción
  String? _description;

  @override
  void initState() {
    super.initState();
    // Inicializar valores si es edición
    _title = widget.card?.title ?? '';
    _description = widget.card?.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;

    return SizedBox(
      height: size.height * AppConstants.cardDetailSizeRatio,
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingDefault),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// Campo de título con validación
              TextFormField(
                initialValue: _title,
                cursorHeight: size.width * AppConstants.fontSizeTitleMultiplier,
                maxLines: 1,
                style: TextStyle(
                  fontSize: size.width * AppConstants.fontSizeTitleMultiplier,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: 'Title...',
                  hintStyle: TextStyle(
                    fontSize: size.width * AppConstants.fontSizeTitleMultiplier,
                    fontWeight: FontWeight.bold,
                  ),
                  errorStyle: const TextStyle(color: Colors.red),
                ),
                validator: FormValidators.validateTitle,
                onChanged: (value) {
                  _title = value;
                  cardsBloc.updateTitleCardToSaveEdit(value);
                },
              ),
              const SizedBox(height: AppConstants.paddingMedium),

              /// Campo de descripción con validación
              TextFormField(
                initialValue: _description,
                maxLines: 14,
                style: TextStyle(
                  fontSize:
                      size.width * AppConstants.fontSizeDescriptionMultiplier,
                ),
                decoration: InputDecoration(
                  hintText: 'Description',
                  hintStyle: TextStyle(
                    fontSize:
                        size.width * AppConstants.fontSizeDescriptionMultiplier,
                  ),
                  errorStyle: const TextStyle(color: Colors.red),
                ),
                validator: FormValidators.validateDescription,
                onChanged: (value) {
                  _description = value;
                  cardsBloc.updateDescriptionCardToSaveEdit(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
