import 'package:flutter/material.dart';
import 'package:backend_client/backend_client.dart';

import 'pantallas/login/login.dart' as login;
import 'pantallas/login/registro.dart' as registro;

import 'servicios/usuario_servicio.dart';
import 'servicios/evento_servicio.dart';
import 'utilidades/colores.dart';
import 'pantallas/dashboard/splash.dart'; // Importa tu pantalla splash

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
      theme: ThemeData(
        scaffoldBackgroundColor: ColoresApp.fondo,
        primaryColor: ColoresApp.academico,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColoresApp.academico,
          secondary: ColoresApp.habitos,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: ColoresApp.textoPrincipal),
          bodySmall: TextStyle(color: ColoresApp.textoSecundario),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColoresApp.fondoSecundario,
          foregroundColor: ColoresApp.textoPrincipal,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(ColoresApp.academico),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
          ),
        ),

        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: ColoresApp.borde),
          ),
          filled: true,
          fillColor: ColoresApp.fondoSecundario,
          labelStyle: TextStyle(color: ColoresApp.textoSecundario),
        ),
        cardTheme: const CardThemeData(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPantalla(),
        '/': (context) => login.Login(
          usuarioServicio: usuarioServicio,
          eventoServicio: eventoServicio,
        ),
        '/registro': (context) => registro.Registro(usuarioServicio: usuarioServicio),
        // La lista de eventos y crear evento requieren idUsuario,
        // así que se navega a ellas usando MaterialPageRoute
      },
    );
  }
}
