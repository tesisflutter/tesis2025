import '/flutter_flow/flutter_flow_util.dart';
import 'componente_bottom_foto_perfil_vete_widget.dart'
    show ComponenteBottomFotoPerfilVeteWidget;
import 'package:flutter/material.dart';

class ComponenteBottomFotoPerfilVeteModel
    extends FlutterFlowModel<ComponenteBottomFotoPerfilVeteWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadFirebaseFotoVetePathCamara = false;
  FFUploadedFile uploadedLocalFile_uploadFirebaseFotoVetePathCamara =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadFirebaseFotoVetePathCamara = '';

  bool isDataUploading_uploadFirebaseFotoVetePathGaleria = false;
  FFUploadedFile uploadedLocalFile_uploadFirebaseFotoVetePathGaleria =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadFirebaseFotoVetePathGaleria = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
