import 'package:backend_client/backend_client.dart';

class UsuarioServicio {
  final Client client;

  UsuarioServicio(this.client);

  Future<Usuario?> login(String correo, String contrasena) async {
    return await client.usuario.login(correo, contrasena);
  }

  Future<Usuario> crearUsuario(String nombre, String correo, String contrasena) async {
    return await client.usuario.crearUsuario(nombre, correo, contrasena);
  }
}