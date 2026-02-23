import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'market_principal_widget.dart' show MarketPrincipalWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class MarketPrincipalModel extends FlutterFlowModel<MarketPrincipalWidget> {
  ///  Local state fields for this page.
  /// Verdadero si hay un término de búsqueda, falso si no hay búsqueda alguna
  /// aplicada.
  bool modoBusqueda = false;

  List<PublicacionMarketRecord> listaPublisDestacadas = [];
  void addToListaPublisDestacadas(PublicacionMarketRecord item) =>
      listaPublisDestacadas.add(item);
  void removeFromListaPublisDestacadas(PublicacionMarketRecord item) =>
      listaPublisDestacadas.remove(item);
  void removeAtIndexFromListaPublisDestacadas(int index) =>
      listaPublisDestacadas.removeAt(index);
  void insertAtIndexInListaPublisDestacadas(
          int index, PublicacionMarketRecord item) =>
      listaPublisDestacadas.insert(index, item);
  void updateListaPublisDestacadasAtIndex(
          int index, Function(PublicacionMarketRecord) updateFn) =>
      listaPublisDestacadas[index] = updateFn(listaPublisDestacadas[index]);

  String? filtroCategoria = 'Todas';

  int? filtroPrecioMinimo = 0;

  int? filtroPrecioMaximo = 10000000000;

  String? filtroProvincia = 'Todas las Provincias';

  String? filtroCiudad;

  /// Clave por la cual ordenar la lista de publicaciones (ya sea la base, o la
  /// filtrada)
  ///
  /// - Más reciente (por defecto)
  /// - Menos reciente
  /// - Mayor precio
  /// - Menor precio
  String ordenLista = 'Más reciente';

  List<PublicacionMarketRecord> listaPublisMarket = [];
  void addToListaPublisMarket(PublicacionMarketRecord item) =>
      listaPublisMarket.add(item);
  void removeFromListaPublisMarket(PublicacionMarketRecord item) =>
      listaPublisMarket.remove(item);
  void removeAtIndexFromListaPublisMarket(int index) =>
      listaPublisMarket.removeAt(index);
  void insertAtIndexInListaPublisMarket(
          int index, PublicacionMarketRecord item) =>
      listaPublisMarket.insert(index, item);
  void updateListaPublisMarketAtIndex(
          int index, Function(PublicacionMarketRecord) updateFn) =>
      listaPublisMarket[index] = updateFn(listaPublisMarket[index]);

  List<PublicacionMarketRecord> listaPublisMarketBuscadasResult = [];
  void addToListaPublisMarketBuscadasResult(PublicacionMarketRecord item) =>
      listaPublisMarketBuscadasResult.add(item);
  void removeFromListaPublisMarketBuscadasResult(
          PublicacionMarketRecord item) =>
      listaPublisMarketBuscadasResult.remove(item);
  void removeAtIndexFromListaPublisMarketBuscadasResult(int index) =>
      listaPublisMarketBuscadasResult.removeAt(index);
  void insertAtIndexInListaPublisMarketBuscadasResult(
          int index, PublicacionMarketRecord item) =>
      listaPublisMarketBuscadasResult.insert(index, item);
  void updateListaPublisMarketBuscadasResultAtIndex(
          int index, Function(PublicacionMarketRecord) updateFn) =>
      listaPublisMarketBuscadasResult[index] =
          updateFn(listaPublisMarketBuscadasResult[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Market_Principal widget.
  List<PublicacionMarketRecord>? listaPublisDestacadasQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Market_Principal widget.
  List<PublicacionMarketRecord>? queryPublisMarket;
  // State field(s) for txtField_buscar widget.
  FocusNode? txtFieldBuscarFocusNode;
  TextEditingController? txtFieldBuscarTextController;
  String? Function(BuildContext, String?)?
      txtFieldBuscarTextControllerValidator;
  // Stores action output result for [Bottom Sheet - componente_bottom_filtros] action in btn_filtrar widget.
  FiltroRecord? docFiltroBottom;
  // State field(s) for chip_categoria widget.
  FormFieldController<List<String>>? chipCategoriaValueController;
  String? get chipCategoriaValue =>
      chipCategoriaValueController?.value?.firstOrNull;
  set chipCategoriaValue(String? val) =>
      chipCategoriaValueController?.value = val != null ? [val] : [];
  // State field(s) for chip_precio widget.
  FormFieldController<List<String>>? chipPrecioValueController;
  String? get chipPrecioValue => chipPrecioValueController?.value?.firstOrNull;
  set chipPrecioValue(String? val) =>
      chipPrecioValueController?.value = val != null ? [val] : [];
  // State field(s) for chip_ubicacion widget.
  FormFieldController<List<String>>? chipUbicacionValueController;
  String? get chipUbicacionValue =>
      chipUbicacionValueController?.value?.firstOrNull;
  set chipUbicacionValue(String? val) =>
      chipUbicacionValueController?.value = val != null ? [val] : [];
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtFieldBuscarFocusNode?.dispose();
    txtFieldBuscarTextController?.dispose();
  }
}
