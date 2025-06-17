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

abstract class Evento implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = EventoTable();

  static const db = EventoRepository._();

  @override
  int? id;

  String titulo;

  String descripcion;

  DateTime fecha;

  int usuarioId;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'fecha': fecha.toJson(),
      'usuarioId': usuarioId,
    };
  }

  static EventoInclude include() {
    return EventoInclude._();
  }

  static EventoIncludeList includeList({
    _i1.WhereExpressionBuilder<EventoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventoTable>? orderByList,
    EventoInclude? include,
  }) {
    return EventoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Evento.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Evento.t),
      include: include,
    );
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

class EventoTable extends _i1.Table<int?> {
  EventoTable({super.tableRelation}) : super(tableName: 'evento') {
    titulo = _i1.ColumnString(
      'titulo',
      this,
    );
    descripcion = _i1.ColumnString(
      'descripcion',
      this,
    );
    fecha = _i1.ColumnDateTime(
      'fecha',
      this,
    );
    usuarioId = _i1.ColumnInt(
      'usuarioId',
      this,
    );
  }

  late final _i1.ColumnString titulo;

  late final _i1.ColumnString descripcion;

  late final _i1.ColumnDateTime fecha;

  late final _i1.ColumnInt usuarioId;

  @override
  List<_i1.Column> get columns => [
        id,
        titulo,
        descripcion,
        fecha,
        usuarioId,
      ];
}

class EventoInclude extends _i1.IncludeObject {
  EventoInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Evento.t;
}

class EventoIncludeList extends _i1.IncludeList {
  EventoIncludeList._({
    _i1.WhereExpressionBuilder<EventoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Evento.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Evento.t;
}

class EventoRepository {
  const EventoRepository._();

  /// Returns a list of [Evento]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Evento>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Evento>(
      where: where?.call(Evento.t),
      orderBy: orderBy?.call(Evento.t),
      orderByList: orderByList?.call(Evento.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Evento] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Evento?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventoTable>? where,
    int? offset,
    _i1.OrderByBuilder<EventoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Evento>(
      where: where?.call(Evento.t),
      orderBy: orderBy?.call(Evento.t),
      orderByList: orderByList?.call(Evento.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Evento] by its [id] or null if no such row exists.
  Future<Evento?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Evento>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Evento]s in the list and returns the inserted rows.
  ///
  /// The returned [Evento]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Evento>> insert(
    _i1.Session session,
    List<Evento> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Evento>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Evento] and returns the inserted row.
  ///
  /// The returned [Evento] will have its `id` field set.
  Future<Evento> insertRow(
    _i1.Session session,
    Evento row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Evento>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Evento]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Evento>> update(
    _i1.Session session,
    List<Evento> rows, {
    _i1.ColumnSelections<EventoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Evento>(
      rows,
      columns: columns?.call(Evento.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Evento]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Evento> updateRow(
    _i1.Session session,
    Evento row, {
    _i1.ColumnSelections<EventoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Evento>(
      row,
      columns: columns?.call(Evento.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Evento]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Evento>> delete(
    _i1.Session session,
    List<Evento> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Evento>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Evento].
  Future<Evento> deleteRow(
    _i1.Session session,
    Evento row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Evento>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Evento>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EventoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Evento>(
      where: where(Evento.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Evento>(
      where: where?.call(Evento.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
