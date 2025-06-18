import 'package:flutter/material.dart';
import '../utilidades/colores.dart';

class TarjetaModulo extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final IconData icono;
  final Color colorModulo;
  final Color colorModuloClaro;
  final VoidCallback alTocar; // Acción al presionar la tarjeta

  const TarjetaModulo({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.icono,
    required this.colorModulo,
    required this.colorModuloClaro,
    required this.alTocar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colorModulo, width: 0.5),
      ),
      child: InkWell(
        onTap: alTocar,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border(
              left: BorderSide(color: colorModulo, width: 4),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icono con fondo claro del módulo
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorModuloClaro,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icono,
                  color: colorModulo,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              // Textos
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ColoresApp.textoPrincipal,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitulo,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColoresApp.textoSecundario,
                          ),
                    ),
                  ],
                ),
              ),
              // Botón "Ver"
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: colorModulo,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Ver',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
