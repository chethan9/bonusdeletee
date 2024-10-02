import '/backend/backend.dart';
import '/bonus_admin/batch/batch_password_single_course/batch_password_single_course_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'batch_change_batch_single_course_present_info_widget.dart'
    show BatchChangeBatchSingleCoursePresentInfoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BatchChangeBatchSingleCoursePresentInfoModel
    extends FlutterFlowModel<BatchChangeBatchSingleCoursePresentInfoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for Add_button component.
  late AddButtonModel addButtonModel1;
  // Model for Add_button component.
  late AddButtonModel addButtonModel2;

  @override
  void initState(BuildContext context) {
    addButtonModel1 = createModel(context, () => AddButtonModel());
    addButtonModel2 = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    addButtonModel1.dispose();
    addButtonModel2.dispose();
  }
}
