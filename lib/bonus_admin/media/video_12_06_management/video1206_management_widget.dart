import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/bonus_admin/media/video_play_button/video_play_button_widget.dart';
import '/bonus_admin/media/video_preview/video_preview_widget.dart';
import '/bonus_admin/media/video_upload_video_list/video_upload_video_list_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'video1206_management_model.dart';
export 'video1206_management_model.dart';

class Video1206ManagementWidget extends StatefulWidget {
  const Video1206ManagementWidget({super.key});

  @override
  State<Video1206ManagementWidget> createState() =>
      _Video1206ManagementWidgetState();
}

class _Video1206ManagementWidgetState extends State<Video1206ManagementWidget> {
  late Video1206ManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Video1206ManagementModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().currentUserRole == 'Instructor') {
        _model.userAuthRslt1 =
            await UsersRecord.getDocumentOnce(FFAppState().currentUserRef!);
        if ((_model.userAuthRslt1 != null) == true) {
          if (_model.userAuthRslt1?.userRole == 'Instructor') {
            _model.userFolderStatusRslt1 = await SearchByFolderNameCall.call(
              folderName: FFAppState().currentUserRef?.id,
            );

            if ((_model.userFolderStatusRslt1?.succeeded ?? true)) {
              if (getJsonField(
                    (_model.userFolderStatusRslt1?.jsonBody ?? ''),
                    r'''$.folders[:].name''',
                  ) ==
                  null) {
                _model.userFolderCreationRslt1 = await CreateFolderCall.call(
                  folderName: FFAppState().currentUserRef?.id,
                  parentFolderID: 'c000e7ede52e4745a592b3b3933d662a',
                );

                if ((_model.userFolderCreationRslt1?.succeeded ?? true)) {
                  await FFAppState()
                      .currentUserRef!
                      .update(createUsersRecordData(
                        instructorFolderID: CreateFolderCall.instructorFolderID(
                          (_model.userFolderCreationRslt1?.jsonBody ?? ''),
                        ),
                        instructorFolderStatus: 'Success',
                      ));
                  FFAppState().currentInstructorFolderID =
                      CreateFolderCall.instructorFolderID(
                    (_model.userFolderCreationRslt1?.jsonBody ?? ''),
                  )!;
                  FFAppState().currentUserRole = 'Instructor';
                  FFAppState().currentUserRef = currentUserReference;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Instructor folder was not initiated.',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );
                  return;
                }
              } else {
                FFAppState().currentInstructorFolderID =
                    _model.userAuthRslt1!.instructorFolderID;
                FFAppState().currentUserRole = 'Instructor';
                FFAppState().currentUserRef = currentUserReference;
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Instructor folder was not checked.',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );
              return;
            }

            _model.userFolderVideoListRslt1 =
                await ListVideoBasedFolderIDCall.call(
              folderId: FFAppState().currentInstructorFolderID,
            );

            if ((_model.userFolderVideoListRslt1?.succeeded ?? true)) {
              _model.instructorVideoList = 'show';
              safeSetState(() {});
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'The Media library is empty.',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );
            }
          }
        } else {
          FFAppState().currentUserRef = currentUserReference;
          _model.refresh = _model.refresh! + 1;
          safeSetState(() {});
        }
      }
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
    context.watch<FFAppState>();

    return Title(
        title: 'Video-12_06_Management',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ) &&
                    !isWeb
                ? AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    automaticallyImplyLeading: false,
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'mvez58uj' /* Contracts */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).displaySmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .displaySmallFamily),
                          ),
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 0.0,
                  )
                : null,
            body: Stack(
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
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
                              wrapWithModel(
                                model: _model.webNavModel,
                                updateCallback: () => safeSetState(() {}),
                                child: WebNavWidget(
                                  colorBgOne: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  colorBgTwo: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  colorBgThree: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  colorBgFour: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textOne: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  textTwo: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  textThree:
                                      FlutterFlowTheme.of(context).primaryText,
                                  textFour: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  colorBgFive: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textFive: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  colorBgSix: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  expand: false,
                                  colorBgPrimarydropdown:
                                      FlutterFlowTheme.of(context).accent4,
                                  colorBgSeventeen: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                            Expanded(
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Container(
                                        width: double.infinity,
                                        height: 34.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yp5im3mb' /* Media Management */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily),
                                                      ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              AlignedTooltip(
                                                content: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '8et5ilo2' /* Reload */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily),
                                                        ),
                                                  ),
                                                ),
                                                offset: 4.0,
                                                preferredDirection:
                                                    AxisDirection.down,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 4.0,
                                                tailBaseWidth: 24.0,
                                                tailLength: 12.0,
                                                waitDuration:
                                                    Duration(milliseconds: 100),
                                                showDuration: Duration(
                                                    milliseconds: 1500),
                                                triggerMode:
                                                    TooltipTriggerMode.tap,
                                                child: Visibility(
                                                  visible: FFAppState()
                                                          .currentUserRole ==
                                                      'Instructor',
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.goNamed(
                                                          'Video-12_06_Management');
                                                    },
                                                    child: Icon(
                                                      Icons.refresh_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 32.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (_model.uploadVisibility ==
                                                      'Show') {
                                                    _model.uploadVisibility =
                                                        'Pending';
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.uploadVisibility =
                                                        'Show';
                                                    safeSetState(() {});
                                                  }
                                                },
                                                child: wrapWithModel(
                                                  model: _model.addButtonModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: AddButtonWidget(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '2k2yvs18' /* Add */,
                                                    ),
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                    height: 50,
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (_model.uploadVisibility == 'Show')
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: ClipRRect(
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  16.0,
                                                                  8.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.uploadVisibility =
                                                              'Pending';
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.close_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 36.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        FlutterFlowWebView(
                                                      content: functions.returnHTMLcode(
                                                          valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.userRole,
                                                                      '') ==
                                                                  'Admin'
                                                              ? 'c000e7ede52e4745a592b3b3933d662a'
                                                              : valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.instructorFolderID,
                                                                  ''),
                                                          'Bonus')!,
                                                      height: 300.0,
                                                      verticalScroll: false,
                                                      horizontalScroll: false,
                                                      html: true,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    wrapWithModel(
                                      model: _model.videoUploadVideoListModel,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: VideoUploadVideoListWidget(
                                        status: 'Admin',
                                      ),
                                    ),
                                    if (FFAppState().currentUserRole == 'Admin')
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child:
                                            StreamBuilder<List<VideosRecord>>(
                                          stream: queryVideosRecord(
                                            queryBuilder: (videosRecord) =>
                                                videosRecord.orderBy(
                                                    'createdAt',
                                                    descending: true),
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
                                            List<VideosRecord>
                                                gridViewVideosRecordList =
                                                snapshot.data!;

                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            kBreakpointLarge
                                                        ? 5
                                                        : 6,
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 10.0,
                                                childAspectRatio: 1.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  gridViewVideosRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, gridViewIndex) {
                                                final gridViewVideosRecord =
                                                    gridViewVideosRecordList[
                                                        gridViewIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().videoRef =
                                                        null;
                                                    _model.apiResultdeqCopy =
                                                        await OTPAndPBICall
                                                            .call(
                                                      videoId:
                                                          gridViewVideosRecord
                                                              .videoId,
                                                      userName: '          ',
                                                      userid: valueOrDefault<
                                                          String>(
                                                        currentUserReference
                                                            ?.id,
                                                        '1234',
                                                      ),
                                                    );

                                                    if ((_model.apiResultdeqCopy
                                                            ?.succeeded ??
                                                        true)) {
                                                      context.pushNamed(
                                                        'Video-Editor',
                                                        queryParameters: {
                                                          'videoRef':
                                                              serializeParam(
                                                            gridViewVideosRecord,
                                                            ParamType.Document,
                                                          ),
                                                          'otp': serializeParam(
                                                            OTPAndPBICall.otp(
                                                              (_model.apiResultdeqCopy
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                          'playbackinfo':
                                                              serializeParam(
                                                            OTPAndPBICall
                                                                .playbackInfo(
                                                              (_model.apiResultdeqCopy
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'videoRef':
                                                              gridViewVideosRecord,
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'API Failed',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      gridViewVideosRecord
                                                                          .images,
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/academy-backend-uubu81/assets/fnk8usux3q1j/Placeholder.png',
                                                                    ),
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 65.0,
                                                                    height:
                                                                        65.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.apiResultdeq =
                                                                              await OTPAndPBICall.call(
                                                                            videoId:
                                                                                gridViewVideosRecord.videoId,
                                                                            userName:
                                                                                '          ',
                                                                            userid:
                                                                                valueOrDefault<String>(
                                                                              currentUserUid,
                                                                              '1234',
                                                                            ),
                                                                          );

                                                                          if ((_model.apiResultdeq?.succeeded ??
                                                                              true)) {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: WebViewAware(
                                                                                    child: GestureDetector(
                                                                                      onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                      child: Container(
                                                                                        width: 600.0,
                                                                                        child: VideoPreviewWidget(
                                                                                          videoRef: gridViewVideosRecord,
                                                                                          otp: OTPAndPBICall.otp(
                                                                                            (_model.apiResultdeq?.jsonBody ?? ''),
                                                                                          )!,
                                                                                          playbackInfo: OTPAndPBICall.playbackInfo(
                                                                                            (_model.apiResultdeq?.jsonBody ?? ''),
                                                                                          )!,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          } else {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Video fetching, Please wait...',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 3000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                              ),
                                                                            );
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            VideoPlayButtonWidget(
                                                                          key: Key(
                                                                              'Key77f_${gridViewIndex}_of_${gridViewVideosRecordList.length}'),
                                                                          parameter1:
                                                                              gridViewVideosRecord.videoId,
                                                                          parameter2:
                                                                              gridViewVideosRecord,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Text(
                                                              gridViewVideosRecord
                                                                  .title
                                                                  .maybeHandleOverflow(
                                                                maxChars: 15,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              if (gridViewVideosRecord
                                                                      .fileSizeMB !=
                                                                  0.0)
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .video_file_outlined,
                                                                        color: Color(
                                                                            0xFFEA9A9C),
                                                                        size:
                                                                            14.0,
                                                                      ),
                                                                      AutoSizeText(
                                                                        '${(gridViewVideosRecord.fileSizeMB / 1024).toStringAsFixed(2)}gb ',
                                                                        maxLines:
                                                                            1,
                                                                        minFontSize:
                                                                            10.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                              if (gridViewVideosRecord
                                                                      .duration !=
                                                                  '0')
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .timer_sharp,
                                                                      color: Color(
                                                                          0xFFEA9A9C),
                                                                      size:
                                                                          14.0,
                                                                    ),
                                                                    AutoSizeText(
                                                                      '${((int.parse(gridViewVideosRecord.duration) / 60).floor()).toString()}min'
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            21,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          1,
                                                                      minFontSize:
                                                                          10.0,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                            ].divide(SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    if ((FFAppState().currentUserRole ==
                                            'Instructor') &&
                                        (_model.instructorVideoList == 'show'))
                                      Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Builder(
                                          builder: (context) {
                                            final videoList =
                                                ListVideoBasedFolderIDCall
                                                        .videoId(
                                                      (_model.userFolderVideoListRslt1
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList() ??
                                                    [];
                                            if (videoList.isEmpty) {
                                              return Center(
                                                child: EmptyMessageWidget(
                                                  emptyText: '  ',
                                                  status: 'media',
                                                ),
                                              );
                                            }

                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    MediaQuery.sizeOf(context)
                                                                .width <
                                                            kBreakpointLarge
                                                        ? 5
                                                        : 6,
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 10.0,
                                                childAspectRatio: 1.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: videoList.length,
                                              itemBuilder:
                                                  (context, videoListIndex) {
                                                final videoListItem =
                                                    videoList[videoListIndex];
                                                return FutureBuilder<int>(
                                                  future:
                                                      queryVideosRecordCount(
                                                    queryBuilder:
                                                        (videosRecord) =>
                                                            videosRecord.where(
                                                      'videoId',
                                                      isEqualTo: videoListItem,
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
                                                    int stackCount =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      child: Stack(
                                                        children: [
                                                          if (stackCount > 0)
                                                            StreamBuilder<
                                                                List<
                                                                    VideosRecord>>(
                                                              stream:
                                                                  queryVideosRecord(
                                                                queryBuilder:
                                                                    (videosRecord) =>
                                                                        videosRecord
                                                                            .where(
                                                                  'videoId',
                                                                  isEqualTo:
                                                                      videoListItem,
                                                                ),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          10.0,
                                                                      height:
                                                                          10.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          Color(
                                                                              0x00DF473F),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<VideosRecord>
                                                                    containerVideosRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final containerVideosRecord =
                                                                    containerVideosRecordList
                                                                            .isNotEmpty
                                                                        ? containerVideosRecordList
                                                                            .first
                                                                        : null;

                                                                return Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                              .videoRef =
                                                                          null;
                                                                      _model.apiResultdeqCopyCopy =
                                                                          await OTPAndPBICall
                                                                              .call(
                                                                        videoId:
                                                                            videoListItem,
                                                                        userName:
                                                                            currentUserEmail,
                                                                      );

                                                                      if ((_model
                                                                              .apiResultdeqCopyCopy
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        context
                                                                            .pushNamed(
                                                                          'Video-Editor',
                                                                          queryParameters:
                                                                              {
                                                                            'videoRef':
                                                                                serializeParam(
                                                                              containerVideosRecord,
                                                                              ParamType.Document,
                                                                            ),
                                                                            'otp':
                                                                                serializeParam(
                                                                              OTPAndPBICall.otp(
                                                                                (_model.apiResultdeqCopyCopy?.jsonBody ?? ''),
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                            'playbackinfo':
                                                                                serializeParam(
                                                                              OTPAndPBICall.playbackInfo(
                                                                                (_model.apiResultdeqCopyCopy?.jsonBody ?? ''),
                                                                              ),
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'videoRef':
                                                                                containerVideosRecord,
                                                                            kTransitionInfoKey:
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.fade,
                                                                              duration: Duration(milliseconds: 0),
                                                                            ),
                                                                          },
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'API Failed',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  containerVideosRecord!.images,
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  gradient: LinearGradient(
                                                                                    colors: [
                                                                                      Color(0x00F4F6FC),
                                                                                      Color(0x5F101213)
                                                                                    ],
                                                                                    stops: [
                                                                                      0.0,
                                                                                      1.0
                                                                                    ],
                                                                                    begin: AlignmentDirectional(0.0, -1.0),
                                                                                    end: AlignmentDirectional(0, 1.0),
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) => InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      _model.apiResultdeq1 = await OTPAndPBICall.call(
                                                                                        videoId: videoListItem,
                                                                                        userName: currentUserEmail,
                                                                                        userid: currentUserUid,
                                                                                      );

                                                                                      if ((_model.apiResultdeq1?.succeeded ?? true)) {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (dialogContext) {
                                                                                            return Dialog(
                                                                                              elevation: 0,
                                                                                              insetPadding: EdgeInsets.zero,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              child: WebViewAware(
                                                                                                child: GestureDetector(
                                                                                                  onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                                    child: VideoPreviewWidget(
                                                                                                      videoRef: containerVideosRecord!,
                                                                                                      otp: OTPAndPBICall.otp(
                                                                                                        (_model.apiResultdeq1?.jsonBody ?? ''),
                                                                                                      )!,
                                                                                                      playbackInfo: OTPAndPBICall.playbackInfo(
                                                                                                        (_model.apiResultdeq1?.jsonBody ?? ''),
                                                                                                      )!,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'API Failed',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                      }

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.play_circle,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 50.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              16.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            containerVideosRecord!.title.maybeHandleOverflow(maxChars: 15),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            if (containerVideosRecord?.fileSizeMB !=
                                                                                0.0)
                                                                              Expanded(
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.video_file_outlined,
                                                                                      color: Color(0xFFEA9A9C),
                                                                                      size: 14.0,
                                                                                    ),
                                                                                    AutoSizeText(
                                                                                      '${(containerVideosRecord!.fileSizeMB / 1024).toStringAsFixed(2)}gb ',
                                                                                      maxLines: 1,
                                                                                      minFontSize: 10.0,
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 4.0)),
                                                                                ),
                                                                              ),
                                                                            if (containerVideosRecord?.duration !=
                                                                                '0')
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.timer_sharp,
                                                                                    color: Color(0xFFEA9A9C),
                                                                                    size: 14.0,
                                                                                  ),
                                                                                  AutoSizeText(
                                                                                    '${((int.parse(containerVideosRecord!.duration) / 60).floor()).toString()}min'.maybeHandleOverflow(
                                                                                      maxChars: 21,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    textAlign: TextAlign.start,
                                                                                    maxLines: 1,
                                                                                    minFontSize: 10.0,
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 4.0)),
                                                                              ),
                                                                          ].divide(SizedBox(width: 4.0)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          if (stackCount == 0)
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child: Lottie
                                                                        .asset(
                                                                      'assets/lottie_animations/animation_ll69bvmj.json',
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              1.0,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      animate:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                  Lottie.asset(
                                                                    'assets/lottie_animations/animation_ll69bvmj.json',
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        35.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    animate:
                                                                        true,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
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
                    ],
                  ),
                wrapWithModel(
                  model: _model.mobileModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MobileWidget(),
                ),
                wrapWithModel(
                  model: _model.initialUserStatusCheckModel,
                  updateCallback: () => safeSetState(() {}),
                  child: InitialUserStatusCheckWidget(),
                ),
              ],
            ),
          ),
        ));
  }
}
