import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'componente_registrar_transaccion_widget.dart'
    show ComponenteRegistrarTransaccionWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ComponenteRegistrarTransaccionModel
    extends FlutterFlowModel<ComponenteRegistrarTransaccionWidget> {
  ///  Local state fields for this component.

  DateTime? horarioElegido;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for txtField_monto widget.
  FocusNode? txtFieldMontoFocusNode;
  TextEditingController? txtFieldMontoTextController;
  String? Function(BuildContext, String?)? txtFieldMontoTextControllerValidator;
  String? _txtFieldMontoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor especificar el monto';
    }

    return null;
  }

  // State field(s) for drop_tipo widget.
  String? dropTipoValue;
  FormFieldController<String>? dropTipoValueController;
  // State field(s) for txtField_otroTipo widget.
  FocusNode? txtFieldOtroTipoFocusNode;
  TextEditingController? txtFieldOtroTipoTextController;
  String? Function(BuildContext, String?)?
      txtFieldOtroTipoTextControllerValidator;
  // State field(s) for txtField_nombre widget.
  FocusNode? txtFieldNombreFocusNode;
  TextEditingController? txtFieldNombreTextController;
  String? Function(BuildContext, String?)?
      txtFieldNombreTextControllerValidator;
  String? _txtFieldNombreTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor, ingresar un nombre para la transacción';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TransaccionRecord? ultimaTransaccionPorID;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransaccionRecord? outputDoc1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransaccionRecord? outputDoc2;

  @override
  void initState(BuildContext context) {
    txtFieldMontoTextControllerValidator =
        _txtFieldMontoTextControllerValidator;
    txtFieldNombreTextControllerValidator =
        _txtFieldNombreTextControllerValidator;
  }

  @override
  void dispose() {
    txtFieldMontoFocusNode?.dispose();
    txtFieldMontoTextController?.dispose();

    txtFieldOtroTipoFocusNode?.dispose();
    txtFieldOtroTipoTextController?.dispose();

    txtFieldNombreFocusNode?.dispose();
    txtFieldNombreTextController?.dispose();
  }
}
