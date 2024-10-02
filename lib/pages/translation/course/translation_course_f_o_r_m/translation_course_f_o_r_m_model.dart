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
import 'translation_course_f_o_r_m_widget.dart'
    show TranslationCourseFORMWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TranslationCourseFORMModel
    extends FlutterFlowModel<TranslationCourseFORMWidget> {
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
  // State field(s) for input widget.
  FocusNode? inputFocusNode6;
  TextEditingController? inputTextController6;
  String? Function(BuildContext, String?)? inputTextController6Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode7;
  TextEditingController? inputTextController7;
  String? Function(BuildContext, String?)? inputTextController7Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode8;
  TextEditingController? inputTextController8;
  String? Function(BuildContext, String?)? inputTextController8Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode9;
  TextEditingController? inputTextController9;
  String? Function(BuildContext, String?)? inputTextController9Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode10;
  TextEditingController? inputTextController10;
  String? Function(BuildContext, String?)? inputTextController10Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode11;
  TextEditingController? inputTextController11;
  String? Function(BuildContext, String?)? inputTextController11Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode12;
  TextEditingController? inputTextController12;
  String? Function(BuildContext, String?)? inputTextController12Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode13;
  TextEditingController? inputTextController13;
  String? Function(BuildContext, String?)? inputTextController13Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode14;
  TextEditingController? inputTextController14;
  String? Function(BuildContext, String?)? inputTextController14Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode15;
  TextEditingController? inputTextController15;
  String? Function(BuildContext, String?)? inputTextController15Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode16;
  TextEditingController? inputTextController16;
  String? Function(BuildContext, String?)? inputTextController16Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode17;
  TextEditingController? inputTextController17;
  String? Function(BuildContext, String?)? inputTextController17Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode18;
  TextEditingController? inputTextController18;
  String? Function(BuildContext, String?)? inputTextController18Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode19;
  TextEditingController? inputTextController19;
  String? Function(BuildContext, String?)? inputTextController19Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode20;
  TextEditingController? inputTextController20;
  String? Function(BuildContext, String?)? inputTextController20Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode21;
  TextEditingController? inputTextController21;
  String? Function(BuildContext, String?)? inputTextController21Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode22;
  TextEditingController? inputTextController22;
  String? Function(BuildContext, String?)? inputTextController22Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode23;
  TextEditingController? inputTextController23;
  String? Function(BuildContext, String?)? inputTextController23Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode24;
  TextEditingController? inputTextController24;
  String? Function(BuildContext, String?)? inputTextController24Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode25;
  TextEditingController? inputTextController25;
  String? Function(BuildContext, String?)? inputTextController25Validator;
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

    inputFocusNode6?.dispose();
    inputTextController6?.dispose();

    inputFocusNode7?.dispose();
    inputTextController7?.dispose();

    inputFocusNode8?.dispose();
    inputTextController8?.dispose();

    inputFocusNode9?.dispose();
    inputTextController9?.dispose();

    inputFocusNode10?.dispose();
    inputTextController10?.dispose();

    inputFocusNode11?.dispose();
    inputTextController11?.dispose();

    inputFocusNode12?.dispose();
    inputTextController12?.dispose();

    inputFocusNode13?.dispose();
    inputTextController13?.dispose();

    inputFocusNode14?.dispose();
    inputTextController14?.dispose();

    inputFocusNode15?.dispose();
    inputTextController15?.dispose();

    inputFocusNode16?.dispose();
    inputTextController16?.dispose();

    inputFocusNode17?.dispose();
    inputTextController17?.dispose();

    inputFocusNode18?.dispose();
    inputTextController18?.dispose();

    inputFocusNode19?.dispose();
    inputTextController19?.dispose();

    inputFocusNode20?.dispose();
    inputTextController20?.dispose();

    inputFocusNode21?.dispose();
    inputTextController21?.dispose();

    inputFocusNode22?.dispose();
    inputTextController22?.dispose();

    inputFocusNode23?.dispose();
    inputTextController23?.dispose();

    inputFocusNode24?.dispose();
    inputTextController24?.dispose();

    inputFocusNode25?.dispose();
    inputTextController25?.dispose();

    addButtonModel.dispose();
    mobileModel.dispose();
    webNavHorizontalModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
