import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/remove/remove_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'branch_f_o_r_m_widget.dart' show BranchFORMWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BranchFORMModel extends FlutterFlowModel<BranchFORMWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;
  String? _inputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'oztn0fex' /* Field is required */,
      );
    }

    return null;
  }

  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Add_button widget.
  String? userIP1;
  // Stores action output result for [Custom Action - getUserSessionID] action in Add_button widget.
  String? userSession1;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for Mobile component.
  late MobileModel mobileModel;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    inputTextControllerValidator = _inputTextControllerValidator;
    addButtonModel = createModel(context, () => AddButtonModel());
    mobileModel = createModel(context, () => MobileModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    inputFocusNode?.dispose();
    inputTextController?.dispose();

    addButtonModel.dispose();
    mobileModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
