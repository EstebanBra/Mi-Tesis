/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:backend_client/src/protocol/evento.dart' as _i3;
import 'package:backend_client/src/protocol/usuario.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointEvento extends _i1.EndpointRef {
  EndpointEvento(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'evento';

  _i2.Future<_i3.Evento> crearEvento(
    String titulo,
    String descripcion,
    DateTime fecha,
    int idUsuario,
  ) =>
      caller.callServerEndpoint<_i3.Evento>(
        'evento',
        'crearEvento',
        {
          'titulo': titulo,
          'descripcion': descripcion,
          'fecha': fecha,
          'idUsuario': idUsuario,
        },
      );

  _i2.Future<List<_i3.Evento>> obtenerEventos(int idUsuario) =>
      caller.callServerEndpoint<List<_i3.Evento>>(
        'evento',
        'obtenerEventos',
        {'idUsuario': idUsuario},
      );

  _i2.Future<void> eliminarEvento(int idEvento) =>
      caller.callServerEndpoint<void>(
        'evento',
        'eliminarEvento',
        {'idEvento': idEvento},
      );

  _i2.Future<_i3.Evento?> editarEvento(
    int idEvento,
    String nuevoTitulo,
    String nuevaDescripcion,
    DateTime nuevaFecha,
  ) =>
      caller.callServerEndpoint<_i3.Evento?>(
        'evento',
        'editarEvento',
        {
          'idEvento': idEvento,
          'nuevoTitulo': nuevoTitulo,
          'nuevaDescripcion': nuevaDescripcion,
          'nuevaFecha': nuevaFecha,
        },
      );
}

/// {@category Endpoint}
class EndpointUsuario extends _i1.EndpointRef {
  EndpointUsuario(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'usuario';

  _i2.Future<_i4.Usuario?> login(
    String correo,
    String contrasena,
  ) =>
      caller.callServerEndpoint<_i4.Usuario?>(
        'usuario',
        'login',
        {
          'correo': correo,
          'contrasena': contrasena,
        },
      );

  _i2.Future<_i4.Usuario> crearUsuario(
    String nombre,
    String correo,
    String contrasena,
  ) =>
      caller.callServerEndpoint<_i4.Usuario>(
        'usuario',
        'crearUsuario',
        {
          'nombre': nombre,
          'correo': correo,
          'contrasena': contrasena,
        },
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    evento = EndpointEvento(this);
    usuario = EndpointUsuario(this);
  }

  late final EndpointEvento evento;

  late final EndpointUsuario usuario;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'evento': evento,
        'usuario': usuario,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
