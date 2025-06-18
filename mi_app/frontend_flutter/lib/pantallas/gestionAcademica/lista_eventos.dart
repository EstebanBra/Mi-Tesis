import 'package:flutter/material.dart';
import 'package:backend_client/backend_client.dart';
import '../../servicios/evento_servicio.dart';
import 'crear_evento.dart';
import 'editar_evento.dart';
import '../../pantallas/gestionAcademica/tarjeta_evento.dart';
import '../../utilidades/colores.dart';

class ListaEventos extends StatefulWidget {
  final EventoServicio eventoServicio;
  final int idUsuario;

  const ListaEventos({
    required this.eventoServicio,
    required this.idUsuario,
    super.key,
  });

  @override
  State<ListaEventos> createState() => _ListaEventosState();
}

class _ListaEventosState extends State<ListaEventos> {
  List<Evento> eventos = [];
  bool cargando = true;

  @override
  void initState() {
    super.initState();
    cargarEventos();
  }

  Future<void> cargarEventos() async {
    final lista = await widget.eventoServicio.obtenerEventos(widget.idUsuario);
    setState(() {
      eventos = lista;
      cargando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Eventos')),
      body: cargando
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: eventos.length,
              itemBuilder: (context, i) {
                final evento = eventos[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TarjetaEvento(
                    titulo: evento.titulo,
                    subtitulo: evento.descripcion,
                    onVer: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tocaste ${evento.titulo}')),
                      );
                    },
                    onEditar: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditarEvento(
                            eventoServicio: widget.eventoServicio,
                            evento: evento,
                          ),
                        ),
                      );
                      cargarEventos(); // Recarga la lista
                    },
                    onEliminar: () async {
                      await widget.eventoServicio.eliminarEvento(evento.id!);
                      cargarEventos(); // Recarga la lista
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CrearEvento(
                eventoServicio: widget.eventoServicio,
                idUsuario: widget.idUsuario,
              ),
            ),
          );
          cargarEventos();
        },
      ),
    );
  }
}
