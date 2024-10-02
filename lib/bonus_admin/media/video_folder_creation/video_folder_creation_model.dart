import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'video_folder_creation_widget.dart' show VideoFolderCreationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class VideoFolderCreationModel
    extends FlutterFlowModel<VideoFolderCreationWidget> {
  ///  Local state fields for this component.

  List<FolderInfoStruct> folderListComp = [];
  void addToFolderListComp(FolderInfoStruct item) => folderListComp.add(item);
  void removeFromFolderListComp(FolderInfoStruct item) =>
      folderListComp.remove(item);
  void removeAtIndexFromFolderListComp(int index) =>
      folderListComp.removeAt(index);
  void insertAtIndexInFolderListComp(int index, FolderInfoStruct item) =>
      folderListComp.insert(index, item);
  void updateFolderListCompAtIndex(
          int index, Function(FolderInfoStruct) updateFn) =>
      folderListComp[index] = updateFn(folderListComp[index]);

  String? folderStatus = 'unset';

  int? count;

  int? refresh = 1;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in Video-FolderCreation widget.
  FolderRecord? createFolderResult1;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  FolderRecord? subfolderResult1;
  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode;
  TextEditingController? yourEmailTextController;
  String? Function(BuildContext, String?)? yourEmailTextControllerValidator;
  String? _yourEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r4rl4s8y' /* Field is required */,
      );
    }

    return null;
  }

  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Add_button widget.
  IdMapRecord? idMapResult1;
  // Stores action output result for [Backend Call - Create Document] action in Add_button widget.
  FolderRecord? newFolderResult1;

  @override
  void initState(BuildContext context) {
    yourEmailTextControllerValidator = _yourEmailTextControllerValidator;
    addButtonModel = createModel(context, () => AddButtonModel());
  }

  @override
  void dispose() {
    yourEmailFocusNode?.dispose();
    yourEmailTextController?.dispose();

    addButtonModel.dispose();
  }
}
