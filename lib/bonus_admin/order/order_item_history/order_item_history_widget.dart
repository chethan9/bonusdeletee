import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'order_item_history_model.dart';
export 'order_item_history_model.dart';

class OrderItemHistoryWidget extends StatefulWidget {
  const OrderItemHistoryWidget({
    super.key,
    required this.orderRef,
    int? paymentProcess,
  }) : this.paymentProcess = paymentProcess ?? 1;

  final DocumentReference? orderRef;
  final int paymentProcess;

  @override
  State<OrderItemHistoryWidget> createState() => _OrderItemHistoryWidgetState();
}

class _OrderItemHistoryWidgetState extends State<OrderItemHistoryWidget> {
  late OrderItemHistoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderItemHistoryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
      child: StreamBuilder<List<OrderHistoryRecord>>(
        stream: queryOrderHistoryRecord(
          queryBuilder: (orderHistoryRecord) => orderHistoryRecord.where(
            'orderRef',
            isEqualTo: widget!.orderRef,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 10.0,
                height: 10.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0x00DF473F),
                  ),
                ),
              ),
            );
          }
          List<OrderHistoryRecord> listViewOrderHistoryRecordList =
              snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listViewOrderHistoryRecordList.length,
            itemBuilder: (context, listViewIndex) {
              final listViewOrderHistoryRecord =
                  listViewOrderHistoryRecordList[listViewIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                child: StreamBuilder<OrdersRecord>(
                  stream: OrdersRecord.getDocument(widget!.orderRef!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 10.0,
                          height: 10.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0x00DF473F),
                            ),
                          ),
                        ),
                      );
                    }

                    final containerOrdersRecord = snapshot.data!;

                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.0,
                            color: FlutterFlowTheme.of(context).lineColor,
                            offset: Offset(
                              0.0,
                              1.0,
                            ),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 2,
                              child: StreamBuilder<CourseRecord>(
                                stream: CourseRecord.getDocument(
                                    listViewOrderHistoryRecord.courseRef!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 10.0,
                                        height: 10.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0x00DF473F),
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final rowCourseRecord = snapshot.data!;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (listViewOrderHistoryRecord
                                              .batchesRef !=
                                          null) {
                                        _model.batchRslt1 =
                                            await BatchesRecord.getDocumentOnce(
                                                listViewOrderHistoryRecord
                                                    .batchesRef!);
                                        if ((_model.batchRslt1?.status ==
                                                'Ongoing') &&
                                            (_model.batchRslt1?.courseRef
                                                    ?.contains(
                                                        listViewOrderHistoryRecord
                                                            .courseRef) ==
                                                true)) {
                                          FFAppState().videoRef = null;
                                          safeSetState(() {});
                                          _model.courseRslt1 =
                                              await CourseRecord
                                                  .getDocumentOnce(
                                                      listViewOrderHistoryRecord
                                                          .courseRef!);
                                          _model.cR1 = await CountryRecord
                                              .getDocumentOnce(_model
                                                  .courseRslt1!.countryRef!);
                                          _model.uR1 = await UniversityRecord
                                              .getDocumentOnce(_model
                                                  .courseRslt1!.universityRef!);
                                          _model.ccR1 = await CategoryRecord
                                              .getDocumentOnce(_model
                                                  .courseRslt1!.categoryRef!);
                                          _model.bR1 = await BranchRecord
                                              .getDocumentOnce(_model
                                                  .courseRslt1!.branchRef!);

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            courseLevel:
                                                createInstructorCourseLevelStruct(
                                              coutryRef: _model
                                                  .courseRslt1?.countryRef,
                                              universityRef: _model
                                                  .courseRslt1?.universityRef,
                                              branchRef:
                                                  _model.courseRslt1?.branchRef,
                                              categoryRef: _model
                                                  .courseRslt1?.categoryRef,
                                              countryName: _model.cR1?.name,
                                              universityName: _model.uR1?.name,
                                              branchName: _model.bR1?.name,
                                              categoryName: _model.ccR1?.name,
                                              clearUnsetFields: false,
                                            ),
                                          ));

                                          context.pushNamed(
                                            'CourseFORM',
                                            queryParameters: {
                                              'courseRef': serializeParam(
                                                _model.courseRslt1,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'courseRef': _model.courseRslt1,
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content:
                                                      Text('Batch is archived'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content:
                                                    Text('Batch is archived'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: valueOrDefault<String>(
                                                rowCourseRecord.image,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/academy-backend-uubu81/assets/d4qgp31qwifd/course_placeholder.png',
                                              ),
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                rowCourseRecord.name
                                                    .maybeHandleOverflow(
                                                  maxChars: 32,
                                                  replacement: '…',
                                                ),
                                                maxLines: 32,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: StreamBuilder<BatchesRecord>(
                                stream: BatchesRecord.getDocument(
                                    listViewOrderHistoryRecord.batchesRef!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 10.0,
                                        height: 10.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0x00DF473F),
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final rowBatchesRecord = snapshot.data!;

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                      ))
                                        Expanded(
                                          child: AutoSizeText(
                                            rowBatchesRecord.name
                                                .maybeHandleOverflow(
                                                    maxChars: 32),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if ((listViewOrderHistoryRecord.paymentType !=
                                          'EMI') &&
                                      responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                      ))
                                    AutoSizeText(
                                      '${listViewOrderHistoryRecord.paymentType}'
                                          .maybeHandleOverflow(maxChars: 32),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  if ((listViewOrderHistoryRecord.paymentType ==
                                          'EMI') &&
                                      responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                      ))
                                    AutoSizeText(
                                      '${listViewOrderHistoryRecord.paymentType} :  ${listViewOrderHistoryRecord.emiPaymentType}'
                                          .maybeHandleOverflow(maxChars: 32),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Expanded(
                                      child: AutoSizeText(
                                        '${listViewOrderHistoryRecord.price.toString()} KWD'
                                            .maybeHandleOverflow(maxChars: 32),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Expanded(
                                      child: AutoSizeText(
                                        '0 KWD'
                                            .maybeHandleOverflow(maxChars: 32),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Expanded(
                                      child: AutoSizeText(
                                        '${listViewOrderHistoryRecord.price.toString()} KWD'
                                            .maybeHandleOverflow(maxChars: 32),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
