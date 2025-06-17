import 'package:flutter/material.dart';
import 'package:backend_client/backend_client.dart';

class WidgetEvento extends StatelessWidget {
  final Evento evento;
  final VoidCallback? onEliminar;
  final VoidCallback? onTap;

  const WidgetEvento({
    super.key,
    required this.evento,
    this.onEliminar,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(evento.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(evento.descripcion),
            const SizedBox(height: 4),
            Text(
              'Fecha: ${evento.fecha.toString().split(" ")[0]}',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        trailing: onEliminar != null
            ? IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onEliminar,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
