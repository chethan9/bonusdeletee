import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/bonus_admin/media/video_23_09_list_for_selection/video2309_list_for_selection_widget.dart';
import '/bonus_admin/media/video_preview/video_preview_widget.dart';
import '/bonus_admin/media/video_preview_title/video_preview_title_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'video2309_list_for_selection_widget.dart'
    show Video2309ListForSelectionWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Video2309ListForSelectionModel
    extends FlutterFlowModel<Video2309ListForSelectionWidget> {
  ///  Local state fields for this component.

  int refresh = 1;

  String folderShowStatus = 'hide';

  String videoShowStatus = 'hide';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Folder List)] action in Video-23_09ListForSelection widget.
  ApiCallResponse? userFolderListRslt1;
  // Stores action output result for [Backend Call - API (List Video based FolderID)] action in Video-23_09ListForSelection widget.
  ApiCallResponse? userFolderVideoListRslt1;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in Icon widget.
  ApiCallResponse? apiResultdeq1;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in preview widget.
  ApiCallResponse? apiResultffl1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
