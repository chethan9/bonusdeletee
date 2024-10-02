import '/backend/backend.dart';
import '/bonus_admin/batch/batch_change_batch_status_subscriber/batch_change_batch_status_subscriber_widget.dart';
import '/bonus_admin/batch/batch_course_process_chapter_lock/batch_course_process_chapter_lock_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'batch_change_batch_single_course_model.dart';
export 'batch_change_batch_single_course_model.dart';

class BatchChangeBatchSingleCourseWidget extends StatefulWidget {
  const BatchChangeBatchSingleCourseWidget({
    super.key,
    required this.courseRef,
    required this.prevBatchesRef,
    required this.prevBatchesStatus,
    required this.presentBatchRef,
    required this.presentBatchesStatus,
  });

  final CourseRecord? courseRef;
  final DocumentReference? prevBatchesRef;
  final String? prevBatchesStatus;
  final DocumentReference? presentBatchRef;
  final String? presentBatchesStatus;

  @override
  State<BatchChangeBatchSingleCourseWidget> createState() =>
      _BatchChangeBatchSingleCourseWidgetState();
}

class _BatchChangeBatchSingleCourseWidgetState
    extends State<BatchChangeBatchSingleCourseWidget> {
  late BatchChangeBatchSingleCourseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BatchChangeBatchSingleCourseModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 5000));

      context.goNamed(
        'Course',
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Batch-ChangeBatch-SingleCourse',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  if (MediaQuery.sizeOf(context).width > 1070.0)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Lottie.asset(
                            'assets/lottie_animations/animation_lk0ujcxl.json',
                            width: 500.0,
                            height: 500.0,
                            fit: BoxFit.cover,
                            reverse: true,
                            animate: true,
                          ),
                        ),
                        FutureBuilder<List<ChapterRecord>>(
                          future: queryChapterRecordOnce(
                            queryBuilder: (chapterRecord) =>
                                chapterRecord.where(
                              'courseRef',
                              isEqualTo: widget!.courseRef?.reference,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 10.0,
                                  height: 10.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0x00DF473F),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<ChapterRecord> rowChapterRecordList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    rowChapterRecordList.length, (rowIndex) {
                                  final rowChapterRecord =
                                      rowChapterRecordList[rowIndex];
                                  return BatchCourseProcessChapterLockWidget(
                                    key: Key(
                                        'Key9mm_${rowIndex}_of_${rowChapterRecordList.length}'),
                                    parameter1: rowChapterRecord.reference,
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                        FutureBuilder<List<SubscriptionRecord>>(
                          future: querySubscriptionRecordOnce(
                            queryBuilder: (subscriptionRecord) =>
                                subscriptionRecord
                                    .where(
                                      'courseRef',
                                      isEqualTo: widget!.courseRef?.reference,
                                    )
                                    .where(
                                      'batchesRef',
                                      isEqualTo: widget!.prevBatchesRef,
                                    ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 10.0,
                                  height: 10.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0x00DF473F),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<SubscriptionRecord> rowSubscriptionRecordList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    rowSubscriptionRecordList.length,
                                    (rowIndex) {
                                  final rowSubscriptionRecord =
                                      rowSubscriptionRecordList[rowIndex];
                                  return BatchChangeBatchStatusSubscriberWidget(
                                    key: Key(
                                        'Keyg1e_${rowIndex}_of_${rowSubscriptionRecordList.length}'),
                                    parameter1: rowSubscriptionRecord.reference,
                                    status: widget!.prevBatchesStatus!,
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                        FutureBuilder<List<SubscriptionRecord>>(
                          future: querySubscriptionRecordOnce(
                            queryBuilder: (subscriptionRecord) =>
                                subscriptionRecord
                                    .where(
                                      'courseRef',
                                      isEqualTo: widget!.courseRef?.reference,
                                    )
                                    .where(
                                      'batchesRef',
                                      isEqualTo: widget!.presentBatchRef,
                                    ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 10.0,
                                  height: 10.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0x00DF473F),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<SubscriptionRecord>
                                presentSubscriberSubscriptionRecordList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    presentSubscriberSubscriptionRecordList
                                        .length, (presentSubscriberIndex) {
                                  final presentSubscriberSubscriptionRecord =
                                      presentSubscriberSubscriptionRecordList[
                                          presentSubscriberIndex];
                                  return BatchChangeBatchStatusSubscriberWidget(
                                    key: Key(
                                        'Key3rl_${presentSubscriberIndex}_of_${presentSubscriberSubscriptionRecordList.length}'),
                                    parameter1:
                                        presentSubscriberSubscriptionRecord
                                            .reference,
                                    status: widget!.presentBatchesStatus!,
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  wrapWithModel(
                    model: _model.mobileModel,
                    updateCallback: () => safeSetState(() {}),
                    child: MobileWidget(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
