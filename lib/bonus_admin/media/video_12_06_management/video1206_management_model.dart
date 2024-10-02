import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/bonus_admin/media/video_play_button/video_play_button_widget.dart';
import '/bonus_admin/media/video_preview/video_preview_widget.dart';
import '/bonus_admin/media/video_upload_video_list/video_upload_video_list_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'video1206_management_widget.dart' show Video1206ManagementWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Video1206ManagementModel
    extends FlutterFlowModel<Video1206ManagementWidget> {
  ///  Local state fields for this page.

  int? videoProgress;

  String instructorVideoList = 'pending';

  String uploadVisibility = 'Pending';

  int videoCount = 0;

  int? totalVideoCount = 0;

  int? refresh;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Video-12_06_Management widget.
  UsersRecord? userAuthRslt1;
  // Stores action output result for [Backend Call - API (Search by Folder Name)] action in Video-12_06_Management widget.
  ApiCallResponse? userFolderStatusRslt1;
  // Stores action output result for [Backend Call - API (Create Folder)] action in Video-12_06_Management widget.
  ApiCallResponse? userFolderCreationRslt1;
  // Stores action output result for [Backend Call - API (List Video based FolderID)] action in Video-12_06_Management widget.
  ApiCallResponse? userFolderVideoListRslt1;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Model for Video-UploadVideoList component.
  late VideoUploadVideoListModel videoUploadVideoListModel;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in Container widget.
  ApiCallResponse? apiResultdeqCopy;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in Video-PlayButton widget.
  ApiCallResponse? apiResultdeq;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in Column widget.
  ApiCallResponse? apiResultdeqCopyCopy;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in Icon widget.
  ApiCallResponse? apiResultdeq1;
  // Model for Mobile component.
  late MobileModel mobileModel;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    addButtonModel = createModel(context, () => AddButtonModel());
    videoUploadVideoListModel =
        createModel(context, () => VideoUploadVideoListModel());
    mobileModel = createModel(context, () => MobileModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    addButtonModel.dispose();
    videoUploadVideoListModel.dispose();
    mobileModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
