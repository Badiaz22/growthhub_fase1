import 'package:flutter/material.dart';
import 'package:cards_app/src/presentation/widgets/widgets.dart';

/// Pantalla principal de la aplicación
///
/// Muestra una lista de tarjetas en un grid y proporciona acceso
/// a funciones como crear, ver detalles y gestionar tarjetas.
class HomeScreen extends StatefulWidget {
  /// Constructor de HomeScreen
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

/// Estado de la pantalla de inicio
///
/// Maneja la lógica y construcción de la UI para mostrar
/// el header, lista de tarjetas y navbar.
class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(children: [HomeHeaderWidget(), CardsListStreamWidget()]),
          HomeNavbarWidget(),
        ],
      ),
    );
  }
}
