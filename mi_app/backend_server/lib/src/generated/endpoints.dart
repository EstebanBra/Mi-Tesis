/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/evento_endpoint.dart' as _i2;
import '../endpoints/usuario_endpoint.dart' as _i3;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'evento': _i2.EventoEndpoint()
        ..initialize(
          server,
          'evento',
          null,
        ),
      'usuario': _i3.UsuarioEndpoint()
        ..initialize(
          server,
          'usuario',
          null,
        ),
    };
    connectors['evento'] = _i1.EndpointConnector(
      name: 'evento',
      endpoint: endpoints['evento']!,
      methodConnectors: {
        'crearEvento': _i1.MethodConnector(
          name: 'crearEvento',
          params: {
            'titulo': _i1.ParameterDescription(
              name: 'titulo',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'descripcion': _i1.ParameterDescription(
              name: 'descripcion',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fecha': _i1.ParameterDescription(
              name: 'fecha',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'idUsuario': _i1.ParameterDescription(
              name: 'idUsuario',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evento'] as _i2.EventoEndpoint).crearEvento(
            session,
            params['titulo'],
            params['descripcion'],
            params['fecha'],
            params['idUsuario'],
          ),
        ),
        'obtenerEventos': _i1.MethodConnector(
          name: 'obtenerEventos',
          params: {
            'idUsuario': _i1.ParameterDescription(
              name: 'idUsuario',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evento'] as _i2.EventoEndpoint).obtenerEventos(
            session,
            params['idUsuario'],
          ),
        ),
        'eliminarEvento': _i1.MethodConnector(
          name: 'eliminarEvento',
          params: {
            'idEvento': _i1.ParameterDescription(
              name: 'idEvento',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evento'] as _i2.EventoEndpoint).eliminarEvento(
            session,
            params['idEvento'],
          ),
        ),
        'editarEvento': _i1.MethodConnector(
          name: 'editarEvento',
          params: {
            'idEvento': _i1.ParameterDescription(
              name: 'idEvento',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'nuevoTitulo': _i1.ParameterDescription(
              name: 'nuevoTitulo',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'nuevaDescripcion': _i1.ParameterDescription(
              name: 'nuevaDescripcion',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'nuevaFecha': _i1.ParameterDescription(
              name: 'nuevaFecha',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['evento'] as _i2.EventoEndpoint).editarEvento(
            session,
            params['idEvento'],
            params['nuevoTitulo'],
            params['nuevaDescripcion'],
            params['nuevaFecha'],
          ),
        ),
      },
    );
    connectors['usuario'] = _i1.EndpointConnector(
      name: 'usuario',
      endpoint: endpoints['usuario']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'correo': _i1.ParameterDescription(
              name: 'correo',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'contrasena': _i1.ParameterDescription(
              name: 'contrasena',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usuario'] as _i3.UsuarioEndpoint).login(
            session,
            params['correo'],
            params['contrasena'],
          ),
        ),
        'crearUsuario': _i1.MethodConnector(
          name: 'crearUsuario',
          params: {
            'nombre': _i1.ParameterDescription(
              name: 'nombre',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'correo': _i1.ParameterDescription(
              name: 'correo',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'contrasena': _i1.ParameterDescription(
              name: 'contrasena',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usuario'] as _i3.UsuarioEndpoint).crearUsuario(
            session,
            params['nombre'],
            params['correo'],
            params['contrasena'],
          ),
        ),
      },
    );
  }
}
