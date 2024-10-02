import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/bonus_admin/batch/batch_course_creat_time_batch_list/batch_course_creat_time_batch_list_widget.dart';
import '/bonus_admin/media/video_list_for_selection/video_list_for_selection_widget.dart';
import '/bonus_admin/media/video_preview_title/video_preview_title_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/change_branch/change_branch_widget.dart';
import '/components/change_category/change_category_widget.dart';
import '/components/change_country/change_country_widget.dart';
import '/components/change_university/change_university_widget.dart';
import '/components/remove/remove_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_course_widget.dart' show CreateCourseWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateCourseModel extends FlutterFlowModel<CreateCourseWidget> {
  ///  Local state fields for this component.

  String countryLevelSet = 'unset';

  String universityLevelSet = 'unset';

  String categoryLevelSet = 'unset';

  String branchLevelSet = 'unset';

  DocumentReference? authrRef;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (OTP and PBI)] action in preview widget.
  ApiCallResponse? apiResultff12;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FolderRecord? mainFolderResult1;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7if3i9k3' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Subtitle widget.
  FocusNode? subtitleFocusNode;
  TextEditingController? subtitleTextController;
  String? Function(BuildContext, String?)? subtitleTextControllerValidator;
  // State field(s) for DropDownInstructor widget.
  String? dropDownInstructorValue;
  FormFieldController<String>? dropDownInstructorValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDownInstructor widget.
  UsersRecord? autherRef1;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  CountryRecord? countryRslt1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  CountryRecord? countryRslt;
  // Model for changeCountry component.
  late ChangeCountryModel changeCountryModel;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  UniversityRecord? universityRslt1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  UniversityRecord? universityRslt;
  // Model for changeUniversity component.
  late ChangeUniversityModel changeUniversityModel;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  CategoryRecord? categoryRslt1new;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  CategoryRecord? categoryRslt;
  // Model for changeCategory component.
  late ChangeCategoryModel changeCategoryModel;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  BranchRecord? branchRslt1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  BranchRecord? branchRslt;
  // Model for changeBranch component.
  late ChangeBranchModel changeBranchModel;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for whatyouwilllearn widget.
  FocusNode? whatyouwilllearnFocusNode1;
  TextEditingController? whatyouwilllearnTextController1;
  String? Function(BuildContext, String?)?
      whatyouwilllearnTextController1Validator;
  // State field(s) for whatyouwilllearn widget.
  FocusNode? whatyouwilllearnFocusNode2;
  TextEditingController? whatyouwilllearnTextController2;
  String? Function(BuildContext, String?)?
      whatyouwilllearnTextController2Validator;
  // State field(s) for input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;
  // State field(s) for TotalNumberofLesson widget.
  FocusNode? totalNumberofLessonFocusNode;
  TextEditingController? totalNumberofLessonTextController;
  String? Function(BuildContext, String?)?
      totalNumberofLessonTextControllerValidator;
  // State field(s) for BookingLimit widget.
  FocusNode? bookingLimitFocusNode;
  TextEditingController? bookingLimitTextController;
  String? Function(BuildContext, String?)? bookingLimitTextControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // State field(s) for Price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  String? _priceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wx34jl0b' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for firstEMIPrice widget.
  FocusNode? firstEMIPriceFocusNode;
  TextEditingController? firstEMIPriceTextController;
  String? Function(BuildContext, String?)? firstEMIPriceTextControllerValidator;
  String? _firstEMIPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ymw1dws8' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for secondEMIPrice widget.
  FocusNode? secondEMIPriceFocusNode;
  TextEditingController? secondEMIPriceTextController;
  String? Function(BuildContext, String?)?
      secondEMIPriceTextControllerValidator;
  String? _secondEMIPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't3flkv7r' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for thirdEMIPrice widget.
  FocusNode? thirdEMIPriceFocusNode;
  TextEditingController? thirdEMIPriceTextController;
  String? Function(BuildContext, String?)? thirdEMIPriceTextControllerValidator;
  String? _thirdEMIPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'quk4l8zz' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for WhatsappGroupLink widget.
  FocusNode? whatsappGroupLinkFocusNode;
  TextEditingController? whatsappGroupLinkTextController;
  String? Function(BuildContext, String?)?
      whatsappGroupLinkTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;
  // State field(s) for DropDown widget.
  String? dropDownValue6;
  FormFieldController<String>? dropDownValueController6;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Add_button widget.
  SettingsRecord? settingRslt1;
  // Stores action output result for [Backend Call - Create Document] action in Add_button widget.
  CourseRecord? courseNewRef;
  // Stores action output result for [Custom Action - getUserIPaddress] action in Add_button widget.
  String? userIP1;
  // Stores action output result for [Custom Action - getUserSessionID] action in Add_button widget.
  String? userSession1;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    changeCountryModel = createModel(context, () => ChangeCountryModel());
    changeUniversityModel = createModel(context, () => ChangeUniversityModel());
    changeCategoryModel = createModel(context, () => ChangeCategoryModel());
    changeBranchModel = createModel(context, () => ChangeBranchModel());
    priceTextControllerValidator = _priceTextControllerValidator;
    firstEMIPriceTextControllerValidator =
        _firstEMIPriceTextControllerValidator;
    secondEMIPriceTextControllerValidator =
        _secondEMIPriceTextControllerValidator;
    thirdEMIPriceTextControllerValidator =
        _thirdEMIPriceTextControllerValidator;
    addButtonModel = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    subtitleFocusNode?.dispose();
    subtitleTextController?.dispose();

    changeCountryModel.dispose();
    changeUniversityModel.dispose();
    changeCategoryModel.dispose();
    changeBranchModel.dispose();
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    whatyouwilllearnFocusNode1?.dispose();
    whatyouwilllearnTextController1?.dispose();

    whatyouwilllearnFocusNode2?.dispose();
    whatyouwilllearnTextController2?.dispose();

    inputFocusNode?.dispose();
    inputTextController?.dispose();

    totalNumberofLessonFocusNode?.dispose();
    totalNumberofLessonTextController?.dispose();

    bookingLimitFocusNode?.dispose();
    bookingLimitTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    firstEMIPriceFocusNode?.dispose();
    firstEMIPriceTextController?.dispose();

    secondEMIPriceFocusNode?.dispose();
    secondEMIPriceTextController?.dispose();

    thirdEMIPriceFocusNode?.dispose();
    thirdEMIPriceTextController?.dispose();

    whatsappGroupLinkFocusNode?.dispose();
    whatsappGroupLinkTextController?.dispose();

    addButtonModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
}
