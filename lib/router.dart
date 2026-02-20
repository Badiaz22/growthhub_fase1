part of 'main.dart';

/// Rutas de navegación disponibles en la aplicación
class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';
  static const String form = '/form';
}

/// Genera las rutas de navegación según el nombre proporcionado
/// Mapea nombres de ruta a widgets con transiciones apropiadas
Route<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return _buildFadeRoute(const HomeScreen());

    case AppRoutes.detail:
      final arguments = settings.arguments as ({CardEntity card});
      return _buildFadeRoute(DetailsScreen(card: arguments.card));

    case AppRoutes.form:
      final arguments =
          settings.arguments as ({CardEntity? card, bool isEditMode});
      return _buildScaleRoute(
        FormScreen(card: arguments.card, isEditMode: arguments.isEditMode),
      );

    default:
      return null;
  }
}

/// Crea una ruta con transición de fade
/// Usado para transiciones simples entre pantallas
PageRouteBuilder _buildFadeRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

/// Crea una ruta con transición de escala
/// Usado para transiciones más destacadas (ej: al abrir formulario)
PageRouteBuilder _buildScaleRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
        child: child,
      );
    },
  );
}
