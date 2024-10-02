import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/mobile/mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'sign_i_n_widget.dart' show SignINWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignINModel extends FlutterFlowModel<SignINWidget> {
  ///  Local state fields for this page.

  String googleStatus = 'Hide';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qxbo7qqi' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ytlu7he3' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Custom Action - getUserIPaddress] action in password widget.
  String? userIP1Copy;
  // Stores action output result for [Custom Action - getUserSessionID] action in password widget.
  String? userSession1Copy;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Button-Login widget.
  String? userIP1;
  // Stores action output result for [Custom Action - getUserSessionID] action in Button-Login widget.
  String? userSession1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button-Login widget.
  IdMapRecord? idMapResult1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button-Login widget.
  FolderRecord? mainFolderResult1;
  // Stores action output result for [Backend Call - Create Document] action in Button-Login widget.
  FolderRecord? newFolderResult1;
  // Model for Mobile component.
  late MobileModel mobileModel;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    mobileModel = createModel(context, () => MobileModel());
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    mobileModel.dispose();
  }
}
