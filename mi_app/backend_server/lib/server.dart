import 'package:serverpod/serverpod.dart';
import 'src/generated/protocol.dart';   // Clases generadas de tus modelos
import 'src/generated/endpoints.dart';  // Clase generada que lista todos tus endpoints

/// Punto de entrada de tu servidor. Usado por bin/main.dart.
Future<void> run(List<String> args) async {
  // Crea la instancia de Serverpod con tu protocolo y endpoints
  var pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  // Esto aplicará automáticamente cualquier migración pendiente
  // y arrancará el servidor en el puerto configurado (por defecto 8080).
  await pod.start();
}
