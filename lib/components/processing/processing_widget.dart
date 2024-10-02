import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'processing_model.dart';
export 'processing_model.dart';

class ProcessingWidget extends StatefulWidget {
  const ProcessingWidget({super.key});

  @override
  State<ProcessingWidget> createState() => _ProcessingWidgetState();
}

class _ProcessingWidgetState extends State<ProcessingWidget> {
  late ProcessingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProcessingModel());

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
      child: Lottie.asset(
        'assets/lottie_animations/animation_lk0ujcxl.json',
        width: 500.0,
        height: 500.0,
        fit: BoxFit.cover,
        reverse: true,
        animate: true,
      ),
    );
  }
}
