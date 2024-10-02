import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/bonus_admin/media/video_attached_info/video_attached_info_widget.dart';
import '/bonus_admin/media/video_remove_popup/video_remove_popup_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/components/web_nav_horizontal/web_nav_horizontal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'video_editor_widget.dart' show VideoEditorWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class VideoEditorModel extends FlutterFlowModel<VideoEditorWidget> {
  ///  Local state fields for this page.

  String image = 'false';

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
        '9e1q7kfg' /* Field is required */,
      );
    }

    return null;
  }

  // Model for Add_button component.
  late AddButtonModel addButtonModel1;
  // Stores action output result for [Backend Call - API (Download Link)] action in Add_button widget.
  ApiCallResponse? apiResult8hp;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for input widget.
  FocusNode? inputFocusNode2;
  TextEditingController? inputTextController2;
  String? Function(BuildContext, String?)? inputTextController2Validator;
  // Model for Add_button component.
  late AddButtonModel addButtonModel2;
  // Stores action output result for [Firestore Query - Query a collection] action in Add_button widget.
  List<CourseRecord>? productRslt1;
  // Stores action output result for [Firestore Query - Query a collection] action in Add_button widget.
  List<LessonsRecord>? productListrslt1;
  // Stores action output result for [Backend Call - API (Change Title)] action in Button widget.
  ApiCallResponse? apiResult9el;
  // Stores action output result for [Backend Call - API (Change Feature Image)] action in Button widget.
  ApiCallResponse? apiResultu77;
  // Stores action output result for [Backend Call - API (Check Video Status)] action in Button widget.
  ApiCallResponse? apiResultf9c;
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
    addButtonModel1 = createModel(context, () => AddButtonModel());
    addButtonModel2 = createModel(context, () => AddButtonModel());
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

    addButtonModel1.dispose();
    inputFocusNode2?.dispose();
    inputTextController2?.dispose();

    addButtonModel2.dispose();
    mobileModel.dispose();
    webNavHorizontalModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
