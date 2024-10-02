import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/course/bulk_sms_confirmation/bulk_sms_confirmation_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:sticky_headers/sticky_headers.dart';
import 's_m_s_paricular_course_widget.dart' show SMSParicularCourseWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SMSParicularCourseModel
    extends FlutterFlowModel<SMSParicularCourseWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Add_button widget.
  SettingsRecord? mainSettingRslt;
  // Stores action output result for [Custom Action - messageCount] action in Add_button widget.
  int? msgCountRslt;

  @override
  void initState(BuildContext context) {
    addButtonModel = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    inputFocusNode?.dispose();
    inputTextController?.dispose();

    addButtonModel.dispose();
  }
}
