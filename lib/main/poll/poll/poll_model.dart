import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/delete_message_1/delete_message1_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/components/web_nav_course_submenu/web_nav_course_submenu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/poll/create_poll/create_poll_widget.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'poll_widget.dart' show PollWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PollModel extends FlutterFlowModel<PollWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for webNavCourseSubmenu component.
  late WebNavCourseSubmenuModel webNavCourseSubmenuModel;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
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
