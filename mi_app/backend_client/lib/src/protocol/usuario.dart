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

abstract class Usuario implements _i1.SerializableModel {
  Usuario._({
    this.id,
    required this.nombre,
    this.correo,
    this.fechaRegistro,
    this.claveHash,
  });

  factory Usuario({
    int? id,
    required String nombre,
    String? correo,
    DateTime? fechaRegistro,
    String? claveHash,
  }) = _UsuarioImpl;

  factory Usuario.fromJson(Map<String, dynamic> jsonSerialization) {
    return Usuario(
      id: jsonSerialization['id'] as int?,
      nombre: jsonSerialization['nombre'] as String,
      correo: jsonSerialization['correo'] as String?,
      fechaRegistro: jsonSerialization['fechaRegistro'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['fechaRegistro']),
      claveHash: jsonSerialization['claveHash'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String nombre;

  String? correo;

  DateTime? fechaRegistro;

  String? claveHash;

  /// Returns a shallow copy of this [Usuario]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Usuario copyWith({
    int? id,
    String? nombre,
    String? correo,
    DateTime? fechaRegistro,
    String? claveHash,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nombre': nombre,
      if (correo != null) 'correo': correo,
      if (fechaRegistro != null) 'fechaRegistro': fechaRegistro?.toJson(),
      if (claveHash != null) 'claveHash': claveHash,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UsuarioImpl extends Usuario {
  _UsuarioImpl({
    int? id,
    required String nombre,
    String? correo,
    DateTime? fechaRegistro,
    String? claveHash,
  }) : super._(
          id: id,
          nombre: nombre,
          correo: correo,
          fechaRegistro: fechaRegistro,
          claveHash: claveHash,
        );

  /// Returns a shallow copy of this [Usuario]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Usuario copyWith({
    Object? id = _Undefined,
    String? nombre,
    Object? correo = _Undefined,
    Object? fechaRegistro = _Undefined,
    Object? claveHash = _Undefined,
  }) {
    return Usuario(
      id: id is int? ? id : this.id,
      nombre: nombre ?? this.nombre,
      correo: correo is String? ? correo : this.correo,
      fechaRegistro:
          fechaRegistro is DateTime? ? fechaRegistro : this.fechaRegistro,
      claveHash: claveHash is String? ? claveHash : this.claveHash,
    );
  }
}
