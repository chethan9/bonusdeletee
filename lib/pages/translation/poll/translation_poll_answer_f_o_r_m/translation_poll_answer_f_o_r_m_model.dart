import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/components/web_nav_horizontal/web_nav_horizontal_widget.dart';
import '/components/web_nav_translate_submenu/web_nav_translate_submenu_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'translation_poll_answer_f_o_r_m_widget.dart'
    show TranslationPollAnswerFORMWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TranslationPollAnswerFORMModel
    extends FlutterFlowModel<TranslationPollAnswerFORMWidget> {
  ///  Local state fields for this page.

  bool textpopupstatus = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for webNavTranslateSubmenu component.
  late WebNavTranslateSubmenuModel webNavTranslateSubmenuModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for input widget.
  FocusNode? inputFocusNode1;
  TextEditingController? inputTextController1;
  String? Function(BuildContext, String?)? inputTextController1Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode2;
  TextEditingController? inputTextController2;
  String? Function(BuildContext, String?)? inputTextController2Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode3;
  TextEditingController? inputTextController3;
  String? Function(BuildContext, String?)? inputTextController3Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode4;
  TextEditingController? inputTextController4;
  String? Function(BuildContext, String?)? inputTextController4Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode5;
  TextEditingController? inputTextController5;
  String? Function(BuildContext, String?)? inputTextController5Validator;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Add_button widget.
  String? userIP1;
  // Stores action output result for [Custom Action - getUserSessionID] action in Add_button widget.
  String? userSession1;
  // Model for Mobile component.
  late MobileModel mobileModel;
  // Model for webNavHorizontal component.
  late WebNavHorizontalModel webNavHorizontalModel;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    webNavTranslateSubmenuModel =
        createModel(context, () => WebNavTranslateSubmenuModel());
    addButtonModel = createModel(context, () => AddButtonModel());
    mobileModel = createModel(context, () => MobileModel());
    webNavHorizontalModel = createModel(context, () => WebNavHorizontalModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    webNavTranslateSubmenuModel.dispose();
    inputFocusNode1?.dispose();
    inputTextController1?.dispose();

    inputFocusNode2?.dispose();
    inputTextController2?.dispose();

    inputFocusNode3?.dispose();
    inputTextController3?.dispose();

    inputFocusNode4?.dispose();
    inputTextController4?.dispose();

    inputFocusNode5?.dispose();
    inputTextController5?.dispose();

    addButtonModel.dispose();
    mobileModel.dispose();
    webNavHorizontalModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
