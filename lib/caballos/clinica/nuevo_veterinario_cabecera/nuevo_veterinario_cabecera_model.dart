import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'nuevo_veterinario_cabecera_widget.dart'
    show NuevoVeterinarioCabeceraWidget;
import 'package:flutter/material.dart';

class NuevoVeterinarioCabeceraModel
    extends FlutterFlowModel<NuevoVeterinarioCabeceraWidget> {
  ///  Local state fields for this page.

  String? fotoSubidaPath;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
  String? _txtFieldVeteCorreoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor ingresar el correo del veterinario';
    }

    return null;
  }

  // State field(s) for txtField_nroMatricula widget.
  FocusNode? txtFieldNroMatriculaFocusNode;
  TextEditingController? txtFieldNroMatriculaTextController;
  String? Function(BuildContext, String?)?
      txtFieldNroMatriculaTextControllerValidator;
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
      return 'Por favor ingresar la ciudad donde trabaja el veterinario';
    }

    return null;
  }

  // Stores action output result for [Bottom Sheet - componente_bottom_nuevaFotoPerfil] action in Button widget.
  String? outputFotoVeteSubidaPath;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_RegistrarVete widget.
  MedicoVeterinarioRecord? queryUltimoVeteCreado;

  @override
  void initState(BuildContext context) {
    txtFieldNombreVeteTextControllerValidator =
        _txtFieldNombreVeteTextControllerValidator;
    txtFieldApellidoVeteTextControllerValidator =
        _txtFieldApellidoVeteTextControllerValidator;
    txtFieldVeteContactoTextControllerValidator =
        _txtFieldVeteContactoTextControllerValidator;
    txtFieldVeteCorreoTextControllerValidator =
        _txtFieldVeteCorreoTextControllerValidator;
    txtFieldCiudadTextControllerValidator =
        _txtFieldCiudadTextControllerValidator;
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

    txtFieldNroMatriculaFocusNode?.dispose();
    txtFieldNroMatriculaTextController?.dispose();

    txtFieldCiudadFocusNode?.dispose();
    txtFieldCiudadTextController?.dispose();
  }
}
