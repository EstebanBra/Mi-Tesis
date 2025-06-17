import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class UsuarioEndpoint extends Endpoint {
  Future<Usuario?> login(Session session, String correo, String contrasena) async {
    var usuarios = await Usuario.db.find(
      session,
      where: (u) => u.correo.equals(correo) & u.claveHash.equals(contrasena),
    );
    return usuarios.isNotEmpty ? usuarios.first : null;
  }

  Future<Usuario> crearUsuario(Session session, String nombre, String correo, String contrasena) async {
    var nuevo = Usuario(nombre: nombre, correo: correo, claveHash: contrasena);
    await Usuario.db.insertRow(session, nuevo);
    return nuevo;
  }
}

