import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PublicacionMarketRecord extends FirestoreRecord {
  PublicacionMarketRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Publicacion" field.
  int? _iDPublicacion;
  int get iDPublicacion => _iDPublicacion ?? 0;
  bool hasIDPublicacion() => _iDPublicacion != null;

  // "Destacado" field.
  bool? _destacado;
  bool get destacado => _destacado ?? false;
  bool hasDestacado() => _destacado != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "Titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "Ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "Provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  // "CorreoDuenio" field.
  String? _correoDuenio;
  String get correoDuenio => _correoDuenio ?? '';
  bool hasCorreoDuenio() => _correoDuenio != null;

  // "Telefono_Contacto" field.
  String? _telefonoContacto;
  String get telefonoContacto => _telefonoContacto ?? '';
  bool hasTelefonoContacto() => _telefonoContacto != null;

  // "Lista_URL_Fotos" field.
  List<String>? _listaURLFotos;
  List<String> get listaURLFotos => _listaURLFotos ?? const [];
  bool hasListaURLFotos() => _listaURLFotos != null;

  // "Fecha_Publicacion" field.
  DateTime? _fechaPublicacion;
  DateTime? get fechaPublicacion => _fechaPublicacion;
  bool hasFechaPublicacion() => _fechaPublicacion != null;

  // "Precio" field.
  int? _precio;
  int get precio => _precio ?? 0;
  bool hasPrecio() => _precio != null;

  // "ID_Caballo" field.
  int? _iDCaballo;

  /// PK de ID Caballo para cuando la publicación es de un caballo.
  ///
  /// Si es de productos o servicios, esto es null.
  int get iDCaballo => _iDCaballo ?? 0;
  bool hasIDCaballo() => _iDCaballo != null;

  void _initializeFields() {
    _iDPublicacion = castToType<int>(snapshotData['ID_Publicacion']);
    _destacado = snapshotData['Destacado'] as bool?;
    _categoria = snapshotData['Categoria'] as String?;
    _titulo = snapshotData['Titulo'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _ciudad = snapshotData['Ciudad'] as String?;
    _provincia = snapshotData['Provincia'] as String?;
    _correoDuenio = snapshotData['CorreoDuenio'] as String?;
    _telefonoContacto = snapshotData['Telefono_Contacto'] as String?;
    _listaURLFotos = getDataList(snapshotData['Lista_URL_Fotos']);
    _fechaPublicacion = snapshotData['Fecha_Publicacion'] as DateTime?;
    _precio = castToType<int>(snapshotData['Precio']);
    _iDCaballo = castToType<int>(snapshotData['ID_Caballo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Publicacion_Market');

  static Stream<PublicacionMarketRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PublicacionMarketRecord.fromSnapshot(s));

  static Future<PublicacionMarketRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PublicacionMarketRecord.fromSnapshot(s));

  static PublicacionMarketRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PublicacionMarketRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PublicacionMarketRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PublicacionMarketRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PublicacionMarketRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PublicacionMarketRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPublicacionMarketRecordData({
  int? iDPublicacion,
  bool? destacado,
  String? categoria,
  String? titulo,
  String? descripcion,
  String? ciudad,
  String? provincia,
  String? correoDuenio,
  String? telefonoContacto,
  DateTime? fechaPublicacion,
  int? precio,
  int? iDCaballo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Publicacion': iDPublicacion,
      'Destacado': destacado,
      'Categoria': categoria,
      'Titulo': titulo,
      'Descripcion': descripcion,
      'Ciudad': ciudad,
      'Provincia': provincia,
      'CorreoDuenio': correoDuenio,
      'Telefono_Contacto': telefonoContacto,
      'Fecha_Publicacion': fechaPublicacion,
      'Precio': precio,
      'ID_Caballo': iDCaballo,
    }.withoutNulls,
  );

  return firestoreData;
}

class PublicacionMarketRecordDocumentEquality
    implements Equality<PublicacionMarketRecord> {
  const PublicacionMarketRecordDocumentEquality();

  @override
  bool equals(PublicacionMarketRecord? e1, PublicacionMarketRecord? e2) {
    const listEquality = ListEquality();
    return e1?.iDPublicacion == e2?.iDPublicacion &&
        e1?.destacado == e2?.destacado &&
        e1?.categoria == e2?.categoria &&
        e1?.titulo == e2?.titulo &&
        e1?.descripcion == e2?.descripcion &&
        e1?.ciudad == e2?.ciudad &&
        e1?.provincia == e2?.provincia &&
        e1?.correoDuenio == e2?.correoDuenio &&
        e1?.telefonoContacto == e2?.telefonoContacto &&
        listEquality.equals(e1?.listaURLFotos, e2?.listaURLFotos) &&
        e1?.fechaPublicacion == e2?.fechaPublicacion &&
        e1?.precio == e2?.precio &&
        e1?.iDCaballo == e2?.iDCaballo;
  }

  @override
  int hash(PublicacionMarketRecord? e) => const ListEquality().hash([
        e?.iDPublicacion,
        e?.destacado,
        e?.categoria,
        e?.titulo,
        e?.descripcion,
        e?.ciudad,
        e?.provincia,
        e?.correoDuenio,
        e?.telefonoContacto,
        e?.listaURLFotos,
        e?.fechaPublicacion,
        e?.precio,
        e?.iDCaballo
      ]);

  @override
  bool isValidKey(Object? o) => o is PublicacionMarketRecord;
}
