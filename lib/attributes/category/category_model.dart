import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'category_widget.dart' show CategoryWidget;
import 'package:flutter/material.dart';

class CategoryModel extends FlutterFlowModel<CategoryWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for search widget.
  final searchKey = GlobalKey();
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? searchSelectedOption;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  List<CategoryRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
  }
}
