import '/backend/backend.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/components/web_nav_logs_submenu/web_nav_logs_submenu_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'log_e_m_i_notification_widget.dart' show LogEMINotificationWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LogEMINotificationModel
    extends FlutterFlowModel<LogEMINotificationWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for webNavLogsSubmenu component.
  late WebNavLogsSubmenuModel webNavLogsSubmenuModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<AlertSubscriberRecord>();
  // Model for Mobile component.
  late MobileModel mobileModel;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    webNavLogsSubmenuModel =
        createModel(context, () => WebNavLogsSubmenuModel());
    mobileModel = createModel(context, () => MobileModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    webNavLogsSubmenuModel.dispose();
    paginatedDataTableController.dispose();
    mobileModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
