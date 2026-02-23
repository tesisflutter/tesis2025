import '/backend/backend.dart';
import '/caballos/componente_nombre_caballo/componente_nombre_caballo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'seleccionar_mis_equinos_widget.dart' show SeleccionarMisEquinosWidget;
import 'package:flutter/material.dart';

class SeleccionarMisEquinosModel
    extends FlutterFlowModel<SeleccionarMisEquinosWidget> {
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

  EquinoRecord? caballoSeleccionadoSTATE;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for componente_nombreCaballo dynamic component.
  late FlutterFlowDynamicModels<ComponenteNombreCaballoModel>
      componenteNombreCaballoModels;

  @override
  void initState(BuildContext context) {
    componenteNombreCaballoModels =
        FlutterFlowDynamicModels(() => ComponenteNombreCaballoModel());
  }

  @override
  void dispose() {
    componenteNombreCaballoModels.dispose();
  }
}
