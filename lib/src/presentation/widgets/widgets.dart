/// Indice principal de todos los widgets de la aplicacion
///
/// Centraliza las exportaciones de widgets de todas las categorias:
/// - common: Widgets reutilizables
/// - home: Widgets de la pantalla de inicio
/// - form: Widgets de la pantalla de formulario
///
/// Los screens importan desde este archivo unicamente.
library;

// Common widgets
export 'package:cards_app/src/presentation/widgets/common/common.dart';

// Home screen widgets
export 'package:cards_app/src/presentation/widgets/home/home.dart';

// Form screen widgets
export 'package:cards_app/src/presentation/widgets/form/form.dart';
