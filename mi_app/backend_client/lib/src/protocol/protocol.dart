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
import 'evento.dart' as _i2;
import 'usuario.dart' as _i3;
import 'package:backend_client/src/protocol/evento.dart' as _i4;
export 'evento.dart';
export 'usuario.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Evento) {
      return _i2.Evento.fromJson(data) as T;
    }
    if (t == _i3.Usuario) {
      return _i3.Usuario.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Evento?>()) {
      return (data != null ? _i2.Evento.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Usuario?>()) {
      return (data != null ? _i3.Usuario.fromJson(data) : null) as T;
    }
    if (t == List<_i4.Evento>) {
      return (data as List).map((e) => deserialize<_i4.Evento>(e)).toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Evento) {
      return 'Evento';
    }
    if (data is _i3.Usuario) {
      return 'Usuario';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Evento') {
      return deserialize<_i2.Evento>(data['data']);
    }
    if (dataClassName == 'Usuario') {
      return deserialize<_i3.Usuario>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
