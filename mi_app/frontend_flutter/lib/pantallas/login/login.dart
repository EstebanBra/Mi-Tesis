import 'package:flutter/material.dart';
import '../../servicios/usuario_servicio.dart';
import '../../pantallas/gestionAcademica/lista_eventos.dart';
import '../../servicios/evento_servicio.dart';
import '../../utilidades/colores.dart';
import '../login/witget_tarjeta_auth.dart';

class Login extends StatefulWidget {
  final UsuarioServicio usuarioServicio;
  final EventoServicio eventoServicio;

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
      backgroundColor: ColoresApp.fondoSecundario,
      body: Center(
        child: SingleChildScrollView(
          child: WidgetTarjetaAuth(
            titulo: 'Bienvenido',
            subtitulo: 'Inicia sesión en tu cuenta',
            child: Column(
              children: [
                TextField(
                  controller: correoController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Correo electrónico',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: contrasenaController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Contraseña',
                    suffixIcon: Icon(Icons.visibility_off), // (opcional)
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(44),
                    backgroundColor: ColoresApp.academico,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Iniciar Sesión',
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
                      color: mensaje.contains('exitoso')
                          ? ColoresApp.habitos
                          : ColoresApp.textoSecundario,
                      fontSize: 13,
                    ),
                  ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registro');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: ColoresApp.academico,
                  ),
                  child: const Text('¿No tienes cuenta? Regístrate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
