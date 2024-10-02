import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_folder_edit_model.dart';
export 'video_folder_edit_model.dart';

class VideoFolderEditWidget extends StatefulWidget {
  const VideoFolderEditWidget({
    super.key,
    required this.folderRef,
    required this.folderInfo,
    required this.mainFolderRef,
    required this.mainSubIndex,
    required this.status,
  });

  final DocumentReference? folderRef;
  final FolderInfoStruct? folderInfo;
  final DocumentReference? mainFolderRef;
  final int? mainSubIndex;
  final String? status;

  @override
  State<VideoFolderEditWidget> createState() => _VideoFolderEditWidgetState();
}

class _VideoFolderEditWidgetState extends State<VideoFolderEditWidget> {
  late VideoFolderEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoFolderEditModel());

    _model.yourEmailTextController ??=
        TextEditingController(text: widget!.folderInfo?.folderName);
    _model.yourEmailFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
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
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(),
                child: TextFormField(
                  controller: _model.yourEmailTextController,
                  focusNode: _model.yourEmailFocusNode,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'kayluz5s' /* Folder name */,
                    ),
                    labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                    hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                  maxLines: null,
                  validator: _model.yourEmailTextControllerValidator
                      .asValidator(context),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (_model.formKey.currentState == null ||
                      !_model.formKey.currentState!.validate()) {
                    return;
                  }

                  await widget!.folderRef!.update(createFolderRecordData(
                    folderName: _model.yourEmailTextController.text,
                  ));
                  _model.mainFolderRslt1 = await FolderRecord.getDocumentOnce(
                      widget!.mainFolderRef!);
                  _model.folderList = _model
                      .mainFolderRslt1!.folderSubfolderInfo
                      .toList()
                      .cast<FolderInfoStruct>();
                  _model.updateFolderListAtIndex(
                    widget!.mainSubIndex!,
                    (e) => e..folderName = _model.yourEmailTextController.text,
                  );

                  await widget!.mainFolderRef!.update({
                    ...mapToFirestore(
                      {
                        'folder_subfolder_info': getFolderInfoListFirestoreData(
                          _model.folderList,
                        ),
                      },
                    ),
                  });
                  unawaited(
                    () async {
                      Navigator.pop(context);
                    }(),
                  );
                  if (widget!.status == 'Main') {
                    context.pushNamed(
                      'Video-Management',
                      queryParameters: {
                        'status': serializeParam(
                          'Main',
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  } else {
                    context.pushNamed(
                      'Video-Management',
                      queryParameters: {
                        'folder': serializeParam(
                          _model.mainFolderRslt1,
                          ParamType.Document,
                        ),
                        'status': serializeParam(
                          'subfolder',
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'folder': _model.mainFolderRslt1,
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  }

                  safeSetState(() {});
                },
                child: wrapWithModel(
                  model: _model.addButtonModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AddButtonWidget(
                    text: FFLocalizations.of(context).getText(
                      '74568prb' /* Update */,
                    ),
                    icon: Icon(
                      Icons.save_outlined,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 16.0,
                    ),
                    height: 45,
                    width: 150,
                    fontSize: 14,
                  ),
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
