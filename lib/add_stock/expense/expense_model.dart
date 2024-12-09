import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'expense_widget.dart' show ExpenseWidget;
import 'package:flutter/material.dart';

class ExpenseModel extends FlutterFlowModel<ExpenseWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for supplierTxt widget.
  String? supplierTxtValue;
  FormFieldController<String>? supplierTxtValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
