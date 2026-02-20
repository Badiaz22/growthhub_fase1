import 'package:cards_app/src/domain/entities/entity.dart';

/// Representa una tarjeta de nota en la aplicación
///
/// Contiene toda la información necesaria para mostrar y gestionar
/// una nota: identificador único, título, descripción y color.
class CardEntity implements Entity {
  /// Identificador único de la tarjeta
  String id;

  /// Título de la tarjeta
  ///
  /// Debe tener entre 3 y 100 caracteres.
  String title;

  /// Descripción detallada del contenido de la tarjeta
  ///
  /// Debe tener entre 10 y 500 caracteres.
  String description;

  /// Índice de color para la tarjeta (1-6)
  ///
  /// Determina el color visual de la tarjeta según la paleta definida
  /// en [AppColors].
  int colorIndex;

  /// Constructor de CardEntity
  ///
  /// Parámetros:
  /// - [id]: Identificador único (por defecto vacío)
  /// - [title]: Título de la tarjeta (por defecto vacío)
  /// - [description]: Descripción (por defecto vacío)
  /// - [colorIndex]: Índice de color (por defecto 1)
  CardEntity({
    this.id = '',
    this.title = '',
    this.description = '',
    this.colorIndex = 1,
  });

  /// Serializa la tarjeta a un mapa JSON
  ///
  /// Retorna un mapa con los datos serializables de la tarjeta.
  /// Nota: El id no se incluye en la serialización al ser autogenerado.
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['title'] = title;
    json['description'] = description;
    return json;
  }
}
