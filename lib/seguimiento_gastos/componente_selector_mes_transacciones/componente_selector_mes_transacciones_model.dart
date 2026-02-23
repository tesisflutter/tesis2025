import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'componente_selector_mes_transacciones_widget.dart'
    show ComponenteSelectorMesTransaccionesWidget;
import 'package:flutter/material.dart';

class ComponenteSelectorMesTransaccionesModel
    extends FlutterFlowModel<ComponenteSelectorMesTransaccionesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
