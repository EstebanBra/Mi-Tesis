import 'package:flutter/material.dart';
import 'package:backend_client/backend_client.dart';

import 'pantallas/login/login.dart';
import 'pantallas/login/registro.dart';
import 'pantallas/gestionAcademica/lista_eventos.dart';
import 'pantallas/gestionAcademica/crear_evento.dart';

import 'servicios/usuario_servicio.dart';
import 'servicios/evento_servicio.dart';

late final Client client;

void main() {
  client = Client('http://10.0.2.2:8080/');
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  MiApp({super.key});

  final usuarioServicio = UsuarioServicio(client);
  final eventoServicio = EventoServicio(client);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiApp',
      initialRoute: '/',
      routes: {
        '/': (context) => Login(
          usuarioServicio: usuarioServicio,
          eventoServicio: eventoServicio),
        '/registro': (context) => Registro(usuarioServicio: usuarioServicio),
        // Importante: la lista de eventos y crear evento requieren idUsuario, así que NO se ponen aquí
        // Se navega a ellas con MaterialPageRoute y se les pasa el idUsuario cuando sea necesario
      },
    );
  }
}
