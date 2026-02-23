import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EquinoRecord extends FirestoreRecord {
  EquinoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Equino" field.
  int? _iDEquino;
  int get iDEquino => _iDEquino ?? 0;
  bool hasIDEquino() => _iDEquino != null;

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "CorreoDuenio" field.
  String? _correoDuenio;
  String get correoDuenio => _correoDuenio ?? '';
  bool hasCorreoDuenio() => _correoDuenio != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "Sexo" field.
  String? _sexo;
  String get sexo => _sexo ?? '';
  bool hasSexo() => _sexo != null;

  // "Raza" field.
  String? _raza;
  String get raza => _raza ?? '';
  bool hasRaza() => _raza != null;

  // "Altura" field.
  int? _altura;
  int get altura => _altura ?? 0;
  bool hasAltura() => _altura != null;

  // "Color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "Ubicacion" field.
  String? _ubicacion;
  String get ubicacion => _ubicacion ?? '';
  bool hasUbicacion() => _ubicacion != null;

  // "Lista_URL_Fotos" field.
  List<String>? _listaURLFotos;
  List<String> get listaURLFotos => _listaURLFotos ?? const [];
  bool hasListaURLFotos() => _listaURLFotos != null;

  // "Fecha_Registro" field.
  DateTime? _fechaRegistro;
  DateTime? get fechaRegistro => _fechaRegistro;
  bool hasFechaRegistro() => _fechaRegistro != null;

  // "Fecha_Nacimiento" field.
  DateTime? _fechaNacimiento;
  DateTime? get fechaNacimiento => _fechaNacimiento;
  bool hasFechaNacimiento() => _fechaNacimiento != null;

  void _initializeFields() {
    _iDEquino = castToType<int>(snapshotData['ID_Equino']);
    _nombre = snapshotData['Nombre'] as String?;
    _correoDuenio = snapshotData['CorreoDuenio'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _sexo = snapshotData['Sexo'] as String?;
    _raza = snapshotData['Raza'] as String?;
    _altura = castToType<int>(snapshotData['Altura']);
    _color = snapshotData['Color'] as String?;
    _ubicacion = snapshotData['Ubicacion'] as String?;
    _listaURLFotos = getDataList(snapshotData['Lista_URL_Fotos']);
    _fechaRegistro = snapshotData['Fecha_Registro'] as DateTime?;
    _fechaNacimiento = snapshotData['Fecha_Nacimiento'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Equino');

  static Stream<EquinoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EquinoRecord.fromSnapshot(s));

  static Future<EquinoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EquinoRecord.fromSnapshot(s));

  static EquinoRecord fromSnapshot(DocumentSnapshot snapshot) => EquinoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EquinoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EquinoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EquinoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EquinoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEquinoRecordData({
  int? iDEquino,
  String? nombre,
  String? correoDuenio,
  String? descripcion,
  String? sexo,
  String? raza,
  int? altura,
  String? color,
  String? ubicacion,
  DateTime? fechaRegistro,
  DateTime? fechaNacimiento,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Equino': iDEquino,
      'Nombre': nombre,
      'CorreoDuenio': correoDuenio,
      'Descripcion': descripcion,
      'Sexo': sexo,
      'Raza': raza,
      'Altura': altura,
      'Color': color,
      'Ubicacion': ubicacion,
      'Fecha_Registro': fechaRegistro,
      'Fecha_Nacimiento': fechaNacimiento,
    }.withoutNulls,
  );

  return firestoreData;
}

class EquinoRecordDocumentEquality implements Equality<EquinoRecord> {
  const EquinoRecordDocumentEquality();

  @override
  bool equals(EquinoRecord? e1, EquinoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.iDEquino == e2?.iDEquino &&
        e1?.nombre == e2?.nombre &&
        e1?.correoDuenio == e2?.correoDuenio &&
        e1?.descripcion == e2?.descripcion &&
        e1?.sexo == e2?.sexo &&
        e1?.raza == e2?.raza &&
        e1?.altura == e2?.altura &&
        e1?.color == e2?.color &&
        e1?.ubicacion == e2?.ubicacion &&
        listEquality.equals(e1?.listaURLFotos, e2?.listaURLFotos) &&
        e1?.fechaRegistro == e2?.fechaRegistro &&
        e1?.fechaNacimiento == e2?.fechaNacimiento;
  }

  @override
  int hash(EquinoRecord? e) => const ListEquality().hash([
        e?.iDEquino,
        e?.nombre,
        e?.correoDuenio,
        e?.descripcion,
        e?.sexo,
        e?.raza,
        e?.altura,
        e?.color,
        e?.ubicacion,
        e?.listaURLFotos,
        e?.fechaRegistro,
        e?.fechaNacimiento
      ]);

  @override
  bool isValidKey(Object? o) => o is EquinoRecord;
}
