import 'package:flutter/material.dart';
import 'package:cards_app/src/utils/app_colors.dart';

/// Boton redondeado flotante personalizado
///
/// Widget reutilizable que proporciona un boton de acccion flotante
/// con estilo consistente. Usado principalmente para acciones primarias
/// como agregar tarjetas.
class CustomRoundedButton extends StatelessWidget {
  /// Constructor del boton redondeado
  ///
  /// Parametros:
  /// - [onPressed]: Callback al hacer tap
  /// - [icon]: Icono a mostrar
  /// - [tooltipText]: Texto del tooltip
  const CustomRoundedButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.tooltipText,
  });

  /// Callback ejecutado al presionar el boton
  final VoidCallback onPressed;

  /// Icono del boton
  final IconData icon;

  /// Texto descriptivo del boton
  final String tooltipText;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipText,
      child: FloatingActionButton(
        elevation: 10.0,
        shape: const CircleBorder(),
        backgroundColor: Colors.white.withValues(alpha: 0.9),
        onPressed: () => onPressed(),
        child: Icon(icon, size: 35.0, color: AppColors.orangeCard),
      ),
    );
  }
}
