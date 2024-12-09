import '/flutter_flow/flutter_flow_util.dart';
import 'quantity_stock_widget.dart' show QuantityStockWidget;
import 'package:flutter/material.dart';

class QuantityStockModel extends FlutterFlowModel<QuantityStockWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for quantityTxt widget.
  FocusNode? quantityTxtFocusNode;
  TextEditingController? quantityTxtTextController;
  String? Function(BuildContext, String?)? quantityTxtTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    quantityTxtFocusNode?.dispose();
    quantityTxtTextController?.dispose();
  }
}
