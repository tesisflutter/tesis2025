import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacionRecord extends FirestoreRecord {
  NotificacionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Notificacion" field.
  int? _iDNotificacion;
  int get iDNotificacion => _iDNotificacion ?? 0;
  bool hasIDNotificacion() => _iDNotificacion != null;

  // "CorreoUsuario" field.
  String? _correoUsuario;
  String get correoUsuario => _correoUsuario ?? '';
  bool hasCorreoUsuario() => _correoUsuario != null;

  // "ID_Evento_Notificado" field.
  int? _iDEventoNotificado;

  /// FK de Evento_Calendario
  int get iDEventoNotificado => _iDEventoNotificado ?? 0;
  bool hasIDEventoNotificado() => _iDEventoNotificado != null;

  // "Fecha_Evento_Notificado" field.
  DateTime? _fechaEventoNotificado;
  DateTime? get fechaEventoNotificado => _fechaEventoNotificado;
  bool hasFechaEventoNotificado() => _fechaEventoNotificado != null;

  // "Fecha_Notificacion" field.
  DateTime? _fechaNotificacion;
  DateTime? get fechaNotificacion => _fechaNotificacion;
  bool hasFechaNotificacion() => _fechaNotificacion != null;

  void _initializeFields() {
    _iDNotificacion = castToType<int>(snapshotData['ID_Notificacion']);
    _correoUsuario = snapshotData['CorreoUsuario'] as String?;
    _iDEventoNotificado = castToType<int>(snapshotData['ID_Evento_Notificado']);
    _fechaEventoNotificado =
        snapshotData['Fecha_Evento_Notificado'] as DateTime?;
    _fechaNotificacion = snapshotData['Fecha_Notificacion'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notificacion');

  static Stream<NotificacionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacionRecord.fromSnapshot(s));

  static Future<NotificacionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacionRecord.fromSnapshot(s));

  static NotificacionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacionRecordData({
  int? iDNotificacion,
  String? correoUsuario,
  int? iDEventoNotificado,
  DateTime? fechaEventoNotificado,
  DateTime? fechaNotificacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Notificacion': iDNotificacion,
      'CorreoUsuario': correoUsuario,
      'ID_Evento_Notificado': iDEventoNotificado,
      'Fecha_Evento_Notificado': fechaEventoNotificado,
      'Fecha_Notificacion': fechaNotificacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacionRecordDocumentEquality
    implements Equality<NotificacionRecord> {
  const NotificacionRecordDocumentEquality();

  @override
  bool equals(NotificacionRecord? e1, NotificacionRecord? e2) {
    return e1?.iDNotificacion == e2?.iDNotificacion &&
        e1?.correoUsuario == e2?.correoUsuario &&
        e1?.iDEventoNotificado == e2?.iDEventoNotificado &&
        e1?.fechaEventoNotificado == e2?.fechaEventoNotificado &&
        e1?.fechaNotificacion == e2?.fechaNotificacion;
  }

  @override
  int hash(NotificacionRecord? e) => const ListEquality().hash([
        e?.iDNotificacion,
        e?.correoUsuario,
        e?.iDEventoNotificado,
        e?.fechaEventoNotificado,
        e?.fechaNotificacion
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificacionRecord;
}
