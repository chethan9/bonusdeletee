import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/delete_message_1/delete_message1_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  Local state fields for this page.

  String? navName = 'General';

  Color? mainSubmenuColor;

  Color? submenuColor;

  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for RadioButtonSocial widget.
  FormFieldController<String>? radioButtonSocialValueController;
  // State field(s) for RadioButtonPhone widget.
  FormFieldController<String>? radioButtonPhoneValueController;
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
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode4;
  TextEditingController? yourNameTextController4;
  String? Function(BuildContext, String?)? yourNameTextController4Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode5;
  TextEditingController? yourNameTextController5;
  String? Function(BuildContext, String?)? yourNameTextController5Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode6;
  TextEditingController? yourNameTextController6;
  String? Function(BuildContext, String?)? yourNameTextController6Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode7;
  TextEditingController? yourNameTextController7;
  String? Function(BuildContext, String?)? yourNameTextController7Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode8;
  TextEditingController? yourNameTextController8;
  String? Function(BuildContext, String?)? yourNameTextController8Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode9;
  TextEditingController? yourNameTextController9;
  String? Function(BuildContext, String?)? yourNameTextController9Validator;
  // State field(s) for emailRecipient widget.
  FocusNode? emailRecipientFocusNode;
  TextEditingController? emailRecipientTextController;
  String? Function(BuildContext, String?)?
      emailRecipientTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for RadioButtonWish widget.
  FormFieldController<String>? radioButtonWishValueController;
  // State field(s) for RadioButtonrecomd widget.
  FormFieldController<String>? radioButtonrecomdValueController;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode10;
  TextEditingController? yourNameTextController10;
  String? Function(BuildContext, String?)? yourNameTextController10Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode11;
  TextEditingController? yourNameTextController11;
  String? Function(BuildContext, String?)? yourNameTextController11Validator;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for RadioButtonTitleLogo widget.
  FormFieldController<String>? radioButtonTitleLogoValueController;
  // State field(s) for RadioButtonBGHide widget.
  FormFieldController<String>? radioButtonBGHideValueController;
  Color? colorPicked;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // State field(s) for RadioButtonUpcommingClas widget.
  FormFieldController<String>? radioButtonUpcommingClasValueController;
  // State field(s) for RadioButtonOfferCourse widget.
  FormFieldController<String>? radioButtonOfferCourseValueController;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode12;
  TextEditingController? yourNameTextController12;
  String? Function(BuildContext, String?)? yourNameTextController12Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode13;
  TextEditingController? yourNameTextController13;
  String? Function(BuildContext, String?)? yourNameTextController13Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode14;
  TextEditingController? yourNameTextController14;
  String? Function(BuildContext, String?)? yourNameTextController14Validator;
  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl5 = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode15;
  TextEditingController? yourNameTextController15;
  String? Function(BuildContext, String?)? yourNameTextController15Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode16;
  TextEditingController? yourNameTextController16;
  String? Function(BuildContext, String?)? yourNameTextController16Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode17;
  TextEditingController? yourNameTextController17;
  String? Function(BuildContext, String?)? yourNameTextController17Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode18;
  TextEditingController? yourNameTextController18;
  String? Function(BuildContext, String?)? yourNameTextController18Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode19;
  TextEditingController? yourNameTextController19;
  String? Function(BuildContext, String?)? yourNameTextController19Validator;
  bool isDataUploading6 = false;
  FFUploadedFile uploadedLocalFile6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl6 = '';

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
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // State field(s) for input widget.
  FocusNode? inputFocusNode4;
  TextEditingController? inputTextController4;
  String? Function(BuildContext, String?)? inputTextController4Validator;
  // Model for Mobile component.
  late MobileModel mobileModel;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    addButtonModel = createModel(context, () => AddButtonModel());
    mobileModel = createModel(context, () => MobileModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    yourNameFocusNode1?.dispose();
    yourNameTextController1?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameTextController2?.dispose();

    yourNameFocusNode3?.dispose();
    yourNameTextController3?.dispose();

    yourNameFocusNode4?.dispose();
    yourNameTextController4?.dispose();

    yourNameFocusNode5?.dispose();
    yourNameTextController5?.dispose();

    yourNameFocusNode6?.dispose();
    yourNameTextController6?.dispose();

    yourNameFocusNode7?.dispose();
    yourNameTextController7?.dispose();

    yourNameFocusNode8?.dispose();
    yourNameTextController8?.dispose();

    yourNameFocusNode9?.dispose();
    yourNameTextController9?.dispose();

    emailRecipientFocusNode?.dispose();
    emailRecipientTextController?.dispose();

    yourNameFocusNode10?.dispose();
    yourNameTextController10?.dispose();

    yourNameFocusNode11?.dispose();
    yourNameTextController11?.dispose();

    yourNameFocusNode12?.dispose();
    yourNameTextController12?.dispose();

    yourNameFocusNode13?.dispose();
    yourNameTextController13?.dispose();

    yourNameFocusNode14?.dispose();
    yourNameTextController14?.dispose();

    yourNameFocusNode15?.dispose();
    yourNameTextController15?.dispose();

    yourNameFocusNode16?.dispose();
    yourNameTextController16?.dispose();

    yourNameFocusNode17?.dispose();
    yourNameTextController17?.dispose();

    yourNameFocusNode18?.dispose();
    yourNameTextController18?.dispose();

    yourNameFocusNode19?.dispose();
    yourNameTextController19?.dispose();

    inputFocusNode1?.dispose();
    inputTextController1?.dispose();

    inputFocusNode2?.dispose();
    inputTextController2?.dispose();

    inputFocusNode3?.dispose();
    inputTextController3?.dispose();

    addButtonModel.dispose();
    inputFocusNode4?.dispose();
    inputTextController4?.dispose();

    mobileModel.dispose();
    initialUserStatusCheckModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonSocialValue => radioButtonSocialValueController?.value;
  String? get radioButtonPhoneValue => radioButtonPhoneValueController?.value;
  String? get radioButtonWishValue => radioButtonWishValueController?.value;
  String? get radioButtonrecomdValue => radioButtonrecomdValueController?.value;
  String? get radioButtonTitleLogoValue =>
      radioButtonTitleLogoValueController?.value;
  String? get radioButtonBGHideValue => radioButtonBGHideValueController?.value;
  String? get radioButtonUpcommingClasValue =>
      radioButtonUpcommingClasValueController?.value;
  String? get radioButtonOfferCourseValue =>
      radioButtonOfferCourseValueController?.value;
}
