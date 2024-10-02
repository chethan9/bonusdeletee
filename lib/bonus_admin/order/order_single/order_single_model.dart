import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/bonus_admin/order/order_item_history/order_item_history_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'order_single_widget.dart' show OrderSingleWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class OrderSingleModel extends FlutterFlowModel<OrderSingleWidget> {
  ///  Local state fields for this page.

  int? paymentProcess = 1;

  double? totalPrice = 0.0;

  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  BatchesRecord? batchRslt1;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  CourseRecord? courseRslt1;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  CountryRecord? cR1;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  UniversityRecord? uR1;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  CategoryRecord? ccR1;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  BranchRecord? bR1;
  // Model for Order-ItemHistory component.
  late OrderItemHistoryModel orderItemHistoryModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Add_button widget.
  SubscriptionRecord? userSubscriptionRslt1;
  // Stores action output result for [Backend Call - Create Document] action in Add_button widget.
  SubscriptionRecord? newSubscriptionResult1;
  // Stores action output result for [Backend Call - Read Document] action in Add_button widget.
  CourseRecord? courseEMIrslt1;
  // Stores action output result for [Backend Call - Read Document] action in Add_button widget.
  UsersRecord? userRsltOne;
  // Stores action output result for [Backend Call - Read Document] action in Add_button widget.
  OrdersRecord? orderRslt1;
  // Model for Mobile component.
  late MobileModel mobileModel;
  // Model for initialUserStatusCheck component.
  late InitialUserStatusCheckModel initialUserStatusCheckModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    orderItemHistoryModel = createModel(context, () => OrderItemHistoryModel());
    addButtonModel = createModel(context, () => AddButtonModel());
    mobileModel = createModel(context, () => MobileModel());
    initialUserStatusCheckModel =
        createModel(context, () => InitialUserStatusCheckModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    orderItemHistoryModel.dispose();
    addButtonModel.dispose();
    mobileModel.dispose();
    initialUserStatusCheckModel.dispose();
  }
}
