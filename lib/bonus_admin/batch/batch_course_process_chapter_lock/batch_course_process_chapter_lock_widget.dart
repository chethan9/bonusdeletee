import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'batch_course_process_chapter_lock_model.dart';
export 'batch_course_process_chapter_lock_model.dart';

class BatchCourseProcessChapterLockWidget extends StatefulWidget {
  const BatchCourseProcessChapterLockWidget({
    super.key,
    this.parameter1,
  });

  final DocumentReference? parameter1;

  @override
  State<BatchCourseProcessChapterLockWidget> createState() =>
      _BatchCourseProcessChapterLockWidgetState();
}

class _BatchCourseProcessChapterLockWidgetState
    extends State<BatchCourseProcessChapterLockWidget> {
  late BatchCourseProcessChapterLockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BatchCourseProcessChapterLockModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget!.parameter1!.update(createChapterRecordData(
        status: true,
      ));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
