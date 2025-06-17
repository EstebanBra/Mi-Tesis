import 'package:backend_server/server.dart' as server;

Future<void> main(List<String> args) async {
  // Pasamos los argumentos de línea de comando a tu función run()
  await server.run(args);
}