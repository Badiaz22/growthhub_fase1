import 'package:flutter/material.dart';
import 'package:cards_app/src/di/dependency_provider.dart';
import 'package:cards_app/src/domain/entities/card_entity.dart';
import 'package:cards_app/src/domain/use_cases/get_cards_use_case.dart';
import 'package:cards_app/src/infrastructure/repository/cards_repository.dart';
import 'package:cards_app/src/presentation/screens/details_screen.dart';
import 'package:cards_app/src/presentation/screens/form_screen.dart';
import 'package:cards_app/src/presentation/screens/home_screen.dart';
import 'package:cards_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';
import 'package:cards_app/src/utils/app_colors.dart';

part 'router.dart';

/// Punto de entrada de la aplicación
///
/// Inicializa el BLoC con datos y configura el árbol de widgets
void main() => runApp(const MyApp());

/// Widget raíz de la aplicación
///
/// Proporciona:
/// - Inyección de dependencias (BLoC)
/// - Configuración de tema material
/// - Router centralizado
/// - Estilos globales
class MyApp extends StatelessWidget {
  /// Constructor del widget raíz
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DependencyProvider(
      cardsBloc: CardsBloc(
        getCardsUseCase: GetCardsUseCase(repository: CardsRepository()),
      )..getCards(),
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          fontFamily: 'Ubuntu',
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.orangeCard,
            selectionColor: Colors.grey[300],
            selectionHandleColor: AppColors.orangeCard,
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: generateRoutes,
      ),
    );
  }
}
