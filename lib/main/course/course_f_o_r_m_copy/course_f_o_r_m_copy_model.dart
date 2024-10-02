import '/backend/backend.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/components/web_nav_horizontal/web_nav_horizontal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/course/course_f_o_r_min_components/course_f_o_r_min_components_widget.dart';
import 'course_f_o_r_m_copy_widget.dart' show CourseFORMCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CourseFORMCopyModel extends FlutterFlowModel<CourseFORMCopyWidget> {
  ///  Local state fields for this page.

  String countryName = '';

  String universityName = '';

  String categoryName = '';

  String branchName = '';

  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for CourseFORMinComponents component.
  late CourseFORMinComponentsModel courseFORMinComponentsModel;
  // Model for Mobile component.
  late MobileModel mobileModel;
  // Model for webNavHorizontal component.
  late WebNavHorizontalModel webNavHorizontalModel;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    courseFORMinComponentsModel =
        createModel(context, () => CourseFORMinComponentsModel());
    mobileModel = createModel(context, () => MobileModel());
    webNavHorizontalModel = createModel(context, () => WebNavHorizontalModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    courseFORMinComponentsModel.dispose();
    mobileModel.dispose();
    webNavHorizontalModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
