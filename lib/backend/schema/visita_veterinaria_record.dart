import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitaVeterinariaRecord extends FirestoreRecord {
  VisitaVeterinariaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Visita_Veterinaria" field.
  int? _iDVisitaVeterinaria;
  int get iDVisitaVeterinaria => _iDVisitaVeterinaria ?? 0;
  bool hasIDVisitaVeterinaria() => _iDVisitaVeterinaria != null;

  // "Nombre_Caballo" field.
  String? _nombreCaballo;
  String get nombreCaballo => _nombreCaballo ?? '';
  bool hasNombreCaballo() => _nombreCaballo != null;

  // "Correo_Duenio_Caballo" field.
  String? _correoDuenioCaballo;
  String get correoDuenioCaballo => _correoDuenioCaballo ?? '';
  bool hasCorreoDuenioCaballo() => _correoDuenioCaballo != null;

  // "Correo_Medico_Veterinario" field.
  String? _correoMedicoVeterinario;
  String get correoMedicoVeterinario => _correoMedicoVeterinario ?? '';
  bool hasCorreoMedicoVeterinario() => _correoMedicoVeterinario != null;

  // "ID_Medico_Veterinario" field.
  String? _iDMedicoVeterinario;
  String get iDMedicoVeterinario => _iDMedicoVeterinario ?? '';
  bool hasIDMedicoVeterinario() => _iDMedicoVeterinario != null;

  // "Motivo" field.
  String? _motivo;
  String get motivo => _motivo ?? '';
  bool hasMotivo() => _motivo != null;

  // "Tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "Fecha_Visita" field.
  DateTime? _fechaVisita;
  DateTime? get fechaVisita => _fechaVisita;
  bool hasFechaVisita() => _fechaVisita != null;

  // "Provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  // "Ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "Monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "Observaciones" field.
  String? _observaciones;
  String get observaciones => _observaciones ?? '';
  bool hasObservaciones() => _observaciones != null;

  // "Fotos" field.
  List<String>? _fotos;
  List<String> get fotos => _fotos ?? const [];
  bool hasFotos() => _fotos != null;

  // "Videos" field.
  List<String>? _videos;
  List<String> get videos => _videos ?? const [];
  bool hasVideos() => _videos != null;

  // "Audios" field.
  List<String>? _audios;
  List<String> get audios => _audios ?? const [];
  bool hasAudios() => _audios != null;

  // "ID_Tratamiento_Veterinario" field.
  int? _iDTratamientoVeterinario;
  int get iDTratamientoVeterinario => _iDTratamientoVeterinario ?? 0;
  bool hasIDTratamientoVeterinario() => _iDTratamientoVeterinario != null;

  // "ID_Vacunacion" field.
  int? _iDVacunacion;
  int get iDVacunacion => _iDVacunacion ?? 0;
  bool hasIDVacunacion() => _iDVacunacion != null;

  void _initializeFields() {
    _iDVisitaVeterinaria =
        castToType<int>(snapshotData['ID_Visita_Veterinaria']);
    _nombreCaballo = snapshotData['Nombre_Caballo'] as String?;
    _correoDuenioCaballo = snapshotData['Correo_Duenio_Caballo'] as String?;
    _correoMedicoVeterinario =
        snapshotData['Correo_Medico_Veterinario'] as String?;
    _iDMedicoVeterinario = snapshotData['ID_Medico_Veterinario'] as String?;
    _motivo = snapshotData['Motivo'] as String?;
    _tipo = snapshotData['Tipo'] as String?;
    _fechaVisita = snapshotData['Fecha_Visita'] as DateTime?;
    _provincia = snapshotData['Provincia'] as String?;
    _ciudad = snapshotData['Ciudad'] as String?;
    _monto = castToType<double>(snapshotData['Monto']);
    _observaciones = snapshotData['Observaciones'] as String?;
    _fotos = getDataList(snapshotData['Fotos']);
    _videos = getDataList(snapshotData['Videos']);
    _audios = getDataList(snapshotData['Audios']);
    _iDTratamientoVeterinario =
        castToType<int>(snapshotData['ID_Tratamiento_Veterinario']);
    _iDVacunacion = castToType<int>(snapshotData['ID_Vacunacion']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('VisitaVeterinaria');

  static Stream<VisitaVeterinariaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitaVeterinariaRecord.fromSnapshot(s));

  static Future<VisitaVeterinariaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VisitaVeterinariaRecord.fromSnapshot(s));

  static VisitaVeterinariaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VisitaVeterinariaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitaVeterinariaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitaVeterinariaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitaVeterinariaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitaVeterinariaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitaVeterinariaRecordData({
  int? iDVisitaVeterinaria,
  String? nombreCaballo,
  String? correoDuenioCaballo,
  String? correoMedicoVeterinario,
  String? iDMedicoVeterinario,
  String? motivo,
  String? tipo,
  DateTime? fechaVisita,
  String? provincia,
  String? ciudad,
  double? monto,
  String? observaciones,
  int? iDTratamientoVeterinario,
  int? iDVacunacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Visita_Veterinaria': iDVisitaVeterinaria,
      'Nombre_Caballo': nombreCaballo,
      'Correo_Duenio_Caballo': correoDuenioCaballo,
      'Correo_Medico_Veterinario': correoMedicoVeterinario,
      'ID_Medico_Veterinario': iDMedicoVeterinario,
      'Motivo': motivo,
      'Tipo': tipo,
      'Fecha_Visita': fechaVisita,
      'Provincia': provincia,
      'Ciudad': ciudad,
      'Monto': monto,
      'Observaciones': observaciones,
      'ID_Tratamiento_Veterinario': iDTratamientoVeterinario,
      'ID_Vacunacion': iDVacunacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class VisitaVeterinariaRecordDocumentEquality
    implements Equality<VisitaVeterinariaRecord> {
  const VisitaVeterinariaRecordDocumentEquality();

  @override
  bool equals(VisitaVeterinariaRecord? e1, VisitaVeterinariaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.iDVisitaVeterinaria == e2?.iDVisitaVeterinaria &&
        e1?.nombreCaballo == e2?.nombreCaballo &&
        e1?.correoDuenioCaballo == e2?.correoDuenioCaballo &&
        e1?.correoMedicoVeterinario == e2?.correoMedicoVeterinario &&
        e1?.iDMedicoVeterinario == e2?.iDMedicoVeterinario &&
        e1?.motivo == e2?.motivo &&
        e1?.tipo == e2?.tipo &&
        e1?.fechaVisita == e2?.fechaVisita &&
        e1?.provincia == e2?.provincia &&
        e1?.ciudad == e2?.ciudad &&
        e1?.monto == e2?.monto &&
        e1?.observaciones == e2?.observaciones &&
        listEquality.equals(e1?.fotos, e2?.fotos) &&
        listEquality.equals(e1?.videos, e2?.videos) &&
        listEquality.equals(e1?.audios, e2?.audios) &&
        e1?.iDTratamientoVeterinario == e2?.iDTratamientoVeterinario &&
        e1?.iDVacunacion == e2?.iDVacunacion;
  }

  @override
  int hash(VisitaVeterinariaRecord? e) => const ListEquality().hash([
        e?.iDVisitaVeterinaria,
        e?.nombreCaballo,
        e?.correoDuenioCaballo,
        e?.correoMedicoVeterinario,
        e?.iDMedicoVeterinario,
        e?.motivo,
        e?.tipo,
        e?.fechaVisita,
        e?.provincia,
        e?.ciudad,
        e?.monto,
        e?.observaciones,
        e?.fotos,
        e?.videos,
        e?.audios,
        e?.iDTratamientoVeterinario,
        e?.iDVacunacion
      ]);

  @override
  bool isValidKey(Object? o) => o is VisitaVeterinariaRecord;
}
