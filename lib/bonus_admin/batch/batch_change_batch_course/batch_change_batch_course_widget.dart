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
import 'batch_change_batch_course_model.dart';
export 'batch_change_batch_course_model.dart';

class BatchChangeBatchCourseWidget extends StatefulWidget {
  const BatchChangeBatchCourseWidget({
    super.key,
    required this.courseRef,
    required this.batchRef,
    required this.batchesStatus,
  });

  final DocumentReference? courseRef;
  final DocumentReference? batchRef;
  final String? batchesStatus;

  @override
  State<BatchChangeBatchCourseWidget> createState() =>
      _BatchChangeBatchCourseWidgetState();
}

class _BatchChangeBatchCourseWidgetState
    extends State<BatchChangeBatchCourseWidget> {
  late BatchChangeBatchCourseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BatchChangeBatchCourseModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 5000));

      context.pushNamed('Batch-List');
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
        title: 'Batch-ChangeBatch-Course',
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
                  if ((MediaQuery.sizeOf(context).width > 1070.0) &&
                      responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                      ))
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
                              isEqualTo: widget!.courseRef,
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
                                        'Keyv8a_${rowIndex}_of_${rowChapterRecordList.length}'),
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
                                      isEqualTo: widget!.courseRef,
                                    )
                                    .where(
                                      'batchesRef',
                                      isEqualTo: widget!.batchRef,
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
                                        'Keyoav_${rowIndex}_of_${rowSubscriptionRecordList.length}'),
                                    parameter1: rowSubscriptionRecord.reference,
                                    status: widget!.batchesStatus!,
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
