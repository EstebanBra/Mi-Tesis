import 'package:backend_client/backend_client.dart';

class EventoServicio {
  final Client client;

  EventoServicio(this.client);

  Future<Evento> crearEvento(String titulo, String descripcion, DateTime fecha, int idUsuario) async {
    return await client.evento.crearEvento(titulo, descripcion, fecha, idUsuario);
  }

  Future<List<Evento>> obtenerEventos(int idUsuario) async {
    return await client.evento.obtenerEventos(idUsuario);
  }

  Future<void> eliminarEvento(int idEvento) async {
    await client.evento.eliminarEvento(idEvento);
  }
}
