import 'package:flutter/material.dart';
import '../../servicios/evento_servicio.dart';

class CrearEvento extends StatefulWidget {
  final EventoServicio eventoServicio;
  final int idUsuario;
  const CrearEvento({required this.eventoServicio, required this.idUsuario, super.key});

  @override
  State<CrearEvento> createState() => _CrearEventoState();
}

class _CrearEventoState extends State<CrearEvento> {
  final tituloController = TextEditingController();
  final descripcionController = TextEditingController();
  DateTime? fecha;
  String mensaje = '';

  Future<void> _crearEvento() async {
    if (tituloController.text.isEmpty || fecha == null) {
      setState(() => mensaje = 'Título y fecha son obligatorios');
      return;
    }
    try {
      await widget.eventoServicio.crearEvento(
        tituloController.text,
        descripcionController.text,
        fecha!,
        widget.idUsuario,
      );
      setState(() => mensaje = 'Evento creado');
      // Espera 1 segundo y vuelve a la lista de eventos
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    } catch (e) {
      setState(() => mensaje = 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Evento')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final seleccion = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (seleccion != null) setState(() => fecha = seleccion);
              },
              child: Text(fecha == null ? 'Seleccionar fecha' : fecha.toString().split(' ')[0]),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _crearEvento, child: const Text('Crear evento')),
            const SizedBox(height: 12),
            Text(mensaje),
          ],
        ),
      ),
    );
  }
}
