import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_play_button_model.dart';
export 'video_play_button_model.dart';

class VideoPlayButtonWidget extends StatefulWidget {
  const VideoPlayButtonWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final String? parameter1;
  final VideosRecord? parameter2;

  @override
  State<VideoPlayButtonWidget> createState() => _VideoPlayButtonWidgetState();
}

class _VideoPlayButtonWidgetState extends State<VideoPlayButtonWidget>
    with TickerProviderStateMixin {
  late VideoPlayButtonModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPlayButtonModel());

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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
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
        onEnter: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = true);
          if (animationsMap['stackOnActionTriggerAnimation'] != null) {
            await animationsMap['stackOnActionTriggerAnimation']!
                .controller
                .forward(from: 0.0);
          }
        }),
        onExit: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = false);
          if (animationsMap['stackOnActionTriggerAnimation'] != null) {
            animationsMap['stackOnActionTriggerAnimation']!.controller.reset();
          }
        }),
      ),
    );
  }
}
