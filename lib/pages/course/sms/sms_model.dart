import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/course/bulk_sms_processing/bulk_sms_processing_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'sms_widget.dart' show SmsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SmsModel extends FlutterFlowModel<SmsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Add_button component.
  late AddButtonModel addButtonModel1;
  // Stores action output result for [Backend Call - Create Document] action in Add_button widget.
  SmsMarketRecord? presentCreatedSMS;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Add_button widget.
  String? userIP1;
  // Stores action output result for [Custom Action - getUserSessionID] action in Add_button widget.
  String? userSession1;
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
