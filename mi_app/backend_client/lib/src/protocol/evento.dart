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

abstract class Evento implements _i1.SerializableModel {
  Evento._({
    this.id,
    required this.titulo,
    required this.descripcion,
    required this.fecha,
    required this.usuarioId,
  });

  factory Evento({
    int? id,
    required String titulo,
    required String descripcion,
    required DateTime fecha,
    required int usuarioId,
  }) = _EventoImpl;

  factory Evento.fromJson(Map<String, dynamic> jsonSerialization) {
    return Evento(
      id: jsonSerialization['id'] as int?,
      titulo: jsonSerialization['titulo'] as String,
      descripcion: jsonSerialization['descripcion'] as String,
      fecha: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['fecha']),
      usuarioId: jsonSerialization['usuarioId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String titulo;

  String descripcion;

  DateTime fecha;

  int usuarioId;

  /// Returns a shallow copy of this [Evento]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Evento copyWith({
    int? id,
    String? titulo,
    String? descripcion,
    DateTime? fecha,
    int? usuarioId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'fecha': fecha.toJson(),
      'usuarioId': usuarioId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventoImpl extends Evento {
  _EventoImpl({
    int? id,
    required String titulo,
    required String descripcion,
    required DateTime fecha,
    required int usuarioId,
  }) : super._(
          id: id,
          titulo: titulo,
          descripcion: descripcion,
          fecha: fecha,
          usuarioId: usuarioId,
        );

  /// Returns a shallow copy of this [Evento]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Evento copyWith({
    Object? id = _Undefined,
    String? titulo,
    String? descripcion,
    DateTime? fecha,
    int? usuarioId,
  }) {
    return Evento(
      id: id is int? ? id : this.id,
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      fecha: fecha ?? this.fecha,
      usuarioId: usuarioId ?? this.usuarioId,
    );
  }
}
