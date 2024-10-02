import '/auth/firebase_auth/auth_util.dart';
import '/components/mobile/mobile_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'onboard_phone_widget.dart' show OnboardPhoneWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardPhoneModel extends FlutterFlowModel<OnboardPhoneWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for phone_field widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldTextController;
  String? Function(BuildContext, String?)? phoneFieldTextControllerValidator;
  // Model for Mobile component.
  late MobileModel mobileModel;

  @override
  void initState(BuildContext context) {
    mobileModel = createModel(context, () => MobileModel());
  }

  @override
  void dispose() {
    phoneFieldFocusNode?.dispose();
    phoneFieldTextController?.dispose();

    mobileModel.dispose();
  }
}
