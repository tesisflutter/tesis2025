import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'nueva_publicacion_producto_servicio_widget.dart'
    show NuevaPublicacionProductoServicioWidget;
import 'package:flutter/material.dart';

class NuevaPublicacionProductoServicioModel
    extends FlutterFlowModel<NuevaPublicacionProductoServicioWidget> {
  ///  Local state fields for this page.

  List<String> uploadedPicsList = [];
  void addToUploadedPicsList(String item) => uploadedPicsList.add(item);
  void removeFromUploadedPicsList(String item) => uploadedPicsList.remove(item);
  void removeAtIndexFromUploadedPicsList(int index) =>
      uploadedPicsList.removeAt(index);
  void insertAtIndexInUploadedPicsList(int index, String item) =>
      uploadedPicsList.insert(index, item);
  void updateUploadedPicsListAtIndex(int index, Function(String) updateFn) =>
      uploadedPicsList[index] = updateFn(uploadedPicsList[index]);

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

    if (val.length < 10) {
      return 'El título debe tener al menos 10 caracteres';
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
      return 'Field is required';
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
      return 'Field is required';
    }

    if (val.length > 2000) {
      return 'La descripción no puede tener más de 2000 caracteres';
    }

    return null;
  }

  bool isDataUploading_uploadFotosPubliByS = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadFotosPubliByS = [];
  List<String> uploadedFileUrls_uploadFotosPubliByS = [];

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? cuentaDocumentosPublicacion;

  @override
  void initState(BuildContext context) {
    txtFieldTituloTextControllerValidator =
        _txtFieldTituloTextControllerValidator;
    txtFieldPrecioTextControllerValidator =
        _txtFieldPrecioTextControllerValidator;
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
