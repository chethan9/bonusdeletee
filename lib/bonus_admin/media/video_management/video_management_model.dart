import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/bonus_admin/media/video_folder_creation/video_folder_creation_widget.dart';
import '/bonus_admin/media/video_folder_edit/video_folder_edit_widget.dart';
import '/bonus_admin/media/video_preview/video_preview_widget.dart';
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
import 'video_management_widget.dart' show VideoManagementWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class VideoManagementModel extends FlutterFlowModel<VideoManagementWidget> {
  ///  Local state fields for this page.

  String uploadVisibility = 'Pending';

  int? refresh;

  int? pageLimit = 10;

  int? presentPageNumber = 1;

  int? prev = 1;

  int? last = 1;

  int? startIndex = 0;

  int? endIndex = 9;

  String paginationStatus = 'hide';

  int? totalVideo;

  int? numberOfPage;

  List<FolderInfoStruct> folderList = [];
  void addToFolderList(FolderInfoStruct item) => folderList.add(item);
  void removeFromFolderList(FolderInfoStruct item) => folderList.remove(item);
  void removeAtIndexFromFolderList(int index) => folderList.removeAt(index);
  void insertAtIndexInFolderList(int index, FolderInfoStruct item) =>
      folderList.insert(index, item);
  void updateFolderListAtIndex(
          int index, Function(FolderInfoStruct) updateFn) =>
      folderList[index] = updateFn(folderList[index]);

  String mainShow = 'hide';

  String? presentFolderID;

  String? folderShow = 'hide';

  int? count;

  List<String> tagBasedVideoList = [];
  void addToTagBasedVideoList(String item) => tagBasedVideoList.add(item);
  void removeFromTagBasedVideoList(String item) =>
      tagBasedVideoList.remove(item);
  void removeAtIndexFromTagBasedVideoList(int index) =>
      tagBasedVideoList.removeAt(index);
  void insertAtIndexInTagBasedVideoList(int index, String item) =>
      tagBasedVideoList.insert(index, item);
  void updateTagBasedVideoListAtIndex(int index, Function(String) updateFn) =>
      tagBasedVideoList[index] = updateFn(tagBasedVideoList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Video-Management widget.
  FolderRecord? mainFolderResult1;
  // Stores action output result for [Backend Call - API (Tag based List NewRohit)] action in Video-Management widget.
  ApiCallResponse? userFolderVideoListRslt2;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // Stores action output result for [Backend Call - Read Document] action in Text widget.
  FolderRecord? subfolderRsult1;
  // Model for Add_button component.
  late AddButtonModel addButtonModel1;
  // Model for Add_button component.
  late AddButtonModel addButtonModel2;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  FolderRecord? folderResult1;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in Column widget.
  ApiCallResponse? apiResultdeqCopyCopy111;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in Container widget.
  ApiCallResponse? apiResultdeq1;
  // Stores action output result for [Backend Call - API (Download Link)] action in Icon widget.
  ApiCallResponse? apiResult8hp;
  // Stores action output result for [Backend Call - API (Tag based List NewRohit)] action in First widget.
  ApiCallResponse? apifirstbasedresult1;
  // Stores action output result for [Backend Call - API (Tag based List NewRohit)] action in Prev widget.
  ApiCallResponse? apibackbasedresult1;
  // Stores action output result for [Backend Call - API (Tag based List NewRohit)] action in Button widget.
  ApiCallResponse? apiindexbasedresult1;
  // Stores action output result for [Backend Call - API (Tag based List NewRohit)] action in Next widget.
  ApiCallResponse? apinextbasedresult1;
  // Stores action output result for [Backend Call - API (Tag based List NewRohit)] action in Last widget.
  ApiCallResponse? apilastbasedresult1;
  // Model for Mobile component.
  late MobileModel mobileModel;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    addButtonModel1 = createModel(context, () => AddButtonModel());
    addButtonModel2 = createModel(context, () => AddButtonModel());
    mobileModel = createModel(context, () => MobileModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    addButtonModel1.dispose();
    addButtonModel2.dispose();
    mobileModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
