import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'video_folder_creation_model.dart';
export 'video_folder_creation_model.dart';

class VideoFolderCreationWidget extends StatefulWidget {
  const VideoFolderCreationWidget({super.key});

  @override
  State<VideoFolderCreationWidget> createState() =>
      _VideoFolderCreationWidgetState();
}

class _VideoFolderCreationWidgetState extends State<VideoFolderCreationWidget> {
  late VideoFolderCreationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoFolderCreationModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_model.folderStatus == 'unset') {
        _model.createFolderResult1 = await queryFolderRecordOnce(
          queryBuilder: (folderRecord) => folderRecord.where(
            'folder_main_id',
            isEqualTo: FFAppState().currentUserRole == 'Instructor'
                ? valueOrDefault(currentUserDocument?.folderID, '')
                : 'BSFL1000',
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        _model.addToFolderListComp(FolderInfoStruct(
          folderId: _model.createFolderResult1?.folderStatus,
          folderName: _model.createFolderResult1?.folderName,
          folderRef: _model.createFolderResult1?.reference,
          folderSubfolderIdList:
              _model.createFolderResult1?.folderSubfolderInfo,
        ));
        _model.folderStatus = 'set';
        safeSetState(() {});
      }
    });

    _model.yourEmailTextController ??= TextEditingController();
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
    context.watch<FFAppState>();

    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Container(
        width: 600.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Builder(
                  builder: (context) {
                    final folderList = _model.folderListComp.toList();

                    return Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children:
                          List.generate(folderList.length, (folderListIndex) {
                        final folderListItem = folderList[folderListIndex];
                        return Wrap(
                          spacing: 0.0,
                          runSpacing: 8.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.count = _model.folderListComp.length;
                                while (_model.count! > 0) {
                                  if (folderListItem.folderId !=
                                      _model.folderListComp[(_model.count!) - 1]
                                          .folderId) {
                                    _model.removeAtIndexFromFolderListComp(
                                        (_model.count!) - 1);
                                  } else {
                                    _model.refresh = (_model.refresh!) + 1;
                                    safeSetState(() {});
                                    return;
                                  }

                                  _model.count = (_model.count!) - 1;
                                }
                              },
                              child: Text(
                                folderListItem.folderName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                            Text(
                              ' > ',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                            if ((folderListItem.folderId ==
                                    _model.folderListComp.last.folderId) &&
                                (folderListItem.folderSubfolderIdList.length >
                                    0))
                              Wrap(
                                spacing: 0.0,
                                runSpacing: 0.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final subfolderList = folderListItem
                                          .folderSubfolderIdList
                                          .toList();

                                      return Wrap(
                                        spacing: 8.0,
                                        runSpacing: 8.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children:
                                            List.generate(subfolderList.length,
                                                (subfolderListIndex) {
                                          final subfolderListItem =
                                              subfolderList[subfolderListIndex];
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              _model.subfolderResult1 =
                                                  await FolderRecord
                                                      .getDocumentOnce(
                                                          subfolderListItem
                                                              .folderRef!);
                                              _model.addToFolderListComp(
                                                  FolderInfoStruct(
                                                folderId:
                                                    subfolderListItem.folderId,
                                                folderName: subfolderListItem
                                                    .folderName,
                                                folderRef:
                                                    subfolderListItem.folderRef,
                                                folderSubfolderIdList: _model
                                                    .subfolderResult1
                                                    ?.folderSubfolderInfo,
                                              ));
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                            text: subfolderListItem.folderName,
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ],
                              ),
                          ],
                        );
                      }),
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: TextFormField(
                        controller: _model.yourEmailTextController,
                        focusNode: _model.yourEmailFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            '3p6r4dvm' /* Folder name */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
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
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 0.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        maxLines: null,
                        validator: _model.yourEmailTextControllerValidator
                            .asValidator(context),
                      ),
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
                      if (_model.folderListComp
                              .where((e) =>
                                  e.folderName ==
                                  _model.yourEmailTextController.text)
                              .toList()
                              .length >
                          0) {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text('Folder already exists.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('Confirm'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ) ??
                            false;
                      } else {
                        _model.idMapResult1 = await queryIdMapRecordOnce(
                          queryBuilder: (idMapRecord) => idMapRecord.where(
                            'type',
                            isEqualTo: 'Main',
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);

                        var folderRecordReference =
                            FolderRecord.collection.doc();
                        await folderRecordReference.set(createFolderRecordData(
                          folderStatus: 'active',
                          folderCreatedAt: getCurrentTimestamp,
                          folderMainId:
                              'BSFL${_model.idMapResult1?.folderId?.toString()}',
                          folderName: _model.yourEmailTextController.text,
                          folderCreatedUserRef: currentUserReference,
                          folderCreatedUserRole:
                              valueOrDefault(currentUserDocument?.userRole, ''),
                          folderCreatedUserInfo: updateFolderUserInfoStruct(
                            FolderUserInfoStruct(
                              folderUserRef: currentUserReference,
                              folderUserUid: currentUserUid,
                              folderUserRole: valueOrDefault(
                                  currentUserDocument?.userRole, ''),
                              folderUserImage: currentUserPhoto,
                              folderUserName: currentUserDisplayName,
                              folderUserEmail: currentUserEmail,
                            ),
                            clearUnsetFields: false,
                            create: true,
                          ),
                        ));
                        _model.newFolderResult1 =
                            FolderRecord.getDocumentFromData(
                                createFolderRecordData(
                                  folderStatus: 'active',
                                  folderCreatedAt: getCurrentTimestamp,
                                  folderMainId:
                                      'BSFL${_model.idMapResult1?.folderId?.toString()}',
                                  folderName:
                                      _model.yourEmailTextController.text,
                                  folderCreatedUserRef: currentUserReference,
                                  folderCreatedUserRole: valueOrDefault(
                                      currentUserDocument?.userRole, ''),
                                  folderCreatedUserInfo:
                                      updateFolderUserInfoStruct(
                                    FolderUserInfoStruct(
                                      folderUserRef: currentUserReference,
                                      folderUserUid: currentUserUid,
                                      folderUserRole: valueOrDefault(
                                          currentUserDocument?.userRole, ''),
                                      folderUserImage: currentUserPhoto,
                                      folderUserName: currentUserDisplayName,
                                      folderUserEmail: currentUserEmail,
                                    ),
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                ),
                                folderRecordReference);

                        await _model.folderListComp.last.folderRef!.update({
                          ...mapToFirestore(
                            {
                              'folder_subfolder_info': FieldValue.arrayUnion([
                                getFolderInfoFirestoreData(
                                  updateFolderInfoStruct(
                                    FolderInfoStruct(
                                      folderId:
                                          _model.newFolderResult1?.folderMainId,
                                      folderName:
                                          _model.newFolderResult1?.folderName,
                                      folderRef:
                                          _model.newFolderResult1?.reference,
                                    ),
                                    clearUnsetFields: false,
                                  ),
                                  true,
                                )
                              ]),
                            },
                          ),
                        });

                        await _model.idMapResult1!.reference.update({
                          ...mapToFirestore(
                            {
                              'folder_id': FieldValue.increment(1),
                            },
                          ),
                        });
                        unawaited(
                          () async {
                            Navigator.pop(context);
                          }(),
                        );
                        FFAppState().refresh = FFAppState().refresh + 1;
                        FFAppState().update(() {});
                      }

                      safeSetState(() {});
                    },
                    child: wrapWithModel(
                      model: _model.addButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AddButtonWidget(
                        text: FFLocalizations.of(context).getText(
                          'e0arbjhn' /* Create */,
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
                ].divide(SizedBox(width: 16.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
