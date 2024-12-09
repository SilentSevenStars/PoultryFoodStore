import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stocktem_list_widget.dart' show StocktemListWidget;
import 'package:flutter/material.dart';

class StocktemListModel extends FlutterFlowModel<StocktemListWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for search widget.
  final searchKey = GlobalKey();
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? searchSelectedOption;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  List<ProductRecord> simpleSearchResults = [];
  var qr = '';
  // Stores action output result for [Custom Action - getProductByScan] action in IconButton widget.
  bool? product;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
  }
}
