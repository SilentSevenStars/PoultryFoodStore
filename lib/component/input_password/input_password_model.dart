import '/flutter_flow/flutter_flow_util.dart';
import 'input_password_widget.dart' show InputPasswordWidget;
import 'package:flutter/material.dart';

class InputPasswordModel extends FlutterFlowModel<InputPasswordWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
