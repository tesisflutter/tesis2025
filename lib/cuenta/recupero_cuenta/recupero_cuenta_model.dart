import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recupero_cuenta_widget.dart' show RecuperoCuentaWidget;
import 'package:flutter/material.dart';

class RecuperoCuentaModel extends FlutterFlowModel<RecuperoCuentaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtField_email widget.
  FocusNode? txtFieldEmailFocusNode;
  TextEditingController? txtFieldEmailTextController;
  String? Function(BuildContext, String?)? txtFieldEmailTextControllerValidator;
  String? _txtFieldEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor ingresar un correo electrónico';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    txtFieldEmailTextControllerValidator =
        _txtFieldEmailTextControllerValidator;
  }

  @override
  void dispose() {
    txtFieldEmailFocusNode?.dispose();
    txtFieldEmailTextController?.dispose();
  }
}
