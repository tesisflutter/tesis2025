import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'iniciar_sesion_widget.dart' show IniciarSesionWidget;
import 'package:flutter/material.dart';

class IniciarSesionModel extends FlutterFlowModel<IniciarSesionWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtField_Correo widget.
  FocusNode? txtFieldCorreoFocusNode;
  TextEditingController? txtFieldCorreoTextController;
  String? Function(BuildContext, String?)?
      txtFieldCorreoTextControllerValidator;
  String? _txtFieldCorreoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Dato requerido';
    }

    if (val.length < 5) {
      return 'Correo electrónico inválido';
    }
    if (val.length > 50) {
      return 'Correo electrónico inválido';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Correo electrónico inválido';
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
      return 'Dato requerido';
    }

    if (val.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    if (val.length > 20) {
      return 'La contraseña no puede tener más de 20 caracteres';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in btn_IniciarSesion widget.
  UsuarioRecord? usuarioDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UsuarioRecord? queryDocsUserConMismoMail;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UsuarioRecord? queryDocUltimoUsuarioIntegracion;

  @override
  void initState(BuildContext context) {
    txtFieldCorreoTextControllerValidator =
        _txtFieldCorreoTextControllerValidator;
    txtFieldContraseniaVisibility = false;
    txtFieldContraseniaTextControllerValidator =
        _txtFieldContraseniaTextControllerValidator;
  }

  @override
  void dispose() {
    txtFieldCorreoFocusNode?.dispose();
    txtFieldCorreoTextController?.dispose();

    txtFieldContraseniaFocusNode?.dispose();
    txtFieldContraseniaTextController?.dispose();
  }
}
