import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'batch_course_creat_time_popup_widget.dart'
    show BatchCourseCreatTimePopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BatchCourseCreatTimePopupModel
    extends FlutterFlowModel<BatchCourseCreatTimePopupWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Add_button widget.
  BatchesRecord? batchExistsCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Add_button widget.
  BatchesRecord? batchExistsCount2;
  // Stores action output result for [Backend Call - Read Document] action in Add_button widget.
  BatchesRecord? batchRslt1;

  @override
  void initState(BuildContext context) {
    addButtonModel = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    addButtonModel.dispose();
  }
}
