import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/bonus_admin/media/video_list_for_selection/video_list_for_selection_widget.dart';
import '/bonus_admin/media/video_preview/video_preview_widget.dart';
import '/bonus_admin/media/video_preview_title/video_preview_title_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'video_list_for_selection_widget.dart' show VideoListForSelectionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class VideoListForSelectionModel
    extends FlutterFlowModel<VideoListForSelectionWidget> {
  ///  Local state fields for this component.

  int refresh = 1;

  String folderShowStatus = 'hide';

  String videoShowStatus = 'hide';

  List<FolderInfoStruct> subFolderList = [];
  void addToSubFolderList(FolderInfoStruct item) => subFolderList.add(item);
  void removeFromSubFolderList(FolderInfoStruct item) =>
      subFolderList.remove(item);
  void removeAtIndexFromSubFolderList(int index) =>
      subFolderList.removeAt(index);
  void insertAtIndexInSubFolderList(int index, FolderInfoStruct item) =>
      subFolderList.insert(index, item);
  void updateSubFolderListAtIndex(
          int index, Function(FolderInfoStruct) updateFn) =>
      subFolderList[index] = updateFn(subFolderList[index]);

  int? count;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Video-ListForSelection widget.
  FolderRecord? mainFolderResult1;
  // Stores action output result for [Backend Call - API (Tag based List VdoChipher)] action in Video-ListForSelection widget.
  ApiCallResponse? userFolderVideoListRslt1;
  // Stores action output result for [Backend Call - Read Document] action in Text widget.
  FolderRecord? subfolderRsult1;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  FolderRecord? folderResult1;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in Icon widget.
  ApiCallResponse? apiResultdeq1;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in preview widget.
  ApiCallResponse? apiResultffl1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
