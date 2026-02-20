import 'package:flutter/material.dart';
import 'package:cards_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';

/// Proveedor de dependencias mediante InheritedWidget
///
/// Implementa el patrón de inyección de dependencias para proporcionar
/// acceso al [CardsBloc] en toda la jerarquía de widgets de la aplicación.
/// Permite que cualquier widget pueda acceder al BLoC sin necesidad de
/// pasarlo como parámetro.
class DependencyProvider extends InheritedWidget {
  /// Instancia del CardsBloc compartida en toda la aplicación
  final CardsBloc cardsBloc;

  /// Constructor de DependencyProvider
  ///
  /// Parámetros:
  /// - [cardsBloc]: Instancia del BLoC de tarjetas
  /// - [child]: Widget hijo que tendrá acceso al BLoC
  const DependencyProvider({
    super.key,
    required this.cardsBloc,
    required super.child,
  });

  /// Determina si los widgets dependientes deben reconstruirse
  ///
  /// Retorna true si el BLoC ha cambiado, false en caso contrario.
  @override
  bool updateShouldNotify(DependencyProvider oldWidget) {
    return cardsBloc != oldWidget.cardsBloc;
  }

  /// Obtiene la instancia del proveedor de dependencias del contexto
  ///
  /// Busca el [DependencyProvider] más cercano en el árbol de widgets
  /// y retorna su instancia. Falla con una aserción si no encuentra
  /// el proveedor.
  ///
  /// Parámetros:
  /// - [context]: Contexto de construcción actual
  ///
  /// Retorna la instancia de [DependencyProvider].
  /// Lanza [AssertionError] si no se encuentra en el contexto.
  static DependencyProvider of(BuildContext context) {
    final DependencyProvider? result = context
        .dependOnInheritedWidgetOfExactType<DependencyProvider>();
    assert(result != null, 'No DependencyProvider found in context');
    return result!;
  }
}
