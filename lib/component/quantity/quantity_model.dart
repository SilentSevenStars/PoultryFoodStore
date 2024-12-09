import '/flutter_flow/flutter_flow_util.dart';
import 'quantity_widget.dart' show QuantityWidget;
import 'package:flutter/material.dart';

class QuantityModel extends FlutterFlowModel<QuantityWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - quantityCheck] action in TextField widget.
  int? quantityCheck;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
