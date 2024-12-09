import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_page_widget.dart' show ForgotPageWidget;
import 'package:flutter/material.dart';

class ForgotPageModel extends FlutterFlowModel<ForgotPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
