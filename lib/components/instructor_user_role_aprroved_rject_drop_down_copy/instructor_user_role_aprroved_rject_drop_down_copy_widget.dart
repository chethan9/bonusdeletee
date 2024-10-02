import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/student_blocking/student_blocking_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'instructor_user_role_aprroved_rject_drop_down_copy_model.dart';
export 'instructor_user_role_aprroved_rject_drop_down_copy_model.dart';

class InstructorUserRoleAprrovedRjectDropDownCopyWidget extends StatefulWidget {
  const InstructorUserRoleAprrovedRjectDropDownCopyWidget({
    super.key,
    this.instructorRequestRef,
    this.userRef,
    required this.status,
  });

  final DocumentReference? instructorRequestRef;
  final DocumentReference? userRef;
  final String? status;

  @override
  State<InstructorUserRoleAprrovedRjectDropDownCopyWidget> createState() =>
      _InstructorUserRoleAprrovedRjectDropDownCopyWidgetState();
}

class _InstructorUserRoleAprrovedRjectDropDownCopyWidgetState
    extends State<InstructorUserRoleAprrovedRjectDropDownCopyWidget> {
  late InstructorUserRoleAprrovedRjectDropDownCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => InstructorUserRoleAprrovedRjectDropDownCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: 300.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '1f4p9q1o' /* Approve / Reject */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Builder(
                builder: (context) => FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(
                    _model.dropDownValue ??= widget!.status,
                  ),
                  options: [
                    FFLocalizations.of(context).getText(
                      'nwtuc54h' /* Approved */,
                    ),
                    FFLocalizations.of(context).getText(
                      '89p2dcby' /* Reject */,
                    ),
                    FFLocalizations.of(context).getText(
                      'yn7f2f1e' /* Pending */,
                    )
                  ],
                  onChanged: (val) async {
                    safeSetState(() => _model.dropDownValue = val);
                    await widget!.instructorRequestRef!
                        .update(createInstructorUserRequestRecordData(
                      status: _model.dropDownValue,
                      approvalFrom: currentUserReference,
                      approvalDate: getCurrentTimestamp,
                    ));
                    _model.userRslt1 =
                        await UsersRecord.getDocumentOnce(widget!.userRef!);
                    if (_model.dropDownValue == 'Approved') {
                      await widget!.userRef!.update(createUsersRecordData(
                        userRole: 'Instructor',
                        instuctorStatus: _model.dropDownValue,
                      ));

                      await MailRecord.collection
                          .doc()
                          .set(createMailRecordData(
                            to: _model.userRslt1?.email,
                            template: createTemplateMainStruct(
                              data: createTemplateMessagePartStruct(
                                userName: _model.userRslt1?.displayName,
                                clearUnsetFields: false,
                                create: true,
                              ),
                              name: 'InstructorApproved',
                              clearUnsetFields: false,
                              create: true,
                            ),
                            createdAt: getCurrentTimestamp,
                          ));
                      _model.userIP1 = await actions.getUserIPaddress();
                      _model.userSession1 = await actions.getUserSessionID(
                        currentUserUid,
                      );

                      await ActivityLogRecord.collection.doc().set({
                        ...createActivityLogRecordData(
                          userRef: currentUserReference,
                          userIP: _model.userIP1,
                          userRole:
                              valueOrDefault(currentUserDocument?.userRole, ''),
                          createdAt: getCurrentTimestamp,
                          eventType: 'Modified',
                          object: 'Instructor Request',
                          eventId: widget!.instructorRequestRef?.id,
                          eventTitle: _model.dropDownValue,
                          userSessionID: _model.userSession1,
                        ),
                        ...mapToFirestore(
                          {
                            'eventStatus': ['Modify'],
                          },
                        ),
                      });
                    } else {
                      if (_model.dropDownValue == 'Reject') {
                        await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: WebViewAware(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  child: StudentBlockingWidget(
                                    userRef: widget!.userRef!,
                                    status: _model.dropDownValue!,
                                    userStatus: _model.dropDownValue,
                                  ),
                                ),
                              ),
                            );
                          },
                        );

                        _model.userIP2 = await actions.getUserIPaddress();
                        _model.userSession2 = await actions.getUserSessionID(
                          currentUserUid,
                        );

                        await ActivityLogRecord.collection.doc().set({
                          ...createActivityLogRecordData(
                            userRef: currentUserReference,
                            userIP: _model.userIP2,
                            userRole: valueOrDefault(
                                currentUserDocument?.userRole, ''),
                            createdAt: getCurrentTimestamp,
                            eventType: 'Modified',
                            object: 'Instructor Request',
                            eventId: widget!.instructorRequestRef?.id,
                            eventTitle: _model.dropDownValue,
                            userSessionID: _model.userSession2,
                          ),
                          ...mapToFirestore(
                            {
                              'eventStatus': ['Modify'],
                            },
                          ),
                        });
                      }
                    }

                    safeSetState(() {});
                  },
                  width: 250.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'vzsuv82v' /* Please select... */,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).primaryBackground,
                  borderWidth: 2.0,
                  borderRadius: 0.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
        ),
      ),
    );
  }
}
