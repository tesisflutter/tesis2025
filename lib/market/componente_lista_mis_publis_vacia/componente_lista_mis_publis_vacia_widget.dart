import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'componente_lista_mis_publis_vacia_model.dart';
export 'componente_lista_mis_publis_vacia_model.dart';

class ComponenteListaMisPublisVaciaWidget extends StatefulWidget {
  const ComponenteListaMisPublisVaciaWidget({super.key});

  @override
  State<ComponenteListaMisPublisVaciaWidget> createState() =>
      _ComponenteListaMisPublisVaciaWidgetState();
}

class _ComponenteListaMisPublisVaciaWidgetState
    extends State<ComponenteListaMisPublisVaciaWidget> {
  late ComponenteListaMisPublisVaciaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteListaMisPublisVaciaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 256.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: Image.asset(
            Theme.of(context).brightness == Brightness.dark
                ? 'assets/images/publis_vacia_blanca2.png'
                : 'assets/images/publis_vacia_negra2.png',
          ).image,
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
    );
  }
}
