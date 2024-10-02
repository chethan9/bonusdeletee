import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/remove/remove_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'batch_add_widget.dart' show BatchAddWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BatchAddModel extends FlutterFlowModel<BatchAddWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode1;
  TextEditingController? yourEmailTextController1;
  String? Function(BuildContext, String?)? yourEmailTextController1Validator;
  String? _yourEmailTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6eziri4e' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for BookingLimit widget.
  FocusNode? bookingLimitFocusNode;
  TextEditingController? bookingLimitTextController;
  String? Function(BuildContext, String?)? bookingLimitTextControllerValidator;
  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode2;
  TextEditingController? yourEmailTextController2;
  String? Function(BuildContext, String?)? yourEmailTextController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Add_button widget.
  String? userIP1;
  // Stores action output result for [Custom Action - getUserSessionID] action in Add_button widget.
  String? userSession1;
  // Stores action output result for [Backend Call - Create Document] action in Add_button widget.
  BatchesRecord? newBatchRef1;
  // Stores action output result for [Backend Call - Create Document] action in Add_button widget.
  BatchesRecord? newBatchRef2;

  @override
  void initState(BuildContext context) {
    yourEmailTextController1Validator = _yourEmailTextController1Validator;
    addButtonModel = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    yourEmailFocusNode1?.dispose();
    yourEmailTextController1?.dispose();

    bookingLimitFocusNode?.dispose();
    bookingLimitTextController?.dispose();

    yourEmailFocusNode2?.dispose();
    yourEmailTextController2?.dispose();

    addButtonModel.dispose();
  }
}
