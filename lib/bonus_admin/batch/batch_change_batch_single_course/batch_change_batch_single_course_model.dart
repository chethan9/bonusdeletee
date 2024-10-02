import '/backend/backend.dart';
import '/bonus_admin/batch/batch_change_batch_status_subscriber/batch_change_batch_status_subscriber_widget.dart';
import '/bonus_admin/batch/batch_course_process_chapter_lock/batch_course_process_chapter_lock_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'batch_change_batch_single_course_widget.dart'
    show BatchChangeBatchSingleCourseWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BatchChangeBatchSingleCourseModel
    extends FlutterFlowModel<BatchChangeBatchSingleCourseWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Mobile component.
  late MobileModel mobileModel;

  @override
  void initState(BuildContext context) {
    mobileModel = createModel(context, () => MobileModel());
  }

  @override
  void dispose() {
    mobileModel.dispose();
  }
}
