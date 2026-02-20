import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cards_app/src/utils/maps.dart';
import 'package:cards_app/src/utils/app_colors.dart';
import 'package:cards_app/src/di/dependency_provider.dart';
import 'package:cards_app/src/presentation/widgets/common/common.dart';
import 'package:cards_app/src/presentation/blocs/card_bloc.dart/cards_bloc.dart';

/// Barra de navegacion para la pantalla de formulario
///
/// Proporciona selector de colores y boton de guardar/agregar tarjeta.
/// Completa la interfaz de creacion y edicion de tarjetas.
class FormNavbarWidget extends StatelessWidget {
  /// Constructor de la navbar de formulario
  ///
  /// Parametros:
  /// - [isEditMode]: true si es edicion, false si es creacion
  const FormNavbarWidget({super.key, required this.isEditMode});

  /// Indica si estamos editando una tarjeta existente
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final cardsBloc = DependencyProvider.of(context).cardsBloc;
    final painterHeight = size.height * 0.15;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: bottomPadding,
          right: 0.0,
          left: 0.0,
          child: ClipPath(
            clipper: NavBarClipper(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: CustomPaint(
                size: Size(size.width, painterHeight),
                painter: CurvedNavBarPainter(),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: bottomPadding + painterHeight - 20.0,
          right: size.width * 0.5 - 40,
          left: size.width * 0.5 - 40,
          child: StreamBuilder<CardsState>(
            stream: cardsBloc.streamController,
            builder: (context, snapshot) {
              final state = snapshot.data ?? cardsBloc.currentState;
              return CustomRoundedButton(
                tooltipText: isEditMode ? 'Save' : 'Add',
                icon: isEditMode
                    ? CupertinoIcons.floppy_disk
                    : CupertinoIcons.check_mark,
                onPressed: () {
                  if (state.titlecardToEditSaveText == '' ||
                      state.descriptioncardToEditSaveText == '') {
                    _showAlertDialog(context);
                  } else {
                    if (isEditMode) {
                      cardsBloc.updateCard();
                    } else {
                      cardsBloc.addCard();
                    }
                    Navigator.pushNamed(context, '/');
                  }
                },
              );
            },
          ),
        ),
        Positioned(
          bottom: bottomPadding + 20.0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ButtonColor(color: getCardColorByIndex(1), index: 1),
              _ButtonColor(color: getCardColorByIndex(2), index: 2),
              _ButtonColor(color: getCardColorByIndex(3), index: 3),
              _ButtonColor(color: getCardColorByIndex(4), index: 4),
              _ButtonColor(color: getCardColorByIndex(5), index: 5),
              _ButtonColor(color: getCardColorByIndex(6), index: 6),
            ],
          ),
        ),
      ],
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.warning, color: AppColors.orangeCard),
          const Text(
            'Please fill all fields',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}

class _ButtonColor extends StatefulWidget {
  final Color color;
  final int index;
  const _ButtonColor({required this.color, required this.index});

  @override
  State<_ButtonColor> createState() => _ButtonColorState();
}

class _ButtonColorState extends State<_ButtonColor>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300 * widget.index),
      vsync: this,
    );
    // Inicia animation después de que el frame inicial se complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CardsBloc cardsBloc = DependencyProvider.of(context).cardsBloc;

    return GestureDetector(
      onTap: () => cardsBloc.updateColorSelection(widget.index),
      child: StreamBuilder<CardsState>(
        stream: cardsBloc.streamController,
        builder: (context, snapshot) {
          final state = snapshot.data ?? cardsBloc.currentState;
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
                .animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Curves.easeOutCubic,
                  ),
                ),
            child: FadeTransition(
              opacity: _controller,
              child: Container(
                width: size.width * 0.1,
                height: size.width * 0.1,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                ),
                child: state.selectedColorIndex == widget.index
                    ? const Icon(CupertinoIcons.check_mark)
                    : const SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }
}
