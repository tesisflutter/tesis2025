import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/index.dart';
import 'nuevo_caballo_widget.dart' show NuevoCaballoWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NuevoCaballoModel extends FlutterFlowModel<NuevoCaballoWidget> {
  ///  Local state fields for this page.

  DateTime? fechaNacimientoCaballo;

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

  final formKey = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Stores action output result for [Bottom Sheet - componente_bottom_nuevasFotosCaballo] action in btn_AgregarFotos widget.
  List<String>? outputBottomFotosCaballoPag1;
  // State field(s) for txt_Nombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreTextController;
  String? Function(BuildContext, String?)? txtNombreTextControllerValidator;
  String? _txtNombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre del caballo es requerido';
    }

    if (val.length > 50) {
      return 'El nombre no puede tener más de 50 caracteres';
    }
    if (!RegExp('[a-zA-Z0-9\\s]').hasMatch(val)) {
      return 'El nombre solo puede tener letras, números y espacios';
    }
    return null;
  }

  // State field(s) for txt_FechaNacimiento widget.
  FocusNode? txtFechaNacimientoFocusNode;
  TextEditingController? txtFechaNacimientoTextController;
  late MaskTextInputFormatter txtFechaNacimientoMask;
  String? Function(BuildContext, String?)?
      txtFechaNacimientoTextControllerValidator;
  String? _txtFechaNacimientoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor indicar la fecha de nacimiento del caballo';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for chips_Sexo widget.
  FormFieldController<List<String>>? chipsSexoValueController;
  String? get chipsSexoValue => chipsSexoValueController?.value?.firstOrNull;
  set chipsSexoValue(String? val) =>
      chipsSexoValueController?.value = val != null ? [val] : [];
  // State field(s) for Raza widget.
  FocusNode? razaFocusNode;
  TextEditingController? razaTextController;
  String? Function(BuildContext, String?)? razaTextControllerValidator;
  String? _razaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La raza es un dato requerido';
    }

    if (val.length > 50) {
      return 'El nombre de la raza no puede tener más de 50 caracteres';
    }
    if (!RegExp('[a-zA-Z\\s]').hasMatch(val)) {
      return 'El nombre de la raza no puede contener números o caracteres especiales';
    }
    return null;
  }

  // State field(s) for Altura widget.
  FocusNode? alturaFocusNode;
  TextEditingController? alturaTextController;
  String? Function(BuildContext, String?)? alturaTextControllerValidator;
  String? _alturaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor indicar la altura';
    }

    return null;
  }

  // State field(s) for Color widget.
  FocusNode? colorFocusNode;
  TextEditingController? colorTextController;
  String? Function(BuildContext, String?)? colorTextControllerValidator;
  String? _colorTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El color es un dato requerido';
    }

    if (val.length > 30) {
      return 'El nombre de la raza no puede tener más de 30 caracteres';
    }
    if (!RegExp('[a-zA-Z\\s]').hasMatch(val)) {
      return 'El color no puede contener números o caracteres especiales';
    }
    return null;
  }

  // State field(s) for dropDown_Provincia widget.
  String? dropDownProvinciaValue;
  FormFieldController<String>? dropDownProvinciaValueController;
  // State field(s) for Ciudad widget.
  FocusNode? ciudadFocusNode;
  TextEditingController? ciudadTextController;
  String? Function(BuildContext, String?)? ciudadTextControllerValidator;
  String? _ciudadTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor indicar la ciudad donde reside el caballo';
    }

    return null;
  }

  // State field(s) para el selector de mapa.
  FFPlace? ubicacionSeleccionadaMapa;
  LatLng? ubicacionGeoPoint;

  // State field(s) for Descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_Registrar widget.
  int? cuentaDocsCaballo;
  // Stores action output result for [Backend Call - Create Document] action in btn_Registrar widget.
  EquinoRecord? docRefCaballoRegistrado;
  // Stores action output result for [Bottom Sheet - componente_bottom_nuevasFotosCaballo] action in btn_subirMas widget.
  List<String>? outputBottomFotosCaballoPag2;

  @override
  void initState(BuildContext context) {
    txtNombreTextControllerValidator = _txtNombreTextControllerValidator;
    txtFechaNacimientoTextControllerValidator =
        _txtFechaNacimientoTextControllerValidator;
    razaTextControllerValidator = _razaTextControllerValidator;
    alturaTextControllerValidator = _alturaTextControllerValidator;
    colorTextControllerValidator = _colorTextControllerValidator;
    ciudadTextControllerValidator = _ciudadTextControllerValidator;
  }

  @override
  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreTextController?.dispose();

    txtFechaNacimientoFocusNode?.dispose();
    txtFechaNacimientoTextController?.dispose();

    razaFocusNode?.dispose();
    razaTextController?.dispose();

    alturaFocusNode?.dispose();
    alturaTextController?.dispose();

    colorFocusNode?.dispose();
    colorTextController?.dispose();

    ciudadFocusNode?.dispose();
    ciudadTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }
}
