import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'nueva_publicacion_caballo_widget.dart'
    show NuevaPublicacionCaballoWidget;
import 'package:flutter/material.dart';

class NuevaPublicacionCaballoModel
    extends FlutterFlowModel<NuevaPublicacionCaballoWidget> {
  ///  Local state fields for this page.

  List<String> listaFotosCaballoSTATE = [];
  void addToListaFotosCaballoSTATE(String item) =>
      listaFotosCaballoSTATE.add(item);
  void removeFromListaFotosCaballoSTATE(String item) =>
      listaFotosCaballoSTATE.remove(item);
  void removeAtIndexFromListaFotosCaballoSTATE(int index) =>
      listaFotosCaballoSTATE.removeAt(index);
  void insertAtIndexInListaFotosCaballoSTATE(int index, String item) =>
      listaFotosCaballoSTATE.insert(index, item);
  void updateListaFotosCaballoSTATEAtIndex(
          int index, Function(String) updateFn) =>
      listaFotosCaballoSTATE[index] = updateFn(listaFotosCaballoSTATE[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtField_Titulo widget.
  FocusNode? txtFieldTituloFocusNode;
  TextEditingController? txtFieldTituloTextController;
  String? Function(BuildContext, String?)?
      txtFieldTituloTextControllerValidator;
  String? _txtFieldTituloTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La publicación debe estar titulada';
    }

    if (val.length < 6) {
      return 'El título debe tener al menos 6 caracteres';
    }
    if (val.length > 100) {
      return 'El título no puede tener más de 100 caracteres';
    }

    return null;
  }

  // State field(s) for txtField_Precio widget.
  FocusNode? txtFieldPrecioFocusNode;
  TextEditingController? txtFieldPrecioTextController;
  String? Function(BuildContext, String?)?
      txtFieldPrecioTextControllerValidator;
  String? _txtFieldPrecioTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La publicación debe especificar un precio';
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
      return 'La publicación debe especificar una ciudad';
    }

    return null;
  }

  // State field(s) for txtField_Contacto widget.
  FocusNode? txtFieldContactoFocusNode;
  TextEditingController? txtFieldContactoTextController;
  String? Function(BuildContext, String?)?
      txtFieldContactoTextControllerValidator;
  String? _txtFieldContactoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor escribir un número de contacto';
    }

    return null;
  }

  // State field(s) for txtField_Descripcion widget.
  FocusNode? txtFieldDescripcionFocusNode;
  TextEditingController? txtFieldDescripcionTextController;
  String? Function(BuildContext, String?)?
      txtFieldDescripcionTextControllerValidator;
  String? _txtFieldDescripcionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La publicación debe tener al menos una pequeña descripción';
    }

    if (val.length < 30) {
      return 'La descripción debe tener al menos 30 caracteres';
    }
    if (val.length > 2000) {
      return 'La descripción no puede tener más de 2000 caracteres';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in btn_ElegirCaballo widget.
  EquinoRecord? caballoAux;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_Publicar widget.
  int? cuentaDocumentosPublicacion;

  @override
  void initState(BuildContext context) {
    txtFieldTituloTextControllerValidator =
        _txtFieldTituloTextControllerValidator;
    txtFieldPrecioTextControllerValidator =
        _txtFieldPrecioTextControllerValidator;
    txtFieldCiudadTextControllerValidator =
        _txtFieldCiudadTextControllerValidator;
    txtFieldContactoTextControllerValidator =
        _txtFieldContactoTextControllerValidator;
    txtFieldDescripcionTextControllerValidator =
        _txtFieldDescripcionTextControllerValidator;
  }

  @override
  void dispose() {
    txtFieldTituloFocusNode?.dispose();
    txtFieldTituloTextController?.dispose();

    txtFieldPrecioFocusNode?.dispose();
    txtFieldPrecioTextController?.dispose();

    txtFieldCiudadFocusNode?.dispose();
    txtFieldCiudadTextController?.dispose();

    txtFieldContactoFocusNode?.dispose();
    txtFieldContactoTextController?.dispose();

    txtFieldDescripcionFocusNode?.dispose();
    txtFieldDescripcionTextController?.dispose();
  }
}
