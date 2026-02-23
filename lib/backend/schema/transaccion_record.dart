import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Gastos e ingresos
class TransaccionRecord extends FirestoreRecord {
  TransaccionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Transaccion" field.
  int? _iDTransaccion;
  int get iDTransaccion => _iDTransaccion ?? 0;
  bool hasIDTransaccion() => _iDTransaccion != null;

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "EsGasto" field.
  bool? _esGasto;
  bool get esGasto => _esGasto ?? false;
  bool hasEsGasto() => _esGasto != null;

  // "FechaHoraRegistro" field.
  DateTime? _fechaHoraRegistro;
  DateTime? get fechaHoraRegistro => _fechaHoraRegistro;
  bool hasFechaHoraRegistro() => _fechaHoraRegistro != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "OtraCategoria" field.
  String? _otraCategoria;
  String get otraCategoria => _otraCategoria ?? '';
  bool hasOtraCategoria() => _otraCategoria != null;

  // "OtraParte" field.
  String? _otraParte;
  String get otraParte => _otraParte ?? '';
  bool hasOtraParte() => _otraParte != null;

  // "CorreoUsuario" field.
  String? _correoUsuario;
  String get correoUsuario => _correoUsuario ?? '';
  bool hasCorreoUsuario() => _correoUsuario != null;

  void _initializeFields() {
    _iDTransaccion = castToType<int>(snapshotData['ID_Transaccion']);
    _nombre = snapshotData['Nombre'] as String?;
    _monto = castToType<double>(snapshotData['Monto']);
    _esGasto = snapshotData['EsGasto'] as bool?;
    _fechaHoraRegistro = snapshotData['FechaHoraRegistro'] as DateTime?;
    _categoria = snapshotData['Categoria'] as String?;
    _otraCategoria = snapshotData['OtraCategoria'] as String?;
    _otraParte = snapshotData['OtraParte'] as String?;
    _correoUsuario = snapshotData['CorreoUsuario'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Transaccion');

  static Stream<TransaccionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransaccionRecord.fromSnapshot(s));

  static Future<TransaccionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransaccionRecord.fromSnapshot(s));

  static TransaccionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransaccionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransaccionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransaccionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransaccionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransaccionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransaccionRecordData({
  int? iDTransaccion,
  String? nombre,
  double? monto,
  bool? esGasto,
  DateTime? fechaHoraRegistro,
  String? categoria,
  String? otraCategoria,
  String? otraParte,
  String? correoUsuario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Transaccion': iDTransaccion,
      'Nombre': nombre,
      'Monto': monto,
      'EsGasto': esGasto,
      'FechaHoraRegistro': fechaHoraRegistro,
      'Categoria': categoria,
      'OtraCategoria': otraCategoria,
      'OtraParte': otraParte,
      'CorreoUsuario': correoUsuario,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransaccionRecordDocumentEquality implements Equality<TransaccionRecord> {
  const TransaccionRecordDocumentEquality();

  @override
  bool equals(TransaccionRecord? e1, TransaccionRecord? e2) {
    return e1?.iDTransaccion == e2?.iDTransaccion &&
        e1?.nombre == e2?.nombre &&
        e1?.monto == e2?.monto &&
        e1?.esGasto == e2?.esGasto &&
        e1?.fechaHoraRegistro == e2?.fechaHoraRegistro &&
        e1?.categoria == e2?.categoria &&
        e1?.otraCategoria == e2?.otraCategoria &&
        e1?.otraParte == e2?.otraParte &&
        e1?.correoUsuario == e2?.correoUsuario;
  }

  @override
  int hash(TransaccionRecord? e) => const ListEquality().hash([
        e?.iDTransaccion,
        e?.nombre,
        e?.monto,
        e?.esGasto,
        e?.fechaHoraRegistro,
        e?.categoria,
        e?.otraCategoria,
        e?.otraParte,
        e?.correoUsuario
      ]);

  @override
  bool isValidKey(Object? o) => o is TransaccionRecord;
}
