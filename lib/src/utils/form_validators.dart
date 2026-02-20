/// Validadores centralizados para formularios
/// Proporciona métodos reutilizables para validar inputs de usuario
class FormValidators {
  FormValidators._(); // Constructor privado

  /// Valida que el título no esté vacío y tenga longitud mínima
  /// Retorna mensaje de error o null si es válido
  static String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title is required';
    }
    if (value.trim().isEmpty) {
      return 'Title cannot be only whitespace';
    }
    if (value.length < 3) {
      return 'Title must be at least 3 characters';
    }
    if (value.length > 100) {
      return 'Title must be less than 100 characters';
    }
    return null;
  }

  /// Valida que la descripción no esté vacía y tenga longitud válida
  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Description is required';
    }
    if (value.trim().isEmpty) {
      return 'Description cannot be only whitespace';
    }
    if (value.length < 10) {
      return 'Description must be at least 10 characters';
    }
    if (value.length > 500) {
      return 'Description must be less than 500 characters';
    }
    return null;
  }

  /// Validación genérica de campo requerido
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
}
