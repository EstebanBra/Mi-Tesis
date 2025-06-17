import 'package:flutter/material.dart';
import 'package:backend_client/backend_client.dart';

// Cliente Serverpod (ajusta la URL según tu entorno)
late final Client client;

void main() {
  client = Client('http://10.0.2.2:8080/'); // Cambia la URL si usas otro entorno
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiApp',
      home: const PantallaInicio(),
    );
  }
}

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  String mensaje = 'Presiona un botón para interactuar con el backend';
  final TextEditingController controladorNombre = TextEditingController();

  // Método para obtener usuarios
  Future<void> obtenerUsuarios() async {
    try {
      List<Usuario> usuarios = await client.usuario.obtenerUsuarios();
      setState(() {
        if (usuarios.isNotEmpty) {
          mensaje = 'Primer usuario: ${usuarios[0].nombre}';
        } else {
          mensaje = 'No hay usuarios registrados';
        }
      });
    } catch (e) {
      setState(() {
        mensaje = 'Error al obtener usuarios: $e';
      });
    }
  }

  // Método para agregar usuario con el nombre ingresado
  Future<void> agregarUsuario() async {
    String nombreUsuario = controladorNombre.text.trim();
    if (nombreUsuario.isEmpty) {
      setState(() {
        mensaje = 'Debes escribir un nombre antes de agregar un usuario.';
      });
      return;
    }

    try {
      Usuario usuario = await client.usuario.agregarUsuario(nombreUsuario);
      setState(() {
        mensaje = 'Usuario creado: ${usuario.nombre}';
        controladorNombre.clear(); // Limpia el input después de agregar
      });
    } catch (e) {
      setState(() {
        mensaje = 'Error al agregar usuario: $e';
      });
    }
  }

  @override
  void dispose() {
    controladorNombre.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MiApp'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mensaje,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: controladorNombre,
                  decoration: const InputDecoration(
                    labelText: 'Nombre de usuario',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: agregarUsuario,
                child: const Text('Agregar usuario'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: obtenerUsuarios,
                child: const Text('Obtener usuarios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
