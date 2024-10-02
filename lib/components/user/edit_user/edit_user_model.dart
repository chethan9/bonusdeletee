import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/edit_profile_photo/edit_profile_photo_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/student_blocking/student_blocking_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'edit_user_widget.dart' show EditUserWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditUserModel extends FlutterFlowModel<EditUserWidget> {
  ///  Local state fields for this page.

  Color colorPaid = Color(0xFF4ADA96);

  Color? colorPending = Color(0xFFFFAB3D);

  Color? colorCancelled = Color(0xFFFB3E4B);

  String prevURL = '';

  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for reason widget.
  FocusNode? reasonFocusNode;
  TextEditingController? reasonTextController;
  String? Function(BuildContext, String?)? reasonTextControllerValidator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode1;
  TextEditingController? yourNameTextController1;
  String? Function(BuildContext, String?)? yourNameTextController1Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode2;
  TextEditingController? yourNameTextController2;
  String? Function(BuildContext, String?)? yourNameTextController2Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode3;
  TextEditingController? yourNameTextController3;
  String? Function(BuildContext, String?)? yourNameTextController3Validator;
  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode;
  TextEditingController? yourEmailTextController;
  String? Function(BuildContext, String?)? yourEmailTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for yourPhn widget.
  FocusNode? yourPhnFocusNode;
  TextEditingController? yourPhnTextController;
  String? Function(BuildContext, String?)? yourPhnTextControllerValidator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // Stores action output result for [Custom Action - getUserIPaddress] action in button widget.
  String? userIP1;
  // Stores action output result for [Custom Action - getUserSessionID] action in button widget.
  String? userSession1;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;
  // Model for Mobile component.
  late MobileModel mobileModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    addButtonModel = createModel(context, () => AddButtonModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
    mobileModel = createModel(context, () => MobileModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    addButtonModel.dispose();
    reasonFocusNode?.dispose();
    reasonTextController?.dispose();

    yourNameFocusNode1?.dispose();
    yourNameTextController1?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameTextController2?.dispose();

    yourNameFocusNode3?.dispose();
    yourNameTextController3?.dispose();

    yourEmailFocusNode?.dispose();
    yourEmailTextController?.dispose();

    yourPhnFocusNode?.dispose();
    yourPhnTextController?.dispose();

    initialUserStatusCheckModel.dispose();
    mobileModel.dispose();
  }
}
