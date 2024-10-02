import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/bonus_admin/media/video_folder_creation/video_folder_creation_widget.dart';
import '/bonus_admin/media/video_folder_edit/video_folder_edit_widget.dart';
import '/bonus_admin/media/video_preview/video_preview_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'video_management_model.dart';
export 'video_management_model.dart';

class VideoManagementWidget extends StatefulWidget {
  const VideoManagementWidget({
    super.key,
    this.folder,
    String? status,
  }) : this.status = status ?? 'Main';

  final FolderRecord? folder;
  final String status;

  @override
  State<VideoManagementWidget> createState() => _VideoManagementWidgetState();
}

class _VideoManagementWidgetState extends State<VideoManagementWidget>
    with TickerProviderStateMixin {
  late VideoManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoManagementModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.mainFolderResult1 = await queryFolderRecordOnce(
        queryBuilder: (folderRecord) => folderRecord.where(
          'folder_main_id',
          isEqualTo: widget!.status != 'subfolder'
              ? (FFAppState().currentUserRole == 'Instructor'
                  ? valueOrDefault(currentUserDocument?.folderID, '')
                  : 'BSFL1000')
              : widget!.folder?.folderMainId,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if ((_model.mainFolderResult1 != null) == true) {
        if ((_model.mainFolderResult1!.folderSubfolderInfo.length > 0) &&
            (_model.folderShow == 'hide')) {
          _model.folderList = _model.mainFolderResult1!.folderSubfolderInfo
              .toList()
              .cast<FolderInfoStruct>();
          _model.folderShow = 'show';
        }
        _model.userFolderVideoListRslt2 = await TagBasedListNewRohitCall.call(
          tagname: _model.mainFolderResult1?.folderMainId,
          pageno: _model.presentPageNumber,
          limit: _model.pageLimit,
        );

        if ((_model.userFolderVideoListRslt2?.succeeded ?? true)) {
          _model.mainShow = 'show';
          if (TagBasedListNewRohitCall.videoCount(
                (_model.userFolderVideoListRslt2?.jsonBody ?? ''),
              )! >
              0) {
            _model.totalVideo = TagBasedListNewRohitCall.videoCount(
              (_model.userFolderVideoListRslt2?.jsonBody ?? ''),
            );
            _model.tagBasedVideoList = TagBasedListNewRohitCall.videoId(
              (_model.userFolderVideoListRslt2?.jsonBody ?? ''),
            )!
                .toList()
                .cast<String>();
            _model.numberOfPage =
                ((_model.totalVideo!) / (_model.pageLimit!)).ceil();
            _model.startIndex =
                (_model.pageLimit!) * ((_model.presentPageNumber!) - 1);
            _model.endIndex = _model.presentPageNumber == _model.numberOfPage
                ? ((_model.totalVideo!) - 1)
                : ((((_model.pageLimit!) * ((_model.presentPageNumber!) - 1)) +
                        (_model.pageLimit!)) -
                    1);
            _model.last =
                (((_model.totalVideo!) / (_model.pageLimit!)).round()) == 0
                    ? 1
                    : (((_model.totalVideo!) / (_model.pageLimit!)).ceil());
          }
          FFAppState().refresh = FFAppState().refresh + 1;
          safeSetState(() {});
        }
      }
    });

    animationsMap.addAll({
      'stackOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 0.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.09),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        title: 'Video-Management',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      if ((MediaQuery.sizeOf(context).width > 1070.0) &&
                          responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                          ))
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                textOne:
                                    FlutterFlowTheme.of(context).secondaryText,
                                textTwo:
                                    FlutterFlowTheme.of(context).secondaryText,
                                textThree:
                                    FlutterFlowTheme.of(context).primaryText,
                                textFour:
                                    FlutterFlowTheme.of(context).secondaryText,
                                colorBgFive: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textFive:
                                    FlutterFlowTheme.of(context).secondaryText,
                                colorBgSix: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                expand: false,
                                colorBgPrimarydropdown:
                                    FlutterFlowTheme.of(context).accent4,
                                colorBgSeventeen: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                            Flexible(
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 80.0),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 24.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    final navigationList =
                                                        FFAppState()
                                                            .folderListNav
                                                            .toList();

                                                    return Wrap(
                                                      spacing: 8.0,
                                                      runSpacing: 8.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: List.generate(
                                                          navigationList.length,
                                                          (navigationListIndex) {
                                                        final navigationListItem =
                                                            navigationList[
                                                                navigationListIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            FFAppState()
                                                                    .adminCurrentFolderID =
                                                                'c000e7ede52e4745a592b3b3933d662a';
                                                            _model.count =
                                                                FFAppState()
                                                                    .folderListNav
                                                                    .length;
                                                            while (
                                                                _model.count! >
                                                                    0) {
                                                              if (navigationListItem
                                                                      .folderId !=
                                                                  FFAppState()
                                                                      .folderListNav[
                                                                          (_model.count!) -
                                                                              1]
                                                                      .folderId) {
                                                                FFAppState()
                                                                    .removeAtIndexFromFolderListNav(
                                                                        (_model.count!) -
                                                                            1);
                                                              } else {
                                                                _model.subfolderRsult1 = await FolderRecord.getDocumentOnce(FFAppState()
                                                                    .folderListNav[
                                                                        (_model.count!) -
                                                                            1]
                                                                    .folderRef!);
                                                                _shouldSetState =
                                                                    true;

                                                                context
                                                                    .pushNamed(
                                                                  'Video-Management',
                                                                  queryParameters:
                                                                      {
                                                                    'status':
                                                                        serializeParam(
                                                                      'subfolder',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'folder':
                                                                        serializeParam(
                                                                      _model
                                                                          .subfolderRsult1,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'folder': _model
                                                                        .subfolderRsult1,
                                                                    kTransitionInfoKey:
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .fade,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              0),
                                                                    ),
                                                                  },
                                                                );

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              _model
                                                                  .count = (_model
                                                                      .count!) -
                                                                  1;
                                                            }
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          child: Text(
                                                            navigationListIndex ==
                                                                    0
                                                                ? 'Media Manangement > '
                                                                : '${navigationListItem.folderName} > ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (_model
                                                              .uploadVisibility ==
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
                                                      model: _model
                                                          .addButtonModel1,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: AddButtonWidget(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '4gvp9hz0' /* Video */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .video_call_outlined,
                                                          color: Colors.white,
                                                        ),
                                                        height: 50,
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) =>
                                                        InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () =>
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus(),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        400.0,
                                                                    child:
                                                                        VideoFolderCreationWidget(),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .addButtonModel2,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: AddButtonWidget(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'p01zpw5p' /* Folder */,
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .create_new_folder_outlined,
                                                            color: Colors.white,
                                                          ),
                                                          bg1:
                                                              Color(0xFF1D71AE),
                                                          bg2:
                                                              Color(0xFF1AA6FF),
                                                          height: 50,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 16.0)),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ),
                                        if (_model.uploadVisibility == 'Show')
                                          Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: ClipRRect(
                                              child: Container(
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
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.uploadVisibility =
                                                                  'Pending';
                                                              safeSetState(
                                                                  () {});
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: FlutterFlowWebView(
                                                        content: functions
                                                            .returnHTMLcode(
                                                                FFAppConstants
                                                                    .folderID,
                                                                'Bonus,${_model.mainFolderResult1?.folderMainId}')!,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 300.0,
                                                        verticalScroll: false,
                                                        horizontalScroll: false,
                                                        html: true,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Builder(
                                            builder: (context) {
                                              final subFolderList =
                                                  _model.folderList.toList();

                                              return GridView.builder(
                                                padding: EdgeInsets.zero,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointLarge
                                                          ? 5
                                                          : 8,
                                                  crossAxisSpacing: 24.0,
                                                  mainAxisSpacing: 24.0,
                                                  childAspectRatio: 1.0,
                                                ),
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: subFolderList.length,
                                                itemBuilder: (context,
                                                    subFolderListIndex) {
                                                  final subFolderListItem =
                                                      subFolderList[
                                                          subFolderListIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onDoubleTap: () async {
                                                      _model.folderResult1 =
                                                          await FolderRecord
                                                              .getDocumentOnce(
                                                                  subFolderListItem
                                                                      .folderRef!);
                                                      _model.tagBasedVideoList =
                                                          [];
                                                      FFAppState()
                                                          .addToFolderListNav(
                                                              FolderInfoStruct(
                                                        folderId: _model
                                                            .folderResult1
                                                            ?.folderMainId,
                                                        folderName: _model
                                                            .folderResult1
                                                            ?.folderName,
                                                        folderRef: _model
                                                            .folderResult1
                                                            ?.reference,
                                                      ));

                                                      context.pushNamed(
                                                        'Video-Management',
                                                        queryParameters: {
                                                          'folder':
                                                              serializeParam(
                                                            _model
                                                                .folderResult1,
                                                            ParamType.Document,
                                                          ),
                                                          'status':
                                                              serializeParam(
                                                            'subfolder',
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'folder': _model
                                                              .folderResult1,
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

                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/XMLID_839_.svg',
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    1.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  subFolderListItem
                                                                      .folderName
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        15,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                              child: Container(
                                                                                width: 400.0,
                                                                                child: VideoFolderEditWidget(
                                                                                  folderRef: subFolderListItem.folderRef!,
                                                                                  folderInfo: subFolderListItem,
                                                                                  mainFolderRef: _model.mainFolderResult1!.reference,
                                                                                  mainSubIndex: subFolderListIndex,
                                                                                  status: widget!.status,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .drive_file_rename_outline_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 18.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            if (_model.mainShow == 'hide')
                                              Lottie.asset(
                                                'assets/lottie_animations/animation_ll4tcupb.json',
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 300.0,
                                                fit: BoxFit.contain,
                                                reverse: true,
                                                animate: true,
                                              ),
                                            if (_model.mainShow != 'hide')
                                              Wrap(
                                                spacing: 0.0,
                                                runSpacing: 0.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final videoList = _model
                                                            .tagBasedVideoList
                                                            .toList();
                                                        if (videoList.isEmpty) {
                                                          return Center(
                                                            child:
                                                                EmptyMessageWidget(
                                                              emptyText: '  ',
                                                              status: 'media',
                                                            ),
                                                          );
                                                        }

                                                        return Wrap(
                                                          spacing: 16.0,
                                                          runSpacing: 16.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .spaceBetween,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              videoList.length,
                                                              (videoListIndex) {
                                                            final videoListItem =
                                                                videoList[
                                                                    videoListIndex];
                                                            return FutureBuilder<
                                                                int>(
                                                              future:
                                                                  queryVideosRecordCount(
                                                                queryBuilder:
                                                                    (videosRecord) =>
                                                                        videosRecord
                                                                            .where(
                                                                  'videoId',
                                                                  isEqualTo:
                                                                      videoListItem,
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
                                                                int stackCount =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  width: 210.0,
                                                                  height: 210.0,
                                                                  child: Stack(
                                                                    children: [
                                                                      if (stackCount >
                                                                          0)
                                                                        StreamBuilder<
                                                                            List<VideosRecord>>(
                                                                          stream:
                                                                              queryVideosRecord(
                                                                            queryBuilder: (videosRecord) =>
                                                                                videosRecord.where(
                                                                              'videoId',
                                                                              isEqualTo: videoListItem,
                                                                            ),
                                                                            singleRecord:
                                                                                true,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<VideosRecord>
                                                                                containerVideosRecordList =
                                                                                snapshot.data!;
                                                                            final containerVideosRecord = containerVideosRecordList.isNotEmpty
                                                                                ? containerVideosRecordList.first
                                                                                : null;

                                                                            return Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: MediaQuery.sizeOf(context).height * 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(12.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    FFAppState().videoRef = null;
                                                                                    _model.apiResultdeqCopyCopy111 = await OTPAndPBICall.call(
                                                                                      videoId: containerVideosRecord?.videoId,
                                                                                      userName: '        ',
                                                                                      userid: '124785',
                                                                                      url: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/',
                                                                                    );

                                                                                    if ((_model.apiResultdeqCopyCopy111?.succeeded ?? true)) {
                                                                                      context.pushNamed(
                                                                                        'Video-Editor',
                                                                                        queryParameters: {
                                                                                          'videoRef': serializeParam(
                                                                                            containerVideosRecord,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                          'otp': serializeParam(
                                                                                            OTPAndPBICall.otp(
                                                                                              (_model.apiResultdeqCopyCopy111?.jsonBody ?? ''),
                                                                                            ),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'playbackinfo': serializeParam(
                                                                                            OTPAndPBICall.playbackInfo(
                                                                                              (_model.apiResultdeqCopyCopy111?.jsonBody ?? ''),
                                                                                            ),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'videoRef': containerVideosRecord,
                                                                                          kTransitionInfoKey: TransitionInfo(
                                                                                            hasTransition: true,
                                                                                            transitionType: PageTransitionType.fade,
                                                                                            duration: Duration(milliseconds: 0),
                                                                                          ),
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
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Stack(
                                                                                          children: [
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(0.0),
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
                                                                                                    Color(0x5FE6EBEE)
                                                                                                  ],
                                                                                                  stops: [0.0, 1.0],
                                                                                                  begin: AlignmentDirectional(0.0, -1.0),
                                                                                                  end: AlignmentDirectional(0, 1.0),
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(0.0),
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
                                                                                                      videoId: containerVideosRecord?.videoId,
                                                                                                      userName: '     ',
                                                                                                      userid: '124578',
                                                                                                      url: 'https://proxy.vizsoft.in/https://backend.vizsoft.in/',
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
                                                                                                                  width: 600.0,
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

                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: 65.0,
                                                                                                    height: 65.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Container(
                                                                                                      width: 65.0,
                                                                                                      height: 65.0,
                                                                                                      child: Stack(
                                                                                                        children: [
                                                                                                          Opacity(
                                                                                                            opacity: 0.4,
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Material(
                                                                                                                color: Colors.transparent,
                                                                                                                elevation: 7.0,
                                                                                                                shape: const CircleBorder(),
                                                                                                                child: Container(
                                                                                                                  width: 65.0,
                                                                                                                  height: 65.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    boxShadow: [
                                                                                                                      BoxShadow(
                                                                                                                        blurRadius: 4.0,
                                                                                                                        color: Color(0x33000000),
                                                                                                                        offset: Offset(
                                                                                                                          0.0,
                                                                                                                          2.0,
                                                                                                                        ),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                    shape: BoxShape.circle,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 46.0,
                                                                                                              height: 46.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                shape: BoxShape.circle,
                                                                                                              ),
                                                                                                              child: Stack(
                                                                                                                children: [
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Icon(
                                                                                                                      Icons.play_arrow,
                                                                                                                      color: Color(0xFFEA9A9C),
                                                                                                                      size: 42.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Opacity(
                                                                                                                    opacity: 0.82,
                                                                                                                    child: Align(
                                                                                                                      alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                      child: Icon(
                                                                                                                        Icons.play_arrow_outlined,
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        size: 42.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ).animateOnActionTrigger(
                                                                                                      animationsMap['stackOnActionTriggerAnimation']!,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                        child: Text(
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
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              if (containerVideosRecord?.fileSizeMB != 0.0)
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Icon(
                                                                                                      Icons.video_file_outlined,
                                                                                                      color: Color(0xFFEA9A9C),
                                                                                                      size: 14.0,
                                                                                                    ),
                                                                                                    AutoSizeText(
                                                                                                      '${(containerVideosRecord!.fileSizeMB / 1024).toStringAsFixed(2)} GB',
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
                                                                                              if (containerVideosRecord?.duration != '0')
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
                                                                                                      '${((int.parse(containerVideosRecord!.duration) / 60).floor()).toString()} min'.maybeHandleOverflow(
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
                                                                                            ].divide(SizedBox(width: 8.0)),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              _model.apiResult8hp = await DownloadLinkCall.call(
                                                                                                videoid: containerVideosRecord?.videoId,
                                                                                              );

                                                                                              if ((_model.apiResult8hp?.succeeded ?? true)) {
                                                                                                await launchURL(DownloadLinkCall.downloadLink(
                                                                                                  (_model.apiResult8hp?.jsonBody ?? ''),
                                                                                                )!);
                                                                                              }

                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.file_download_outlined,
                                                                                              color: Color(0xFFEA9A9C),
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      if (stackCount ==
                                                                          0)
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Lottie.asset(
                                                                                  'assets/lottie_animations/animation_ll69bvmj.json',
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                  fit: BoxFit.fill,
                                                                                  animate: true,
                                                                                ),
                                                                              ),
                                                                              Lottie.asset(
                                                                                'assets/lottie_animations/animation_ll69bvmj.json',
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                height: 35.0,
                                                                                fit: BoxFit.fill,
                                                                                animate: true,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.presentPageNumber = 1;
                                              _model.tagBasedVideoList = [];
                                              _model.apifirstbasedresult1 =
                                                  await TagBasedListNewRohitCall
                                                      .call(
                                                tagname: _model
                                                    .mainFolderResult1
                                                    ?.folderMainId,
                                                pageno:
                                                    _model.presentPageNumber,
                                                limit: _model.pageLimit,
                                              );

                                              if ((_model.apifirstbasedresult1
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.tagBasedVideoList =
                                                    TagBasedListNewRohitCall
                                                            .videoId(
                                                  (_model.apifirstbasedresult1
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<String>();
                                                _model.startIndex = (_model
                                                        .pageLimit!) *
                                                    ((_model.presentPageNumber!) -
                                                        1);
                                                _model.endIndex = _model
                                                            .presentPageNumber ==
                                                        _model.numberOfPage
                                                    ? ((_model.totalVideo!) - 1)
                                                    : ((((_model.pageLimit!) *
                                                                ((_model.presentPageNumber!) -
                                                                    1)) +
                                                            (_model
                                                                .pageLimit!)) -
                                                        1);
                                              }
                                              FFAppState().refresh =
                                                  FFAppState().refresh + 1;
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .keyboard_double_arrow_left_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'tjd78658' /* First */,
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
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if ((_model.presentPageNumber! > 1) &&
                                              (_model.last != 1))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model
                                                    .presentPageNumber = _model
                                                        .presentPageNumber! +
                                                    ((_model.presentPageNumber!) -
                                                        1);
                                                _model.tagBasedVideoList = [];
                                                _model.apibackbasedresult1 =
                                                    await TagBasedListNewRohitCall
                                                        .call(
                                                  tagname: _model
                                                      .mainFolderResult1
                                                      ?.folderMainId,
                                                  pageno:
                                                      _model.presentPageNumber,
                                                  limit: _model.pageLimit,
                                                );

                                                if ((_model.apibackbasedresult1
                                                        ?.succeeded ??
                                                    true)) {
                                                  _model.tagBasedVideoList =
                                                      TagBasedListNewRohitCall
                                                              .videoId(
                                                    (_model.apibackbasedresult1
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                          .toList()
                                                          .cast<String>();
                                                  _model.startIndex = (_model
                                                          .pageLimit!) *
                                                      ((_model.presentPageNumber!) -
                                                          1);
                                                  _model.endIndex = _model
                                                              .presentPageNumber ==
                                                          _model.numberOfPage
                                                      ? ((_model.totalVideo!) -
                                                          1)
                                                      : ((((_model.pageLimit!) *
                                                                  ((_model.presentPageNumber!) -
                                                                      1)) +
                                                              (_model
                                                                  .pageLimit!)) -
                                                          1);
                                                }
                                                FFAppState().refresh =
                                                    FFAppState().refresh + 1;
                                                safeSetState(() {});

                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .chevron_left_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '2hxfvji8' /* Back */,
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
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Builder(
                                            builder: (context) {
                                              final pageList = functions
                                                  .createList(_model.last!)
                                                  .toList();

                                              return Wrap(
                                                spacing: 8.0,
                                                runSpacing: 8.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: List.generate(
                                                    pageList.length,
                                                    (pageListIndex) {
                                                  final pageListItem =
                                                      pageList[pageListIndex];
                                                  return FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.presentPageNumber =
                                                          pageListIndex + 1;
                                                      _model.tagBasedVideoList =
                                                          [];
                                                      _model.apiindexbasedresult1 =
                                                          await TagBasedListNewRohitCall
                                                              .call(
                                                        tagname: _model
                                                            .mainFolderResult1
                                                            ?.folderMainId,
                                                        pageno: _model
                                                            .presentPageNumber,
                                                        limit: _model.pageLimit,
                                                      );

                                                      if ((_model
                                                              .apiindexbasedresult1
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.tagBasedVideoList =
                                                            TagBasedListNewRohitCall
                                                                    .videoId(
                                                          (_model.apiindexbasedresult1
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                                .toList()
                                                                .cast<String>();
                                                        _model
                                                            .startIndex = (_model
                                                                .pageLimit!) *
                                                            ((_model.presentPageNumber!) -
                                                                1);
                                                        _model.endIndex = _model
                                                                    .presentPageNumber ==
                                                                _model
                                                                    .numberOfPage
                                                            ? ((_model
                                                                    .totalVideo!) -
                                                                1)
                                                            : ((((_model.pageLimit!) *
                                                                        ((_model.presentPageNumber!) -
                                                                            1)) +
                                                                    (_model
                                                                        .pageLimit!)) -
                                                                1);
                                                      }
                                                      FFAppState().refresh =
                                                          FFAppState().refresh +
                                                              1;
                                                      safeSetState(() {});

                                                      safeSetState(() {});
                                                    },
                                                    text: (pageListIndex + 1)
                                                        .toString(),
                                                    options: FFButtonOptions(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: _model.presentPageNumber ==
                                                                        _model
                                                                            .presentPageNumber
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                          if ((_model.presentPageNumber !=
                                                  _model.last) &&
                                              (_model.last != 1))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model
                                                    .presentPageNumber = _model
                                                        .presentPageNumber! +
                                                    ((_model.presentPageNumber!) +
                                                        1);
                                                _model.tagBasedVideoList = [];
                                                _model.apinextbasedresult1 =
                                                    await TagBasedListNewRohitCall
                                                        .call(
                                                  tagname: _model
                                                      .mainFolderResult1
                                                      ?.folderMainId,
                                                  pageno:
                                                      _model.presentPageNumber,
                                                  limit: _model.pageLimit,
                                                );

                                                if ((_model.apinextbasedresult1
                                                        ?.succeeded ??
                                                    true)) {
                                                  _model.tagBasedVideoList =
                                                      TagBasedListNewRohitCall
                                                              .videoId(
                                                    (_model.apinextbasedresult1
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!
                                                          .toList()
                                                          .cast<String>();
                                                  _model.startIndex = (_model
                                                          .pageLimit!) *
                                                      ((_model.presentPageNumber!) -
                                                          1);
                                                  _model.endIndex = _model
                                                              .presentPageNumber ==
                                                          _model.numberOfPage
                                                      ? ((_model.totalVideo!) -
                                                          1)
                                                      : ((((_model.pageLimit!) *
                                                                  ((_model.presentPageNumber!) -
                                                                      1)) +
                                                              (_model
                                                                  .pageLimit!)) -
                                                          1);
                                                }
                                                FFAppState().refresh =
                                                    FFAppState().refresh + 1;
                                                safeSetState(() {});

                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'igxfcbmg' /* Next */,
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
                                                      Icon(
                                                        Icons
                                                            .navigate_next_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.presentPageNumber =
                                                  _model.last;
                                              _model.tagBasedVideoList = [];
                                              _model.apilastbasedresult1 =
                                                  await TagBasedListNewRohitCall
                                                      .call(
                                                tagname: _model
                                                    .mainFolderResult1
                                                    ?.folderMainId,
                                                pageno:
                                                    _model.presentPageNumber,
                                                limit: _model.pageLimit,
                                              );

                                              if ((_model.apilastbasedresult1
                                                      ?.succeeded ??
                                                  true)) {
                                                _model.tagBasedVideoList =
                                                    TagBasedListNewRohitCall
                                                            .videoId(
                                                  (_model.apilastbasedresult1
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<String>();
                                                _model.startIndex = (_model
                                                        .pageLimit!) *
                                                    ((_model.presentPageNumber!) -
                                                        1);
                                                _model.endIndex = _model
                                                            .presentPageNumber ==
                                                        _model.numberOfPage
                                                    ? ((_model.totalVideo!) - 1)
                                                    : ((((_model.pageLimit!) *
                                                                ((_model.presentPageNumber!) -
                                                                    1)) +
                                                            (_model
                                                                .pageLimit!)) -
                                                        1);
                                              }
                                              FFAppState().refresh =
                                                  FFAppState().refresh + 1;
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '9en8pkvd' /* Last */,
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
                                                    Icon(
                                                      Icons
                                                          .keyboard_double_arrow_right,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
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
              ),
            ),
          ),
        ));
  }
}
