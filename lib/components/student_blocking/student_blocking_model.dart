import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'student_blocking_widget.dart' show StudentBlockingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudentBlockingModel extends FlutterFlowModel<StudentBlockingWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for reason widget.
  FocusNode? reasonFocusNode;
  TextEditingController? reasonTextController;
  String? Function(BuildContext, String?)? reasonTextControllerValidator;
  String? _reasonTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '58er5jul' /* Field is required */,
      );
    }

    if (val.length < 15) {
      return 'Requires at least 15 characters.';
    }

    return null;
  }

  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Backend Call - Read Document] action in Add_button widget.
  UsersRecord? userRslt1;

  @override
  void initState(BuildContext context) {
    reasonTextControllerValidator = _reasonTextControllerValidator;
    addButtonModel = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    reasonFocusNode?.dispose();
    reasonTextController?.dispose();

    addButtonModel.dispose();
  }
}
