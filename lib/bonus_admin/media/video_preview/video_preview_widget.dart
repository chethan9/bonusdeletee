import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_preview_model.dart';
export 'video_preview_model.dart';

class VideoPreviewWidget extends StatefulWidget {
  const VideoPreviewWidget({
    super.key,
    required this.videoRef,
    required this.otp,
    required this.playbackInfo,
  });

  final VideosRecord? videoRef;
  final String? otp;
  final String? playbackInfo;

  @override
  State<VideoPreviewWidget> createState() => _VideoPreviewWidgetState();
}

class _VideoPreviewWidgetState extends State<VideoPreviewWidget> {
  late VideoPreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPreviewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.35,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
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
              if (widget!.otp != '')
                FlutterFlowWebView(
                  content:
                      '<div style=\"padding-top:41%;position:relative;\"> <iframe src=\"https://player.vdocipher.com/v2/?otp=${widget!.otp}&playbackInfo=${widget!.playbackInfo}&player=G5nv0QmsGSrtT2Fu\" style=\"border:0;max-width:100%;position:absolute;top:0;left:0;height:100%;width:100%;\" allowFullScreen=\"true\" allow=\"encrypted-media\"></iframe> </div>',
                  height: 280.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                  html: true,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
