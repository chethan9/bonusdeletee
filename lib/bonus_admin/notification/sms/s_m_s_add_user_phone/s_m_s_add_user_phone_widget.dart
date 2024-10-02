import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 's_m_s_add_user_phone_model.dart';
export 's_m_s_add_user_phone_model.dart';

class SMSAddUserPhoneWidget extends StatefulWidget {
  const SMSAddUserPhoneWidget({
    super.key,
    required this.phoneNumber,
    required this.userRef,
  });

  final String? phoneNumber;
  final DocumentReference? userRef;

  @override
  State<SMSAddUserPhoneWidget> createState() => _SMSAddUserPhoneWidgetState();
}

class _SMSAddUserPhoneWidgetState extends State<SMSAddUserPhoneWidget> {
  late SMSAddUserPhoneModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SMSAddUserPhoneModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().addToUserPhoneList(widget!.phoneNumber!);
      FFAppState().addToUserRefList(widget!.userRef!);
      _model.updatePage(() {});
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

    return Container(
      decoration: BoxDecoration(),
    );
  }
}
