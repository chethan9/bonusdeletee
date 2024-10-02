import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_item_history_widget.dart' show OrderItemHistoryWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class OrderItemHistoryModel extends FlutterFlowModel<OrderItemHistoryWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  BatchesRecord? batchRslt1;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  CourseRecord? courseRslt1;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  CountryRecord? cR1;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  UniversityRecord? uR1;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  CategoryRecord? ccR1;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  BranchRecord? bR1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
