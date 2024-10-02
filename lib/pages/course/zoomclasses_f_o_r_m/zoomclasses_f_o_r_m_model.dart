import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'zoomclasses_f_o_r_m_widget.dart' show ZoomclassesFORMWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ZoomclassesFORMModel extends FlutterFlowModel<ZoomclassesFORMWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for input widget.
  FocusNode? inputFocusNode1;
  TextEditingController? inputTextController1;
  String? Function(BuildContext, String?)? inputTextController1Validator;
  String? _inputTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7ay9bzqn' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for input widget.
  FocusNode? inputFocusNode2;
  TextEditingController? inputTextController2;
  String? Function(BuildContext, String?)? inputTextController2Validator;
  String? _inputTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iiyxrvap' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for summary widget.
  FocusNode? summaryFocusNode;
  TextEditingController? summaryTextController;
  String? Function(BuildContext, String?)? summaryTextControllerValidator;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Backend Call - API (Update  Meeting)] action in Add_button widget.
  ApiCallResponse? zoomUpdateRslt;
  // Stores action output result for [Backend Call - API (Retrieve  Meeting)] action in Add_button widget.
  ApiCallResponse? zoomGetRslt;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Add_button widget.
  String? userIP1;
  // Stores action output result for [Custom Action - getUserSessionID] action in Add_button widget.
  String? userSession1;
  // Model for Mobile component.
  late MobileModel mobileModel;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    inputTextController1Validator = _inputTextController1Validator;
    inputTextController2Validator = _inputTextController2Validator;
    addButtonModel = createModel(context, () => AddButtonModel());
    mobileModel = createModel(context, () => MobileModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    inputFocusNode1?.dispose();
    inputTextController1?.dispose();

    inputFocusNode2?.dispose();
    inputTextController2?.dispose();

    summaryFocusNode?.dispose();
    summaryTextController?.dispose();

    addButtonModel.dispose();
    mobileModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
