import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TratamientoVeterinarioRecord extends FirestoreRecord {
  TratamientoVeterinarioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Tratamiento_Veterinario" field.
  int? _iDTratamientoVeterinario;
  int get iDTratamientoVeterinario => _iDTratamientoVeterinario ?? 0;
  bool hasIDTratamientoVeterinario() => _iDTratamientoVeterinario != null;

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

  // "Fecha_Inicio_Tratamiento" field.
  DateTime? _fechaInicioTratamiento;
  DateTime? get fechaInicioTratamiento => _fechaInicioTratamiento;
  bool hasFechaInicioTratamiento() => _fechaInicioTratamiento != null;

  // "Duracion_Estimada" field.
  String? _duracionEstimada;
  String get duracionEstimada => _duracionEstimada ?? '';
  bool hasDuracionEstimada() => _duracionEstimada != null;

  // "Fecha_Fin_Tratamiento" field.
  DateTime? _fechaFinTratamiento;
  DateTime? get fechaFinTratamiento => _fechaFinTratamiento;
  bool hasFechaFinTratamiento() => _fechaFinTratamiento != null;

  // "Estado_Tratamiento" field.
  String? _estadoTratamiento;
  String get estadoTratamiento => _estadoTratamiento ?? '';
  bool hasEstadoTratamiento() => _estadoTratamiento != null;

  // "Observaciones" field.
  List<String>? _observaciones;
  List<String> get observaciones => _observaciones ?? const [];
  bool hasObservaciones() => _observaciones != null;

  // "Medicamentos_Administrados" field.
  List<String>? _medicamentosAdministrados;
  List<String> get medicamentosAdministrados =>
      _medicamentosAdministrados ?? const [];
  bool hasMedicamentosAdministrados() => _medicamentosAdministrados != null;

  // "IDs_Intervenciones_Veterinarias" field.
  List<int>? _iDsIntervencionesVeterinarias;
  List<int> get iDsIntervencionesVeterinarias =>
      _iDsIntervencionesVeterinarias ?? const [];
  bool hasIDsIntervencionesVeterinarias() =>
      _iDsIntervencionesVeterinarias != null;

  void _initializeFields() {
    _iDTratamientoVeterinario =
        castToType<int>(snapshotData['ID_Tratamiento_Veterinario']);
    _nombreCaballo = snapshotData['Nombre_Caballo'] as String?;
    _correoDuenioCaballo = snapshotData['Correo_Duenio_Caballo'] as String?;
    _correoMedicoVeterinario =
        snapshotData['Correo_Medico_Veterinario'] as String?;
    _fechaInicioTratamiento =
        snapshotData['Fecha_Inicio_Tratamiento'] as DateTime?;
    _duracionEstimada = snapshotData['Duracion_Estimada'] as String?;
    _fechaFinTratamiento = snapshotData['Fecha_Fin_Tratamiento'] as DateTime?;
    _estadoTratamiento = snapshotData['Estado_Tratamiento'] as String?;
    _observaciones = getDataList(snapshotData['Observaciones']);
    _medicamentosAdministrados =
        getDataList(snapshotData['Medicamentos_Administrados']);
    _iDsIntervencionesVeterinarias =
        getDataList(snapshotData['IDs_Intervenciones_Veterinarias']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TratamientoVeterinario');

  static Stream<TratamientoVeterinarioRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => TratamientoVeterinarioRecord.fromSnapshot(s));

  static Future<TratamientoVeterinarioRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TratamientoVeterinarioRecord.fromSnapshot(s));

  static TratamientoVeterinarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TratamientoVeterinarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TratamientoVeterinarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TratamientoVeterinarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TratamientoVeterinarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TratamientoVeterinarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTratamientoVeterinarioRecordData({
  int? iDTratamientoVeterinario,
  String? nombreCaballo,
  String? correoDuenioCaballo,
  String? correoMedicoVeterinario,
  DateTime? fechaInicioTratamiento,
  String? duracionEstimada,
  DateTime? fechaFinTratamiento,
  String? estadoTratamiento,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Tratamiento_Veterinario': iDTratamientoVeterinario,
      'Nombre_Caballo': nombreCaballo,
      'Correo_Duenio_Caballo': correoDuenioCaballo,
      'Correo_Medico_Veterinario': correoMedicoVeterinario,
      'Fecha_Inicio_Tratamiento': fechaInicioTratamiento,
      'Duracion_Estimada': duracionEstimada,
      'Fecha_Fin_Tratamiento': fechaFinTratamiento,
      'Estado_Tratamiento': estadoTratamiento,
    }.withoutNulls,
  );

  return firestoreData;
}

class TratamientoVeterinarioRecordDocumentEquality
    implements Equality<TratamientoVeterinarioRecord> {
  const TratamientoVeterinarioRecordDocumentEquality();

  @override
  bool equals(
      TratamientoVeterinarioRecord? e1, TratamientoVeterinarioRecord? e2) {
    const listEquality = ListEquality();
    return e1?.iDTratamientoVeterinario == e2?.iDTratamientoVeterinario &&
        e1?.nombreCaballo == e2?.nombreCaballo &&
        e1?.correoDuenioCaballo == e2?.correoDuenioCaballo &&
        e1?.correoMedicoVeterinario == e2?.correoMedicoVeterinario &&
        e1?.fechaInicioTratamiento == e2?.fechaInicioTratamiento &&
        e1?.duracionEstimada == e2?.duracionEstimada &&
        e1?.fechaFinTratamiento == e2?.fechaFinTratamiento &&
        e1?.estadoTratamiento == e2?.estadoTratamiento &&
        listEquality.equals(e1?.observaciones, e2?.observaciones) &&
        listEquality.equals(
            e1?.medicamentosAdministrados, e2?.medicamentosAdministrados) &&
        listEquality.equals(e1?.iDsIntervencionesVeterinarias,
            e2?.iDsIntervencionesVeterinarias);
  }

  @override
  int hash(TratamientoVeterinarioRecord? e) => const ListEquality().hash([
        e?.iDTratamientoVeterinario,
        e?.nombreCaballo,
        e?.correoDuenioCaballo,
        e?.correoMedicoVeterinario,
        e?.fechaInicioTratamiento,
        e?.duracionEstimada,
        e?.fechaFinTratamiento,
        e?.estadoTratamiento,
        e?.observaciones,
        e?.medicamentosAdministrados,
        e?.iDsIntervencionesVeterinarias
      ]);

  @override
  bool isValidKey(Object? o) => o is TratamientoVeterinarioRecord;
}
