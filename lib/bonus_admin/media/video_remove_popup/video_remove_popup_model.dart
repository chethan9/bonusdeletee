import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'video_remove_popup_widget.dart' show VideoRemovePopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VideoRemovePopupModel extends FlutterFlowModel<VideoRemovePopupWidget> {
  ///  Local state fields for this component.

  int? lessonCount;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Delete)] action in Button widget.
  ApiCallResponse? apiResultyhp123;
  // Stores action output result for [Backend Call - API (Delete)] action in Button widget.
  ApiCallResponse? apiResultyhp;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<LessonsRecord>? productListrslt1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CourseRecord>? productRslt1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FolderRecord? mainFolderResult1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
