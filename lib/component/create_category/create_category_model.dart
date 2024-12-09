import '/flutter_flow/flutter_flow_util.dart';
import 'create_category_widget.dart' show CreateCategoryWidget;
import 'package:flutter/material.dart';

class CreateCategoryModel extends FlutterFlowModel<CreateCategoryWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for categoryName widget.
  FocusNode? categoryNameFocusNode;
  TextEditingController? categoryNameTextController;
  String? Function(BuildContext, String?)? categoryNameTextControllerValidator;
  String? _categoryNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    categoryNameTextControllerValidator = _categoryNameTextControllerValidator;
  }

  @override
  void dispose() {
    categoryNameFocusNode?.dispose();
    categoryNameTextController?.dispose();
  }
}
