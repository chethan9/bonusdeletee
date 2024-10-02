import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'coupon_add_widget.dart' show CouponAddWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CouponAddModel extends FlutterFlowModel<CouponAddWidget> {
  ///  Local state fields for this component.

  String componentLevelRefresh = 'No';

  List<DocumentReference> selectedCourseRefList = [];
  void addToSelectedCourseRefList(DocumentReference item) =>
      selectedCourseRefList.add(item);
  void removeFromSelectedCourseRefList(DocumentReference item) =>
      selectedCourseRefList.remove(item);
  void removeAtIndexFromSelectedCourseRefList(int index) =>
      selectedCourseRefList.removeAt(index);
  void insertAtIndexInSelectedCourseRefList(
          int index, DocumentReference item) =>
      selectedCourseRefList.insert(index, item);
  void updateSelectedCourseRefListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedCourseRefList[index] = updateFn(selectedCourseRefList[index]);

  String listLevelShow = 'Pending';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode1;
  TextEditingController? yourEmailTextController1;
  String? Function(BuildContext, String?)? yourEmailTextController1Validator;
  String? _yourEmailTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9r6z44d3' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode2;
  TextEditingController? yourEmailTextController2;
  String? Function(BuildContext, String?)? yourEmailTextController2Validator;
  String? _yourEmailTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pej7jnmr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode3;
  TextEditingController? yourEmailTextController3;
  String? Function(BuildContext, String?)? yourEmailTextController3Validator;
  String? _yourEmailTextController3Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'q3qrswxz' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode4;
  TextEditingController? yourEmailTextController4;
  String? Function(BuildContext, String?)? yourEmailTextController4Validator;
  String? _yourEmailTextController4Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1fgymag9' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode5;
  TextEditingController? yourEmailTextController5;
  String? Function(BuildContext, String?)? yourEmailTextController5Validator;
  String? _yourEmailTextController5Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e0eoq6qk' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  List<CourseRecord> simpleSearchResults = [];
  // State field(s) for CheckboxListTile widget.
  Map<CourseRecord, bool> checkboxListTileValueMap1 = {};
  List<CourseRecord> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for CheckboxListTile widget.
  Map<CourseRecord, bool> checkboxListTileValueMap2 = {};
  List<CourseRecord> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Backend Call - Create Document] action in Add_button widget.
  CouponRecord? couponResult1;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Add_button widget.
  String? userIP1;
  // Stores action output result for [Custom Action - getUserSessionID] action in Add_button widget.
  String? userSession1;

  @override
  void initState(BuildContext context) {
    yourEmailTextController1Validator = _yourEmailTextController1Validator;
    yourEmailTextController2Validator = _yourEmailTextController2Validator;
    yourEmailTextController3Validator = _yourEmailTextController3Validator;
    yourEmailTextController4Validator = _yourEmailTextController4Validator;
    yourEmailTextController5Validator = _yourEmailTextController5Validator;
    addButtonModel = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    yourEmailFocusNode1?.dispose();
    yourEmailTextController1?.dispose();

    yourEmailFocusNode2?.dispose();
    yourEmailTextController2?.dispose();

    yourEmailFocusNode3?.dispose();
    yourEmailTextController3?.dispose();

    yourEmailFocusNode4?.dispose();
    yourEmailTextController4?.dispose();

    yourEmailFocusNode5?.dispose();
    yourEmailTextController5?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();

    addButtonModel.dispose();
  }
}
