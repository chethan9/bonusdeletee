import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/change_branch/change_branch_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/remove/remove_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'course_category_f_o_r_m_widget.dart' show CourseCategoryFORMWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CourseCategoryFORMModel
    extends FlutterFlowModel<CourseCategoryFORMWidget> {
  ///  Local state fields for this page.

  int? initialValue = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for webNav component.
  late WebNavModel webNavModel;
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
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;
  String? _inputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kjtqggay' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for CheckboxListTile widget.
  Map<CourseRecord, bool> checkboxListTileValueMap = {};
  List<CourseRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for Add_button component.
  late AddButtonModel addButtonModel;
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
    changeBranchModel = createModel(context, () => ChangeBranchModel());
    inputTextControllerValidator = _inputTextControllerValidator;
    addButtonModel = createModel(context, () => AddButtonModel());
    mobileModel = createModel(context, () => MobileModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    changeBranchModel.dispose();
    inputFocusNode?.dispose();
    inputTextController?.dispose();

    addButtonModel.dispose();
    mobileModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
