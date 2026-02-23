// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DiaCalendarioStruct extends FFFirebaseStruct {
  DiaCalendarioStruct({
    bool? esMesAnterior,
    bool? esMesProximo,
    DateTime? fechaCalendario,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _esMesAnterior = esMesAnterior,
        _esMesProximo = esMesProximo,
        _fechaCalendario = fechaCalendario,
        super(firestoreUtilData);

  // "EsMesAnterior" field.
  bool? _esMesAnterior;
  bool get esMesAnterior => _esMesAnterior ?? false;
  set esMesAnterior(bool? val) => _esMesAnterior = val;

  bool hasEsMesAnterior() => _esMesAnterior != null;

  // "EsMesProximo" field.
  bool? _esMesProximo;
  bool get esMesProximo => _esMesProximo ?? false;
  set esMesProximo(bool? val) => _esMesProximo = val;

  bool hasEsMesProximo() => _esMesProximo != null;

  // "FechaCalendario" field.
  DateTime? _fechaCalendario;
  DateTime? get fechaCalendario => _fechaCalendario;
  set fechaCalendario(DateTime? val) => _fechaCalendario = val;

  bool hasFechaCalendario() => _fechaCalendario != null;

  static DiaCalendarioStruct fromMap(Map<String, dynamic> data) =>
      DiaCalendarioStruct(
        esMesAnterior: data['EsMesAnterior'] as bool?,
        esMesProximo: data['EsMesProximo'] as bool?,
        fechaCalendario: data['FechaCalendario'] as DateTime?,
      );

  static DiaCalendarioStruct? maybeFromMap(dynamic data) => data is Map
      ? DiaCalendarioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'EsMesAnterior': _esMesAnterior,
        'EsMesProximo': _esMesProximo,
        'FechaCalendario': _fechaCalendario,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'EsMesAnterior': serializeParam(
          _esMesAnterior,
          ParamType.bool,
        ),
        'EsMesProximo': serializeParam(
          _esMesProximo,
          ParamType.bool,
        ),
        'FechaCalendario': serializeParam(
          _fechaCalendario,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DiaCalendarioStruct fromSerializableMap(Map<String, dynamic> data) =>
      DiaCalendarioStruct(
        esMesAnterior: deserializeParam(
          data['EsMesAnterior'],
          ParamType.bool,
          false,
        ),
        esMesProximo: deserializeParam(
          data['EsMesProximo'],
          ParamType.bool,
          false,
        ),
        fechaCalendario: deserializeParam(
          data['FechaCalendario'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DiaCalendarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DiaCalendarioStruct &&
        esMesAnterior == other.esMesAnterior &&
        esMesProximo == other.esMesProximo &&
        fechaCalendario == other.fechaCalendario;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([esMesAnterior, esMesProximo, fechaCalendario]);
}

DiaCalendarioStruct createDiaCalendarioStruct({
  bool? esMesAnterior,
  bool? esMesProximo,
  DateTime? fechaCalendario,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DiaCalendarioStruct(
      esMesAnterior: esMesAnterior,
      esMesProximo: esMesProximo,
      fechaCalendario: fechaCalendario,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DiaCalendarioStruct? updateDiaCalendarioStruct(
  DiaCalendarioStruct? diaCalendario, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    diaCalendario
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDiaCalendarioStructData(
  Map<String, dynamic> firestoreData,
  DiaCalendarioStruct? diaCalendario,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (diaCalendario == null) {
    return;
  }
  if (diaCalendario.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && diaCalendario.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final diaCalendarioData =
      getDiaCalendarioFirestoreData(diaCalendario, forFieldValue);
  final nestedData =
      diaCalendarioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = diaCalendario.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDiaCalendarioFirestoreData(
  DiaCalendarioStruct? diaCalendario, [
  bool forFieldValue = false,
]) {
  if (diaCalendario == null) {
    return {};
  }
  final firestoreData = mapToFirestore(diaCalendario.toMap());

  // Add any Firestore field values
  diaCalendario.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDiaCalendarioListFirestoreData(
  List<DiaCalendarioStruct>? diaCalendarios,
) =>
    diaCalendarios
        ?.map((e) => getDiaCalendarioFirestoreData(e, true))
        .toList() ??
    [];
