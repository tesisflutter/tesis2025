import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventoCalendarioRecord extends FirestoreRecord {
  EventoCalendarioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_EventoCalendario" field.
  int? _iDEventoCalendario;
  int get iDEventoCalendario => _iDEventoCalendario ?? 0;
  bool hasIDEventoCalendario() => _iDEventoCalendario != null;

  // "CorreoUsuario" field.
  String? _correoUsuario;
  String get correoUsuario => _correoUsuario ?? '';
  bool hasCorreoUsuario() => _correoUsuario != null;

  // "FechaHora" field.
  DateTime? _fechaHora;
  DateTime? get fechaHora => _fechaHora;
  bool hasFechaHora() => _fechaHora != null;

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "OtroTipo" field.
  String? _otroTipo;
  String get otroTipo => _otroTipo ?? '';
  bool hasOtroTipo() => _otroTipo != null;

  // "Notificacion" field.
  List<bool>? _notificacion;
  List<bool> get notificacion => _notificacion ?? const [];
  bool hasNotificacion() => _notificacion != null;

  void _initializeFields() {
    _iDEventoCalendario = castToType<int>(snapshotData['ID_EventoCalendario']);
    _correoUsuario = snapshotData['CorreoUsuario'] as String?;
    _fechaHora = snapshotData['FechaHora'] as DateTime?;
    _nombre = snapshotData['Nombre'] as String?;
    _tipo = snapshotData['Tipo'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _otroTipo = snapshotData['OtroTipo'] as String?;
    _notificacion = getDataList(snapshotData['Notificacion']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Evento_Calendario');

  static Stream<EventoCalendarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventoCalendarioRecord.fromSnapshot(s));

  static Future<EventoCalendarioRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EventoCalendarioRecord.fromSnapshot(s));

  static EventoCalendarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventoCalendarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventoCalendarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventoCalendarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventoCalendarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventoCalendarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventoCalendarioRecordData({
  int? iDEventoCalendario,
  String? correoUsuario,
  DateTime? fechaHora,
  String? nombre,
  String? tipo,
  String? descripcion,
  String? otroTipo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_EventoCalendario': iDEventoCalendario,
      'CorreoUsuario': correoUsuario,
      'FechaHora': fechaHora,
      'Nombre': nombre,
      'Tipo': tipo,
      'Descripcion': descripcion,
      'OtroTipo': otroTipo,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventoCalendarioRecordDocumentEquality
    implements Equality<EventoCalendarioRecord> {
  const EventoCalendarioRecordDocumentEquality();

  @override
  bool equals(EventoCalendarioRecord? e1, EventoCalendarioRecord? e2) {
    const listEquality = ListEquality();
    return e1?.iDEventoCalendario == e2?.iDEventoCalendario &&
        e1?.correoUsuario == e2?.correoUsuario &&
        e1?.fechaHora == e2?.fechaHora &&
        e1?.nombre == e2?.nombre &&
        e1?.tipo == e2?.tipo &&
        e1?.descripcion == e2?.descripcion &&
        e1?.otroTipo == e2?.otroTipo &&
        listEquality.equals(e1?.notificacion, e2?.notificacion);
  }

  @override
  int hash(EventoCalendarioRecord? e) => const ListEquality().hash([
        e?.iDEventoCalendario,
        e?.correoUsuario,
        e?.fechaHora,
        e?.nombre,
        e?.tipo,
        e?.descripcion,
        e?.otroTipo,
        e?.notificacion
      ]);

  @override
  bool isValidKey(Object? o) => o is EventoCalendarioRecord;
}
