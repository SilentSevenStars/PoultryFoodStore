import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for newPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  String? _newPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 32) {
      return 'Maximum 32 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  String? _confirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 32) {
      return 'Maximum 32 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    newPasswordVisibility = false;
    newPasswordTextControllerValidator = _newPasswordTextControllerValidator;
    confirmPasswordVisibility = false;
    confirmPasswordTextControllerValidator =
        _confirmPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
