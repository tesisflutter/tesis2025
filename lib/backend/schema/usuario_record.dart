import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsuarioRecord extends FirestoreRecord {
  UsuarioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Usuario" field.
  int? _iDUsuario;
  int get iDUsuario => _iDUsuario ?? 0;
  bool hasIDUsuario() => _iDUsuario != null;

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Apellido" field.
  String? _apellido;
  String get apellido => _apellido ?? '';
  bool hasApellido() => _apellido != null;

  // "Correo" field.
  String? _correo;
  String get correo => _correo ?? '';
  bool hasCorreo() => _correo != null;

  // "Contrasenia" field.
  String? _contrasenia;
  String get contrasenia => _contrasenia ?? '';
  bool hasContrasenia() => _contrasenia != null;

  // "Fecha_Nacimiento" field.
  String? _fechaNacimiento;
  String get fechaNacimiento => _fechaNacimiento ?? '';
  bool hasFechaNacimiento() => _fechaNacimiento != null;

  // "Ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "Provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  // "Telefono" field.
  int? _telefono;
  int get telefono => _telefono ?? 0;
  bool hasTelefono() => _telefono != null;

  // "URL_Foto_Perfil" field.
  String? _uRLFotoPerfil;
  String get uRLFotoPerfil => _uRLFotoPerfil ?? '';
  bool hasURLFotoPerfil() => _uRLFotoPerfil != null;

  // "Fecha_Creacion_Perfil" field.
  DateTime? _fechaCreacionPerfil;
  DateTime? get fechaCreacionPerfil => _fechaCreacionPerfil;
  bool hasFechaCreacionPerfil() => _fechaCreacionPerfil != null;

  // "ID_Veterinario_Cabecera" field.
  int? _iDVeterinarioCabecera;
  int get iDVeterinarioCabecera => _iDVeterinarioCabecera ?? 0;
  bool hasIDVeterinarioCabecera() => _iDVeterinarioCabecera != null;

  void _initializeFields() {
    _iDUsuario = castToType<int>(snapshotData['ID_Usuario']);
    _nombre = snapshotData['Nombre'] as String?;
    _apellido = snapshotData['Apellido'] as String?;
    _correo = snapshotData['Correo'] as String?;
    _contrasenia = snapshotData['Contrasenia'] as String?;
    _fechaNacimiento = snapshotData['Fecha_Nacimiento'] as String?;
    _ciudad = snapshotData['Ciudad'] as String?;
    _provincia = snapshotData['Provincia'] as String?;
    _telefono = castToType<int>(snapshotData['Telefono']);
    _uRLFotoPerfil = snapshotData['URL_Foto_Perfil'] as String?;
    _fechaCreacionPerfil = snapshotData['Fecha_Creacion_Perfil'] as DateTime?;
    _iDVeterinarioCabecera =
        castToType<int>(snapshotData['ID_Veterinario_Cabecera']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Usuario');

  static Stream<UsuarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsuarioRecord.fromSnapshot(s));

  static Future<UsuarioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsuarioRecord.fromSnapshot(s));

  static UsuarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsuarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsuarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsuarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsuarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsuarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsuarioRecordData({
  int? iDUsuario,
  String? nombre,
  String? apellido,
  String? correo,
  String? contrasenia,
  String? fechaNacimiento,
  String? ciudad,
  String? provincia,
  int? telefono,
  String? uRLFotoPerfil,
  DateTime? fechaCreacionPerfil,
  int? iDVeterinarioCabecera,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Usuario': iDUsuario,
      'Nombre': nombre,
      'Apellido': apellido,
      'Correo': correo,
      'Contrasenia': contrasenia,
      'Fecha_Nacimiento': fechaNacimiento,
      'Ciudad': ciudad,
      'Provincia': provincia,
      'Telefono': telefono,
      'URL_Foto_Perfil': uRLFotoPerfil,
      'Fecha_Creacion_Perfil': fechaCreacionPerfil,
      'ID_Veterinario_Cabecera': iDVeterinarioCabecera,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsuarioRecordDocumentEquality implements Equality<UsuarioRecord> {
  const UsuarioRecordDocumentEquality();

  @override
  bool equals(UsuarioRecord? e1, UsuarioRecord? e2) {
    return e1?.iDUsuario == e2?.iDUsuario &&
        e1?.nombre == e2?.nombre &&
        e1?.apellido == e2?.apellido &&
        e1?.correo == e2?.correo &&
        e1?.contrasenia == e2?.contrasenia &&
        e1?.fechaNacimiento == e2?.fechaNacimiento &&
        e1?.ciudad == e2?.ciudad &&
        e1?.provincia == e2?.provincia &&
        e1?.telefono == e2?.telefono &&
        e1?.uRLFotoPerfil == e2?.uRLFotoPerfil &&
        e1?.fechaCreacionPerfil == e2?.fechaCreacionPerfil &&
        e1?.iDVeterinarioCabecera == e2?.iDVeterinarioCabecera;
  }

  @override
  int hash(UsuarioRecord? e) => const ListEquality().hash([
        e?.iDUsuario,
        e?.nombre,
        e?.apellido,
        e?.correo,
        e?.contrasenia,
        e?.fechaNacimiento,
        e?.ciudad,
        e?.provincia,
        e?.telefono,
        e?.uRLFotoPerfil,
        e?.fechaCreacionPerfil,
        e?.iDVeterinarioCabecera
      ]);

  @override
  bool isValidKey(Object? o) => o is UsuarioRecord;
}
