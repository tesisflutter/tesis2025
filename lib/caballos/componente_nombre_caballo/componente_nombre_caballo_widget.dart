import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'componente_nombre_caballo_model.dart';
export 'componente_nombre_caballo_model.dart';

/// Componente que contiene el txt con el nombre de cada caballo en el list
/// view de Mis Equinos
class ComponenteNombreCaballoWidget extends StatefulWidget {
  const ComponenteNombreCaballoWidget({
    super.key,
    String? nombreCaballo,
  }) : this.nombreCaballo = nombreCaballo ?? '...';

  final String nombreCaballo;

  @override
  State<ComponenteNombreCaballoWidget> createState() =>
      _ComponenteNombreCaballoWidgetState();
}

class _ComponenteNombreCaballoWidgetState
    extends State<ComponenteNombreCaballoWidget> {
  late ComponenteNombreCaballoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteNombreCaballoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        widget.nombreCaballo,
        style: FlutterFlowTheme.of(context).titleMedium.override(
              font: GoogleFonts.readexPro(
                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
              ),
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
            ),
      ),
    );
  }
}
