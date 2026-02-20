part of 'cards_bloc.dart';

/// Estado de la aplicacion relacionado con tarjetas
///
/// Contiene toda la informacion necesaria para renderizar la UI
/// incluyendo lista de tarjetas, seleccion de color y formulario.
class CardsState {
  /// Lista de tarjetas actualmente cargadas
  final List<CardEntity> cards;

  /// Indice del color seleccionado para crear/editar tarjeta
  final int selectedColorIndex;

  /// Texto del titulo ingresado en el formulario
  final String titlecardToEditSaveText;

  /// Texto de la descripcion ingresada en el formulario
  final String descriptioncardToEditSaveText;

  /// Tarjeta actualmente en edicion
  final CardEntity? cardToEdit;

  /// Indica si se estan cargando tarjetas
  final bool isLoading;

  /// Constructor de CardsState
  ///
  /// Parametros:
  /// - [cards]: Lista de tarjetas (por defecto lista vacía)
  /// - [selectedColorIndex]: Indice de color (por defecto 1)
  /// - [titlecardToEditSaveText]: Titulo (por defecto vacio)
  /// - [descriptioncardToEditSaveText]: Descripcion (por defecto vacio)
  /// - [cardToEdit]: Tarjeta en edicion (por defecto null)
  /// - [isLoading]: En carga (por defecto false)
  CardsState({
    this.cards = const [],
    this.selectedColorIndex = 1,
    this.descriptioncardToEditSaveText = '',
    this.titlecardToEditSaveText = '',
    this.cardToEdit,
    this.isLoading = false,
  });

  /// [copyWith] es un metodo que retorna una nueva instancia del objeto con propiedades modificadas.
  CardsState copyWith({
    List<CardEntity>? cards,
    int? selectedColorIndex,
    String? titlecardToEditSaveText,
    String? descriptioncardToEditSaveText,
    CardEntity? cardToEdit,
    bool? isLoading,
  }) => CardsState(
    cards: cards ?? this.cards,
    selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
    titlecardToEditSaveText:
        titlecardToEditSaveText ?? this.titlecardToEditSaveText,
    descriptioncardToEditSaveText:
        descriptioncardToEditSaveText ?? this.descriptioncardToEditSaveText,
    cardToEdit: cardToEdit ?? this.cardToEdit,
    isLoading: isLoading ?? this.isLoading,
  );
}
