import 'package:flutter/material.dart';
import '../utilidades/colores.dart';

class WidgetTarjetaFormulario extends StatelessWidget {
  final String titulo;
  final Widget child;

  const WidgetTarjetaFormulario({
    super.key,
    required this.titulo,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 14,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              titulo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: ColoresApp.textoPrincipal,
              ),
            ),
            const SizedBox(height: 18),
            child,
          ],
        ),
      ),
    );
  }
}
