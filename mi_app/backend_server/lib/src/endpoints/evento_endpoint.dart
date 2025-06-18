import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class EventoEndpoint extends Endpoint {
  Future<Evento> crearEvento(Session session, String titulo, String descripcion,
      DateTime fecha, int idUsuario) async {
    var evento = Evento(
      titulo: titulo,
      descripcion: descripcion,
      fecha: fecha,
      usuarioId: idUsuario,
    );
    await Evento.db.insertRow(session, evento);
    return evento;
  }

  Future<List<Evento>> obtenerEventos(Session session, int idUsuario) async {
    return await Evento.db.find(
      session,
      where: (e) => e.usuarioId.equals(idUsuario),
    );
  }

  Future<void> eliminarEvento(Session session, int idEvento) async {
    await Evento.db.deleteWhere(session, where: (e) => e.id.equals(idEvento));
  }

  Future<Evento?> editarEvento(Session session, int idEvento,
      String nuevoTitulo, String nuevaDescripcion, DateTime nuevaFecha) async {
    var eventos = await Evento.db.find(
      session,
      where: (e) => e.id.equals(idEvento),
    );
    if (eventos.isEmpty) return null;

    var evento = eventos.first
      ..titulo = nuevoTitulo
      ..descripcion = nuevaDescripcion
      ..fecha = nuevaFecha;

    await Evento.db.updateRow(session, evento);
    return evento;
  }
}
