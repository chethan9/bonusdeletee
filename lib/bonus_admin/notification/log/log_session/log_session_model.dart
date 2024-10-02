import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/components/web_nav_logs_submenu/web_nav_logs_submenu_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/course/session_log_details/session_log_details_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'log_session_widget.dart' show LogSessionWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LogSessionModel extends FlutterFlowModel<LogSessionWidget> {
  ///  Local state fields for this page.

  String sessionFliterShow = 'pending';

  DateTime? fromDate;

  DateTime? toDate;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for webNavLogsSubmenu component.
  late WebNavLogsSubmenuModel webNavLogsSubmenuModel;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Model for Add_button component.
  late AddButtonModel addButtonModel1;
  // Model for Add_button component.
  late AddButtonModel addButtonModel2;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<SessionsRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<SessionsRecord>();
  // Model for Mobile component.
  late MobileModel mobileModel;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    webNavLogsSubmenuModel =
        createModel(context, () => WebNavLogsSubmenuModel());
    addButtonModel1 = createModel(context, () => AddButtonModel());
    addButtonModel2 = createModel(context, () => AddButtonModel());
    mobileModel = createModel(context, () => MobileModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    webNavLogsSubmenuModel.dispose();
    addButtonModel1.dispose();
    addButtonModel2.dispose();
    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
    mobileModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
