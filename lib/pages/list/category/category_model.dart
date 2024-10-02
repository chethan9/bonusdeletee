import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/create_list/create_list_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/course/delete_confirmation/delete_confirmation_widget.dart';
import 'category_widget.dart' show CategoryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CategoryModel extends FlutterFlowModel<CategoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for Add_button component.
  late AddButtonModel addButtonModel1;
  // Model for Mobile component.
  late MobileModel mobileModel;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    addButtonModel1 = createModel(context, () => AddButtonModel());
    mobileModel = createModel(context, () => MobileModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    addButtonModel1.dispose();
    mobileModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
