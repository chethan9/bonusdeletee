import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'batch_course_process_model.dart';
export 'batch_course_process_model.dart';

class BatchCourseProcessWidget extends StatefulWidget {
  const BatchCourseProcessWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    required this.parameter3,
    this.parameter4,
  });

  final DocumentReference? parameter1;
  final DocumentReference? parameter2;
  final String? parameter3;
  final DocumentReference? parameter4;

  @override
  State<BatchCourseProcessWidget> createState() =>
      _BatchCourseProcessWidgetState();
}

class _BatchCourseProcessWidgetState extends State<BatchCourseProcessWidget> {
  late BatchCourseProcessModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BatchCourseProcessModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.parameter1 == widget!.parameter2) {
        await widget!.parameter4!.update(createCourseRecordData(
          status: widget!.parameter3 == 'Ongoing' ? 'Publish' : 'Draft',
          batchesRef:
              widget!.parameter3 == 'Ongoing' ? widget!.parameter1 : null,
        ));
      }
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
