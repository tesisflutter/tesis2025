import '/flutter_flow/flutter_flow_util.dart';
import 'details20_property_widget.dart' show Details20PropertyWidget;
import 'package:flutter/material.dart';

class Details20PropertyModel extends FlutterFlowModel<Details20PropertyWidget> {
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
