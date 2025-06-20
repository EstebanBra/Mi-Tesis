import 'package:flutter/material.dart';
import '../../servicios/evento_servicio.dart';
import '../../utilidades/colores.dart';
import '../../widgets/tarjeta_formulario.dart';

class CrearEvento extends StatefulWidget {
  final EventoServicio eventoServicio;
  final int idUsuario;
  const CrearEvento({
    required this.eventoServicio,
    required this.idUsuario,
    super.key,
  });

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
      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;
        Navigator.pop(context);
      });
    } catch (e) {
      setState(() => mensaje = 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresApp.fondoSecundario,
      appBar: AppBar(
        title: const Text('Crear Evento'),
        backgroundColor: ColoresApp.fondoSecundario,
        foregroundColor: ColoresApp.textoPrincipal,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: WidgetTarjetaFormulario(
            titulo: "Nuevo Evento",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: tituloController,
                  decoration: const InputDecoration(labelText: 'Título'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descripcionController,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                ),
                const SizedBox(height: 12),
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
                  child: Text(
                    fecha == null
                        ? 'Seleccionar fecha'
                        : fecha.toString().split(' ')[0],
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: _crearEvento,
                  child: const Text('Crear evento'),
                ),
                const SizedBox(height: 12),
                if (mensaje.isNotEmpty)
                  Text(
                    mensaje,
                    style: TextStyle(
                      color: mensaje.contains('creado')
                          ? ColoresApp.habitos
                          : ColoresApp.textoSecundario,
                      fontSize: 13,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
