import '/flutter_flow/flutter_flow_util.dart';
import 'componente_perfil_vendedor_widget.dart'
    show ComponentePerfilVendedorWidget;
import 'package:flutter/material.dart';

class ComponentePerfilVendedorModel
    extends FlutterFlowModel<ComponentePerfilVendedorWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtField_Ciudad widget.
  FocusNode? txtFieldCiudadFocusNode;
  TextEditingController? txtFieldCiudadTextController;
  String? Function(BuildContext, String?)?
      txtFieldCiudadTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtFieldCiudadFocusNode?.dispose();
    txtFieldCiudadTextController?.dispose();
  }
}
