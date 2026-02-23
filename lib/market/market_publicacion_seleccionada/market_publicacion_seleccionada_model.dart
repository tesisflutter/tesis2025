import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'market_publicacion_seleccionada_widget.dart'
    show MarketPublicacionSeleccionadaWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MarketPublicacionSeleccionadaModel
    extends FlutterFlowModel<MarketPublicacionSeleccionadaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtField_buscar widget.
  FocusNode? txtFieldBuscarFocusNode;
  TextEditingController? txtFieldBuscarTextController;
  String? Function(BuildContext, String?)?
      txtFieldBuscarTextControllerValidator;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  UsuarioRecord? queryVendedorPublicacion;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_VerMasAsi widget.
  int? cuentaDocumentosFiltro;
  // Stores action output result for [Backend Call - Create Document] action in btn_VerMasAsi widget.
  FiltroRecord? docFiltro;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtFieldBuscarFocusNode?.dispose();
    txtFieldBuscarTextController?.dispose();
  }
}
