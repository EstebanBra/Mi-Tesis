import 'package:flutter/material.dart';
import '../../servicios/usuario_servicio.dart';
import '../../pantallas/gestionAcademica/lista_eventos.dart';
import '../../servicios/evento_servicio.dart';
import 'package:backend_client/backend_client.dart';

class Login extends StatefulWidget {
  final UsuarioServicio usuarioServicio;
  final EventoServicio eventoServicio; // <-- agrega esto

  const Login({
    required this.usuarioServicio,
    required this.eventoServicio,
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final correoController = TextEditingController();
  final contrasenaController = TextEditingController();
  String mensaje = '';

  Future<void> _login() async {
    final correo = correoController.text.trim();
    final contrasena = contrasenaController.text;
    final usuario = await widget.usuarioServicio.login(correo, contrasena);
    setState(() {
      if (usuario != null && usuario.id != null) {
        mensaje = 'Login exitoso. Bienvenido ${usuario.nombre}';
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ListaEventos(
              eventoServicio: widget.eventoServicio,
              idUsuario: usuario.id!,
            ),
          ),
        );
      } else {
        mensaje = 'Correo o contraseña incorrectos';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: correoController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: contrasenaController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Iniciar sesión'),
            ),
            const SizedBox(height: 12),
            Text(mensaje),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registro');
              },
              child: const Text('¿No tienes cuenta? Regístrate'),
            ),
          ],
        ),
      ),
    );
  }
}
