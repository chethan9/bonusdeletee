import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/course/video_uploading_status/video_uploading_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'video_upload_status_checker_model.dart';
export 'video_upload_status_checker_model.dart';

class VideoUploadStatusCheckerWidget extends StatefulWidget {
  const VideoUploadStatusCheckerWidget({
    super.key,
    required this.videoID,
  });

  final String? videoID;

  @override
  State<VideoUploadStatusCheckerWidget> createState() =>
      _VideoUploadStatusCheckerWidgetState();
}

class _VideoUploadStatusCheckerWidgetState
    extends State<VideoUploadStatusCheckerWidget> {
  late VideoUploadStatusCheckerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoUploadStatusCheckerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (_model.videoTimer != 0) {
        _model.apiResultl4dCopy = await CheckVideoStatusCall.call(
          videoID: widget!.videoID,
        );

        if ((_model.apiResultl4dCopy?.succeeded ?? true)) {
          if (CheckVideoStatusCall.status(
                (_model.apiResultl4dCopy?.jsonBody ?? ''),
              ) ==
              'Pre-Upload') {
            _model.videoStatus = 'Pre-Upload';
            safeSetState(() {});
          } else {
            if (CheckVideoStatusCall.status(
                  (_model.apiResultl4dCopy?.jsonBody ?? ''),
                ) ==
                'Queued') {
              _model.videoStatus = 'Queued';
              safeSetState(() {});
            } else {
              if (CheckVideoStatusCall.status(
                    (_model.apiResultl4dCopy?.jsonBody ?? ''),
                  ) ==
                  'Processing') {
                _model.videoStatus = 'Processing';
                safeSetState(() {});
              } else {
                if (CheckVideoStatusCall.status(
                      (_model.apiResultl4dCopy?.jsonBody ?? ''),
                    ) ==
                    'ready') {
                  FFAppState().removeFromVideoUploadList(widget!.videoID!);
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
                            width: MediaQuery.sizeOf(context).width * 0.25,
                            child: VideoUploadingStatusWidget(
                              status: 'success',
                            ),
                          ),
                        ),
                      );
                    },
                  );

                  context.goNamed(
                    'Video-20_09Management',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  return;
                } else {
                  if (CheckVideoStatusCall.status(
                        (_model.apiResultl4dCopy?.jsonBody ?? ''),
                      ) ==
                      'Not a media file') {
                    FFAppState().removeFromVideoUploadList(widget!.videoID!);
                    await DeleteCall.call(
                      videoId: widget!.videoID,
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
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              child: VideoUploadingStatusWidget(
                                status: 'fail',
                              ),
                            ),
                          ),
                        );
                      },
                    );

                    return;
                  }
                }
              }
            }
          }
        }
        await Future.delayed(const Duration(milliseconds: 30000));
        _model.videoTimer = (_model.videoTimer!) - 1;
        _model.updatePage(() {});
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

    return Builder(
      builder: (context) => Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            if ((_model.videoStatus == 'Pre-Upload') &&
                responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Lottie.asset(
                        'assets/lottie_animations/animation_ll69bvmj.json',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 0.0, 8.0),
                    child: Lottie.asset(
                      'assets/lottie_animations/animation_ll69bvmj.json',
                      width: 55.0,
                      height: 9.0,
                      fit: BoxFit.fill,
                      animate: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 8.0),
                    child: Lottie.asset(
                      'assets/lottie_animations/animation_ll69bvmj.json',
                      width: 210.0,
                      height: 12.0,
                      fit: BoxFit.fill,
                      animate: true,
                    ),
                  ),
                ],
              ),
            if ((_model.videoStatus == 'Queued') &&
                responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Lottie.asset(
                      'assets/lottie_animations/animation_lnsk4ww8.json',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
                    child: Lottie.asset(
                      'assets/lottie_animations/animation_ll69bvmj.json',
                      width: 55.0,
                      height: 9.0,
                      fit: BoxFit.fill,
                      animate: true,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'p51s1pkc' /* Uploading... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/processing.gif',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                  child: Text(
                    CheckVideoStatusCall.title(
                      (_model.apiResultl4dCopy?.jsonBody ?? ''),
                    )!
                        .maybeHandleOverflow(
                      maxChars: 18,
                      replacement: '…',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 16.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'yuqmxbzw' /* Video is being processed, plea... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
