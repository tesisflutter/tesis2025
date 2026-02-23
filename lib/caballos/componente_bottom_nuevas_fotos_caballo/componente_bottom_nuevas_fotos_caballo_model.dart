import '/flutter_flow/flutter_flow_util.dart';
import 'componente_bottom_nuevas_fotos_caballo_widget.dart'
    show ComponenteBottomNuevasFotosCaballoWidget;
import 'package:flutter/material.dart';

class ComponenteBottomNuevasFotosCaballoModel
    extends FlutterFlowModel<ComponenteBottomNuevasFotosCaballoWidget> {
  ///  Local state fields for this component.
  /// Hace falta tener esta variable como buffer porque la opción de subir desde
  /// la cámara solo permite 1 foto, y no la guarda como LISTA, que es lo que
  /// necesitamos devolver de este componente.
  List<String> listaFotosSubidas = [];
  void addToListaFotosSubidas(String item) => listaFotosSubidas.add(item);
  void removeFromListaFotosSubidas(String item) =>
      listaFotosSubidas.remove(item);
  void removeAtIndexFromListaFotosSubidas(int index) =>
      listaFotosSubidas.removeAt(index);
  void insertAtIndexInListaFotosSubidas(int index, String item) =>
      listaFotosSubidas.insert(index, item);
  void updateListaFotosSubidasAtIndex(int index, Function(String) updateFn) =>
      listaFotosSubidas[index] = updateFn(listaFotosSubidas[index]);

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadFirebaseFotoPathCamara = false;
  FFUploadedFile uploadedLocalFile_uploadFirebaseFotoPathCamara =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadFirebaseFotoPathCamara = '';

  bool isDataUploading_uploadFirebaseFotosPathGaleria = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadFirebaseFotosPathGaleria = [];
  List<String> uploadedFileUrls_uploadFirebaseFotosPathGaleria = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
