import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bonus_admin/batch/batch_course_creat_time_batch_list/batch_course_creat_time_batch_list_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/remove_message/remove_message_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/components/web_nav_course_submenu/web_nav_course_submenu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/course/create_course/create_course_widget.dart';
import 'course_widget.dart' show CourseWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CourseModel extends FlutterFlowModel<CourseWidget> {
  ///  Local state fields for this page.

  String courseState = 'Published';

  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for webNavCourseSubmenu component.
  late WebNavCourseSubmenuModel webNavCourseSubmenuModel;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  BatchesRecord? batchRslt1;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CountryRecord? cR1;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  UniversityRecord? uR1;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CategoryRecord? ccR1;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  BranchRecord? bR1;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  BatchesRecord? batchRslt2;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CountryRecord? cR2;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  UniversityRecord? uR2;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CategoryRecord? ccR2;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  BranchRecord? bR2;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  BatchesRecord? batchRslt3;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CountryRecord? cR3;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  UniversityRecord? uR3;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CategoryRecord? ccR3;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  BranchRecord? bR3;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  BatchesRecord? batchRslt4;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CountryRecord? cR4;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  UniversityRecord? uR4;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CategoryRecord? ccR4;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CategoryRecord? bR4;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  BatchesRecord? batchRslt5;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CountryRecord? cR5;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  UniversityRecord? uR5;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CategoryRecord? ccR5;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  BranchRecord? bR5;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  BatchesRecord? batchRslt6;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CountryRecord? cR6;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  UniversityRecord? uR6;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  CategoryRecord? ccR6;
  // Stores action output result for [Backend Call - Read Document] action in course_grid widget.
  BranchRecord? bR6;
  // Model for Mobile component.
  late MobileModel mobileModel;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    webNavCourseSubmenuModel =
        createModel(context, () => WebNavCourseSubmenuModel());
    addButtonModel = createModel(context, () => AddButtonModel());
    mobileModel = createModel(context, () => MobileModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    webNavCourseSubmenuModel.dispose();
    addButtonModel.dispose();
    mobileModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
