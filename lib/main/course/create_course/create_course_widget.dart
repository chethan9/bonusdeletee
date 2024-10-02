import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/bonus_admin/batch/batch_course_creat_time_batch_list/batch_course_creat_time_batch_list_widget.dart';
import '/bonus_admin/media/video_list_for_selection/video_list_for_selection_widget.dart';
import '/bonus_admin/media/video_preview_title/video_preview_title_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/change_branch/change_branch_widget.dart';
import '/components/change_category/change_category_widget.dart';
import '/components/change_country/change_country_widget.dart';
import '/components/change_university/change_university_widget.dart';
import '/components/remove/remove_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_course_model.dart';
export 'create_course_model.dart';

class CreateCourseWidget extends StatefulWidget {
  const CreateCourseWidget({super.key});

  @override
  State<CreateCourseWidget> createState() => _CreateCourseWidgetState();
}

class _CreateCourseWidgetState extends State<CreateCourseWidget> {
  late CreateCourseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateCourseModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await currentUserReference!.update(createUsersRecordData(
        courseLevel: createInstructorCourseLevelStruct(delete: true),
      ));
      FFAppState().courseImgGallery = [];
      FFAppState().courseImgFeature = '';
      FFAppState().video = '';
      FFAppState().courseCatImg = '';
      FFAppState().file = '';
    });

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.subtitleTextController ??= TextEditingController();
    _model.subtitleFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    _model.whatyouwilllearnTextController1 ??= TextEditingController();
    _model.whatyouwilllearnFocusNode1 ??= FocusNode();

    _model.whatyouwilllearnTextController2 ??= TextEditingController();
    _model.whatyouwilllearnFocusNode2 ??= FocusNode();

    _model.inputTextController ??= TextEditingController();
    _model.inputFocusNode ??= FocusNode();

    _model.totalNumberofLessonTextController ??= TextEditingController();
    _model.totalNumberofLessonFocusNode ??= FocusNode();

    _model.bookingLimitTextController ??= TextEditingController();
    _model.bookingLimitFocusNode ??= FocusNode();

    _model.priceTextController ??= TextEditingController();
    _model.priceFocusNode ??= FocusNode();

    _model.firstEMIPriceTextController ??= TextEditingController();
    _model.firstEMIPriceFocusNode ??= FocusNode();

    _model.secondEMIPriceTextController ??= TextEditingController();
    _model.secondEMIPriceFocusNode ??= FocusNode();

    _model.thirdEMIPriceTextController ??= TextEditingController();
    _model.thirdEMIPriceFocusNode ??= FocusNode();

    _model.whatsappGroupLinkTextController ??= TextEditingController();
    _model.whatsappGroupLinkFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.inputTextController?.text =
              FFLocalizations.of(context).getText(
            'pxsqq7zh' /* 0 */,
          );
          _model.totalNumberofLessonTextController?.text =
              FFLocalizations.of(context).getText(
            'nnexapoz' /* 0 */,
          );
          _model.bookingLimitTextController?.text =
              FFLocalizations.of(context).getText(
            'ksazhc27' /* 10000 */,
          );
          _model.priceTextController?.text =
              FFLocalizations.of(context).getText(
            'w0sx6mmm' /* 0 */,
          );
          _model.firstEMIPriceTextController?.text =
              FFLocalizations.of(context).getText(
            '5o3xn8io' /* 0 */,
          );
          _model.secondEMIPriceTextController?.text =
              FFLocalizations.of(context).getText(
            'd7xpr1nd' /* 0 */,
          );
          _model.thirdEMIPriceTextController?.text =
              FFLocalizations.of(context).getText(
            'cc1s0cm8' /* 0 */,
          );
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.75,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'iiwwk7k8' /* Create Course */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      FFAppState().courseImgFeature,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/academy-backend-uubu81/assets/4jkvsr538si7/Placeholder_view_vector.svg.png',
                                    ),
                                    width: 250.0,
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 32.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              maxWidth: 1500.00,
                                              maxHeight: 1500.00,
                                              allowPhoto: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              safeSetState(() => _model
                                                  .isDataUploading = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              var downloadUrls = <String>[];
                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading = false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl =
                                                      downloadUrls.first;
                                                });
                                              } else {
                                                safeSetState(() {});
                                                return;
                                              }
                                            }

                                            FFAppState().courseImgFeature =
                                                _model.uploadedFileUrl;
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'mmhveadj' /* Add Image */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 100.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Lexend Deca'),
                                                ),
                                            elevation: 1.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      if (_model.uploadedFileUrl != '')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 16.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: Container(
                                                        height: 200.0,
                                                        child: RemoveWidget(
                                                          image: 1,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '6kxwi017' /* Remove */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 100.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    useGoogleFonts:
                                                        GoogleFonts.asMap()
                                                            .containsKey(
                                                                'Lexend Deca'),
                                                  ),
                                              elevation: 1.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                if (FFAppState().videoRef != null)
                                  Wrap(
                                    spacing: 0.0,
                                    runSpacing: 0.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      if (FFAppState().videoRef != null)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: StreamBuilder<VideosRecord>(
                                            stream: VideosRecord.getDocument(
                                                FFAppState().videoRef!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 10.0,
                                                    height: 10.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        Color(0x00DF473F),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }

                                              final containerVideosRecord =
                                                  snapshot.data!;

                                              return Container(
                                                width: 250.0,
                                                height: 250.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            containerVideosRecord
                                                                .images,
                                                            width: 300.0,
                                                            height: 120.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        containerVideosRecord
                                                            .title,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.apiResultff12 =
                                                                await OTPAndPBICall
                                                                    .call(
                                                              videoId:
                                                                  containerVideosRecord
                                                                      .videoId,
                                                              userName:
                                                                  currentUserEmail,
                                                              userid:
                                                                  currentUserUid,
                                                            );

                                                            if ((_model
                                                                    .apiResultff12
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        WebViewAware(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.35,
                                                                        child:
                                                                            VideoPreviewTitleWidget(
                                                                          videoRef:
                                                                              containerVideosRecord,
                                                                          otp: OTPAndPBICall
                                                                              .otp(
                                                                            (_model.apiResultff12?.jsonBody ??
                                                                                ''),
                                                                          )!,
                                                                          playbackinfo:
                                                                              OTPAndPBICall.playbackInfo(
                                                                            (_model.apiResultff12?.jsonBody ??
                                                                                ''),
                                                                          )!,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'API Failed',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(6.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .remove_red_eye_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 14.0,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'oft2bmz5' /* Preview */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 8.0, 16.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().folderListNav = [];
                                            _model.mainFolderResult1 =
                                                await queryFolderRecordOnce(
                                              queryBuilder: (folderRecord) =>
                                                  folderRecord.where(
                                                'folder_main_id',
                                                isEqualTo: FFAppState()
                                                            .currentUserRole ==
                                                        'Instructor'
                                                    ? valueOrDefault(
                                                        currentUserDocument
                                                            ?.folderID,
                                                        '')
                                                    : 'BSFL1000',
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            FFAppState().addToFolderListNav(
                                                FolderInfoStruct(
                                              folderId: _model.mainFolderResult1
                                                  ?.folderMainId,
                                              folderName: _model
                                                  .mainFolderResult1
                                                  ?.folderName,
                                              folderRef: _model
                                                  .mainFolderResult1?.reference,
                                            ));
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.5,
                                                      child:
                                                          VideoListForSelectionWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'zlkj5s8w' /* Add Video */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 100.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Lexend Deca'),
                                                ),
                                            elevation: 1.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (FFAppState().videoRef != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 16.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().videoRef = null;
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '0r0senyp' /* Remove Video */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 110.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Lexend Deca'),
                                                ),
                                            elevation: 1.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                if (FFAppState().videoRef != null)
                                  Wrap(
                                    spacing: 0.0,
                                    runSpacing: 0.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [],
                                  ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 0.0),
                                          child: Container(
                                            width: 320.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.nameTextController,
                                              focusNode: _model.nameFocusNode,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'alnhfigo' /* Name* */,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFFF0000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFFF0000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 32.0,
                                                            20.0, 12.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              textAlign: TextAlign.start,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: _model
                                                  .nameTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 16.0, 0.0),
                                          child: Container(
                                            width: 22.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.subtitleTextController,
                                              focusNode:
                                                  _model.subtitleFocusNode,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '31vm9a3b' /* Subtitle */,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 32.0,
                                                            20.0, 12.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              textAlign: TextAlign.start,
                                              maxLines: null,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: _model
                                                  .subtitleTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (valueOrDefault(
                                              currentUserDocument?.userRole,
                                              '') ==
                                          'Admin')
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Container(
                                                width: 22.0,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: StreamBuilder<
                                                    List<UsersRecord>>(
                                                  stream: queryUsersRecord(
                                                    queryBuilder:
                                                        (usersRecord) =>
                                                            usersRecord
                                                                .where(
                                                                  'userRole',
                                                                  isEqualTo:
                                                                      'Instructor',
                                                                )
                                                                .where(
                                                                  'instuctorStatus',
                                                                  isEqualTo:
                                                                      'Approved',
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 10.0,
                                                          height: 10.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Color(0x00DF473F),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<UsersRecord>
                                                        dropDownInstructorUsersRecordList =
                                                        snapshot.data!;

                                                    return FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .dropDownInstructorValueController ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options:
                                                          dropDownInstructorUsersRecordList
                                                              .map((e) =>
                                                                  e.displayName)
                                                              .toList(),
                                                      onChanged: (val) async {
                                                        safeSetState(() => _model
                                                                .dropDownInstructorValue =
                                                            val);
                                                        _model.autherRef1 =
                                                            await queryUsersRecordOnce(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                                        'display_name',
                                                                        isEqualTo:
                                                                            _model.dropDownInstructorValue,
                                                                      )
                                                                      .where(
                                                                        'instuctorStatus',
                                                                        isEqualTo:
                                                                            'Approved',
                                                                      )
                                                                      .where(
                                                                        'userRole',
                                                                        isEqualTo:
                                                                            'Instructor',
                                                                      ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        _model.authrRef = _model
                                                            .autherRef1
                                                            ?.reference;
                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                      width: 180.0,
                                                      height: 50.0,
                                                      maxHeight: 300.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '1wzu8zno' /* Select instructor* */,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0.0,
                                                      borderRadius: 0.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  4.0,
                                                                  12.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 170.0,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0,
                                                                16.0, 8.0, 0.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          StreamBuilder<
                                                              List<
                                                                  CountryRecord>>(
                                                        stream:
                                                            queryCountryRecord(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 10.0,
                                                                height: 10.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    Color(
                                                                        0x00DF473F),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<CountryRecord>
                                                              dropDownCountryRecordList =
                                                              snapshot.data!;

                                                          return FlutterFlowDropDown<
                                                              String>(
                                                            controller: _model
                                                                    .dropDownValueController1 ??=
                                                                FormFieldController<
                                                                    String>(
                                                              _model.dropDownValue1 ??=
                                                                  currentUserDocument
                                                                      ?.courseLevel
                                                                      ?.countryName,
                                                            ),
                                                            options:
                                                                dropDownCountryRecordList
                                                                    .map((e) =>
                                                                        e.name)
                                                                    .toList(),
                                                            onChanged:
                                                                (val) async {
                                                              safeSetState(() =>
                                                                  _model.dropDownValue1 =
                                                                      val);
                                                              if (_model
                                                                      .countryLevelSet ==
                                                                  'unset') {
                                                                _model.countryRslt1 =
                                                                    await queryCountryRecordOnce(
                                                                  queryBuilder:
                                                                      (countryRecord) =>
                                                                          countryRecord
                                                                              .where(
                                                                    'name',
                                                                    isEqualTo:
                                                                        _model
                                                                            .dropDownValue1,
                                                                  ),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);

                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  courseLevel:
                                                                      createInstructorCourseLevelStruct(
                                                                    countryName:
                                                                        _model
                                                                            .dropDownValue1,
                                                                    coutryRef: _model
                                                                        .countryRslt1
                                                                        ?.reference,
                                                                    universityName:
                                                                        'Please select..',
                                                                    branchName:
                                                                        'Please select..',
                                                                    categoryName:
                                                                        'Please select..',
                                                                    fieldValues: {
                                                                      'universityRef':
                                                                          FieldValue
                                                                              .delete(),
                                                                      'branchRef':
                                                                          FieldValue
                                                                              .delete(),
                                                                      'categoryRef':
                                                                          FieldValue
                                                                              .delete(),
                                                                    },
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                ));
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .dropDownValueController2
                                                                      ?.reset();
                                                                  _model
                                                                      .dropDownValueController3
                                                                      ?.reset();
                                                                  _model
                                                                      .dropDownValueController4
                                                                      ?.reset();
                                                                });
                                                                _model.countryLevelSet =
                                                                    'set';
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.countryRslt =
                                                                    await queryCountryRecordOnce(
                                                                  queryBuilder:
                                                                      (countryRecord) =>
                                                                          countryRecord
                                                                              .where(
                                                                    'name',
                                                                    isEqualTo:
                                                                        _model
                                                                            .dropDownValue1,
                                                                  ),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);

                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  courseLevel:
                                                                      createInstructorCourseLevelStruct(
                                                                    countryName:
                                                                        _model
                                                                            .dropDownValue1,
                                                                    coutryRef: _model
                                                                        .countryRslt
                                                                        ?.reference,
                                                                    universityName:
                                                                        'Please select..',
                                                                    branchName:
                                                                        'Please select..',
                                                                    categoryName:
                                                                        'Please select..',
                                                                    fieldValues: {
                                                                      'universityRef':
                                                                          FieldValue
                                                                              .delete(),
                                                                      'branchRef':
                                                                          FieldValue
                                                                              .delete(),
                                                                      'categoryRef':
                                                                          FieldValue
                                                                              .delete(),
                                                                    },
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                ));
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .dropDownValueController2
                                                                      ?.reset();
                                                                  _model
                                                                      .dropDownValueController3
                                                                      ?.reset();
                                                                  _model
                                                                      .dropDownValueController4
                                                                      ?.reset();
                                                                });
                                                                _model.countryLevelSet =
                                                                    'unset';
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            width: 300.0,
                                                            height: 50.0,
                                                            maxHeight: 250.0,
                                                            searchHintTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                            searchTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              '1gbmof6u' /* Select country... */,
                                                            ),
                                                            searchHintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'uldep11g' /* Search for an item... */,
                                                            ),
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 2.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            borderWidth: 2.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isSearchable: true,
                                                            isMultiSelect:
                                                                false,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      '${currentUserDocument?.courseLevel?.countryName}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (FFAppState().countryChange == 2)
                                              StreamBuilder<
                                                  List<CountryRecord>>(
                                                stream: queryCountryRecord(
                                                  queryBuilder:
                                                      (countryRecord) =>
                                                          countryRecord.where(
                                                    'name',
                                                    isEqualTo:
                                                        _model.dropDownValue1,
                                                  ),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 10.0,
                                                        height: 10.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Color(0x00DF473F),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<CountryRecord>
                                                      changeCountryCountryRecordList =
                                                      snapshot.data!;
                                                  final changeCountryCountryRecord =
                                                      changeCountryCountryRecordList
                                                              .isNotEmpty
                                                          ? changeCountryCountryRecordList
                                                              .first
                                                          : null;

                                                  return wrapWithModel(
                                                    model: _model
                                                        .changeCountryModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ChangeCountryWidget(
                                                      countryRef:
                                                          changeCountryCountryRecord
                                                              ?.reference,
                                                    ),
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                      ),
                                      if (currentUserDocument?.courseLevel
                                                  ?.coutryRef?.id !=
                                              null &&
                                          currentUserDocument?.courseLevel
                                                  ?.coutryRef?.id !=
                                              '')
                                        Expanded(
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Container(
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      16.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  UniversityRecord>>(
                                                            stream:
                                                                queryUniversityRecord(
                                                              queryBuilder:
                                                                  (universityRecord) =>
                                                                      universityRecord
                                                                          .where(
                                                                'countryRef',
                                                                isEqualTo: currentUserDocument
                                                                    ?.courseLevel
                                                                    ?.coutryRef,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        Color(
                                                                            0x00DF473F),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<UniversityRecord>
                                                                  dropDownUniversityRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .dropDownValueController2 ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model.dropDownValue2 ??=
                                                                      currentUserDocument
                                                                          ?.courseLevel
                                                                          ?.universityName,
                                                                ),
                                                                options: dropDownUniversityRecordList
                                                                    .map((e) =>
                                                                        e.name)
                                                                    .toList(),
                                                                onChanged:
                                                                    (val) async {
                                                                  safeSetState(() =>
                                                                      _model.dropDownValue2 =
                                                                          val);
                                                                  if (_model
                                                                          .universityLevelSet ==
                                                                      'unset') {
                                                                    _model.universityRslt1 =
                                                                        await queryUniversityRecordOnce(
                                                                      queryBuilder: (universityRecord) => universityRecord
                                                                          .where(
                                                                            'name',
                                                                            isEqualTo:
                                                                                _model.dropDownValue2,
                                                                          )
                                                                          .where(
                                                                            'countryRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.coutryRef,
                                                                          ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);

                                                                    await currentUserReference!
                                                                        .update(
                                                                            createUsersRecordData(
                                                                      courseLevel:
                                                                          createInstructorCourseLevelStruct(
                                                                        universityName:
                                                                            _model.dropDownValue2,
                                                                        universityRef: _model
                                                                            .universityRslt1
                                                                            ?.reference,
                                                                        categoryName:
                                                                            'Please select..',
                                                                        branchName:
                                                                            'Please select..',
                                                                        fieldValues: {
                                                                          'branchRef':
                                                                              FieldValue.delete(),
                                                                          'categoryRef':
                                                                              FieldValue.delete(),
                                                                        },
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .dropDownValueController3
                                                                          ?.reset();
                                                                      _model
                                                                          .dropDownValueController4
                                                                          ?.reset();
                                                                    });
                                                                    _model.universityLevelSet =
                                                                        'set';
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    _model.universityRslt =
                                                                        await queryUniversityRecordOnce(
                                                                      queryBuilder: (universityRecord) => universityRecord
                                                                          .where(
                                                                            'name',
                                                                            isEqualTo:
                                                                                _model.dropDownValue2,
                                                                          )
                                                                          .where(
                                                                            'countryRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.coutryRef,
                                                                          ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);

                                                                    await currentUserReference!
                                                                        .update(
                                                                            createUsersRecordData(
                                                                      courseLevel:
                                                                          createInstructorCourseLevelStruct(
                                                                        universityName:
                                                                            _model.dropDownValue2,
                                                                        universityRef: _model
                                                                            .universityRslt
                                                                            ?.reference,
                                                                        branchName:
                                                                            'Please select..',
                                                                        categoryName:
                                                                            'Please select..',
                                                                        fieldValues: {
                                                                          'branchRef':
                                                                              FieldValue.delete(),
                                                                          'categoryRef':
                                                                              FieldValue.delete(),
                                                                        },
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .dropDownValueController3
                                                                          ?.reset();
                                                                      _model
                                                                          .dropDownValueController4
                                                                          ?.reset();
                                                                    });
                                                                    _model.universityLevelSet =
                                                                        'unset';
                                                                    safeSetState(
                                                                        () {});
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                width: 300.0,
                                                                height: 50.0,
                                                                maxHeight:
                                                                    250.0,
                                                                searchHintTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                        ),
                                                                searchTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  '05iscnbt' /* Select university... */,
                                                                ),
                                                                searchHintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'ev6tehhf' /* Search for an item... */,
                                                                ),
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                borderWidth:
                                                                    2.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isSearchable:
                                                                    true,
                                                                isMultiSelect:
                                                                    false,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Text(
                                                          '${currentUserDocument?.courseLevel?.universityName}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (FFAppState()
                                                          .universityChange ==
                                                      2)
                                                    StreamBuilder<
                                                        List<UniversityRecord>>(
                                                      stream:
                                                          queryUniversityRecord(
                                                        queryBuilder:
                                                            (universityRecord) =>
                                                                universityRecord
                                                                    .where(
                                                          'name',
                                                          isEqualTo: _model
                                                              .dropDownValue2,
                                                        ),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 10.0,
                                                              height: 10.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Color(
                                                                      0x00DF473F),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UniversityRecord>
                                                            changeUniversityUniversityRecordList =
                                                            snapshot.data!;
                                                        final changeUniversityUniversityRecord =
                                                            changeUniversityUniversityRecordList
                                                                    .isNotEmpty
                                                                ? changeUniversityUniversityRecordList
                                                                    .first
                                                                : null;

                                                        return wrapWithModel(
                                                          model: _model
                                                              .changeUniversityModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              ChangeUniversityWidget(
                                                            parameter1:
                                                                changeUniversityUniversityRecord
                                                                    ?.reference,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (currentUserDocument?.courseLevel
                                                  ?.universityRef?.id !=
                                              null &&
                                          currentUserDocument?.courseLevel
                                                  ?.universityRef?.id !=
                                              '')
                                        Expanded(
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Container(
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      16.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  CategoryRecord>>(
                                                            stream:
                                                                queryCategoryRecord(
                                                              queryBuilder:
                                                                  (categoryRecord) =>
                                                                      categoryRecord
                                                                          .where(
                                                                            'universityRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.universityRef,
                                                                          )
                                                                          .where(
                                                                            'countryRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.coutryRef,
                                                                          ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        Color(
                                                                            0x00DF473F),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<CategoryRecord>
                                                                  dropDownCategoryRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .dropDownValueController3 ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model.dropDownValue3 ??=
                                                                      currentUserDocument
                                                                          ?.courseLevel
                                                                          ?.categoryName,
                                                                ),
                                                                options: dropDownCategoryRecordList
                                                                    .map((e) =>
                                                                        e.name)
                                                                    .toList(),
                                                                onChanged:
                                                                    (val) async {
                                                                  safeSetState(() =>
                                                                      _model.dropDownValue3 =
                                                                          val);
                                                                  if (_model
                                                                          .categoryLevelSet ==
                                                                      'unset') {
                                                                    _model.categoryRslt1new =
                                                                        await queryCategoryRecordOnce(
                                                                      queryBuilder: (categoryRecord) => categoryRecord
                                                                          .where(
                                                                            'name',
                                                                            isEqualTo:
                                                                                _model.dropDownValue3,
                                                                          )
                                                                          .where(
                                                                            'universityRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.universityRef,
                                                                          )
                                                                          .where(
                                                                            'countryRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.coutryRef,
                                                                          ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);

                                                                    await currentUserReference!
                                                                        .update(
                                                                            createUsersRecordData(
                                                                      courseLevel:
                                                                          createInstructorCourseLevelStruct(
                                                                        categoryName:
                                                                            _model.dropDownValue3,
                                                                        categoryRef: _model
                                                                            .categoryRslt1new
                                                                            ?.reference,
                                                                        branchName:
                                                                            'Please select..',
                                                                        fieldValues: {
                                                                          'branchRef':
                                                                              FieldValue.delete(),
                                                                        },
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .dropDownValueController4
                                                                          ?.reset();
                                                                    });
                                                                    _model.categoryLevelSet =
                                                                        'set';
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    _model.categoryRslt =
                                                                        await queryCategoryRecordOnce(
                                                                      queryBuilder: (categoryRecord) => categoryRecord
                                                                          .where(
                                                                            'name',
                                                                            isEqualTo:
                                                                                _model.dropDownValue3,
                                                                          )
                                                                          .where(
                                                                            'universityRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.universityRef,
                                                                          )
                                                                          .where(
                                                                            'countryRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.coutryRef,
                                                                          ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);

                                                                    await currentUserReference!
                                                                        .update(
                                                                            createUsersRecordData(
                                                                      courseLevel:
                                                                          createInstructorCourseLevelStruct(
                                                                        categoryName:
                                                                            _model.dropDownValue3,
                                                                        categoryRef: _model
                                                                            .categoryRslt
                                                                            ?.reference,
                                                                        branchName:
                                                                            'Please select..',
                                                                        fieldValues: {
                                                                          'branchRef':
                                                                              FieldValue.delete(),
                                                                        },
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .dropDownValueController4
                                                                          ?.reset();
                                                                    });
                                                                    _model.categoryLevelSet =
                                                                        'unset';
                                                                    safeSetState(
                                                                        () {});
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                width: 300.0,
                                                                height: 50.0,
                                                                maxHeight:
                                                                    250.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'xwp6lkpm' /* Select category... */,
                                                                ),
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                borderWidth:
                                                                    2.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Text(
                                                          '${currentUserDocument?.courseLevel?.categoryName}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (FFAppState()
                                                          .categoryChange ==
                                                      2)
                                                    StreamBuilder<
                                                        List<CategoryRecord>>(
                                                      stream:
                                                          queryCategoryRecord(
                                                        queryBuilder:
                                                            (categoryRecord) =>
                                                                categoryRecord
                                                                    .where(
                                                          'name',
                                                          isEqualTo: _model
                                                              .dropDownValue3,
                                                        ),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 10.0,
                                                              height: 10.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Color(
                                                                      0x00DF473F),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<CategoryRecord>
                                                            changeCategoryCategoryRecordList =
                                                            snapshot.data!;
                                                        final changeCategoryCategoryRecord =
                                                            changeCategoryCategoryRecordList
                                                                    .isNotEmpty
                                                                ? changeCategoryCategoryRecordList
                                                                    .first
                                                                : null;

                                                        return wrapWithModel(
                                                          model: _model
                                                              .changeCategoryModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              ChangeCategoryWidget(
                                                            parameter1:
                                                                changeCategoryCategoryRecord
                                                                    ?.reference,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (currentUserDocument?.courseLevel
                                                  ?.categoryRef?.id !=
                                              null &&
                                          currentUserDocument?.courseLevel
                                                  ?.categoryRef?.id !=
                                              '')
                                        Expanded(
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Container(
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      16.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  BranchRecord>>(
                                                            stream:
                                                                queryBranchRecord(
                                                              queryBuilder:
                                                                  (branchRecord) =>
                                                                      branchRecord
                                                                          .where(
                                                                            'categoryRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.categoryRef,
                                                                          )
                                                                          .where(
                                                                            'universityRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.universityRef,
                                                                          ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        Color(
                                                                            0x00DF473F),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<BranchRecord>
                                                                  dropDownBranchRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .dropDownValueController4 ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model.dropDownValue4 ??=
                                                                      currentUserDocument
                                                                          ?.courseLevel
                                                                          ?.branchName,
                                                                ),
                                                                options: dropDownBranchRecordList
                                                                    .map((e) =>
                                                                        e.name)
                                                                    .toList(),
                                                                onChanged:
                                                                    (val) async {
                                                                  safeSetState(() =>
                                                                      _model.dropDownValue4 =
                                                                          val);
                                                                  if (_model
                                                                          .branchLevelSet ==
                                                                      'unset') {
                                                                    _model.branchRslt1 =
                                                                        await queryBranchRecordOnce(
                                                                      queryBuilder: (branchRecord) => branchRecord
                                                                          .where(
                                                                            'name',
                                                                            isEqualTo:
                                                                                _model.dropDownValue3,
                                                                          )
                                                                          .where(
                                                                            'universityRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.universityRef,
                                                                          )
                                                                          .where(
                                                                            'categoryRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.categoryRef,
                                                                          ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);

                                                                    await currentUserReference!
                                                                        .update(
                                                                            createUsersRecordData(
                                                                      courseLevel:
                                                                          createInstructorCourseLevelStruct(
                                                                        branchName:
                                                                            _model.dropDownValue4,
                                                                        branchRef: _model
                                                                            .branchRslt1
                                                                            ?.reference,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                    _model.branchLevelSet =
                                                                        'set';
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    _model.branchRslt =
                                                                        await queryBranchRecordOnce(
                                                                      queryBuilder: (branchRecord) => branchRecord
                                                                          .where(
                                                                            'name',
                                                                            isEqualTo:
                                                                                _model.dropDownValue3,
                                                                          )
                                                                          .where(
                                                                            'universityRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.universityRef,
                                                                          )
                                                                          .where(
                                                                            'categoryRef',
                                                                            isEqualTo:
                                                                                currentUserDocument?.courseLevel?.categoryRef,
                                                                          ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);

                                                                    await currentUserReference!
                                                                        .update(
                                                                            createUsersRecordData(
                                                                      courseLevel:
                                                                          createInstructorCourseLevelStruct(
                                                                        branchName:
                                                                            _model.dropDownValue4,
                                                                        branchRef: _model
                                                                            .branchRslt
                                                                            ?.reference,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                    _model.branchLevelSet =
                                                                        'unset';
                                                                    safeSetState(
                                                                        () {});
                                                                  }

                                                                  FFAppState()
                                                                      .branchChange = 2;
                                                                  safeSetState(
                                                                      () {});

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                width: 300.0,
                                                                height: 50.0,
                                                                maxHeight:
                                                                    250.0,
                                                                searchHintTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                        ),
                                                                searchTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'z8bywezt' /* Select branch... */,
                                                                ),
                                                                searchHintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'qbsj9p4r' /* Search for an item... */,
                                                                ),
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                borderWidth:
                                                                    2.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isSearchable:
                                                                    true,
                                                                isMultiSelect:
                                                                    false,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Text(
                                                          '${currentUserDocument?.courseLevel?.branchName}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (FFAppState()
                                                          .branchChange ==
                                                      2)
                                                    StreamBuilder<
                                                        List<BranchRecord>>(
                                                      stream: queryBranchRecord(
                                                        queryBuilder:
                                                            (branchRecord) =>
                                                                branchRecord
                                                                    .where(
                                                          'name',
                                                          isEqualTo: _model
                                                              .dropDownValue4,
                                                        ),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 10.0,
                                                              height: 10.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Color(
                                                                      0x00DF473F),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<BranchRecord>
                                                            changeBranchBranchRecordList =
                                                            snapshot.data!;
                                                        final changeBranchBranchRecord =
                                                            changeBranchBranchRecordList
                                                                    .isNotEmpty
                                                                ? changeBranchBranchRecordList
                                                                    .first
                                                                : null;

                                                        return wrapWithModel(
                                                          model: _model
                                                              .changeBranchModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              ChangeBranchWidget(
                                                            parameter1:
                                                                changeBranchBranchRecord
                                                                    ?.reference,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Container(
                                                width: 22.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .descriptionTextController,
                                                  focusNode: _model
                                                      .descriptionFocusNode,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '6d24gmiu' /* Description */,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                32.0,
                                                                20.0,
                                                                12.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 3,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  validator: _model
                                                      .descriptionTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 16.0, 0.0),
                                              child: Container(
                                                width: 22.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .whatyouwilllearnTextController1,
                                                  focusNode: _model
                                                      .whatyouwilllearnFocusNode1,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'r2lpa6ea' /* What you will learn */,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                32.0,
                                                                20.0,
                                                                12.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 3,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  validator: _model
                                                      .whatyouwilllearnTextController1Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 0.0, 0.0),
                                          child: Container(
                                            width: 22.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .whatyouwilllearnTextController2,
                                              focusNode: _model
                                                  .whatyouwilllearnFocusNode2,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'unk4upiq' /* Course Requirement */,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 32.0,
                                                            20.0, 12.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              textAlign: TextAlign.start,
                                              maxLines: null,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: _model
                                                  .whatyouwilllearnTextController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 16.0, 15.0, 0.0),
                                          child: Container(
                                            width: 22.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.inputTextController,
                                              focusNode: _model.inputFocusNode,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'z0see5ry' /* Total Course Duration(hours) */,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(16.0, 24.0,
                                                            0.0, 24.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .inputTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp('[0-9]'))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 15.0, 0.0),
                                          child: Container(
                                            width: 22.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .totalNumberofLessonTextController,
                                              focusNode: _model
                                                  .totalNumberofLessonFocusNode,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'jqvynksp' /* Total Number of Lessons */,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 32.0,
                                                            20.0, 12.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              textAlign: TextAlign.start,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .totalNumberofLessonTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp('[0-9]'))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: Container(
                                            width: 22.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .bookingLimitTextController,
                                              focusNode:
                                                  _model.bookingLimitFocusNode,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'k27caqng' /* Student Limit */,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 32.0,
                                                            20.0, 12.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              textAlign: TextAlign.start,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .bookingLimitTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp('[0-9]'))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '0r6i1vbc' /* Course Type */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    FlutterFlowRadioButton(
                                                      options: [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'l9c92vx1' /* Free */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'oeg25xe4' /* Paid */,
                                                        )
                                                      ].toList(),
                                                      onChanged: (val) =>
                                                          safeSetState(() {}),
                                                      controller: _model
                                                              .radioButtonValueController1 ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      optionHeight: 32.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      selectedTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      buttonPosition:
                                                          RadioButtonPosition
                                                              .left,
                                                      direction:
                                                          Axis.horizontal,
                                                      radioButtonColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      inactiveRadioButtonColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      toggleable: false,
                                                      horizontalAlignment:
                                                          WrapAlignment.start,
                                                      verticalAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (_model.radioButtonValue1 ==
                                                  'Paid')
                                                SizedBox(
                                                  height: 100.0,
                                                  child: VerticalDivider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                ),
                                              if (_model.radioButtonValue1 ==
                                                  'Paid')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 16.0, 0.0),
                                                  child: FlutterFlowRadioButton(
                                                    options: [
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'm2srxq62' /* Full Payment */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '3wje98ee' /* EMI Payment */,
                                                      )
                                                    ].toList(),
                                                    onChanged: (val) =>
                                                        safeSetState(() {}),
                                                    controller: _model
                                                            .radioButtonValueController2 ??=
                                                        FormFieldController<
                                                                String>(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                      'bak3cg7z' /* Full Payment */,
                                                    )),
                                                    optionHeight: 32.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    selectedTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumFamily),
                                                            ),
                                                    buttonPosition:
                                                        RadioButtonPosition
                                                            .left,
                                                    direction: Axis.vertical,
                                                    radioButtonColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    inactiveRadioButtonColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    toggleable: false,
                                                    horizontalAlignment:
                                                        WrapAlignment.start,
                                                    verticalAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (_model.radioButtonValue1 == 'Paid')
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 8.0, 0.0),
                                            child: Container(
                                              width: 22.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.priceTextController,
                                                focusNode:
                                                    _model.priceFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '78f2en11' /* Full Price* */,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 32.0,
                                                              20.0, 12.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                textAlign: TextAlign.start,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .priceTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if ((_model.radioButtonValue1 ==
                                              'Paid') &&
                                          (_model.radioButtonValue2 ==
                                              'EMI Payment'))
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 16.0, 8.0, 0.0),
                                            child: Container(
                                              width: 22.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .firstEMIPriceTextController,
                                                focusNode: _model
                                                    .firstEMIPriceFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'amxdbv4b' /* First EMI Price* */,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 32.0,
                                                              20.0, 12.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                textAlign: TextAlign.start,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .firstEMIPriceTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if ((_model.radioButtonValue1 ==
                                              'Paid') &&
                                          (_model.radioButtonValue2 ==
                                              'EMI Payment'))
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 16.0, 8.0, 0.0),
                                            child: Container(
                                              width: 22.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .secondEMIPriceTextController,
                                                focusNode: _model
                                                    .secondEMIPriceFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'tq1qer7w' /* Second EMI Price* */,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 32.0,
                                                              20.0, 12.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                textAlign: TextAlign.start,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .secondEMIPriceTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if ((_model.radioButtonValue1 ==
                                              'Paid') &&
                                          (_model.radioButtonValue2 ==
                                              'EMI Payment'))
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 16.0, 0.0, 0.0),
                                            child: Container(
                                              width: 22.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .thirdEMIPriceTextController,
                                                focusNode: _model
                                                    .thirdEMIPriceFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'wdfuzl1v' /* Third EMI Price* */,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 32.0,
                                                              20.0, 12.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                textAlign: TextAlign.start,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .thirdEMIPriceTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  if ((_model.radioButtonValue1 == 'Paid') &&
                                      (_model.radioButtonValue2 ==
                                          'EMI Payment'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 0.0, 8.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'v45bi5t2' /* EMI's Notification Date */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  if ((_model.radioButtonValue1 == 'Paid') &&
                                      (_model.radioButtonValue2 ==
                                          'EMI Payment'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                final _datePicked1Date =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate:
                                                      getCurrentTimestamp,
                                                  firstDate:
                                                      getCurrentTimestamp,
                                                  lastDate: DateTime(2050),
                                                  builder: (context, child) {
                                                    return wrapInMaterialDatePickerTheme(
                                                      context,
                                                      child!,
                                                      headerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      headerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      headerTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                                fontSize: 32.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLargeFamily),
                                                              ),
                                                      pickerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      pickerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      selectedDateTimeBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      selectedDateTimeForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      actionButtonForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      iconSize: 24.0,
                                                    );
                                                  },
                                                );

                                                if (_datePicked1Date != null) {
                                                  safeSetState(() {
                                                    _model.datePicked1 =
                                                        DateTime(
                                                      _datePicked1Date.year,
                                                      _datePicked1Date.month,
                                                      _datePicked1Date.day,
                                                    );
                                                  });
                                                }
                                              },
                                              text: _model.datePicked1 != null
                                                  ? dateTimeFormat(
                                                      "yMMMd",
                                                      _model.datePicked1,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )
                                                  : 'Second EMI Date',
                                              icon: Icon(
                                                Icons.date_range_rounded,
                                                size: 18.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 150.0,
                                                height: 45.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Poppins'),
                                                    ),
                                                elevation: 1.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                final _datePicked2Date =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate:
                                                      getCurrentTimestamp,
                                                  firstDate:
                                                      getCurrentTimestamp,
                                                  lastDate: DateTime(2050),
                                                  builder: (context, child) {
                                                    return wrapInMaterialDatePickerTheme(
                                                      context,
                                                      child!,
                                                      headerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      headerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      headerTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                                fontSize: 32.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLargeFamily),
                                                              ),
                                                      pickerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      pickerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      selectedDateTimeBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      selectedDateTimeForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      actionButtonForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      iconSize: 24.0,
                                                    );
                                                  },
                                                );

                                                if (_datePicked2Date != null) {
                                                  safeSetState(() {
                                                    _model.datePicked2 =
                                                        DateTime(
                                                      _datePicked2Date.year,
                                                      _datePicked2Date.month,
                                                      _datePicked2Date.day,
                                                    );
                                                  });
                                                }
                                              },
                                              text: _model.datePicked2 != null
                                                  ? dateTimeFormat(
                                                      "yMMMd",
                                                      _model.datePicked2,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )
                                                  : 'Third EMI Date',
                                              icon: Icon(
                                                Icons.date_range,
                                                size: 18.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 150.0,
                                                height: 45.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Poppins'),
                                                    ),
                                                elevation: 1.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 0.0),
                                          child: Container(
                                            width: 22.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .whatsappGroupLinkTextController,
                                              focusNode: _model
                                                  .whatsappGroupLinkFocusNode,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'hbzpj3kv' /* Whatsapp Group Link */,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 32.0,
                                                            20.0, 12.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              textAlign: TextAlign.start,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .whatsappGroupLinkTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController5 ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue5 ??=
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'rjgyitnf' /* Recommended */,
                                              ),
                                            ),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yqiqvubk' /* None */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'k8j6a5s4' /* Recommended */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'n32hh7kf' /* Featured */,
                                              )
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () => _model.dropDownValue5 =
                                                    val),
                                            width: 280.0,
                                            height: 58.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'rjc6x6eh' /* Add to list */,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 12.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.5,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 16.0,
                                                          15.0, 0.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .dropDownValueController6 ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.dropDownValue6 ??=
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'aoymta4u' /* Draft */,
                                                      ),
                                                    ),
                                                    options: [
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '7g0y99n1' /* Draft */,
                                                      )
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .dropDownValue6 =
                                                            val),
                                                    width: 300.0,
                                                    height: 60.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      't0hfhh8d' /* Select status */,
                                                    ),
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    borderWidth: 2.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord
                                .where(
                                  'userRole',
                                  isEqualTo: 'Instructor',
                                )
                                .where(
                                  'display_name',
                                  isEqualTo: _model.dropDownInstructorValue,
                                ),
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
                            List<UsersRecord> rowUsersRecordList =
                                snapshot.data!;
                            final rowUsersRecord = rowUsersRecordList.isNotEmpty
                                ? rowUsersRecordList.first
                                : null;

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var _shouldSetState = false;
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        if (_model.dropDownValue1 == null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      ' Please select \"Country\" and try again.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          return;
                                        }
                                        if (_model.dropDownValue2 == null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      ' Please select \"University\" and try again.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          return;
                                        }
                                        if (_model.dropDownValue3 == null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      ' Please select \"Category\" and try again.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          return;
                                        }
                                        if (_model.dropDownValue4 == null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      ' Please select \"Branch\" and try again.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          return;
                                        }
                                        if (_model.radioButtonValue1 == null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      ' Please select \"Course Price type\" and try again.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          return;
                                        }
                                        _model.settingRslt1 =
                                            await querySettingsRecordOnce(
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;
                                        if (((_model
                                                        .priceTextController.text ==
                                                    '0') ||
                                                (_model
                                                        .firstEMIPriceTextController
                                                        .text ==
                                                    '0') ||
                                                (_model.secondEMIPriceTextController
                                                        .text ==
                                                    '0') ||
                                                (_model.thirdEMIPriceTextController
                                                        .text ==
                                                    '0')) &&
                                            (_model.radioButtonValue1 ==
                                                'Paid') &&
                                            (_model.radioButtonValue2 ==
                                                'EMI Payment')) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'Please enter all the prices.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          if ((_model.priceTextController
                                                      .text ==
                                                  '0') &&
                                              (_model.radioButtonValue1 ==
                                                  'Paid') &&
                                              (_model.radioButtonValue2 ==
                                                  'Full Payment')) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'Please enter all the prices.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            if ((functions.returnPriceBasedResult(
                                                        double.parse(_model
                                                            .priceTextController
                                                            .text),
                                                        double.parse(_model
                                                            .firstEMIPriceTextController
                                                            .text),
                                                        double.parse(_model
                                                            .secondEMIPriceTextController
                                                            .text),
                                                        double.parse(_model
                                                            .thirdEMIPriceTextController
                                                            .text)) ==
                                                    true) &&
                                                (_model.radioButtonValue2 ==
                                                    'EMI Payment')) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'The total EMI price must not be less than the full payment price.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              if ((currentUserDocument?.courseLevel?.coutryRef == null) ||
                                                  (currentUserDocument
                                                          ?.courseLevel
                                                          ?.universityRef ==
                                                      null) ||
                                                  (currentUserDocument
                                                          ?.courseLevel
                                                          ?.branchRef ==
                                                      null) ||
                                                  (currentUserDocument
                                                          ?.courseLevel
                                                          ?.categoryRef ==
                                                      null)) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'Please select the required dropdown fields (Country, University, Category and Branch)'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              } else {
                                                var courseRecordReference =
                                                    CourseRecord.collection
                                                        .doc();
                                                await courseRecordReference
                                                    .set({
                                                  ...createCourseRecordData(
                                                    name: _model
                                                        .nameTextController
                                                        .text,
                                                    image: FFAppState()
                                                        .courseImgFeature,
                                                    description: _model
                                                        .descriptionTextController
                                                        .text,
                                                    subtitle: _model
                                                        .subtitleTextController
                                                        .text,
                                                    price: double.tryParse(
                                                        _model
                                                            .priceTextController
                                                            .text),
                                                    firstEMIprice:
                                                        double.tryParse(_model
                                                            .firstEMIPriceTextController
                                                            .text),
                                                    secondEMIprice:
                                                        double.tryParse(_model
                                                            .secondEMIPriceTextController
                                                            .text),
                                                    thirdEMIprice:
                                                        double.tryParse(_model
                                                            .thirdEMIPriceTextController
                                                            .text),
                                                    authorRef: () {
                                                      if (_model.authrRef !=
                                                          null) {
                                                        return _model.authrRef;
                                                      } else if (FFAppState()
                                                              .currentUserRole ==
                                                          'Admin') {
                                                        return FFAppState()
                                                            .currentUserRef;
                                                      } else {
                                                        return FFAppState()
                                                            .currentUserRef;
                                                      }
                                                    }(),
                                                    universityRef:
                                                        currentUserDocument
                                                            ?.courseLevel
                                                            ?.universityRef,
                                                    branchRef:
                                                        currentUserDocument
                                                            ?.courseLevel
                                                            ?.branchRef,
                                                    countryRef:
                                                        currentUserDocument
                                                            ?.courseLevel
                                                            ?.coutryRef,
                                                    whatsappGroupLink: _model
                                                        .whatsappGroupLinkTextController
                                                        .text,
                                                    totalCourseHour:
                                                        int.tryParse(_model
                                                            .inputTextController
                                                            .text),
                                                    courseLearn: _model
                                                        .whatyouwilllearnTextController1
                                                        .text,
                                                    courseRequirement: _model
                                                        .whatyouwilllearnTextController2
                                                        .text,
                                                    numberLessons: int.tryParse(
                                                        _model
                                                            .totalNumberofLessonTextController
                                                            .text),
                                                    coursePaymentType: _model
                                                        .radioButtonValue1,
                                                    status:
                                                        _model.dropDownValue6,
                                                    videoRef:
                                                        FFAppState().videoRef,
                                                    bookingLimit: int.tryParse(
                                                        _model
                                                            .bookingLimitTextController
                                                            .text),
                                                    bookedCount: int.tryParse(_model
                                                        .bookingLimitTextController
                                                        .text),
                                                    categoryRef:
                                                        currentUserDocument
                                                            ?.courseLevel
                                                            ?.categoryRef,
                                                    sku:
                                                        '${_model.settingRslt1?.productSKU?.label}${_model.settingRslt1?.productSKU?.labelnum?.toString()}',
                                                    emiPaymentStatus:
                                                        _model.radioButtonValue2 ==
                                                                'EMI Payment'
                                                            ? true
                                                            : false,
                                                    dateSecondEMIEmail:
                                                        _model.datePicked1,
                                                    dateThirdEMIEmail:
                                                        _model.datePicked2,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'listView': [
                                                        _model.dropDownValue5
                                                      ],
                                                    },
                                                  ),
                                                });
                                                _model.courseNewRef =
                                                    CourseRecord
                                                        .getDocumentFromData({
                                                  ...createCourseRecordData(
                                                    name: _model
                                                        .nameTextController
                                                        .text,
                                                    image: FFAppState()
                                                        .courseImgFeature,
                                                    description: _model
                                                        .descriptionTextController
                                                        .text,
                                                    subtitle: _model
                                                        .subtitleTextController
                                                        .text,
                                                    price: double.tryParse(
                                                        _model
                                                            .priceTextController
                                                            .text),
                                                    firstEMIprice:
                                                        double.tryParse(_model
                                                            .firstEMIPriceTextController
                                                            .text),
                                                    secondEMIprice:
                                                        double.tryParse(_model
                                                            .secondEMIPriceTextController
                                                            .text),
                                                    thirdEMIprice:
                                                        double.tryParse(_model
                                                            .thirdEMIPriceTextController
                                                            .text),
                                                    authorRef: () {
                                                      if (_model.authrRef !=
                                                          null) {
                                                        return _model.authrRef;
                                                      } else if (FFAppState()
                                                              .currentUserRole ==
                                                          'Admin') {
                                                        return FFAppState()
                                                            .currentUserRef;
                                                      } else {
                                                        return FFAppState()
                                                            .currentUserRef;
                                                      }
                                                    }(),
                                                    universityRef:
                                                        currentUserDocument
                                                            ?.courseLevel
                                                            ?.universityRef,
                                                    branchRef:
                                                        currentUserDocument
                                                            ?.courseLevel
                                                            ?.branchRef,
                                                    countryRef:
                                                        currentUserDocument
                                                            ?.courseLevel
                                                            ?.coutryRef,
                                                    whatsappGroupLink: _model
                                                        .whatsappGroupLinkTextController
                                                        .text,
                                                    totalCourseHour:
                                                        int.tryParse(_model
                                                            .inputTextController
                                                            .text),
                                                    courseLearn: _model
                                                        .whatyouwilllearnTextController1
                                                        .text,
                                                    courseRequirement: _model
                                                        .whatyouwilllearnTextController2
                                                        .text,
                                                    numberLessons: int.tryParse(
                                                        _model
                                                            .totalNumberofLessonTextController
                                                            .text),
                                                    coursePaymentType: _model
                                                        .radioButtonValue1,
                                                    status:
                                                        _model.dropDownValue6,
                                                    videoRef:
                                                        FFAppState().videoRef,
                                                    bookingLimit: int.tryParse(
                                                        _model
                                                            .bookingLimitTextController
                                                            .text),
                                                    bookedCount: int.tryParse(_model
                                                        .bookingLimitTextController
                                                        .text),
                                                    categoryRef:
                                                        currentUserDocument
                                                            ?.courseLevel
                                                            ?.categoryRef,
                                                    sku:
                                                        '${_model.settingRslt1?.productSKU?.label}${_model.settingRslt1?.productSKU?.labelnum?.toString()}',
                                                    emiPaymentStatus:
                                                        _model.radioButtonValue2 ==
                                                                'EMI Payment'
                                                            ? true
                                                            : false,
                                                    dateSecondEMIEmail:
                                                        _model.datePicked1,
                                                    dateThirdEMIEmail:
                                                        _model.datePicked2,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'listView': [
                                                        _model.dropDownValue5
                                                      ],
                                                    },
                                                  ),
                                                }, courseRecordReference);
                                                _shouldSetState = true;

                                                await _model
                                                    .settingRslt1!.reference
                                                    .update(
                                                        createSettingsRecordData(
                                                  productSKU:
                                                      createOrderUniqueStruct(
                                                    fieldValues: {
                                                      'labelnum':
                                                          FieldValue.increment(
                                                              1),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                                _model.userIP1 = await actions
                                                    .getUserIPaddress();
                                                _shouldSetState = true;
                                                _model.userSession1 =
                                                    await actions
                                                        .getUserSessionID(
                                                  currentUserUid,
                                                );
                                                _shouldSetState = true;

                                                await ActivityLogRecord
                                                    .collection
                                                    .doc()
                                                    .set({
                                                  ...createActivityLogRecordData(
                                                    userRef:
                                                        currentUserReference,
                                                    userIP: _model.userIP1,
                                                    userRole: valueOrDefault(
                                                        currentUserDocument
                                                            ?.userRole,
                                                        ''),
                                                    userDeviceID:
                                                        _model.userSession1,
                                                    createdAt:
                                                        getCurrentTimestamp,
                                                    eventType: 'Created',
                                                    object: 'Course',
                                                    eventId: _model.courseNewRef
                                                        ?.reference.id,
                                                    eventTitle: _model
                                                        .nameTextController
                                                        .text,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'eventStatus': ['Create'],
                                                    },
                                                  ),
                                                });
                                                FFAppState().courseImgGallery =
                                                    [];
                                                FFAppState().courseImgFeature =
                                                    '';
                                                FFAppState().courseCatImg = '';
                                                FFAppState().video = '';
                                                FFAppState().file = '';
                                                safeSetState(() {});
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child: Container(
                                                          width: 400.0,
                                                          child:
                                                              BatchCourseCreatTimeBatchListWidget(
                                                            courseRef: _model
                                                                .courseNewRef!,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Course Added Successfuly',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }
                                            }
                                          }
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      child: wrapWithModel(
                                        model: _model.addButtonModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AddButtonWidget(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'wqjxvkap' /* Save */,
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
