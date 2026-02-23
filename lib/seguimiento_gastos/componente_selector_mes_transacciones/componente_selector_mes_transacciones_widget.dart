import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'componente_selector_mes_transacciones_model.dart';
export 'componente_selector_mes_transacciones_model.dart';

class ComponenteSelectorMesTransaccionesWidget extends StatefulWidget {
  const ComponenteSelectorMesTransaccionesWidget({super.key});

  @override
  State<ComponenteSelectorMesTransaccionesWidget> createState() =>
      _ComponenteSelectorMesTransaccionesWidgetState();
}

class _ComponenteSelectorMesTransaccionesWidgetState
    extends State<ComponenteSelectorMesTransaccionesWidget> {
  late ComponenteSelectorMesTransaccionesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => ComponenteSelectorMesTransaccionesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowCalendar(
      color: FlutterFlowTheme.of(context).primary,
      iconColor: FlutterFlowTheme.of(context).secondaryText,
      weekFormat: true,
      weekStartsMonday: false,
      initialDate: getCurrentTimestamp,
      rowHeight: 10.0,
      onChange: (DateTimeRange? newSelectedDate) {
        safeSetState(() => _model.calendarSelectedDay = newSelectedDate);
      },
      titleStyle: FlutterFlowTheme.of(context).titleLarge.override(
            font: GoogleFonts.outfit(
              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
          ),
      dayOfWeekStyle: FlutterFlowTheme.of(context).bodyLarge.override(
            font: GoogleFonts.readexPro(
              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
          ),
      dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.readexPro(
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
      selectedDateStyle: FlutterFlowTheme.of(context).titleSmall.override(
            font: GoogleFonts.readexPro(
              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
          ),
      inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium.override(
            font: GoogleFonts.readexPro(
              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
          ),
      locale: FFLocalizations.of(context).languageCode,
    );
  }
}
