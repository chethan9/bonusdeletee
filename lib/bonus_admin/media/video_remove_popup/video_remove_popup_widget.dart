import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_remove_popup_model.dart';
export 'video_remove_popup_model.dart';

class VideoRemovePopupWidget extends StatefulWidget {
  const VideoRemovePopupWidget({
    super.key,
    this.videoDoc,
    this.videoId,
    this.userFolder,
  });

  final VideosRecord? videoDoc;
  final String? videoId;
  final UsersRecord? userFolder;

  @override
  State<VideoRemovePopupWidget> createState() => _VideoRemovePopupWidgetState();
}

class _VideoRemovePopupWidgetState extends State<VideoRemovePopupWidget> {
  late VideoRemovePopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoRemovePopupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'hdqhaeq8' /* Do you really want to remove t... */,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      if (widget!.videoId != null && widget!.videoId != '') {
                        _model.apiResultyhp123 = await DeleteCall.call(
                          videoId: widget!.videoId,
                        );
                      } else {
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
                            await _model
                                .productRslt1![(_model.lessonCount!) - 1]
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
                      }

                      Navigator.pop(context);
                      FFAppState().adminCurrentFolderID =
                          'c000e7ede52e4745a592b3b3933d662a';
                      FFAppState().folderListNav = [];
                      _model.mainFolderResult1 = await queryFolderRecordOnce(
                        queryBuilder: (folderRecord) => folderRecord.where(
                          'folder_main_id',
                          isEqualTo:
                              FFAppState().currentUserRole == 'Instructor'
                                  ? valueOrDefault(
                                      currentUserDocument?.folderID, '')
                                  : 'BSFL1000',
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      FFAppState().addToFolderListNav(FolderInfoStruct(
                        folderId: _model.mainFolderResult1?.folderMainId,
                        folderName: _model.mainFolderResult1?.folderName,
                        folderRef: _model.mainFolderResult1?.reference,
                      ));

                      context.pushNamed(
                        'Video-Management',
                        queryParameters: {
                          'status': serializeParam(
                            'Main',
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      '0s96skll' /* Yes */,
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
                      '0dc4ioco' /* No */,
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
