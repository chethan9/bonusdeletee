import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'manual_notification_add_widget.dart' show ManualNotificationAddWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ManualNotificationAddModel
    extends FlutterFlowModel<ManualNotificationAddWidget> {
  ///  Local state fields for this component.

  List<String> mailTemp = ['SecondEMI', 'ThirdEMI'];
  void addToMailTemp(String item) => mailTemp.add(item);
  void removeFromMailTemp(String item) => mailTemp.remove(item);
  void removeAtIndexFromMailTemp(int index) => mailTemp.removeAt(index);
  void insertAtIndexInMailTemp(int index, String item) =>
      mailTemp.insert(index, item);
  void updateMailTempAtIndex(int index, Function(String) updateFn) =>
      mailTemp[index] = updateFn(mailTemp[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CourseAS widget.
  FormFieldController<String>? courseASValueController;
  // State field(s) for SingleCourse widget.
  String? singleCourseValue;
  FormFieldController<String>? singleCourseValueController;
  // State field(s) for emi_type widget.
  FormFieldController<String>? emiTypeValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode;
  TextEditingController? yourEmailTextController;
  String? Function(BuildContext, String?)? yourEmailTextControllerValidator;
  String? _yourEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u8qenarw' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xpaablnx' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for MailDD widget.
  String? mailDDValue;
  FormFieldController<String>? mailDDValueController;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Backend Call - Create Document] action in Add_button widget.
  ManualAlertSubscriberRecord? manualAlert1;
  // Stores action output result for [Firestore Query - Query a collection] action in Add_button widget.
  CourseRecord? courseSingRslt1;
  // Stores action output result for [Firestore Query - Query a collection] action in Add_button widget.
  List<SubscriptionRecord>? subSecondRslt;
  // Stores action output result for [Firestore Query - Query a collection] action in Add_button widget.
  List<SubscriptionRecord>? subThirdRslt;
  // Stores action output result for [Backend Call - Read Document] action in Add_button widget.
  UsersRecord? userSubRslt1;
  // Stores action output result for [Backend Call - Read Document] action in Add_button widget.
  BatchesRecord? batchRsltOne;
  // Stores action output result for [Firestore Query - Query a collection] action in Add_button widget.
  List<UsersRecord>? allUserRslt1;
  // Stores action output result for [Backend Call - Read Document] action in Add_button widget.
  UsersRecord? userSubRslt2;

  @override
  void initState(BuildContext context) {
    yourEmailTextControllerValidator = _yourEmailTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    addButtonModel = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    yourEmailFocusNode?.dispose();
    yourEmailTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    addButtonModel.dispose();
  }

  /// Additional helper methods.
  String? get courseASValue => courseASValueController?.value;
  String? get emiTypeValue => emiTypeValueController?.value;
}
