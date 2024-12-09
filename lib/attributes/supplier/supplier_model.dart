import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'supplier_widget.dart' show SupplierWidget;
import 'package:flutter/material.dart';

class SupplierModel extends FlutterFlowModel<SupplierWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for search widget.
  final searchKey = GlobalKey();
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? searchSelectedOption;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  List<SupplierRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
  }
}
