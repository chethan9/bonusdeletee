import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'batch_password_single_course_model.dart';
export 'batch_password_single_course_model.dart';

class BatchPasswordSingleCourseWidget extends StatefulWidget {
  const BatchPasswordSingleCourseWidget({
    super.key,
    required this.newBatchesName,
    required this.courseRef,
    this.prevBatchesRef,
    this.prevBatchesStatus,
  });

  final String? newBatchesName;
  final CourseRecord? courseRef;
  final DocumentReference? prevBatchesRef;
  final String? prevBatchesStatus;

  @override
  State<BatchPasswordSingleCourseWidget> createState() =>
      _BatchPasswordSingleCourseWidgetState();
}

class _BatchPasswordSingleCourseWidgetState
    extends State<BatchPasswordSingleCourseWidget> {
  late BatchPasswordSingleCourseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BatchPasswordSingleCourseModel());

    _model.yourEmailTextController ??= TextEditingController();
    _model.yourEmailFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BatchesRecord>(
      stream: BatchesRecord.getDocument(widget!.prevBatchesRef!),
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

        final containerBatchesRecord = snapshot.data!;

        return Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.25,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Visibility(
                visible: responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'miwlgm7q' /* Please enter master password */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: TextFormField(
                                controller: _model.yourEmailTextController,
                                focusNode: _model.yourEmailFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '15pw713p' /* Password */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 0.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model
                                    .yourEmailTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        StreamBuilder<List<SettingsRecord>>(
                          stream: querySettingsRecord(
                            singleRecord: true,
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
                            List<SettingsRecord> wrapSettingsRecordList =
                                snapshot.data!;
                            final wrapSettingsRecord =
                                wrapSettingsRecordList.isNotEmpty
                                    ? wrapSettingsRecordList.first
                                    : null;

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
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model
                                                .yourEmailTextController.text ==
                                            wrapSettingsRecord
                                                ?.masterPassword) {
                                          await widget!.prevBatchesRef!.update({
                                            ...mapToFirestore(
                                              {
                                                'courseRef':
                                                    FieldValue.arrayRemove([
                                                  widget!.courseRef?.reference
                                                ]),
                                                'archiveCourseRef':
                                                    FieldValue.arrayUnion([
                                                  widget!.courseRef?.reference
                                                ]),
                                              },
                                            ),
                                          });
                                          _model.batchRslt =
                                              await queryBatchesRecordOnce(
                                            queryBuilder: (batchesRecord) =>
                                                batchesRecord.where(
                                              'name',
                                              isEqualTo: widget!.newBatchesName,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);

                                          await widget!.courseRef!.reference
                                              .update(createCourseRecordData(
                                            batchesRef:
                                                _model.batchRslt?.reference,
                                            status: 'Publish',
                                          ));

                                          context.pushNamed(
                                            'Batch-ChangeBatch-SingleCourse',
                                            queryParameters: {
                                              'courseRef': serializeParam(
                                                widget!.courseRef,
                                                ParamType.Document,
                                              ),
                                              'prevBatchesStatus':
                                                  serializeParam(
                                                widget!.prevBatchesStatus,
                                                ParamType.String,
                                              ),
                                              'prevBatchesRef': serializeParam(
                                                widget!.prevBatchesRef,
                                                ParamType.DocumentReference,
                                              ),
                                              'presentBatchRef': serializeParam(
                                                _model.batchRslt?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'presentBatchesStatus':
                                                  serializeParam(
                                                'Ongoing',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'courseRef': widget!.courseRef,
                                            },
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Please check your password',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          Navigator.pop(context);

                                          context.pushNamed(
                                            'CourseFORM',
                                            queryParameters: {
                                              'courseRef': serializeParam(
                                                widget!.courseRef,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'courseRef': widget!.courseRef,
                                            },
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      child: wrapWithModel(
                                        model: _model.addButtonModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AddButtonWidget(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'q7e1cjbu' /* Save */,
                                          ),
                                          icon: Icon(
                                            Icons.save_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            size: 16.0,
                                          ),
                                          height: 45,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
