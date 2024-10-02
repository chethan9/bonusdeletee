import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bonus_admin/batch/batch_add/batch_add_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'batch_course_creat_time_batch_list_widget.dart'
    show BatchCourseCreatTimeBatchListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BatchCourseCreatTimeBatchListModel
    extends FlutterFlowModel<BatchCourseCreatTimeBatchListWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for Add_button component.
  late AddButtonModel addButtonModel;

  @override
  void initState(BuildContext context) {
    addButtonModel = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    addButtonModel.dispose();
  }
}
