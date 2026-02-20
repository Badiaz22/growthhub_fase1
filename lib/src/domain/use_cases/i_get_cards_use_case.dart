import 'package:cards_app/src/domain/entities/card_entity.dart';

/// Interfaz del caso de uso para obtener tarjetas
///
/// Define el contrato para las operaciones de obtención de tarjetas.
/// Sigue el patrón de inyección de dependencias para facilitar
/// el testing y la extensibilidad.
abstract class IGetCardsUseCase {
  /// Obtiene la lista de todas las tarjetas
  ///
  /// Retorna un [Future] que se resuelve con la lista de [CardEntity].
  /// Puede lanzar excepciones si hay errores al obtener los datos.
  Future<List<CardEntity>> call();
}
