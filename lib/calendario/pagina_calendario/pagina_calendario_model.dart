import '/backend/backend.dart';
import '/calendario/componente_calendario/componente_calendario_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pagina_calendario_widget.dart' show PaginaCalendarioWidget;
import 'package:flutter/material.dart';

class PaginaCalendarioModel extends FlutterFlowModel<PaginaCalendarioWidget> {
  ///  Local state fields for this page.
  /// Es la fecha que seleccionamos en el calendario al tocar en un día
  /// específico - Por defecto empieza en el día corriente.
  DateTime? fechaSeleccionada;

  /// La lista entera de TODOS los eventos para el usuario logueado.
  List<EventoCalendarioRecord> listaEventosCalendario = [];
  void addToListaEventosCalendario(EventoCalendarioRecord item) =>
      listaEventosCalendario.add(item);
  void removeFromListaEventosCalendario(EventoCalendarioRecord item) =>
      listaEventosCalendario.remove(item);
  void removeAtIndexFromListaEventosCalendario(int index) =>
      listaEventosCalendario.removeAt(index);
  void insertAtIndexInListaEventosCalendario(
          int index, EventoCalendarioRecord item) =>
      listaEventosCalendario.insert(index, item);
  void updateListaEventosCalendarioAtIndex(
          int index, Function(EventoCalendarioRecord) updateFn) =>
      listaEventosCalendario[index] = updateFn(listaEventosCalendario[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PaginaCalendario widget.
  List<EventoCalendarioRecord>? eventosUsuarioOutput;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for componente_calendario component.
  late ComponenteCalendarioModel componenteCalendarioModel;

  @override
  void initState(BuildContext context) {
    componenteCalendarioModel =
        createModel(context, () => ComponenteCalendarioModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    componenteCalendarioModel.dispose();
  }
}
