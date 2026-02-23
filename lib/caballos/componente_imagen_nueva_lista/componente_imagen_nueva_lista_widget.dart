import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'componente_imagen_nueva_lista_model.dart';
export 'componente_imagen_nueva_lista_model.dart';

class ComponenteImagenNuevaListaWidget extends StatefulWidget {
  const ComponenteImagenNuevaListaWidget({super.key});

  @override
  State<ComponenteImagenNuevaListaWidget> createState() =>
      _ComponenteImagenNuevaListaWidgetState();
}

class _ComponenteImagenNuevaListaWidgetState
    extends State<ComponenteImagenNuevaListaWidget> {
  late ComponenteImagenNuevaListaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteImagenNuevaListaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        Theme.of(context).brightness == Brightness.dark
            ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tesis-front1-5o1cj8/assets/a46h0sf02tjs/add_photo_icon_white.png'
            : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tesis-front1-5o1cj8/assets/qsu0rqsbqngd/add_photo_icon_black.png',
        width: 512.0,
        height: 512.0,
        fit: BoxFit.contain,
      ),
    );
  }
}
