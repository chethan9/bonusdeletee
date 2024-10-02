import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/bonus_admin/media/video_preview/video_preview_widget.dart';
import '/bonus_admin/media/video_preview_title/video_preview_title_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'video_list_for_selection_model.dart';
export 'video_list_for_selection_model.dart';

class VideoListForSelectionWidget extends StatefulWidget {
  const VideoListForSelectionWidget({
    super.key,
    String? status,
    this.subfolder,
  }) : this.status = status ?? 'Main';

  final String status;
  final FolderInfoStruct? subfolder;

  @override
  State<VideoListForSelectionWidget> createState() =>
      _VideoListForSelectionWidgetState();
}

class _VideoListForSelectionWidgetState
    extends State<VideoListForSelectionWidget> {
  late VideoListForSelectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoListForSelectionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.mainFolderResult1 = await queryFolderRecordOnce(
        queryBuilder: (folderRecord) => folderRecord.where(
          'folder_main_id',
          isEqualTo: widget!.status != 'subfolder'
              ? (FFAppState().currentUserRole == 'Instructor'
                  ? valueOrDefault(currentUserDocument?.folderID, '')
                  : 'BSFL1000')
              : widget!.subfolder?.folderId,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if ((_model.mainFolderResult1 != null) == true) {
        if ((_model.mainFolderResult1!.folderSubfolderInfo.length > 0) &&
            (_model.folderShowStatus == 'hide')) {
          _model.folderShowStatus = 'show';
          _model.subFolderList = _model.mainFolderResult1!.folderSubfolderInfo
              .toList()
              .cast<FolderInfoStruct>();
          safeSetState(() {});
        }
        _model.userFolderVideoListRslt1 = await TagBasedListVdoChipherCall.call(
          tagname: _model.mainFolderResult1?.folderMainId,
        );

        if ((_model.userFolderVideoListRslt1?.succeeded ?? true)) {
          _model.videoShowStatus = 'show';
          safeSetState(() {});
        }
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
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().selectedFolderID = 'null';
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 14.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final navigationList =
                              FFAppState().folderListNav.toList();

                          return Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: List.generate(navigationList.length,
                                (navigationListIndex) {
                              final navigationListItem =
                                  navigationList[navigationListIndex];
                              return Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    _model.count =
                                        FFAppState().folderListNav.length;
                                    while (_model.count! > 0) {
                                      if (navigationListItem.folderId !=
                                          FFAppState()
                                              .folderListNav[
                                                  (_model.count!) - 1]
                                              .folderId) {
                                        FFAppState()
                                            .removeAtIndexFromFolderListNav(
                                                (_model.count!) - 1);
                                      } else {
                                        _model.subfolderRsult1 =
                                            await FolderRecord.getDocumentOnce(
                                                FFAppState()
                                                    .folderListNav[
                                                        (_model.count!) - 1]
                                                    .folderRef!);
                                        _shouldSetState = true;
                                        unawaited(
                                          () async {
                                            Navigator.pop(context);
                                          }(),
                                        );
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.5,
                                                  child:
                                                      VideoListForSelectionWidget(
                                                    status: 'subfolder',
                                                    subfolder: FolderInfoStruct(
                                                      folderId: _model
                                                          .subfolderRsult1
                                                          ?.folderMainId,
                                                      folderName: _model
                                                          .subfolderRsult1
                                                          ?.folderName,
                                                      folderRef: _model
                                                          .subfolderRsult1
                                                          ?.reference,
                                                      folderSubfolderIdList: _model
                                                          .subfolderRsult1
                                                          ?.folderSubfolderInfo,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      _model.count = (_model.count!) - 1;
                                    }
                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  child: Text(
                                    navigationListIndex == 0
                                        ? 'Media Manangement > '
                                        : '${navigationListItem.folderName} > ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ),
              if (_model.folderShowStatus == 'show')
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Builder(
                    builder: (context) {
                      final folderList1 = _model.subFolderList.toList();

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 1.0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: folderList1.length,
                        itemBuilder: (context, folderList1Index) {
                          final folderList1Item = folderList1[folderList1Index];
                          return Builder(
                            builder: (context) => GestureDetector(
                              onDoubleTapDown: (details) async {
                                _model.folderResult1 =
                                    await FolderRecord.getDocumentOnce(
                                        folderList1Item.folderRef!);
                                _model.videoShowStatus = 'hide';
                                _model.folderShowStatus = 'hide';
                                FFAppState()
                                    .addToFolderListNav(FolderInfoStruct(
                                  folderId: _model.folderResult1?.folderMainId,
                                  folderName: _model.folderResult1?.folderName,
                                  folderRef: _model.folderResult1?.reference,
                                ));
                                unawaited(
                                  () async {
                                    Navigator.pop(context);
                                  }(),
                                );
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.5,
                                          child: VideoListForSelectionWidget(
                                            status: 'subfolder',
                                            subfolder: FolderInfoStruct(
                                              folderId: _model
                                                  .folderResult1?.folderMainId,
                                              folderName: _model
                                                  .folderResult1?.folderName,
                                              folderRef: _model
                                                  .folderResult1?.reference,
                                              folderSubfolderIdList: _model
                                                  .folderResult1
                                                  ?.folderSubfolderInfo,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );

                                safeSetState(() {});
                              },
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: SvgPicture.asset(
                                            'assets/images/XMLID_839_.svg',
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 4.0),
                                        child: Text(
                                          folderList1Item.folderName
                                              .maybeHandleOverflow(
                                            maxChars: 15,
                                            replacement: '…',
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                  if (_model.videoShowStatus == 'hide')
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Lottie.asset(
                        'assets/lottie_animations/animation_ll4tcupb.json',
                        width: 250.0,
                        height: 250.0,
                        fit: BoxFit.contain,
                        reverse: true,
                        animate: true,
                      ),
                    ),
                  if (_model.videoShowStatus != 'hide')
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final videoList =
                                      TagBasedListVdoChipherCall.videoId(
                                            (_model.userFolderVideoListRslt1
                                                    ?.jsonBody ??
                                                ''),
                                          )?.toList() ??
                                          [];
                                  if (videoList.isEmpty) {
                                    return Center(
                                      child: EmptyMessageWidget(
                                        emptyText: '  ',
                                        status: 'list',
                                      ),
                                    );
                                  }

                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 1.0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: videoList.length,
                                    itemBuilder: (context, videoListIndex) {
                                      final videoListItem =
                                          videoList[videoListIndex];
                                      return StreamBuilder<List<VideosRecord>>(
                                        stream: queryVideosRecord(
                                          queryBuilder: (videosRecord) =>
                                              videosRecord.where(
                                            'videoId',
                                            isEqualTo: videoListItem,
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
                                          List<VideosRecord>
                                              containerVideosRecordList =
                                              snapshot.data!;
                                          final containerVideosRecord =
                                              containerVideosRecordList
                                                      .isNotEmpty
                                                  ? containerVideosRecordList
                                                      .first
                                                  : null;

                                          return Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                          .selectedFolderID =
                                                      'null';
                                                  FFAppState().videoRef =
                                                      containerVideosRecord
                                                          ?.reference;
                                                  FFAppState().update(() {});
                                                  Navigator.pop(context);
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              containerVideosRecord!
                                                                  .images,
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
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
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
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  Color(
                                                                      0x00F4F6FC),
                                                                  Color(
                                                                      0x5F101213)
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) =>
                                                                      InkWell(
                                                                splashColor: Colors
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
                                                                  _model.apiResultdeq1 =
                                                                      await OTPAndPBICall
                                                                          .call(
                                                                    videoId:
                                                                        videoListItem,
                                                                    userName:
                                                                        currentUserEmail,
                                                                    userid:
                                                                        currentUserUid,
                                                                  );

                                                                  if ((_model
                                                                          .apiResultdeq1
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
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              WebViewAware(
                                                                            child:
                                                                                Container(
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
                                                                        );
                                                                      },
                                                                    );
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'API Failed',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
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
                                                                child: Icon(
                                                                  Icons
                                                                      .play_circle,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  size: 50.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    16.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Text(
                                                          containerVideosRecord!
                                                              .title,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
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
                                                            _model.apiResultffl1 =
                                                                await OTPAndPBICall
                                                                    .call(
                                                              videoId:
                                                                  containerVideosRecord
                                                                      ?.videoId,
                                                              userName:
                                                                  currentUserEmail,
                                                              userid:
                                                                  currentUserUid,
                                                            );

                                                            if ((_model
                                                                    .apiResultffl1
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
                                                                              containerVideosRecord!,
                                                                          otp: OTPAndPBICall
                                                                              .otp(
                                                                            (_model.apiResultffl1?.jsonBody ??
                                                                                ''),
                                                                          )!,
                                                                          playbackinfo:
                                                                              OTPAndPBICall.playbackInfo(
                                                                            (_model.apiResultffl1?.jsonBody ??
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
                                                                        'kr51k6k6' /* Preview */,
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
                                              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
