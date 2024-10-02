import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/components/web_nav_horizontal/web_nav_horizontal_widget.dart';
import '/components/web_nav_translate_submenu/web_nav_translate_submenu_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'translation_setting_f_o_r_m_widget.dart'
    show TranslationSettingFORMWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TranslationSettingFORMModel
    extends FlutterFlowModel<TranslationSettingFORMWidget> {
  ///  Local state fields for this page.

  bool textpopupstatus = true;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
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
  // Model for Add_button component.
  late AddButtonModel addButtonModel1;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Add_button widget.
  String? userIP1;
  // Stores action output result for [Custom Action - getUserSessionID] action in Add_button widget.
  String? userSession1;
  // State field(s) for input widget.
  FocusNode? inputFocusNode10;
  TextEditingController? inputTextController10;
  String? Function(BuildContext, String?)? inputTextController10Validator;
  // State field(s) for inputAddressEN widget.
  FocusNode? inputAddressENFocusNode;
  TextEditingController? inputAddressENTextController;
  String? Function(BuildContext, String?)?
      inputAddressENTextControllerValidator;
  // State field(s) for inputAddressAR widget.
  FocusNode? inputAddressARFocusNode;
  TextEditingController? inputAddressARTextController;
  String? Function(BuildContext, String?)?
      inputAddressARTextControllerValidator;
  // Model for Add_button component.
  late AddButtonModel addButtonModel2;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Add_button widget.
  String? userIP3;
  // Stores action output result for [Custom Action - getUserSessionID] action in Add_button widget.
  String? userSession3;
  // State field(s) for input widget.
  FocusNode? inputFocusNode11;
  TextEditingController? inputTextController11;
  String? Function(BuildContext, String?)? inputTextController11Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode12;
  TextEditingController? inputTextController12;
  String? Function(BuildContext, String?)? inputTextController12Validator;
  // State field(s) for inputHSen widget.
  FocusNode? inputHSenFocusNode;
  TextEditingController? inputHSenTextController;
  String? Function(BuildContext, String?)? inputHSenTextControllerValidator;
  // State field(s) for inputHSar widget.
  FocusNode? inputHSarFocusNode;
  TextEditingController? inputHSarTextController;
  String? Function(BuildContext, String?)? inputHSarTextControllerValidator;
  // State field(s) for inputHSsen widget.
  FocusNode? inputHSsenFocusNode;
  TextEditingController? inputHSsenTextController;
  String? Function(BuildContext, String?)? inputHSsenTextControllerValidator;
  // State field(s) for inputHSsar widget.
  FocusNode? inputHSsarFocusNode;
  TextEditingController? inputHSsarTextController;
  String? Function(BuildContext, String?)? inputHSsarTextControllerValidator;
  // Model for Add_button component.
  late AddButtonModel addButtonModel3;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Add_button widget.
  String? userIP4;
  // Stores action output result for [Custom Action - getUserSessionID] action in Add_button widget.
  String? userSession4;
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
  // Model for Add_button component.
  late AddButtonModel addButtonModel4;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Add_button widget.
  String? userIP2;
  // Stores action output result for [Custom Action - getUserSessionID] action in Add_button widget.
  String? userSession2;
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
    addButtonModel1 = createModel(context, () => AddButtonModel());
    addButtonModel2 = createModel(context, () => AddButtonModel());
    addButtonModel3 = createModel(context, () => AddButtonModel());
    addButtonModel4 = createModel(context, () => AddButtonModel());
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

    addButtonModel1.dispose();
    inputFocusNode10?.dispose();
    inputTextController10?.dispose();

    inputAddressENFocusNode?.dispose();
    inputAddressENTextController?.dispose();

    inputAddressARFocusNode?.dispose();
    inputAddressARTextController?.dispose();

    addButtonModel2.dispose();
    inputFocusNode11?.dispose();
    inputTextController11?.dispose();

    inputFocusNode12?.dispose();
    inputTextController12?.dispose();

    inputHSenFocusNode?.dispose();
    inputHSenTextController?.dispose();

    inputHSarFocusNode?.dispose();
    inputHSarTextController?.dispose();

    inputHSsenFocusNode?.dispose();
    inputHSsenTextController?.dispose();

    inputHSsarFocusNode?.dispose();
    inputHSsarTextController?.dispose();

    addButtonModel3.dispose();
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

    addButtonModel4.dispose();
    mobileModel.dispose();
    webNavHorizontalModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
