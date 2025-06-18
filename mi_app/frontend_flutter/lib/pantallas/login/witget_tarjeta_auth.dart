import 'package:flutter/material.dart';
import '../../utilidades/colores.dart';

class WidgetTarjetaAuth extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final Widget child;

  const WidgetTarjetaAuth({
    super.key,
    required this.titulo,
    required this.subtitulo,
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
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 36,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Logo
            Container(
              width: 62,
              height: 62,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColoresApp.academico, ColoresApp.actividadFisica],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  'S',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              titulo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: ColoresApp.textoPrincipal,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitulo,
              style: const TextStyle(
                fontSize: 13,
                color: ColoresApp.textoSecundario,
              ),
            ),
            const SizedBox(height: 20),
            child,
          ],
        ),
      ),
    );
  }
}
