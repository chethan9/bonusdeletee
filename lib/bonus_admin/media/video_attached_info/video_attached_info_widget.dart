import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_attached_info_model.dart';
export 'video_attached_info_model.dart';

class VideoAttachedInfoWidget extends StatefulWidget {
  const VideoAttachedInfoWidget({
    super.key,
    required this.videoDoc,
    this.courseList,
    this.lessonList,
    this.userFolder,
  });

  final VideosRecord? videoDoc;
  final List<CourseRecord>? courseList;
  final List<LessonsRecord>? lessonList;
  final UsersRecord? userFolder;

  @override
  State<VideoAttachedInfoWidget> createState() =>
      _VideoAttachedInfoWidgetState();
}

class _VideoAttachedInfoWidgetState extends State<VideoAttachedInfoWidget> {
  late VideoAttachedInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoAttachedInfoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'qv26r6ma' /* Do you really want to remove t... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
            if (widget!.courseList!.length > 0)
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'mjoofm3q' /* Courses:  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
            if (widget!.courseList!.length > 0)
              Builder(
                builder: (context) {
                  final cl1 = widget!.courseList
                          ?.sortedList(keyOf: (e) => e.name, desc: false)
                          ?.toList() ??
                      [];

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: cl1.length,
                    itemBuilder: (context, cl1Index) {
                      final cl1Item = cl1[cl1Index];
                      return Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 3.0),
                          child: Text(
                            cl1Item.name,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            if (widget!.lessonList!.length > 0)
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '01jasdq9' /* Lessons: */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
            if (widget!.lessonList!.length > 0)
              Builder(
                builder: (context) {
                  final cll1 = widget!.lessonList
                          ?.sortedList(keyOf: (e) => e.name, desc: false)
                          ?.toList() ??
                      [];

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: cll1.length,
                    itemBuilder: (context, cll1Index) {
                      final cll1Item = cll1[cll1Index];
                      return StreamBuilder<CourseRecord>(
                        stream: CourseRecord.getDocument(cll1Item.courseRef!),
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

                          final wrapCourseRecord = snapshot.data!;

                          return Wrap(
                            spacing: 0.0,
                            runSpacing: 0.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: StreamBuilder<ChapterRecord>(
                                    stream: ChapterRecord.getDocument(
                                        cll1Item.chapterRef!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 10.0,
                                            height: 10.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0x00DF473F),
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final textChapterRecord = snapshot.data!;

                                      return Text(
                                        '${wrapCourseRecord.name}(course) - ${textChapterRecord.name}(chapter)-${cll1Item.name}(lesson)',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      await widget!.videoDoc!.reference.delete();
                      _model.apiResultyhp = await DeleteCall.call(
                        videoId: widget!.videoDoc?.videoId,
                      );

                      _model.productListrslt1 = await queryLessonsRecordOnce(
                        queryBuilder: (lessonsRecord) => lessonsRecord.where(
                          'videoRef',
                          isEqualTo: widget!.videoDoc?.reference,
                        ),
                      );
                      if (_model.productListrslt1!.length > 0) {
                        _model.lessonCount = _model.productListrslt1?.length;
                        while (_model.lessonCount! > 0) {
                          await _model
                              .productListrslt1![(_model.lessonCount!) - 1]
                              .reference
                              .update({
                            ...mapToFirestore(
                              {
                                'videoRef': FieldValue.delete(),
                              },
                            ),
                          });
                          _model.lessonCount = (_model.lessonCount!) - 1;
                        }
                      }
                      _model.productRslt1 = await queryCourseRecordOnce(
                        queryBuilder: (courseRecord) => courseRecord.where(
                          'videoRef',
                          isEqualTo: widget!.videoDoc?.reference,
                        ),
                      );
                      if (_model.productRslt1!.length > 0) {
                        _model.lessonCount = _model.productRslt1?.length;
                        while (_model.lessonCount! > 0) {
                          await _model.productRslt1![(_model.lessonCount!) - 1]
                              .reference
                              .update({
                            ...mapToFirestore(
                              {
                                'videoRef': FieldValue.delete(),
                              },
                            ),
                          });
                          _model.lessonCount = (_model.lessonCount!) - 1;
                        }
                      }
                      Navigator.pop(context);
                      if (widget!.userFolder != null) {
                        context.pushNamed(
                          'Video-20_09Management',
                          queryParameters: {
                            'folder': serializeParam(
                              widget!.userFolder,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'folder': widget!.userFolder,
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      } else {
                        context.pushNamed(
                          'Video-20_09Management',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      }

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'o2ssir4v' /* Yes */,
                    ),
                    icon: Icon(
                      Icons.thumb_up_off_alt,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 18.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).success,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      '8cqj9zlv' /* No */,
                    ),
                    icon: Icon(
                      Icons.thumb_down_off_alt,
                      size: 18.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
