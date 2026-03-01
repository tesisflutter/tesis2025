import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/index.dart';
import 'mi_cuenta_widget.dart' show MiCuentaWidget;
import 'package:flutter/material.dart';

class MiCuentaModel extends FlutterFlowModel<MiCuentaWidget> {
  ///  Local state fields for this page.

  UsuarioRecord? documentoUsuarioLogueado;

  DocumentReference? docRefUsuarioLogueado;

  bool algunDatoCambiado = false;

  String? fotoPerfilPath;

  // State field(s) para el selector de mapa.
  FFPlace? ubicacionSeleccionadaMapa;
  LatLng? ubicacionGeoPoint;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Bottom Sheet - componente_bottom_nuevaFotoPerfil] action in img_FotoPerfil widget.
  String? outputFotoSubidaPath;
  // State field(s) for txt_Nombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreTextController;
  String? Function(BuildContext, String?)? txtNombreTextControllerValidator;
  // State field(s) for txt_Apellido widget.
  FocusNode? txtApellidoFocusNode;
  TextEditingController? txtApellidoTextController;
  String? Function(BuildContext, String?)? txtApellidoTextControllerValidator;
  // State field(s) for txt_Correo widget.
  FocusNode? txtCorreoFocusNode;
  TextEditingController? txtCorreoTextController;
  String? Function(BuildContext, String?)? txtCorreoTextControllerValidator;
  // State field(s) for dropDown_Provincia widget.
  String? dropDownProvinciaValue;
  FormFieldController<String>? dropDownProvinciaValueController;
  // State field(s) for txt_Ciudad widget.
  FocusNode? txtCiudadFocusNode;
  TextEditingController? txtCiudadTextController;
  String? Function(BuildContext, String?)? txtCiudadTextControllerValidator;
  String? _txtCiudadTextControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for txt_Telefono widget.
  FocusNode? txtTelefonoFocusNode;
  TextEditingController? txtTelefonoTextController;
  String? Function(BuildContext, String?)? txtTelefonoTextControllerValidator;
  String? _txtTelefonoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El número de tléfono es requerido (solo números)';
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

  @override
  void initState(BuildContext context) {
    txtCiudadTextControllerValidator = _txtCiudadTextControllerValidator;
    txtTelefonoTextControllerValidator = _txtTelefonoTextControllerValidator;
  }

  @override
  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreTextController?.dispose();

    txtApellidoFocusNode?.dispose();
    txtApellidoTextController?.dispose();

    txtCorreoFocusNode?.dispose();
    txtCorreoTextController?.dispose();

    txtCiudadFocusNode?.dispose();
    txtCiudadTextController?.dispose();

    txtTelefonoFocusNode?.dispose();
    txtTelefonoTextController?.dispose();
  }
}
