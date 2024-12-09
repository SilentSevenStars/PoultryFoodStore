import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_product_widget.dart' show UpdateProductWidget;
import 'package:flutter/material.dart';

class UpdateProductModel extends FlutterFlowModel<UpdateProductWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
  String? _productNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for brand widget.
  FocusNode? brandFocusNode;
  TextEditingController? brandTextController;
  String? Function(BuildContext, String?)? brandTextControllerValidator;
  String? _brandTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  String? _priceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for stock widget.
  FocusNode? stockFocusNode;
  TextEditingController? stockTextController;
  String? Function(BuildContext, String?)? stockTextControllerValidator;
  String? _stockTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for cost widget.
  FocusNode? costFocusNode;
  TextEditingController? costTextController;
  String? Function(BuildContext, String?)? costTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    productNameTextControllerValidator = _productNameTextControllerValidator;
    brandTextControllerValidator = _brandTextControllerValidator;
    priceTextControllerValidator = _priceTextControllerValidator;
    stockTextControllerValidator = _stockTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();

    brandFocusNode?.dispose();
    brandTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    stockFocusNode?.dispose();
    stockTextController?.dispose();

    costFocusNode?.dispose();
    costTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
