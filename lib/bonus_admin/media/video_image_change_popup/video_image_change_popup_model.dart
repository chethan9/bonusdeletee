import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'video_image_change_popup_widget.dart' show VideoImageChangePopupWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VideoImageChangePopupModel
    extends FlutterFlowModel<VideoImageChangePopupWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Add_button component.
  late AddButtonModel addButtonModel1;
  // Model for Add_button component.
  late AddButtonModel addButtonModel2;

  @override
  void initState(BuildContext context) {
    addButtonModel1 = createModel(context, () => AddButtonModel());
    addButtonModel2 = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    addButtonModel1.dispose();
    addButtonModel2.dispose();
  }
}
