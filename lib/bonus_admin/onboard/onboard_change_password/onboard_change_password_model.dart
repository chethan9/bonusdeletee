import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'onboard_change_password_widget.dart' show OnboardChangePasswordWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardChangePasswordModel
    extends FlutterFlowModel<OnboardChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Button-Login widget.
  String? userIP1;
  // Stores action output result for [Custom Action - getUserSessionID] action in Button-Login widget.
  String? userSession1;
  // Model for Mobile component.
  late MobileModel mobileModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    mobileModel = createModel(context, () => MobileModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    mobileModel.dispose();
  }
}
