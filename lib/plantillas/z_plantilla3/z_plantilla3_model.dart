import '/flutter_flow/flutter_flow_util.dart';
import 'z_plantilla3_widget.dart' show ZPlantilla3Widget;
import 'package:flutter/material.dart';

class ZPlantilla3Model extends FlutterFlowModel<ZPlantilla3Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
