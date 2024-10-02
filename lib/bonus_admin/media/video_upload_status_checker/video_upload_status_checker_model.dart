import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/course/video_uploading_status/video_uploading_status_widget.dart';
import 'video_upload_status_checker_widget.dart'
    show VideoUploadStatusCheckerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class VideoUploadStatusCheckerModel
    extends FlutterFlowModel<VideoUploadStatusCheckerWidget> {
  ///  Local state fields for this component.

  String videoStatus = 'Pre-Upload';

  int? videoTimer = 10000;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Check Video Status)] action in Video-UploadStatusChecker widget.
  ApiCallResponse? apiResultl4dCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
