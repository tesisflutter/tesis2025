import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoriaClinicaRecord extends FirestoreRecord {
  HistoriaClinicaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Historia_Clinica" field.
  int? _iDHistoriaClinica;
  int get iDHistoriaClinica => _iDHistoriaClinica ?? 0;
  bool hasIDHistoriaClinica() => _iDHistoriaClinica != null;

  // "Nombre_Caballo" field.
  String? _nombreCaballo;
  String get nombreCaballo => _nombreCaballo ?? '';
  bool hasNombreCaballo() => _nombreCaballo != null;

  // "Correo_Duenio_Caballo" field.
  String? _correoDuenioCaballo;
  String get correoDuenioCaballo => _correoDuenioCaballo ?? '';
  bool hasCorreoDuenioCaballo() => _correoDuenioCaballo != null;

  // "ID_Caballo" field.
  int? _iDCaballo;
  int get iDCaballo => _iDCaballo ?? 0;
  bool hasIDCaballo() => _iDCaballo != null;

  // "IDs_Tratamientos_Veterinarios" field.
  List<int>? _iDsTratamientosVeterinarios;
  List<int> get iDsTratamientosVeterinarios =>
      _iDsTratamientosVeterinarios ?? const [];
  bool hasIDsTratamientosVeterinarios() => _iDsTratamientosVeterinarios != null;

  // "IDs_Intervenciones_Veterinarias" field.
  List<int>? _iDsIntervencionesVeterinarias;
  List<int> get iDsIntervencionesVeterinarias =>
      _iDsIntervencionesVeterinarias ?? const [];
  bool hasIDsIntervencionesVeterinarias() =>
      _iDsIntervencionesVeterinarias != null;

  // "Vacunas" field.
  List<String>? _vacunas;
  List<String> get vacunas => _vacunas ?? const [];
  bool hasVacunas() => _vacunas != null;

  // "Correo_Medico_Veterinario_Cabecera" field.
  String? _correoMedicoVeterinarioCabecera;
  String get correoMedicoVeterinarioCabecera =>
      _correoMedicoVeterinarioCabecera ?? '';
  bool hasCorreoMedicoVeterinarioCabecera() =>
      _correoMedicoVeterinarioCabecera != null;

  // "Fecha_Proxima_VIsita" field.
  DateTime? _fechaProximaVIsita;
  DateTime? get fechaProximaVIsita => _fechaProximaVIsita;
  bool hasFechaProximaVIsita() => _fechaProximaVIsita != null;

  // "Patologias" field.
  List<String>? _patologias;
  List<String> get patologias => _patologias ?? const [];
  bool hasPatologias() => _patologias != null;

  // "Notas_Adicionales" field.
  List<String>? _notasAdicionales;
  List<String> get notasAdicionales => _notasAdicionales ?? const [];
  bool hasNotasAdicionales() => _notasAdicionales != null;

  void _initializeFields() {
    _iDHistoriaClinica = castToType<int>(snapshotData['ID_Historia_Clinica']);
    _nombreCaballo = snapshotData['Nombre_Caballo'] as String?;
    _correoDuenioCaballo = snapshotData['Correo_Duenio_Caballo'] as String?;
    _iDCaballo = castToType<int>(snapshotData['ID_Caballo']);
    _iDsTratamientosVeterinarios =
        getDataList(snapshotData['IDs_Tratamientos_Veterinarios']);
    _iDsIntervencionesVeterinarias =
        getDataList(snapshotData['IDs_Intervenciones_Veterinarias']);
    _vacunas = getDataList(snapshotData['Vacunas']);
    _correoMedicoVeterinarioCabecera =
        snapshotData['Correo_Medico_Veterinario_Cabecera'] as String?;
    _fechaProximaVIsita = snapshotData['Fecha_Proxima_VIsita'] as DateTime?;
    _patologias = getDataList(snapshotData['Patologias']);
    _notasAdicionales = getDataList(snapshotData['Notas_Adicionales']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Historia_Clinica');

  static Stream<HistoriaClinicaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoriaClinicaRecord.fromSnapshot(s));

  static Future<HistoriaClinicaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoriaClinicaRecord.fromSnapshot(s));

  static HistoriaClinicaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoriaClinicaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoriaClinicaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoriaClinicaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoriaClinicaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoriaClinicaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoriaClinicaRecordData({
  int? iDHistoriaClinica,
  String? nombreCaballo,
  String? correoDuenioCaballo,
  int? iDCaballo,
  String? correoMedicoVeterinarioCabecera,
  DateTime? fechaProximaVIsita,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Historia_Clinica': iDHistoriaClinica,
      'Nombre_Caballo': nombreCaballo,
      'Correo_Duenio_Caballo': correoDuenioCaballo,
      'ID_Caballo': iDCaballo,
      'Correo_Medico_Veterinario_Cabecera': correoMedicoVeterinarioCabecera,
      'Fecha_Proxima_VIsita': fechaProximaVIsita,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoriaClinicaRecordDocumentEquality
    implements Equality<HistoriaClinicaRecord> {
  const HistoriaClinicaRecordDocumentEquality();

  @override
  bool equals(HistoriaClinicaRecord? e1, HistoriaClinicaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.iDHistoriaClinica == e2?.iDHistoriaClinica &&
        e1?.nombreCaballo == e2?.nombreCaballo &&
        e1?.correoDuenioCaballo == e2?.correoDuenioCaballo &&
        e1?.iDCaballo == e2?.iDCaballo &&
        listEquality.equals(
            e1?.iDsTratamientosVeterinarios, e2?.iDsTratamientosVeterinarios) &&
        listEquality.equals(e1?.iDsIntervencionesVeterinarias,
            e2?.iDsIntervencionesVeterinarias) &&
        listEquality.equals(e1?.vacunas, e2?.vacunas) &&
        e1?.correoMedicoVeterinarioCabecera ==
            e2?.correoMedicoVeterinarioCabecera &&
        e1?.fechaProximaVIsita == e2?.fechaProximaVIsita &&
        listEquality.equals(e1?.patologias, e2?.patologias) &&
        listEquality.equals(e1?.notasAdicionales, e2?.notasAdicionales);
  }

  @override
  int hash(HistoriaClinicaRecord? e) => const ListEquality().hash([
        e?.iDHistoriaClinica,
        e?.nombreCaballo,
        e?.correoDuenioCaballo,
        e?.iDCaballo,
        e?.iDsTratamientosVeterinarios,
        e?.iDsIntervencionesVeterinarias,
        e?.vacunas,
        e?.correoMedicoVeterinarioCabecera,
        e?.fechaProximaVIsita,
        e?.patologias,
        e?.notasAdicionales
      ]);

  @override
  bool isValidKey(Object? o) => o is HistoriaClinicaRecord;
}
