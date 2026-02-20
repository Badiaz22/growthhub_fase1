/// Clase base abstracta para todas las entidades del dominio
///
/// Define el contrato que deben cumplir todas las entidades de la aplicación.
/// Proporciona métodos comunes para serialización y manipulación de datos.
abstract class Entity {
  /// Constructor de la clase base
  Entity();

  /// Serializa la entidad a un mapa JSON
  ///
  /// Retorna un [Map<String, dynamic>] con los datos de la entidad
  /// que puede ser usado para enviar a una API o guardar en storage.
  Map<String, dynamic> toJson();
}
