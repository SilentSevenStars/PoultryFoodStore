import '/flutter_flow/flutter_flow_util.dart';
import 'edit_picture_widget.dart' show EditPictureWidget;
import 'package:flutter/material.dart';

class EditPictureModel extends FlutterFlowModel<EditPictureWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
