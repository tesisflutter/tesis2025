import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VacunacionRecord extends FirestoreRecord {
  VacunacionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Vacunacion" field.
  int? _iDVacunacion;
  int get iDVacunacion => _iDVacunacion ?? 0;
  bool hasIDVacunacion() => _iDVacunacion != null;

  // "Nombre_Caballo" field.
  String? _nombreCaballo;
  String get nombreCaballo => _nombreCaballo ?? '';
  bool hasNombreCaballo() => _nombreCaballo != null;

  // "Correo_Duenio_Caballo" field.
  String? _correoDuenioCaballo;
  String get correoDuenioCaballo => _correoDuenioCaballo ?? '';
  bool hasCorreoDuenioCaballo() => _correoDuenioCaballo != null;

  // "Nombre_Vacuna" field.
  String? _nombreVacuna;
  String get nombreVacuna => _nombreVacuna ?? '';
  bool hasNombreVacuna() => _nombreVacuna != null;

  // "Enfermedades_Prevenidas" field.
  List<String>? _enfermedadesPrevenidas;
  List<String> get enfermedadesPrevenidas =>
      _enfermedadesPrevenidas ?? const [];
  bool hasEnfermedadesPrevenidas() => _enfermedadesPrevenidas != null;

  // "Nro_Dosis" field.
  String? _nroDosis;
  String get nroDosis => _nroDosis ?? '';
  bool hasNroDosis() => _nroDosis != null;

  // "Fecha_Administracion" field.
  DateTime? _fechaAdministracion;
  DateTime? get fechaAdministracion => _fechaAdministracion;
  bool hasFechaAdministracion() => _fechaAdministracion != null;

  // "Fecha_Prox_Administracion" field.
  DateTime? _fechaProxAdministracion;
  DateTime? get fechaProxAdministracion => _fechaProxAdministracion;
  bool hasFechaProxAdministracion() => _fechaProxAdministracion != null;

  // "Duracion_Dias" field.
  int? _duracionDias;
  int get duracionDias => _duracionDias ?? 0;
  bool hasDuracionDias() => _duracionDias != null;

  // "Correo_Medico_Veterinario" field.
  String? _correoMedicoVeterinario;
  String get correoMedicoVeterinario => _correoMedicoVeterinario ?? '';
  bool hasCorreoMedicoVeterinario() => _correoMedicoVeterinario != null;

  // "Nro_Lote" field.
  String? _nroLote;
  String get nroLote => _nroLote ?? '';
  bool hasNroLote() => _nroLote != null;

  void _initializeFields() {
    _iDVacunacion = castToType<int>(snapshotData['ID_Vacunacion']);
    _nombreCaballo = snapshotData['Nombre_Caballo'] as String?;
    _correoDuenioCaballo = snapshotData['Correo_Duenio_Caballo'] as String?;
    _nombreVacuna = snapshotData['Nombre_Vacuna'] as String?;
    _enfermedadesPrevenidas =
        getDataList(snapshotData['Enfermedades_Prevenidas']);
    _nroDosis = snapshotData['Nro_Dosis'] as String?;
    _fechaAdministracion = snapshotData['Fecha_Administracion'] as DateTime?;
    _fechaProxAdministracion =
        snapshotData['Fecha_Prox_Administracion'] as DateTime?;
    _duracionDias = castToType<int>(snapshotData['Duracion_Dias']);
    _correoMedicoVeterinario =
        snapshotData['Correo_Medico_Veterinario'] as String?;
    _nroLote = snapshotData['Nro_Lote'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Vacunacion');

  static Stream<VacunacionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VacunacionRecord.fromSnapshot(s));

  static Future<VacunacionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VacunacionRecord.fromSnapshot(s));

  static VacunacionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VacunacionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VacunacionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VacunacionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VacunacionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VacunacionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVacunacionRecordData({
  int? iDVacunacion,
  String? nombreCaballo,
  String? correoDuenioCaballo,
  String? nombreVacuna,
  String? nroDosis,
  DateTime? fechaAdministracion,
  DateTime? fechaProxAdministracion,
  int? duracionDias,
  String? correoMedicoVeterinario,
  String? nroLote,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Vacunacion': iDVacunacion,
      'Nombre_Caballo': nombreCaballo,
      'Correo_Duenio_Caballo': correoDuenioCaballo,
      'Nombre_Vacuna': nombreVacuna,
      'Nro_Dosis': nroDosis,
      'Fecha_Administracion': fechaAdministracion,
      'Fecha_Prox_Administracion': fechaProxAdministracion,
      'Duracion_Dias': duracionDias,
      'Correo_Medico_Veterinario': correoMedicoVeterinario,
      'Nro_Lote': nroLote,
    }.withoutNulls,
  );

  return firestoreData;
}

class VacunacionRecordDocumentEquality implements Equality<VacunacionRecord> {
  const VacunacionRecordDocumentEquality();

  @override
  bool equals(VacunacionRecord? e1, VacunacionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.iDVacunacion == e2?.iDVacunacion &&
        e1?.nombreCaballo == e2?.nombreCaballo &&
        e1?.correoDuenioCaballo == e2?.correoDuenioCaballo &&
        e1?.nombreVacuna == e2?.nombreVacuna &&
        listEquality.equals(
            e1?.enfermedadesPrevenidas, e2?.enfermedadesPrevenidas) &&
        e1?.nroDosis == e2?.nroDosis &&
        e1?.fechaAdministracion == e2?.fechaAdministracion &&
        e1?.fechaProxAdministracion == e2?.fechaProxAdministracion &&
        e1?.duracionDias == e2?.duracionDias &&
        e1?.correoMedicoVeterinario == e2?.correoMedicoVeterinario &&
        e1?.nroLote == e2?.nroLote;
  }

  @override
  int hash(VacunacionRecord? e) => const ListEquality().hash([
        e?.iDVacunacion,
        e?.nombreCaballo,
        e?.correoDuenioCaballo,
        e?.nombreVacuna,
        e?.enfermedadesPrevenidas,
        e?.nroDosis,
        e?.fechaAdministracion,
        e?.fechaProxAdministracion,
        e?.duracionDias,
        e?.correoMedicoVeterinario,
        e?.nroLote
      ]);

  @override
  bool isValidKey(Object? o) => o is VacunacionRecord;
}
