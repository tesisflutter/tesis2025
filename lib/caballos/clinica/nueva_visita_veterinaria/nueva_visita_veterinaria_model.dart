import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'nueva_visita_veterinaria_widget.dart' show NuevaVisitaVeterinariaWidget;
import 'package:flutter/material.dart';

class NuevaVisitaVeterinariaModel
    extends FlutterFlowModel<NuevaVisitaVeterinariaWidget> {
  ///  Local state fields for this page.

  List<MedicoVeterinarioRecord> listaVeterinariosUsuario = [];
  void addToListaVeterinariosUsuario(MedicoVeterinarioRecord item) =>
      listaVeterinariosUsuario.add(item);
  void removeFromListaVeterinariosUsuario(MedicoVeterinarioRecord item) =>
      listaVeterinariosUsuario.remove(item);
  void removeAtIndexFromListaVeterinariosUsuario(int index) =>
      listaVeterinariosUsuario.removeAt(index);
  void insertAtIndexInListaVeterinariosUsuario(
          int index, MedicoVeterinarioRecord item) =>
      listaVeterinariosUsuario.insert(index, item);
  void updateListaVeterinariosUsuarioAtIndex(
          int index, Function(MedicoVeterinarioRecord) updateFn) =>
      listaVeterinariosUsuario[index] =
          updateFn(listaVeterinariosUsuario[index]);

  int? idVeterinarioSeleccionado;

  /// La lista de nombre y apellido a rellenar en el dropdown
  List<String> listaNombresVeterinarios = [];
  void addToListaNombresVeterinarios(String item) =>
      listaNombresVeterinarios.add(item);
  void removeFromListaNombresVeterinarios(String item) =>
      listaNombresVeterinarios.remove(item);
  void removeAtIndexFromListaNombresVeterinarios(int index) =>
      listaNombresVeterinarios.removeAt(index);
  void insertAtIndexInListaNombresVeterinarios(int index, String item) =>
      listaNombresVeterinarios.insert(index, item);
  void updateListaNombresVeterinariosAtIndex(
          int index, Function(String) updateFn) =>
      listaNombresVeterinarios[index] =
          updateFn(listaNombresVeterinarios[index]);

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in Nueva_Visita_Veterinaria widget.
  List<MedicoVeterinarioRecord>? queryVeterinariosDeUsuario;
  // State field(s) for drop_NombreVete widget.
  String? dropNombreVeteValue;
  FormFieldController<String>? dropNombreVeteValueController;
  // State field(s) for txtField_nombreVete widget.
  FocusNode? txtFieldNombreVeteFocusNode;
  TextEditingController? txtFieldNombreVeteTextController;
  String? Function(BuildContext, String?)?
      txtFieldNombreVeteTextControllerValidator;
  String? _txtFieldNombreVeteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor ingresar el nombre del veterinario';
    }

    return null;
  }

  // State field(s) for txtField_apellidoVete widget.
  FocusNode? txtFieldApellidoVeteFocusNode;
  TextEditingController? txtFieldApellidoVeteTextController;
  String? Function(BuildContext, String?)?
      txtFieldApellidoVeteTextControllerValidator;
  String? _txtFieldApellidoVeteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor ingresar el apellido del veterinario';
    }

    return null;
  }

  // State field(s) for txtField_veteContacto widget.
  FocusNode? txtFieldVeteContactoFocusNode;
  TextEditingController? txtFieldVeteContactoTextController;
  String? Function(BuildContext, String?)?
      txtFieldVeteContactoTextControllerValidator;
  String? _txtFieldVeteContactoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor ingresar el número telefónico del veterinario';
    }

    return null;
  }

  // State field(s) for txtField_veteCorreo widget.
  FocusNode? txtFieldVeteCorreoFocusNode;
  TextEditingController? txtFieldVeteCorreoTextController;
  String? Function(BuildContext, String?)?
      txtFieldVeteCorreoTextControllerValidator;
  // State field(s) for drop_Motivo widget.
  String? dropMotivoValue;
  FormFieldController<String>? dropMotivoValueController;
  // State field(s) for txtField_nombreVacuna widget.
  FocusNode? txtFieldNombreVacunaFocusNode;
  TextEditingController? txtFieldNombreVacunaTextController;
  String? Function(BuildContext, String?)?
      txtFieldNombreVacunaTextControllerValidator;
  String? _txtFieldNombreVacunaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor ingresar el nombre de la vacuna';
    }

    return null;
  }

  // State field(s) for txtField_NroLoteVacuna widget.
  FocusNode? txtFieldNroLoteVacunaFocusNode;
  TextEditingController? txtFieldNroLoteVacunaTextController;
  String? Function(BuildContext, String?)?
      txtFieldNroLoteVacunaTextControllerValidator;
  String? _txtFieldNroLoteVacunaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor ingresar el número de lote de la vacuna';
    }

    return null;
  }

  // State field(s) for txtField_Enfermedades widget.
  FocusNode? txtFieldEnfermedadesFocusNode;
  TextEditingController? txtFieldEnfermedadesTextController;
  String? Function(BuildContext, String?)?
      txtFieldEnfermedadesTextControllerValidator;
  String? _txtFieldEnfermedadesTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor especificar las enfermedades prevenidas por la vacuna';
    }

    return null;
  }

  // State field(s) for txtField_Dosis widget.
  FocusNode? txtFieldDosisFocusNode;
  TextEditingController? txtFieldDosisTextController;
  String? Function(BuildContext, String?)? txtFieldDosisTextControllerValidator;
  // State field(s) for txtField_Dias widget.
  FocusNode? txtFieldDiasFocusNode;
  TextEditingController? txtFieldDiasTextController;
  String? Function(BuildContext, String?)? txtFieldDiasTextControllerValidator;
  // State field(s) for drop_Tipo widget.
  String? dropTipoValue;
  FormFieldController<String>? dropTipoValueController;
  // State field(s) for FechaVisita widget.
  FocusNode? fechaVisitaFocusNode;
  TextEditingController? fechaVisitaTextController;
  String? Function(BuildContext, String?)? fechaVisitaTextControllerValidator;
  String? _fechaVisitaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Elegir una fecha de visita';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for dropDown_Provincia widget.
  String? dropDownProvinciaValue;
  FormFieldController<String>? dropDownProvinciaValueController;
  // State field(s) for txtField_Ciudad widget.
  FocusNode? txtFieldCiudadFocusNode;
  TextEditingController? txtFieldCiudadTextController;
  String? Function(BuildContext, String?)?
      txtFieldCiudadTextControllerValidator;
  String? _txtFieldCiudadTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor especificar la ciudad de la visita';
    }

    return null;
  }

  // State field(s) for txtField_Monto widget.
  FocusNode? txtFieldMontoFocusNode;
  TextEditingController? txtFieldMontoTextController;
  String? Function(BuildContext, String?)? txtFieldMontoTextControllerValidator;
  String? _txtFieldMontoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor especificar el monto (puede ser \$0)';
    }

    return null;
  }

  // State field(s) for txtField_Observaciones widget.
  FocusNode? txtFieldObservacionesFocusNode;
  TextEditingController? txtFieldObservacionesTextController;
  String? Function(BuildContext, String?)?
      txtFieldObservacionesTextControllerValidator;
  bool isDataUploading_uploadArchivos = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadArchivos = [];

  // Stores action output result for [Firestore Query - Query a collection] action in btn_Registrar widget.
  MedicoVeterinarioRecord? queryUltimoVeterinarioCreado;
  // Stores action output result for [Backend Call - Create Document] action in btn_Registrar widget.
  MedicoVeterinarioRecord? creacionDocVeterinario;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_Registrar widget.
  VisitaVeterinariaRecord? queryUltimaVisitaCreada;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_Registrar widget.
  VacunacionRecord? queryUltimaVacunacionRegistrada;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_Registrar widget.
  HistoriaClinicaRecord? queryHistClinicaUpdateada;

  @override
  void initState(BuildContext context) {
    txtFieldNombreVeteTextControllerValidator =
        _txtFieldNombreVeteTextControllerValidator;
    txtFieldApellidoVeteTextControllerValidator =
        _txtFieldApellidoVeteTextControllerValidator;
    txtFieldVeteContactoTextControllerValidator =
        _txtFieldVeteContactoTextControllerValidator;
    txtFieldNombreVacunaTextControllerValidator =
        _txtFieldNombreVacunaTextControllerValidator;
    txtFieldNroLoteVacunaTextControllerValidator =
        _txtFieldNroLoteVacunaTextControllerValidator;
    txtFieldEnfermedadesTextControllerValidator =
        _txtFieldEnfermedadesTextControllerValidator;
    fechaVisitaTextControllerValidator = _fechaVisitaTextControllerValidator;
    txtFieldCiudadTextControllerValidator =
        _txtFieldCiudadTextControllerValidator;
    txtFieldMontoTextControllerValidator =
        _txtFieldMontoTextControllerValidator;
  }

  @override
  void dispose() {
    txtFieldNombreVeteFocusNode?.dispose();
    txtFieldNombreVeteTextController?.dispose();

    txtFieldApellidoVeteFocusNode?.dispose();
    txtFieldApellidoVeteTextController?.dispose();

    txtFieldVeteContactoFocusNode?.dispose();
    txtFieldVeteContactoTextController?.dispose();

    txtFieldVeteCorreoFocusNode?.dispose();
    txtFieldVeteCorreoTextController?.dispose();

    txtFieldNombreVacunaFocusNode?.dispose();
    txtFieldNombreVacunaTextController?.dispose();

    txtFieldNroLoteVacunaFocusNode?.dispose();
    txtFieldNroLoteVacunaTextController?.dispose();

    txtFieldEnfermedadesFocusNode?.dispose();
    txtFieldEnfermedadesTextController?.dispose();

    txtFieldDosisFocusNode?.dispose();
    txtFieldDosisTextController?.dispose();

    txtFieldDiasFocusNode?.dispose();
    txtFieldDiasTextController?.dispose();

    fechaVisitaFocusNode?.dispose();
    fechaVisitaTextController?.dispose();

    txtFieldCiudadFocusNode?.dispose();
    txtFieldCiudadTextController?.dispose();

    txtFieldMontoFocusNode?.dispose();
    txtFieldMontoTextController?.dispose();

    txtFieldObservacionesFocusNode?.dispose();
    txtFieldObservacionesTextController?.dispose();
  }
}
