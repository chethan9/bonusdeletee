import '/backend/backend.dart';
import '/components/delete_message/delete_message_widget.dart';
import '/components/empty_message/empty_message_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'bookings_widget.dart' show BookingsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BookingsModel extends FlutterFlowModel<BookingsWidget> {
  ///  Local state fields for this component.

  String bookingState = 'upcoming';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
