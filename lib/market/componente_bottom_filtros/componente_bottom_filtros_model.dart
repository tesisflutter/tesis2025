import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'componente_bottom_filtros_widget.dart'
    show ComponenteBottomFiltrosWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ComponenteBottomFiltrosModel
    extends FlutterFlowModel<ComponenteBottomFiltrosWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for choice_tipoPublicacion widget.
  FormFieldController<List<String>>? choiceTipoPublicacionValueController;
  String? get choiceTipoPublicacionValue =>
      choiceTipoPublicacionValueController?.value?.firstOrNull;
  set choiceTipoPublicacionValue(String? val) =>
      choiceTipoPublicacionValueController?.value = val != null ? [val] : [];
  // State field(s) for txtfield_precioMinimo widget.
  FocusNode? txtfieldPrecioMinimoFocusNode;
  TextEditingController? txtfieldPrecioMinimoTextController;
  String? Function(BuildContext, String?)?
      txtfieldPrecioMinimoTextControllerValidator;
  // State field(s) for txtfield_precioMaximo widget.
  FocusNode? txtfieldPrecioMaximoFocusNode;
  TextEditingController? txtfieldPrecioMaximoTextController;
  String? Function(BuildContext, String?)?
      txtfieldPrecioMaximoTextControllerValidator;
  // State field(s) for dropDown_Provincia widget.
  String? dropDownProvinciaValue;
  FormFieldController<String>? dropDownProvinciaValueController;
  // State field(s) for txtfield_ciudad widget.
  FocusNode? txtfieldCiudadFocusNode;
  TextEditingController? txtfieldCiudadTextController;
  String? Function(BuildContext, String?)?
      txtfieldCiudadTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? cuentaDocumentosFiltro;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FiltroRecord? docFiltro;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtfieldPrecioMinimoFocusNode?.dispose();
    txtfieldPrecioMinimoTextController?.dispose();

    txtfieldPrecioMaximoFocusNode?.dispose();
    txtfieldPrecioMaximoTextController?.dispose();

    txtfieldCiudadFocusNode?.dispose();
    txtfieldCiudadTextController?.dispose();
  }
}
