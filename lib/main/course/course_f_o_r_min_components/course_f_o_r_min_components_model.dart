import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/bonus_admin/batch/batch_change_batch_single_course_present_info/batch_change_batch_single_course_present_info_widget.dart';
import '/bonus_admin/batch/batch_password_single_course/batch_password_single_course_widget.dart';
import '/bonus_admin/media/video_list_for_selection/video_list_for_selection_widget.dart';
import '/bonus_admin/media/video_preview_title/video_preview_title_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/change_branch/change_branch_widget.dart';
import '/components/remove/remove_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'course_f_o_r_min_components_widget.dart'
    show CourseFORMinComponentsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CourseFORMinComponentsModel
    extends FlutterFlowModel<CourseFORMinComponentsWidget> {
  ///  Local state fields for this component.

  String countryLevelSet = 'unset';

  String universityLevelSet = 'unset';

  String categoryLevelSet = 'unset';

  String branchLevelSet = 'unset';

  String cName = '';

  String uName = '';

  String ccName = '';

  String bName = '';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
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
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  CountryRecord? countryRslt1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  CountryRecord? countryRslt;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  UniversityRecord? universityRslt1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  UniversityRecord? universityRslt;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  CategoryRecord? categoryRslt1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  CategoryRecord? categoryRslt;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  BranchRecord? branchRslt1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  BranchRecord? branchRslt;
  // Model for changeBranch component.
  late ChangeBranchModel changeBranchModel;
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
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
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
  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;
  // State field(s) for DropDown widget.
  String? dropDownValue6;
  FormFieldController<String>? dropDownValueController6;
  // State field(s) for DropDown widget.
  String? dropDownValue7;
  FormFieldController<String>? dropDownValueController7;
  // State field(s) for DropDown widget.
  String? dropDownValue8;
  FormFieldController<String>? dropDownValueController8;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (OTP and PBI)] action in preview widget.
  ApiCallResponse? apiResultffl;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in preview widget.
  ApiCallResponse? apiResultff12;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Add_button widget.
  String? userIP1;
  // Stores action output result for [Custom Action - getUserSessionID] action in Add_button widget.
  String? userSession1;

  @override
  void initState(BuildContext context) {
    changeBranchModel = createModel(context, () => ChangeBranchModel());
    addButtonModel = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    inputFocusNode1?.dispose();
    inputTextController1?.dispose();

    inputFocusNode2?.dispose();
    inputTextController2?.dispose();

    inputFocusNode3?.dispose();
    inputTextController3?.dispose();

    changeBranchModel.dispose();
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

    addButtonModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
