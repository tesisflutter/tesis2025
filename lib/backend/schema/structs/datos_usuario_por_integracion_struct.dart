// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DatosUsuarioPorIntegracionStruct extends FFFirebaseStruct {
  DatosUsuarioPorIntegracionStruct({
    String? nombrePerfil,
    String? email,
    String? uRLFotoPerfil,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombrePerfil = nombrePerfil,
        _email = email,
        _uRLFotoPerfil = uRLFotoPerfil,
        super(firestoreUtilData);

  // "NombrePerfil" field.
  String? _nombrePerfil;
  String get nombrePerfil => _nombrePerfil ?? '';
  set nombrePerfil(String? val) => _nombrePerfil = val;

  bool hasNombrePerfil() => _nombrePerfil != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "URL_FotoPerfil" field.
  String? _uRLFotoPerfil;
  String get uRLFotoPerfil => _uRLFotoPerfil ?? '';
  set uRLFotoPerfil(String? val) => _uRLFotoPerfil = val;

  bool hasURLFotoPerfil() => _uRLFotoPerfil != null;

  static DatosUsuarioPorIntegracionStruct fromMap(Map<String, dynamic> data) =>
      DatosUsuarioPorIntegracionStruct(
        nombrePerfil: data['NombrePerfil'] as String?,
        email: data['Email'] as String?,
        uRLFotoPerfil: data['URL_FotoPerfil'] as String?,
      );

  static DatosUsuarioPorIntegracionStruct? maybeFromMap(dynamic data) => data
          is Map
      ? DatosUsuarioPorIntegracionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'NombrePerfil': _nombrePerfil,
        'Email': _email,
        'URL_FotoPerfil': _uRLFotoPerfil,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'NombrePerfil': serializeParam(
          _nombrePerfil,
          ParamType.String,
        ),
        'Email': serializeParam(
          _email,
          ParamType.String,
        ),
        'URL_FotoPerfil': serializeParam(
          _uRLFotoPerfil,
          ParamType.String,
        ),
      }.withoutNulls;

  static DatosUsuarioPorIntegracionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DatosUsuarioPorIntegracionStruct(
        nombrePerfil: deserializeParam(
          data['NombrePerfil'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['Email'],
          ParamType.String,
          false,
        ),
        uRLFotoPerfil: deserializeParam(
          data['URL_FotoPerfil'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DatosUsuarioPorIntegracionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DatosUsuarioPorIntegracionStruct &&
        nombrePerfil == other.nombrePerfil &&
        email == other.email &&
        uRLFotoPerfil == other.uRLFotoPerfil;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nombrePerfil, email, uRLFotoPerfil]);
}

DatosUsuarioPorIntegracionStruct createDatosUsuarioPorIntegracionStruct({
  String? nombrePerfil,
  String? email,
  String? uRLFotoPerfil,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DatosUsuarioPorIntegracionStruct(
      nombrePerfil: nombrePerfil,
      email: email,
      uRLFotoPerfil: uRLFotoPerfil,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DatosUsuarioPorIntegracionStruct? updateDatosUsuarioPorIntegracionStruct(
  DatosUsuarioPorIntegracionStruct? datosUsuarioPorIntegracion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    datosUsuarioPorIntegracion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDatosUsuarioPorIntegracionStructData(
  Map<String, dynamic> firestoreData,
  DatosUsuarioPorIntegracionStruct? datosUsuarioPorIntegracion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (datosUsuarioPorIntegracion == null) {
    return;
  }
  if (datosUsuarioPorIntegracion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      datosUsuarioPorIntegracion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final datosUsuarioPorIntegracionData =
      getDatosUsuarioPorIntegracionFirestoreData(
          datosUsuarioPorIntegracion, forFieldValue);
  final nestedData = datosUsuarioPorIntegracionData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      datosUsuarioPorIntegracion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDatosUsuarioPorIntegracionFirestoreData(
  DatosUsuarioPorIntegracionStruct? datosUsuarioPorIntegracion, [
  bool forFieldValue = false,
]) {
  if (datosUsuarioPorIntegracion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(datosUsuarioPorIntegracion.toMap());

  // Add any Firestore field values
  datosUsuarioPorIntegracion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDatosUsuarioPorIntegracionListFirestoreData(
  List<DatosUsuarioPorIntegracionStruct>? datosUsuarioPorIntegracions,
) =>
    datosUsuarioPorIntegracions
        ?.map((e) => getDatosUsuarioPorIntegracionFirestoreData(e, true))
        .toList() ??
    [];
