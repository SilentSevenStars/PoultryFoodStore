import '/flutter_flow/flutter_flow_util.dart';
import 'add_supplier_widget.dart' show AddSupplierWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddSupplierModel extends FlutterFlowModel<AddSupplierWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for supplierName widget.
  FocusNode? supplierNameFocusNode;
  TextEditingController? supplierNameTextController;
  String? Function(BuildContext, String?)? supplierNameTextControllerValidator;
  String? _supplierNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  final phoneNumberMask = MaskTextInputFormatter(mask: '###########');
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'It must be email address';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    supplierNameTextControllerValidator = _supplierNameTextControllerValidator;
    addressTextControllerValidator = _addressTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    supplierNameFocusNode?.dispose();
    supplierNameTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
