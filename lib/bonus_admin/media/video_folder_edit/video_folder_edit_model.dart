import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'video_folder_edit_widget.dart' show VideoFolderEditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VideoFolderEditModel extends FlutterFlowModel<VideoFolderEditWidget> {
  ///  Local state fields for this component.

  List<FolderInfoStruct> folderList = [];
  void addToFolderList(FolderInfoStruct item) => folderList.add(item);
  void removeFromFolderList(FolderInfoStruct item) => folderList.remove(item);
  void removeAtIndexFromFolderList(int index) => folderList.removeAt(index);
  void insertAtIndexInFolderList(int index, FolderInfoStruct item) =>
      folderList.insert(index, item);
  void updateFolderListAtIndex(
          int index, Function(FolderInfoStruct) updateFn) =>
      folderList[index] = updateFn(folderList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode;
  TextEditingController? yourEmailTextController;
  String? Function(BuildContext, String?)? yourEmailTextControllerValidator;
  String? _yourEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nyh3l43s' /* Field is required */,
      );
    }

    return null;
  }

  // Model for Add_button component.
  late AddButtonModel addButtonModel;
  // Stores action output result for [Backend Call - Read Document] action in Add_button widget.
  FolderRecord? mainFolderRslt1;

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
