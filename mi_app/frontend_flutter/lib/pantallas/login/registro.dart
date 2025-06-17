import 'package:flutter/material.dart';
import '../../servicios/usuario_servicio.dart';

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
      // Aquí va el check:
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
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
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
              onPressed: _registrar,
              child: const Text('Registrarse'),
            ),
            const SizedBox(height: 12),
            Text(mensaje),
          ],
        ),
      ),
    );
  }
}
