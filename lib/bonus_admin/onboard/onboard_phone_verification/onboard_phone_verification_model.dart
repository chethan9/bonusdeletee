import '/auth/firebase_auth/auth_util.dart';
import '/components/mobile/mobile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'onboard_phone_verification_widget.dart'
    show OnboardPhoneVerificationWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardPhoneVerificationModel
    extends FlutterFlowModel<OnboardPhoneVerificationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for TimerSec widget.
  final timerSecInitialTimeMs = 30000;
  int timerSecMilliseconds = 30000;
  String timerSecValue = StopWatchTimer.getDisplayTime(
    30000,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerSecController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for Mobile component.
  late MobileModel mobileModel;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    mobileModel = createModel(context, () => MobileModel());
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
    timerSecController.dispose();
    mobileModel.dispose();
  }
}
