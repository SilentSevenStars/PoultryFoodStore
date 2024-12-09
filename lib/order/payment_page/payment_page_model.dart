import '/flutter_flow/flutter_flow_util.dart';
import 'payment_page_widget.dart' show PaymentPageWidget;
import 'package:flutter/material.dart';

class PaymentPageModel extends FlutterFlowModel<PaymentPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for payment widget.
  FocusNode? paymentFocusNode;
  TextEditingController? paymentTextController;
  String? Function(BuildContext, String?)? paymentTextControllerValidator;
  String? _paymentTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    paymentTextControllerValidator = _paymentTextControllerValidator;
  }

  @override
  void dispose() {
    paymentFocusNode?.dispose();
    paymentTextController?.dispose();
  }
}
