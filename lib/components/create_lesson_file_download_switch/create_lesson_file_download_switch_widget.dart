import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_lesson_file_download_switch_model.dart';
export 'create_lesson_file_download_switch_model.dart';

class CreateLessonFileDownloadSwitchWidget extends StatefulWidget {
  const CreateLessonFileDownloadSwitchWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final bool? parameter1;
  final int? parameter2;

  @override
  State<CreateLessonFileDownloadSwitchWidget> createState() =>
      _CreateLessonFileDownloadSwitchWidgetState();
}

class _CreateLessonFileDownloadSwitchWidgetState
    extends State<CreateLessonFileDownloadSwitchWidget> {
  late CreateLessonFileDownloadSwitchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateLessonFileDownloadSwitchModel());

    _model.switchValue = widget!.parameter1!;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _model.switchValue!,
      onChanged: (newValue) async {
        safeSetState(() => _model.switchValue = newValue!);
        if (newValue!) {
          FFAppState().updateLessonFileListAtIndex(
            widget!.parameter2!,
            (e) => e..lessonDownloadStatus = _model.switchValue,
          );
          safeSetState(() {});
        }
      },
      activeColor: FlutterFlowTheme.of(context).secondaryBackground,
      activeTrackColor: FlutterFlowTheme.of(context).primary,
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
    );
  }
}
