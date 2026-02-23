import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'market_modificar_publicacion_widget.dart'
    show MarketModificarPublicacionWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MarketModificarPublicacionModel
    extends FlutterFlowModel<MarketModificarPublicacionWidget> {
  ///  Local state fields for this page.

  List<String> listaFotosSeleccionadas = [];
  void addToListaFotosSeleccionadas(String item) =>
      listaFotosSeleccionadas.add(item);
  void removeFromListaFotosSeleccionadas(String item) =>
      listaFotosSeleccionadas.remove(item);
  void removeAtIndexFromListaFotosSeleccionadas(int index) =>
      listaFotosSeleccionadas.removeAt(index);
  void insertAtIndexInListaFotosSeleccionadas(int index, String item) =>
      listaFotosSeleccionadas.insert(index, item);
  void updateListaFotosSeleccionadasAtIndex(
          int index, Function(String) updateFn) =>
      listaFotosSeleccionadas[index] = updateFn(listaFotosSeleccionadas[index]);

  List<String> listaFotos = [];
  void addToListaFotos(String item) => listaFotos.add(item);
  void removeFromListaFotos(String item) => listaFotos.remove(item);
  void removeAtIndexFromListaFotos(int index) => listaFotos.removeAt(index);
  void insertAtIndexInListaFotos(int index, String item) =>
      listaFotos.insert(index, item);
  void updateListaFotosAtIndex(int index, Function(String) updateFn) =>
      listaFotos[index] = updateFn(listaFotos[index]);

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for txtField_titulo widget.
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

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

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

  // Stores action output result for [Bottom Sheet - componente_bottom_nuevasFotosCaballo] action in btn_subirMas widget.
  List<String>? outputBottomFotosCaballoPag2;

  @override
  void initState(BuildContext context) {
    txtFieldTituloTextControllerValidator =
        _txtFieldTituloTextControllerValidator;
    txtFieldCiudadTextControllerValidator =
        _txtFieldCiudadTextControllerValidator;
    txtFieldContactoTextControllerValidator =
        _txtFieldContactoTextControllerValidator;
    txtFieldPrecioTextControllerValidator =
        _txtFieldPrecioTextControllerValidator;
    txtFieldDescripcionTextControllerValidator =
        _txtFieldDescripcionTextControllerValidator;
  }

  @override
  void dispose() {
    txtFieldTituloFocusNode?.dispose();
    txtFieldTituloTextController?.dispose();

    txtFieldCiudadFocusNode?.dispose();
    txtFieldCiudadTextController?.dispose();

    txtFieldContactoFocusNode?.dispose();
    txtFieldContactoTextController?.dispose();

    txtFieldPrecioFocusNode?.dispose();
    txtFieldPrecioTextController?.dispose();

    txtFieldDescripcionFocusNode?.dispose();
    txtFieldDescripcionTextController?.dispose();
  }
}
