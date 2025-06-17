import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class UsuarioEndpoint extends Endpoint {
  // Método para listar todos los usuarios
  Future<List<Usuario>> obtenerUsuarios(Session session) async {
    return await Usuario.db.find(session);
  }

  // Método para agregar un usuario
  Future<Usuario> agregarUsuario(Session session, String nombre) async {
    var nuevoUsuario = Usuario(
      nombre: nombre,
      // otros campos obligatorios si existen
    );
    await Usuario.db.insertRow(session, nuevoUsuario);
    return nuevoUsuario;
  }
}
