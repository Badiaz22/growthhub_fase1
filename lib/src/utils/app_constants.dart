/// Constantes globales de la aplicación
///
/// Centraliza todos los valores constantes utilizados en la aplicación
/// como dimensiones, espaciados, duraciones y mensajes.
/// Esto permite mantener consistencia visual y facilita cambios globales.
class AppConstants {
  /// Constructor privado para evitar instanciación de la clase
  AppConstants._();

  // Dimensiones y espaciados
  static const double paddingDefault = 16.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 12.0;
  static const double paddingLarge = 20.0;

  // Tamaños de iconos
  static const double iconSizeSmall = 24.0;
  static const double iconSizeMedium = 30.0;
  static const double iconSizeLarge = 40.0;

  // Bordes redondeados
  static const double borderRadiusDefault = 20.0;
  static const double borderRadiusSmall = 8.0;

  // Alturas y anchos responsivos
  static const double headerHeightRatio = 0.15;
  static const double cardListHeightRatio = 0.8;
  static const double cardDetailSizeRatio = 0.8;
  static const double navBarHeightRatio = 0.1;

  // Tamaños de texto (multiplicadores)
  static const double fontSizeTitleMultiplier = 0.1;
  static const double fontSizeDescriptionMultiplier = 0.05;
  static const double fontSizeSubtitleMultiplier = 0.04;

  // Grid de tarjetas
  static const int gridCrossAxisCount = 2;
  static const double gridChildAspectRatio = 1.2;
  static const double gridSpacing = 10.0;
  static const double gridBottomPaddingRatio = 0.26;

  // Duraciones de animaciones
  static const Duration fadeTransitionDuration = Duration(milliseconds: 200);
  static const Duration scaleTransitionDuration = Duration(milliseconds: 300);

  // Strings y mensajes
  static const String emptyListMessage = 'Add new card';
  static const String deleteConfirmationTitle = 'Delete card?';
  static const String deleteYes = 'Yes';
  static const String deleteNo = 'No';

  // Colores índice
  static const int defaultColorIndex = 1;
  static const int minColorIndex = 1;
  static const int maxColorIndex = 6;
}
