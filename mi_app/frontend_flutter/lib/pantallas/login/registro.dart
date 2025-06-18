import 'package:flutter/material.dart';
import '../../servicios/usuario_servicio.dart';
import '../../utilidades/colores.dart';
import '../login/witget_tarjeta_auth.dart';

class Registro extends StatefulWidget {
  final UsuarioServicio usuarioServicio;
  const Registro({required this.usuarioServicio, super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final contrasenaController = TextEditingController();
  String mensaje = '';

  Future<void> _registrar() async {
    final nombre = nombreController.text.trim();
    final correo = correoController.text.trim();
    final contrasena = contrasenaController.text;
    try {
      final usuario = await widget.usuarioServicio.crearUsuario(
        nombre,
        correo,
        contrasena,
      );
      setState(() {
        mensaje = 'Usuario creado: ${usuario.nombre}. ¡Ahora inicia sesión!';
      });
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      setState(() {
        mensaje = 'Error al crear usuario: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresApp.fondoSecundario,
      body: Center(
        child: SingleChildScrollView(
          child: WidgetTarjetaAuth(
            titulo: 'Crea tu cuenta',
            subtitulo: 'Regístrate para comenzar',
            child: Column(
              children: [
                TextField(
                  controller: nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: correoController,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: contrasenaController,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 22),
                ElevatedButton(
                  onPressed: _registrar,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(44),
                    backgroundColor: ColoresApp.academico,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
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
