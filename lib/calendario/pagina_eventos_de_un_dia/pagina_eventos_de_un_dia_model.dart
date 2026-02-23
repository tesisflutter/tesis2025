import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pagina_eventos_de_un_dia_widget.dart' show PaginaEventosDeUnDiaWidget;
import 'package:flutter/material.dart';

class PaginaEventosDeUnDiaModel
    extends FlutterFlowModel<PaginaEventosDeUnDiaWidget> {
  ///  Local state fields for this page.
  /// La cargamos con el valor de la misma lista pasada por parámetro, pero la
  /// vamos actualizando conforme editamos o borramos eventos, con lo que
  /// salimos de la página si borramos todos los eventos de esta fecha y la
  /// lista queda vacía.
  List<EventoCalendarioRecord> listaEventosSTATE = [];
  void addToListaEventosSTATE(EventoCalendarioRecord item) =>
      listaEventosSTATE.add(item);
  void removeFromListaEventosSTATE(EventoCalendarioRecord item) =>
      listaEventosSTATE.remove(item);
  void removeAtIndexFromListaEventosSTATE(int index) =>
      listaEventosSTATE.removeAt(index);
  void insertAtIndexInListaEventosSTATE(
          int index, EventoCalendarioRecord item) =>
      listaEventosSTATE.insert(index, item);
  void updateListaEventosSTATEAtIndex(
          int index, Function(EventoCalendarioRecord) updateFn) =>
      listaEventosSTATE[index] = updateFn(listaEventosSTATE[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
