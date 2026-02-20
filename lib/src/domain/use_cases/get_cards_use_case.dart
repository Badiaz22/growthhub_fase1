import 'package:cards_app/src/domain/entities/card_entity.dart';
import 'package:cards_app/src/domain/use_cases/i_get_cards_use_case.dart';
import 'package:cards_app/src/infrastructure/repository/cards_repository.dart';

/// Implementación del caso de uso para obtener tarjetas
///
/// Actúa como intermediario entre la capa de presentación y la capa
/// de infraestructura. Responsable de ejecutar la lógica de negocio
/// para obtener las tarjetas del repositorio.
class GetCardsUseCase implements IGetCardsUseCase {
  /// Repositorio para acceder a la persistencia de tarjetas
  final CardsRepository repository;

  /// Constructor de GetCardsUseCase
  ///
  /// Parámetros:
  /// - [repository]: Instancia del repositorio de tarjetas
  GetCardsUseCase({required this.repository});

  /// Obtiene la lista de tarjetas desde el repositorio
  ///
  /// Retorna un [Future] con la lista de [CardEntity].
  @override
  Future<List<CardEntity>> call() async {
    return await repository.getCards();
  }
}
