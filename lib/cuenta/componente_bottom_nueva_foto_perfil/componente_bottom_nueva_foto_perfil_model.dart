import '/flutter_flow/flutter_flow_util.dart';
import 'componente_bottom_nueva_foto_perfil_widget.dart'
    show ComponenteBottomNuevaFotoPerfilWidget;
import 'package:flutter/material.dart';

class ComponenteBottomNuevaFotoPerfilModel
    extends FlutterFlowModel<ComponenteBottomNuevaFotoPerfilWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadFirebaseFotoPerfilPathCamara = false;
  FFUploadedFile uploadedLocalFile_uploadFirebaseFotoPerfilPathCamara =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadFirebaseFotoPerfilPathCamara = '';

  bool isDataUploading_uploadFirebaseFotoPerfilPathGaleria = false;
  FFUploadedFile uploadedLocalFile_uploadFirebaseFotoPerfilPathGaleria =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadFirebaseFotoPerfilPathGaleria = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
