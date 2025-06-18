import 'package:flutter/material.dart';
import '../../utilidades/colores.dart';

class TarjetaEvento extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final VoidCallback? onVer;
  final VoidCallback? onEditar;
  final VoidCallback? onEliminar;

  const TarjetaEvento({
    super.key,
    required this.titulo,
    required this.subtitulo,
    this.onVer,
    this.onEditar,
    this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: ColoresApp.academico, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            // Icono del evento
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColoresApp.academicoClaro,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.event, color: ColoresApp.academico),
            ),
            const SizedBox(width: 12),
            // Info evento
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColoresApp.textoPrincipal,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitulo,
                    style: const TextStyle(
                      color: ColoresApp.textoSecundario,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            // Botones de acción
            if (onEditar != null)
              IconButton(
                icon: const Icon(Icons.edit, color: ColoresApp.academico),
                onPressed: onEditar,
                tooltip: 'Editar',
              ),
            if (onEliminar != null)
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onEliminar,
                tooltip: 'Eliminar',
              ),
            if (onVer != null)
              TextButton(
                onPressed: onVer,
                child: const Text('Ver'),
                style: TextButton.styleFrom(
                  foregroundColor: ColoresApp.academico,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
