import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'video_upload_video_list_widget.dart' show VideoUploadVideoListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class VideoUploadVideoListModel
    extends FlutterFlowModel<VideoUploadVideoListWidget> {
  ///  Local state fields for this component.

  int? count = 0;

  bool apiStatus = false;

  int refresh = 1;

  String? listStatus = 'hide';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (FolderIDBasedVideoListOldTWO)] action in Video-UploadVideoList widget.
  ApiCallResponse? apiResult8ya123;
  // Stores action output result for [Backend Call - API (Delete)] action in Container widget.
  ApiCallResponse? apiResultyhp122;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
