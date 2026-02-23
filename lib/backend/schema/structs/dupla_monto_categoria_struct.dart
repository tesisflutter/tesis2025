// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Es un tipo de dato que consolida una categoria de transacciones
/// (gastos/ingresos del usuario) y contiene la sumatoria de los montos
/// correspondientes
class DuplaMontoCategoriaStruct extends FFFirebaseStruct {
  DuplaMontoCategoriaStruct({
    String? categoria,
    double? montoTotal,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoria = categoria,
        _montoTotal = montoTotal,
        super(firestoreUtilData);

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "MontoTotal" field.
  double? _montoTotal;
  double get montoTotal => _montoTotal ?? 0.0;
  set montoTotal(double? val) => _montoTotal = val;

  void incrementMontoTotal(double amount) => montoTotal = montoTotal + amount;

  bool hasMontoTotal() => _montoTotal != null;

  static DuplaMontoCategoriaStruct fromMap(Map<String, dynamic> data) =>
      DuplaMontoCategoriaStruct(
        categoria: data['Categoria'] as String?,
        montoTotal: castToType<double>(data['MontoTotal']),
      );

  static DuplaMontoCategoriaStruct? maybeFromMap(dynamic data) => data is Map
      ? DuplaMontoCategoriaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Categoria': _categoria,
        'MontoTotal': _montoTotal,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'MontoTotal': serializeParam(
          _montoTotal,
          ParamType.double,
        ),
      }.withoutNulls;

  static DuplaMontoCategoriaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DuplaMontoCategoriaStruct(
        categoria: deserializeParam(
          data['Categoria'],
          ParamType.String,
          false,
        ),
        montoTotal: deserializeParam(
          data['MontoTotal'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DuplaMontoCategoriaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DuplaMontoCategoriaStruct &&
        categoria == other.categoria &&
        montoTotal == other.montoTotal;
  }

  @override
  int get hashCode => const ListEquality().hash([categoria, montoTotal]);
}

DuplaMontoCategoriaStruct createDuplaMontoCategoriaStruct({
  String? categoria,
  double? montoTotal,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DuplaMontoCategoriaStruct(
      categoria: categoria,
      montoTotal: montoTotal,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DuplaMontoCategoriaStruct? updateDuplaMontoCategoriaStruct(
  DuplaMontoCategoriaStruct? duplaMontoCategoria, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    duplaMontoCategoria
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDuplaMontoCategoriaStructData(
  Map<String, dynamic> firestoreData,
  DuplaMontoCategoriaStruct? duplaMontoCategoria,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (duplaMontoCategoria == null) {
    return;
  }
  if (duplaMontoCategoria.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && duplaMontoCategoria.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final duplaMontoCategoriaData =
      getDuplaMontoCategoriaFirestoreData(duplaMontoCategoria, forFieldValue);
  final nestedData =
      duplaMontoCategoriaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      duplaMontoCategoria.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDuplaMontoCategoriaFirestoreData(
  DuplaMontoCategoriaStruct? duplaMontoCategoria, [
  bool forFieldValue = false,
]) {
  if (duplaMontoCategoria == null) {
    return {};
  }
  final firestoreData = mapToFirestore(duplaMontoCategoria.toMap());

  // Add any Firestore field values
  duplaMontoCategoria.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDuplaMontoCategoriaListFirestoreData(
  List<DuplaMontoCategoriaStruct>? duplaMontoCategorias,
) =>
    duplaMontoCategorias
        ?.map((e) => getDuplaMontoCategoriaFirestoreData(e, true))
        .toList() ??
    [];
