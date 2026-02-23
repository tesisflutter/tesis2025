import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'principal_widget.dart' show PrincipalWidget;
import 'package:flutter/material.dart';

class PrincipalModel extends FlutterFlowModel<PrincipalWidget> {
  ///  Local state fields for this page.

  double? balanceMensualSTATE = 0.0;

  /// Determina cuál cuadrito se mostrará en la sección del balance:
  /// sinTransaccionesNunca - No hay transacciones de este usuario
  /// conTransaccionesMesCorriente - Hay transacciones en el mes corriente
  /// sinTransaccionesMesCorriente - Hay transacciones, pero ninguna este mes
  String? statusTransacciones;

  List<TransaccionRecord> listaTransaccionesMesCorriente = [];
  void addToListaTransaccionesMesCorriente(TransaccionRecord item) =>
      listaTransaccionesMesCorriente.add(item);
  void removeFromListaTransaccionesMesCorriente(TransaccionRecord item) =>
      listaTransaccionesMesCorriente.remove(item);
  void removeAtIndexFromListaTransaccionesMesCorriente(int index) =>
      listaTransaccionesMesCorriente.removeAt(index);
  void insertAtIndexInListaTransaccionesMesCorriente(
          int index, TransaccionRecord item) =>
      listaTransaccionesMesCorriente.insert(index, item);
  void updateListaTransaccionesMesCorrienteAtIndex(
          int index, Function(TransaccionRecord) updateFn) =>
      listaTransaccionesMesCorriente[index] =
          updateFn(listaTransaccionesMesCorriente[index]);

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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Principal widget.
  UsuarioRecord? docUsuarioLogueadoOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Principal widget.
  List<TransaccionRecord>? transaccionesMesOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Principal widget.
  int? cuentaTransaccionesAntesMesCorriente;
  // Stores action output result for [Firestore Query - Query a collection] action in Principal widget.
  List<PublicacionMarketRecord>? queryPublisDestacadas;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TransaccionRecord? outputPrimeraTransaccion;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
