import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FiltroRecord extends FirestoreRecord {
  FiltroRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Filtro" field.
  int? _iDFiltro;
  int get iDFiltro => _iDFiltro ?? 0;
  bool hasIDFiltro() => _iDFiltro != null;

  // "TipoPublicacion" field.
  String? _tipoPublicacion;
  String get tipoPublicacion => _tipoPublicacion ?? '';
  bool hasTipoPublicacion() => _tipoPublicacion != null;

  // "PrecioMinimo" field.
  int? _precioMinimo;
  int get precioMinimo => _precioMinimo ?? 0;
  bool hasPrecioMinimo() => _precioMinimo != null;

  // "PrecioMaximo" field.
  int? _precioMaximo;
  int get precioMaximo => _precioMaximo ?? 0;
  bool hasPrecioMaximo() => _precioMaximo != null;

  // "Provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  // "Ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  void _initializeFields() {
    _iDFiltro = castToType<int>(snapshotData['ID_Filtro']);
    _tipoPublicacion = snapshotData['TipoPublicacion'] as String?;
    _precioMinimo = castToType<int>(snapshotData['PrecioMinimo']);
    _precioMaximo = castToType<int>(snapshotData['PrecioMaximo']);
    _provincia = snapshotData['Provincia'] as String?;
    _ciudad = snapshotData['Ciudad'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Filtro');

  static Stream<FiltroRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FiltroRecord.fromSnapshot(s));

  static Future<FiltroRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FiltroRecord.fromSnapshot(s));

  static FiltroRecord fromSnapshot(DocumentSnapshot snapshot) => FiltroRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FiltroRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FiltroRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FiltroRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FiltroRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFiltroRecordData({
  int? iDFiltro,
  String? tipoPublicacion,
  int? precioMinimo,
  int? precioMaximo,
  String? provincia,
  String? ciudad,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Filtro': iDFiltro,
      'TipoPublicacion': tipoPublicacion,
      'PrecioMinimo': precioMinimo,
      'PrecioMaximo': precioMaximo,
      'Provincia': provincia,
      'Ciudad': ciudad,
    }.withoutNulls,
  );

  return firestoreData;
}

class FiltroRecordDocumentEquality implements Equality<FiltroRecord> {
  const FiltroRecordDocumentEquality();

  @override
  bool equals(FiltroRecord? e1, FiltroRecord? e2) {
    return e1?.iDFiltro == e2?.iDFiltro &&
        e1?.tipoPublicacion == e2?.tipoPublicacion &&
        e1?.precioMinimo == e2?.precioMinimo &&
        e1?.precioMaximo == e2?.precioMaximo &&
        e1?.provincia == e2?.provincia &&
        e1?.ciudad == e2?.ciudad;
  }

  @override
  int hash(FiltroRecord? e) => const ListEquality().hash([
        e?.iDFiltro,
        e?.tipoPublicacion,
        e?.precioMinimo,
        e?.precioMaximo,
        e?.provincia,
        e?.ciudad
      ]);

  @override
  bool isValidKey(Object? o) => o is FiltroRecord;
}
