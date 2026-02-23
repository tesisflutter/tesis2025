import '/backend/backend.dart';
import '/calendario/componente_lbl_dia/componente_lbl_dia_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'componente_calendario_widget.dart' show ComponenteCalendarioWidget;
import 'package:flutter/material.dart';

class ComponenteCalendarioModel
    extends FlutterFlowModel<ComponenteCalendarioWidget> {
  ///  Local state fields for this component.
  /// Es la fecha que seleccionamos en el calendario (se actualiza cuando
  /// seleccionamos otra)
  DateTime? fechaSeleccionada;

  /// Nos sirve para indicar el mes correcto cuando tocamos las flechitas para
  /// cambiar entre meses.
  ///
  /// Inicialmente (o cuando tocamos el botón de Reset) muestra la fecha actual.
  /// Al tocar alguna de las flechitas, cambia para mostrar la primer fecha del
  /// mes al que cambiamos.
  DateTime? fechaDeMesSeleccionado;

  /// Es la misma lista con la fecha de eventos que se pasa por parámetro, pero
  /// con la hora seteada a cero para poder compararla con las fechas (también a
  /// hora cero) del calendario, y determinar si mostrar o no el ícono que
  /// indica que hay eventos registrados para cada día.
  List<DateTime> listaFechasEventosHoraCero = [];
  void addToListaFechasEventosHoraCero(DateTime item) =>
      listaFechasEventosHoraCero.add(item);
  void removeFromListaFechasEventosHoraCero(DateTime item) =>
      listaFechasEventosHoraCero.remove(item);
  void removeAtIndexFromListaFechasEventosHoraCero(int index) =>
      listaFechasEventosHoraCero.removeAt(index);
  void insertAtIndexInListaFechasEventosHoraCero(int index, DateTime item) =>
      listaFechasEventosHoraCero.insert(index, item);
  void updateListaFechasEventosHoraCeroAtIndex(
          int index, Function(DateTime) updateFn) =>
      listaFechasEventosHoraCero[index] =
          updateFn(listaFechasEventosHoraCero[index]);

  /// Lista de Eventos a llenar cuando se selecciona una fecha y se toca el
  /// botón "Ver Eventos".
  ///
  /// Se vacía al cargar el componente.
  List<EventoCalendarioRecord> listaEventosFechaSeleccionada = [];
  void addToListaEventosFechaSeleccionada(EventoCalendarioRecord item) =>
      listaEventosFechaSeleccionada.add(item);
  void removeFromListaEventosFechaSeleccionada(EventoCalendarioRecord item) =>
      listaEventosFechaSeleccionada.remove(item);
  void removeAtIndexFromListaEventosFechaSeleccionada(int index) =>
      listaEventosFechaSeleccionada.removeAt(index);
  void insertAtIndexInListaEventosFechaSeleccionada(
          int index, EventoCalendarioRecord item) =>
      listaEventosFechaSeleccionada.insert(index, item);
  void updateListaEventosFechaSeleccionadaAtIndex(
          int index, Function(EventoCalendarioRecord) updateFn) =>
      listaEventosFechaSeleccionada[index] =
          updateFn(listaEventosFechaSeleccionada[index]);

  List<EventoCalendarioRecord> listaEventosUsuarioLogueado = [];
  void addToListaEventosUsuarioLogueado(EventoCalendarioRecord item) =>
      listaEventosUsuarioLogueado.add(item);
  void removeFromListaEventosUsuarioLogueado(EventoCalendarioRecord item) =>
      listaEventosUsuarioLogueado.remove(item);
  void removeAtIndexFromListaEventosUsuarioLogueado(int index) =>
      listaEventosUsuarioLogueado.removeAt(index);
  void insertAtIndexInListaEventosUsuarioLogueado(
          int index, EventoCalendarioRecord item) =>
      listaEventosUsuarioLogueado.insert(index, item);
  void updateListaEventosUsuarioLogueadoAtIndex(
          int index, Function(EventoCalendarioRecord) updateFn) =>
      listaEventosUsuarioLogueado[index] =
          updateFn(listaEventosUsuarioLogueado[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in componente_calendario widget.
  List<EventoCalendarioRecord>? queryEventosUsuarioLogueadoOutput;
  // Model for componente_lblDia component.
  late ComponenteLblDiaModel componenteLblDiaModel1;
  // Model for componente_lblDia component.
  late ComponenteLblDiaModel componenteLblDiaModel2;
  // Model for componente_lblDia component.
  late ComponenteLblDiaModel componenteLblDiaModel3;
  // Model for componente_lblDia component.
  late ComponenteLblDiaModel componenteLblDiaModel4;
  // Model for componente_lblDia component.
  late ComponenteLblDiaModel componenteLblDiaModel5;
  // Model for componente_lblDia component.
  late ComponenteLblDiaModel componenteLblDiaModel6;
  // Model for componente_lblDia component.
  late ComponenteLblDiaModel componenteLblDiaModel7;

  @override
  void initState(BuildContext context) {
    componenteLblDiaModel1 =
        createModel(context, () => ComponenteLblDiaModel());
    componenteLblDiaModel2 =
        createModel(context, () => ComponenteLblDiaModel());
    componenteLblDiaModel3 =
        createModel(context, () => ComponenteLblDiaModel());
    componenteLblDiaModel4 =
        createModel(context, () => ComponenteLblDiaModel());
    componenteLblDiaModel5 =
        createModel(context, () => ComponenteLblDiaModel());
    componenteLblDiaModel6 =
        createModel(context, () => ComponenteLblDiaModel());
    componenteLblDiaModel7 =
        createModel(context, () => ComponenteLblDiaModel());
  }

  @override
  void dispose() {
    componenteLblDiaModel1.dispose();
    componenteLblDiaModel2.dispose();
    componenteLblDiaModel3.dispose();
    componenteLblDiaModel4.dispose();
    componenteLblDiaModel5.dispose();
    componenteLblDiaModel6.dispose();
    componenteLblDiaModel7.dispose();
  }
}
