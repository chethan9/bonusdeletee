import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'video_upload_video_list_model.dart';
export 'video_upload_video_list_model.dart';

class VideoUploadVideoListWidget extends StatefulWidget {
  const VideoUploadVideoListWidget({
    super.key,
    required this.status,
    this.userDoc,
  });

  final String? status;
  final UsersRecord? userDoc;

  @override
  State<VideoUploadVideoListWidget> createState() =>
      _VideoUploadVideoListWidgetState();
}

class _VideoUploadVideoListWidgetState
    extends State<VideoUploadVideoListWidget> {
  late VideoUploadVideoListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoUploadVideoListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (_model.refresh != 0) {
        await Future.delayed(const Duration(milliseconds: 5000));
        _model.apiResult8ya123 = await FolderIDBasedVideoListOldTWOCall.call(
          folderId: FFAppState().currentUserRole == 'Admin'
              ? FFAppState().adminCurrentFolderID
              : FFAppState().currentInstructorFolderID,
        );

        if ((_model.apiResult8ya123?.succeeded ?? true)) {
          _model.apiStatus = true;
        } else {
          _model.apiStatus = false;
        }

        if (FolderIDBasedVideoListOldTWOCall.isNotReadyList(
              (_model.apiResult8ya123?.jsonBody ?? ''),
            )!
                .length >
            0) {
          _model.listStatus = 'show';
          if (_model.count != 0) {
            if ((FolderIDBasedVideoListOldTWOCall.isNotReadyList(
                      (_model.apiResult8ya123?.jsonBody ?? ''),
                    )?.length ==
                    _model.count) &&
                (_model.apiStatus == true)) {
              await Future.delayed(const Duration(milliseconds: 5000));
              _model.refresh = _model.refresh + 1;
              safeSetState(() {});
            } else {
              _model.count = FolderIDBasedVideoListOldTWOCall.isNotReadyList(
                (_model.apiResult8ya123?.jsonBody ?? ''),
              )?.length;
              _model.apiStatus = false;
              _model.refresh = _model.refresh + 1;
              _model.updatePage(() {});
            }
          } else {
            if (FolderIDBasedVideoListOldTWOCall.isNotReadyList(
                  (_model.apiResult8ya123?.jsonBody ?? ''),
                )?.length ==
                0) {
              _model.refresh = _model.refresh + 1;
              safeSetState(() {});
            } else {
              _model.count = FolderIDBasedVideoListOldTWOCall.isNotReadyList(
                (_model.apiResult8ya123?.jsonBody ?? ''),
              )?.length;
              _model.refresh = _model.refresh + 1;
              safeSetState(() {});
            }
          }
        } else {
          _model.listStatus = 'hide';
          _model.refresh = _model.refresh + 1;
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

    return Visibility(
      visible: _model.listStatus == 'show',
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Builder(
              builder: (context) {
                final processingvideolist =
                    FolderIDBasedVideoListOldTWOCall.isNotReadyList(
                          (_model.apiResult8ya123?.jsonBody ?? ''),
                        )?.toList() ??
                        [];

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.sizeOf(context).width < kBreakpointLarge
                            ? 5
                            : 6,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: processingvideolist.length,
                  itemBuilder: (context, processingvideolistIndex) {
                    final processingvideolistItem =
                        processingvideolist[processingvideolistIndex];
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/processing.gif',
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 8.0),
                                child: Text(
                                  getJsonField(
                                    processingvideolistItem,
                                    r'''$..title''',
                                  ).toString().maybeHandleOverflow(
                                        maxChars: 18,
                                        replacement: '…',
                                      ),
                                  textAlign: TextAlign.center,
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
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    '${getJsonField(
                                      processingvideolistItem,
                                      r'''$..status''',
                                    ).toString()}',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 16.0),
                                  child: Text(
                                    '${'Processing' == getJsonField(
                                          processingvideolistItem,
                                          r'''$..status''',
                                        ).toString() ? ' Video is being processed, please check back later.' : ' '}',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'Do you really want to remove the video?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('Confirm'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  _model.apiResultyhp122 =
                                      await DeleteCall.call(
                                    videoId: getJsonField(
                                      processingvideolistItem,
                                      r'''$..id''',
                                    ).toString(),
                                  );

                                  context.goNamed('Video-20_09Management');
                                }

                                safeSetState(() {});
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 3.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
