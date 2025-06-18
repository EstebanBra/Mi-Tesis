import 'package:flutter/material.dart';
import '../../servicios/evento_servicio.dart';
import '../../utilidades/colores.dart';
import '../../widgets/tarjeta_formulario.dart';
import 'package:backend_client/backend_client.dart';

class EditarEvento extends StatefulWidget {
  final EventoServicio eventoServicio;
  final Evento evento; // objeto evento actual

  const EditarEvento({
    required this.eventoServicio,
    required this.evento,
    super.key,
  });

  @override
  State<EditarEvento> createState() => _EditarEventoState();
}

class _EditarEventoState extends State<EditarEvento> {
  late TextEditingController tituloController;
  late TextEditingController descripcionController;
  late DateTime fecha;
  String mensaje = '';

  @override
  void initState() {
    super.initState();
    tituloController = TextEditingController(text: widget.evento.titulo);
    descripcionController = TextEditingController(
      text: widget.evento.descripcion,
    );
    fecha = widget.evento.fecha;
  }

  Future<void> _editarEvento() async {
    if (tituloController.text.isEmpty || fecha == null) {
      setState(() => mensaje = 'Título y fecha son obligatorios');
      return;
    }
    try {
      await widget.eventoServicio.editarEvento(
        widget.evento.id!,
        tituloController.text,
        descripcionController.text,
        fecha,
      );
      setState(() => mensaje = 'Evento actualizado');
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
        title: const Text('Editar Evento'),
        backgroundColor: ColoresApp.fondoSecundario,
        foregroundColor: ColoresApp.textoPrincipal,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: WidgetTarjetaFormulario(
            titulo: "Editar Evento",
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
                      initialDate: fecha,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );
                    if (seleccion != null) setState(() => fecha = seleccion);
                  },
                  child: Text(fecha.toString().split(' ')[0]),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: _editarEvento,
                  child: const Text('Guardar cambios'),
                ),
                const SizedBox(height: 12),
                if (mensaje.isNotEmpty)
                  Text(
                    mensaje,
                    style: TextStyle(
                      color: mensaje.contains('actualizado')
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
