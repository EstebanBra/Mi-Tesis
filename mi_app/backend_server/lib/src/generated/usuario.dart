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

abstract class Usuario
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = UsuarioTable();

  static const db = UsuarioRepository._();

  @override
  int? id;

  String nombre;

  String? correo;

  DateTime? fechaRegistro;

  String? claveHash;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'nombre': nombre,
      if (correo != null) 'correo': correo,
      if (fechaRegistro != null) 'fechaRegistro': fechaRegistro?.toJson(),
      if (claveHash != null) 'claveHash': claveHash,
    };
  }

  static UsuarioInclude include() {
    return UsuarioInclude._();
  }

  static UsuarioIncludeList includeList({
    _i1.WhereExpressionBuilder<UsuarioTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsuarioTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsuarioTable>? orderByList,
    UsuarioInclude? include,
  }) {
    return UsuarioIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Usuario.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Usuario.t),
      include: include,
    );
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

class UsuarioTable extends _i1.Table<int?> {
  UsuarioTable({super.tableRelation}) : super(tableName: 'usuario') {
    nombre = _i1.ColumnString(
      'nombre',
      this,
    );
    correo = _i1.ColumnString(
      'correo',
      this,
    );
    fechaRegistro = _i1.ColumnDateTime(
      'fechaRegistro',
      this,
    );
    claveHash = _i1.ColumnString(
      'claveHash',
      this,
    );
  }

  late final _i1.ColumnString nombre;

  late final _i1.ColumnString correo;

  late final _i1.ColumnDateTime fechaRegistro;

  late final _i1.ColumnString claveHash;

  @override
  List<_i1.Column> get columns => [
        id,
        nombre,
        correo,
        fechaRegistro,
        claveHash,
      ];
}

class UsuarioInclude extends _i1.IncludeObject {
  UsuarioInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Usuario.t;
}

class UsuarioIncludeList extends _i1.IncludeList {
  UsuarioIncludeList._({
    _i1.WhereExpressionBuilder<UsuarioTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Usuario.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Usuario.t;
}

class UsuarioRepository {
  const UsuarioRepository._();

  /// Returns a list of [Usuario]s matching the given query parameters.
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
  Future<List<Usuario>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsuarioTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsuarioTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsuarioTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Usuario>(
      where: where?.call(Usuario.t),
      orderBy: orderBy?.call(Usuario.t),
      orderByList: orderByList?.call(Usuario.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Usuario] matching the given query parameters.
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
  Future<Usuario?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsuarioTable>? where,
    int? offset,
    _i1.OrderByBuilder<UsuarioTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsuarioTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Usuario>(
      where: where?.call(Usuario.t),
      orderBy: orderBy?.call(Usuario.t),
      orderByList: orderByList?.call(Usuario.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Usuario] by its [id] or null if no such row exists.
  Future<Usuario?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Usuario>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Usuario]s in the list and returns the inserted rows.
  ///
  /// The returned [Usuario]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Usuario>> insert(
    _i1.Session session,
    List<Usuario> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Usuario>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Usuario] and returns the inserted row.
  ///
  /// The returned [Usuario] will have its `id` field set.
  Future<Usuario> insertRow(
    _i1.Session session,
    Usuario row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Usuario>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Usuario]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Usuario>> update(
    _i1.Session session,
    List<Usuario> rows, {
    _i1.ColumnSelections<UsuarioTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Usuario>(
      rows,
      columns: columns?.call(Usuario.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Usuario]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Usuario> updateRow(
    _i1.Session session,
    Usuario row, {
    _i1.ColumnSelections<UsuarioTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Usuario>(
      row,
      columns: columns?.call(Usuario.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Usuario]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Usuario>> delete(
    _i1.Session session,
    List<Usuario> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Usuario>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Usuario].
  Future<Usuario> deleteRow(
    _i1.Session session,
    Usuario row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Usuario>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Usuario>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UsuarioTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Usuario>(
      where: where(Usuario.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsuarioTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Usuario>(
      where: where?.call(Usuario.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
