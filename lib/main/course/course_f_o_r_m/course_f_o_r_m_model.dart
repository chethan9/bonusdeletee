import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/bonus_admin/batch/batch_change_batch_single_course_present_info/batch_change_batch_single_course_present_info_widget.dart';
import '/bonus_admin/batch/batch_password_single_course/batch_password_single_course_widget.dart';
import '/bonus_admin/media/video_list_for_selection/video_list_for_selection_widget.dart';
import '/bonus_admin/media/video_preview_title/video_preview_title_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/change_branch/change_branch_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/remove/remove_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/components/web_nav_horizontal/web_nav_horizontal_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'course_f_o_r_m_widget.dart' show CourseFORMWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CourseFORMModel extends FlutterFlowModel<CourseFORMWidget> {
  ///  Local state fields for this page.

  String countryName = '';

  String universityName = '';

  String categoryName = '';

  String branchName = '';

  DocumentReference? authrRef;

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
        'r4rl4s8y' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for input widget.
  FocusNode? inputFocusNode2;
  TextEditingController? inputTextController2;
  String? Function(BuildContext, String?)? inputTextController2Validator;
  // State field(s) for co widget.
  String? coValue;
  FormFieldController<String>? coValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in co widget.
  CountryRecord? countryRslt;
  // State field(s) for un widget.
  String? unValue;
  FormFieldController<String>? unValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in un widget.
  UniversityRecord? universityRslt;
  // State field(s) for ca widget.
  String? caValue;
  FormFieldController<String>? caValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in ca widget.
  CategoryRecord? categoryRslt;
  // State field(s) for br widget.
  String? brValue;
  FormFieldController<String>? brValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in br widget.
  BranchRecord? branchRslt;
  // Model for changeBranch component.
  late ChangeBranchModel changeBranchModel;
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
  // State field(s) for RadioButtonPaymentType widget.
  FormFieldController<String>? radioButtonPaymentTypeValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for fp widget.
  FocusNode? fpFocusNode;
  TextEditingController? fpTextController;
  String? Function(BuildContext, String?)? fpTextControllerValidator;
  String? _fpTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'q5n7ms31' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for input widget.
  FocusNode? inputFocusNode9;
  TextEditingController? inputTextController9;
  String? Function(BuildContext, String?)? inputTextController9Validator;
  String? _inputTextController9Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oyxdtlr9' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for input widget.
  FocusNode? inputFocusNode10;
  TextEditingController? inputTextController10;
  String? Function(BuildContext, String?)? inputTextController10Validator;
  String? _inputTextController10Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ypje2020' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for input widget.
  FocusNode? inputFocusNode11;
  TextEditingController? inputTextController11;
  String? Function(BuildContext, String?)? inputTextController11Validator;
  String? _inputTextController11Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'x8e4deoe' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for input widget.
  FocusNode? inputFocusNode12;
  TextEditingController? inputTextController12;
  String? Function(BuildContext, String?)? inputTextController12Validator;
  // State field(s) for DropDownInstructor widget.
  String? dropDownInstructorValue;
  FormFieldController<String>? dropDownInstructorValueController;
  List<UsersRecord>? dropDownInstructorPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDownInstructor widget.
  UsersRecord? autherRef12;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDownInstructor widget.
  UsersRecord? autherRef1;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDownBatches widget.
  String? dropDownBatchesValue;
  FormFieldController<String>? dropDownBatchesValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (OTP and PBI)] action in preview widget.
  ApiCallResponse? apiResultffl;
  // Stores action output result for [Backend Call - API (OTP and PBI)] action in preview widget.
  ApiCallResponse? apiResultff12;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FolderRecord? mainFolderResult1;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Backend Call - Read Document] action in Add_button widget.
  UsersRecord? cursAuthRef1;
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
    inputTextController1Validator = _inputTextController1Validator;
    changeBranchModel = createModel(context, () => ChangeBranchModel());
    fpTextControllerValidator = _fpTextControllerValidator;
    inputTextController9Validator = _inputTextController9Validator;
    inputTextController10Validator = _inputTextController10Validator;
    inputTextController11Validator = _inputTextController11Validator;
    addButtonModel = createModel(context, () => AddButtonModel());
    mobileModel = createModel(context, () => MobileModel());
    webNavHorizontalModel = createModel(context, () => WebNavHorizontalModel());
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

    changeBranchModel.dispose();
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

    fpFocusNode?.dispose();
    fpTextController?.dispose();

    inputFocusNode9?.dispose();
    inputTextController9?.dispose();

    inputFocusNode10?.dispose();
    inputTextController10?.dispose();

    inputFocusNode11?.dispose();
    inputTextController11?.dispose();

    inputFocusNode12?.dispose();
    inputTextController12?.dispose();

    addButtonModel.dispose();
    mobileModel.dispose();
    webNavHorizontalModel.dispose();
    initialUserStatusCheckModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonPaymentTypeValue =>
      radioButtonPaymentTypeValueController?.value;
  String? get radioButtonValue => radioButtonValueController?.value;
}
