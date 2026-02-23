import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicoVeterinarioRecord extends FirestoreRecord {
  MedicoVeterinarioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ID_Medico_Veterinario" field.
  int? _iDMedicoVeterinario;
  int get iDMedicoVeterinario => _iDMedicoVeterinario ?? 0;
  bool hasIDMedicoVeterinario() => _iDMedicoVeterinario != null;

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

  // "Telefono" field.
  int? _telefono;
  int get telefono => _telefono ?? 0;
  bool hasTelefono() => _telefono != null;

  // "Numero_Matricula" field.
  int? _numeroMatricula;
  int get numeroMatricula => _numeroMatricula ?? 0;
  bool hasNumeroMatricula() => _numeroMatricula != null;

  // "Provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  // "Ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "Correo_Usuario" field.
  String? _correoUsuario;

  /// El correo del usuario que registró a este veterinario (si no estuviera
  /// esto, se mostrarían TODOS los veterinarios registrados a TODOS los
  /// usuarios)
  String get correoUsuario => _correoUsuario ?? '';
  bool hasCorreoUsuario() => _correoUsuario != null;

  // "URL_Foto_Perfil" field.
  String? _uRLFotoPerfil;
  String get uRLFotoPerfil => _uRLFotoPerfil ?? '';
  bool hasURLFotoPerfil() => _uRLFotoPerfil != null;

  void _initializeFields() {
    _iDMedicoVeterinario =
        castToType<int>(snapshotData['ID_Medico_Veterinario']);
    _nombre = snapshotData['Nombre'] as String?;
    _apellido = snapshotData['Apellido'] as String?;
    _correo = snapshotData['Correo'] as String?;
    _telefono = castToType<int>(snapshotData['Telefono']);
    _numeroMatricula = castToType<int>(snapshotData['Numero_Matricula']);
    _provincia = snapshotData['Provincia'] as String?;
    _ciudad = snapshotData['Ciudad'] as String?;
    _correoUsuario = snapshotData['Correo_Usuario'] as String?;
    _uRLFotoPerfil = snapshotData['URL_Foto_Perfil'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MedicoVeterinario');

  static Stream<MedicoVeterinarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicoVeterinarioRecord.fromSnapshot(s));

  static Future<MedicoVeterinarioRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MedicoVeterinarioRecord.fromSnapshot(s));

  static MedicoVeterinarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicoVeterinarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicoVeterinarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicoVeterinarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicoVeterinarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicoVeterinarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicoVeterinarioRecordData({
  int? iDMedicoVeterinario,
  String? nombre,
  String? apellido,
  String? correo,
  int? telefono,
  int? numeroMatricula,
  String? provincia,
  String? ciudad,
  String? correoUsuario,
  String? uRLFotoPerfil,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ID_Medico_Veterinario': iDMedicoVeterinario,
      'Nombre': nombre,
      'Apellido': apellido,
      'Correo': correo,
      'Telefono': telefono,
      'Numero_Matricula': numeroMatricula,
      'Provincia': provincia,
      'Ciudad': ciudad,
      'Correo_Usuario': correoUsuario,
      'URL_Foto_Perfil': uRLFotoPerfil,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicoVeterinarioRecordDocumentEquality
    implements Equality<MedicoVeterinarioRecord> {
  const MedicoVeterinarioRecordDocumentEquality();

  @override
  bool equals(MedicoVeterinarioRecord? e1, MedicoVeterinarioRecord? e2) {
    return e1?.iDMedicoVeterinario == e2?.iDMedicoVeterinario &&
        e1?.nombre == e2?.nombre &&
        e1?.apellido == e2?.apellido &&
        e1?.correo == e2?.correo &&
        e1?.telefono == e2?.telefono &&
        e1?.numeroMatricula == e2?.numeroMatricula &&
        e1?.provincia == e2?.provincia &&
        e1?.ciudad == e2?.ciudad &&
        e1?.correoUsuario == e2?.correoUsuario &&
        e1?.uRLFotoPerfil == e2?.uRLFotoPerfil;
  }

  @override
  int hash(MedicoVeterinarioRecord? e) => const ListEquality().hash([
        e?.iDMedicoVeterinario,
        e?.nombre,
        e?.apellido,
        e?.correo,
        e?.telefono,
        e?.numeroMatricula,
        e?.provincia,
        e?.ciudad,
        e?.correoUsuario,
        e?.uRLFotoPerfil
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicoVeterinarioRecord;
}
