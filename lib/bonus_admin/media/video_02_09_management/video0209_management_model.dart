import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/bonus_admin/media/video_preview/video_preview_widget.dart';
import '/bonus_admin/media/video_upload_video_list/video_upload_video_list_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'video0209_management_widget.dart' show Video0209ManagementWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Video0209ManagementModel
    extends FlutterFlowModel<Video0209ManagementWidget> {
  ///  Local state fields for this page.

  int? videoProgress;

  String instructorVideoList = 'pending';

  String uploadVisibility = 'Pending';

  int videoCount = 0;

  int? totalVideoCount = 0;

  int? refresh;

  String adminVideoList = 'hide';

  String adminFolderList = 'hide';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Video-02_09Management widget.
  UsersRecord? userAuthRslt1;
  // Stores action output result for [Backend Call - API (Search by Folder Name)] action in Video-02_09Management widget.
  ApiCallResponse? userFolderStatusRslt1;
  // Stores action output result for [Backend Call - API (Create Folder)] action in Video-02_09Management widget.
  ApiCallResponse? userFolderCreationRslt1;
  // Stores action output result for [Backend Call - API (List Video based FolderID)] action in Video-02_09Management widget.
  ApiCallResponse? userFolderVideoListRslt1;
  // Stores action output result for [Backend Call - API (Folder List)] action in Video-02_09Management widget.
  ApiCallResponse? userFolderListRslt1;
  // Stores action output result for [Backend Call - API (List Video based FolderID)] action in Video-02_09Management widget.
  ApiCallResponse? userFolderVideoListRslt2;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Model for Video-UploadVideoList component.
  late VideoUploadVideoListModel videoUploadVideoListModel;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in Column widget.
  ApiCallResponse? apiResultdeqCopyCopy111;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in Container widget.
  ApiCallResponse? apiResultdeq1;
  // Stores action output result for [Backend Call - API (Download Link)] action in Icon widget.
  ApiCallResponse? apiResult8hp;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in Column widget.
  ApiCallResponse? apiResultdeqCopyCopy1;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in Container widget.
  ApiCallResponse? apiResultdeq2;
  // Stores action output result for [Backend Call - API (Download Link)] action in Icon widget.
  ApiCallResponse? apiResult8hp11;
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
