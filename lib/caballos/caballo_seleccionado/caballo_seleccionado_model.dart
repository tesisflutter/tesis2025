import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/index.dart';
import 'caballo_seleccionado_widget.dart' show CaballoSeleccionadoWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CaballoSeleccionadoModel
    extends FlutterFlowModel<CaballoSeleccionadoWidget> {
  ///  Local state fields for this page.

  List<String> listImagenesSeleccionadas = [];
  void addToListImagenesSeleccionadas(String item) =>
      listImagenesSeleccionadas.add(item);
  void removeFromListImagenesSeleccionadas(String item) =>
      listImagenesSeleccionadas.remove(item);
  void removeAtIndexFromListImagenesSeleccionadas(int index) =>
      listImagenesSeleccionadas.removeAt(index);
  void insertAtIndexInListImagenesSeleccionadas(int index, String item) =>
      listImagenesSeleccionadas.insert(index, item);
  void updateListImagenesSeleccionadasAtIndex(
          int index, Function(String) updateFn) =>
      listImagenesSeleccionadas[index] =
          updateFn(listImagenesSeleccionadas[index]);

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

  /// Si el caballo ya está publicado en el market, esto muestra la ID de la
  /// publicación.
  ///
  /// Si no, es null.
  int? idPublicacion;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in Caballo_Seleccionado widget.
  PublicacionMarketRecord? queryPublicacionCaballo;
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

  // State field(s) for Nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for Edad widget.
  FocusNode? edadFocusNode;
  TextEditingController? edadTextController;
  String? Function(BuildContext, String?)? edadTextControllerValidator;
  // State field(s) for Color widget.
  FocusNode? colorFocusNode;
  TextEditingController? colorTextController;
  String? Function(BuildContext, String?)? colorTextControllerValidator;
  // State field(s) for Raza widget.
  FocusNode? razaFocusNode;
  TextEditingController? razaTextController;
  String? Function(BuildContext, String?)? razaTextControllerValidator;
  // State field(s) for Altura widget.
  FocusNode? alturaFocusNode;
  TextEditingController? alturaTextController;
  String? Function(BuildContext, String?)? alturaTextControllerValidator;
  // State field(s) for Sexo widget.
  FocusNode? sexoFocusNode;
  TextEditingController? sexoTextController;
  String? Function(BuildContext, String?)? sexoTextControllerValidator;
  // State field(s) for Ubicacion widget.
  FocusNode? ubicacionFocusNode;
  TextEditingController? ubicacionTextController;
  String? Function(BuildContext, String?)? ubicacionTextControllerValidator;
  // State field(s) para el selector de mapa.
  FFPlace? ubicacionSeleccionadaMapa;
  LatLng? ubicacionGeoPoint;

  // State field(s) for Descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // Stores action output result for [Bottom Sheet - componente_bottom_nuevasFotosCaballo] action in btn_subirMas widget.
  List<String>? outputBottomFotosCaballoPag2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    edadFocusNode?.dispose();
    edadTextController?.dispose();

    colorFocusNode?.dispose();
    colorTextController?.dispose();

    razaFocusNode?.dispose();
    razaTextController?.dispose();

    alturaFocusNode?.dispose();
    alturaTextController?.dispose();

    sexoFocusNode?.dispose();
    sexoTextController?.dispose();

    ubicacionFocusNode?.dispose();
    ubicacionTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }
}
