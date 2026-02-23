import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'nueva_cuenta_widget.dart' show NuevaCuentaWidget;
import 'package:flutter/material.dart';

class NuevaCuentaModel extends FlutterFlowModel<NuevaCuentaWidget> {
  ///  Local state fields for this page.

  String? fotoSubidaPath;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtField_Nombre widget.
  FocusNode? txtFieldNombreFocusNode;
  TextEditingController? txtFieldNombreTextController;
  String? Function(BuildContext, String?)?
      txtFieldNombreTextControllerValidator;
  String? _txtFieldNombreTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre es requerido';
    }

    if (val.length < 2) {
      return 'El nombre debe tener al menos 2 caracteres';
    }
    if (val.length > 25) {
      return 'El nombre no puede tener más de 25 caracteres';
    }
    if (!RegExp('[a-zA-Z\\s]').hasMatch(val)) {
      return 'El nombre no puede contener caracteres especiales o números';
    }
    return null;
  }

  // State field(s) for txtField_Apellido widget.
  FocusNode? txtFieldApellidoFocusNode;
  TextEditingController? txtFieldApellidoTextController;
  String? Function(BuildContext, String?)?
      txtFieldApellidoTextControllerValidator;
  String? _txtFieldApellidoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El apellido es requerido';
    }

    if (val.length < 2) {
      return 'El apellido debe tener al menos 2 caracteres';
    }
    if (val.length > 25) {
      return 'El apellido no puede tener más de 25 caracteres';
    }
    if (!RegExp('[a-zA-Z\\s]').hasMatch(val)) {
      return 'El apellido no puede contener caracteres especiales o números';
    }
    return null;
  }

  // State field(s) for txtField_Correo widget.
  FocusNode? txtFieldCorreoFocusNode;
  TextEditingController? txtFieldCorreoTextController;
  String? Function(BuildContext, String?)?
      txtFieldCorreoTextControllerValidator;
  String? _txtFieldCorreoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La dirección de correo electrónica es requerida';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Por favor ingresar una dirección de correo electrónica válida';
    }
    return null;
  }

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
      return 'La ciudad es un dato requerido';
    }

    if (val.length < 3) {
      return 'El nombre de la ciudad no puede tener menos de 3 caracteres';
    }
    if (val.length > 50) {
      return 'El nombre de la ciudad no puede tener más de 50 caracteres';
    }
    if (!RegExp('[a-zA-Z\\s]').hasMatch(val)) {
      return 'El nombre de la ciudad solo puede tener letras, números y espacios';
    }
    return null;
  }

  // State field(s) for txtField_Telefono widget.
  FocusNode? txtFieldTelefonoFocusNode;
  TextEditingController? txtFieldTelefonoTextController;
  String? Function(BuildContext, String?)?
      txtFieldTelefonoTextControllerValidator;
  String? _txtFieldTelefonoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El número de teléfono es requerido (solo números)';
    }

    if (val.length < 8) {
      return 'El número de teléfono no puede tener menos de 8 dígitos (incluyendo la característica)';
    }
    if (val.length > 18) {
      return 'El número de teléfono no puede tener más de 18 dígitos';
    }
    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Por favor, ingresar solo números';
    }
    return null;
  }

  // State field(s) for txtField_Contrasenia widget.
  FocusNode? txtFieldContraseniaFocusNode;
  TextEditingController? txtFieldContraseniaTextController;
  late bool txtFieldContraseniaVisibility;
  String? Function(BuildContext, String?)?
      txtFieldContraseniaTextControllerValidator;
  String? _txtFieldContraseniaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La contraseña es requerida';
    }

    if (val.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }

    return null;
  }

  // State field(s) for txtField_Contrasenia2 widget.
  FocusNode? txtFieldContrasenia2FocusNode;
  TextEditingController? txtFieldContrasenia2TextController;
  late bool txtFieldContrasenia2Visibility;
  String? Function(BuildContext, String?)?
      txtFieldContrasenia2TextControllerValidator;
  String? _txtFieldContrasenia2TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Se requiere repetir la contraseña';
    }

    if (val.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }

    return null;
  }

  // Stores action output result for [Bottom Sheet - componente_bottom_nuevaFotoPerfil] action in Button widget.
  String? outputFotoPerfilSubidaPath;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_crearUsuario widget.
  UsuarioRecord? queryDocUltimoUsuario;

  @override
  void initState(BuildContext context) {
    txtFieldNombreTextControllerValidator =
        _txtFieldNombreTextControllerValidator;
    txtFieldApellidoTextControllerValidator =
        _txtFieldApellidoTextControllerValidator;
    txtFieldCorreoTextControllerValidator =
        _txtFieldCorreoTextControllerValidator;
    txtFieldCiudadTextControllerValidator =
        _txtFieldCiudadTextControllerValidator;
    txtFieldTelefonoTextControllerValidator =
        _txtFieldTelefonoTextControllerValidator;
    txtFieldContraseniaVisibility = false;
    txtFieldContraseniaTextControllerValidator =
        _txtFieldContraseniaTextControllerValidator;
    txtFieldContrasenia2Visibility = false;
    txtFieldContrasenia2TextControllerValidator =
        _txtFieldContrasenia2TextControllerValidator;
  }

  @override
  void dispose() {
    txtFieldNombreFocusNode?.dispose();
    txtFieldNombreTextController?.dispose();

    txtFieldApellidoFocusNode?.dispose();
    txtFieldApellidoTextController?.dispose();

    txtFieldCorreoFocusNode?.dispose();
    txtFieldCorreoTextController?.dispose();

    txtFieldCiudadFocusNode?.dispose();
    txtFieldCiudadTextController?.dispose();

    txtFieldTelefonoFocusNode?.dispose();
    txtFieldTelefonoTextController?.dispose();

    txtFieldContraseniaFocusNode?.dispose();
    txtFieldContraseniaTextController?.dispose();

    txtFieldContrasenia2FocusNode?.dispose();
    txtFieldContrasenia2TextController?.dispose();
  }
}
