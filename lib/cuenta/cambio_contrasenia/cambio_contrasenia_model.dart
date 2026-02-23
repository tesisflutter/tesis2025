import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cambio_contrasenia_widget.dart' show CambioContraseniaWidget;
import 'package:flutter/material.dart';

class CambioContraseniaModel extends FlutterFlowModel<CambioContraseniaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtField_passActual widget.
  FocusNode? txtFieldPassActualFocusNode;
  TextEditingController? txtFieldPassActualTextController;
  late bool txtFieldPassActualVisibility;
  String? Function(BuildContext, String?)?
      txtFieldPassActualTextControllerValidator;
  String? _txtFieldPassActualTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor ingresar la contraseña actual';
    }

    return null;
  }

  // State field(s) for txtField_passNueva widget.
  FocusNode? txtFieldPassNuevaFocusNode;
  TextEditingController? txtFieldPassNuevaTextController;
  late bool txtFieldPassNuevaVisibility;
  String? Function(BuildContext, String?)?
      txtFieldPassNuevaTextControllerValidator;
  String? _txtFieldPassNuevaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor ingresar la nueva contraseña';
    }

    return null;
  }

  // State field(s) for txtField_passNuevaRepeticion widget.
  FocusNode? txtFieldPassNuevaRepeticionFocusNode;
  TextEditingController? txtFieldPassNuevaRepeticionTextController;
  late bool txtFieldPassNuevaRepeticionVisibility;
  String? Function(BuildContext, String?)?
      txtFieldPassNuevaRepeticionTextControllerValidator;
  String? _txtFieldPassNuevaRepeticionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor repetir la nueva contraseña';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsuarioRecord? queryDocUserLogueado;

  @override
  void initState(BuildContext context) {
    txtFieldPassActualVisibility = false;
    txtFieldPassActualTextControllerValidator =
        _txtFieldPassActualTextControllerValidator;
    txtFieldPassNuevaVisibility = false;
    txtFieldPassNuevaTextControllerValidator =
        _txtFieldPassNuevaTextControllerValidator;
    txtFieldPassNuevaRepeticionVisibility = false;
    txtFieldPassNuevaRepeticionTextControllerValidator =
        _txtFieldPassNuevaRepeticionTextControllerValidator;
  }

  @override
  void dispose() {
    txtFieldPassActualFocusNode?.dispose();
    txtFieldPassActualTextController?.dispose();

    txtFieldPassNuevaFocusNode?.dispose();
    txtFieldPassNuevaTextController?.dispose();

    txtFieldPassNuevaRepeticionFocusNode?.dispose();
    txtFieldPassNuevaRepeticionTextController?.dispose();
  }
}
