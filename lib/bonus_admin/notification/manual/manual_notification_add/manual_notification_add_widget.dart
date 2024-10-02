import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/add_button/add_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'manual_notification_add_model.dart';
export 'manual_notification_add_model.dart';

class ManualNotificationAddWidget extends StatefulWidget {
  const ManualNotificationAddWidget({super.key});

  @override
  State<ManualNotificationAddWidget> createState() =>
      _ManualNotificationAddWidgetState();
}

class _ManualNotificationAddWidgetState
    extends State<ManualNotificationAddWidget> {
  late ManualNotificationAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManualNotificationAddModel());

    _model.yourEmailTextController ??= TextEditingController();
    _model.yourEmailFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

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

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: 450.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Visibility(
            visible: responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '3h1pu3qt' /* Select Course */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                      ),
                                ),
                              ),
                              FlutterFlowRadioButton(
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'h42oa0lh' /* All */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'ywdhpky4' /* Single */,
                                  )
                                ].toList(),
                                onChanged: (val) => safeSetState(() {}),
                                controller: _model.courseASValueController ??=
                                    FormFieldController<String>(
                                        FFLocalizations.of(context).getText(
                                  'vaacqwng' /* All */,
                                )),
                                optionHeight: 32.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                                selectedTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.horizontal,
                                radioButtonColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveRadioButtonColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                toggleable: false,
                                horizontalAlignment: WrapAlignment.start,
                                verticalAlignment: WrapCrossAlignment.start,
                              ),
                              if (_model.courseASValue == 'Single')
                                Container(
                                  width: 333.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: StreamBuilder<List<CourseRecord>>(
                                      stream: queryCourseRecord(
                                        queryBuilder: (courseRecord) =>
                                            courseRecord.where(
                                          'status',
                                          isEqualTo: 'Publish',
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0x00DF473F),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<CourseRecord>
                                            singleCourseCourseRecordList =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .singleCourseValueController ??=
                                              FormFieldController<String>(null),
                                          options: singleCourseCourseRecordList
                                              .map((e) => e.name)
                                              .toList(),
                                          onChanged: (val) => safeSetState(() =>
                                              _model.singleCourseValue = val),
                                          height: 50.0,
                                          maxHeight: 210.0,
                                          searchHintTextStyle: FlutterFlowTheme
                                                  .of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily),
                                              ),
                                          searchTextStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'g6pw8uvm' /* Select Course...* */,
                                          ),
                                          searchHintText:
                                              FFLocalizations.of(context)
                                                  .getText(
                                            '7t31jv7x' /* Search... */,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: true,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        ),
                        SizedBox(
                          height: 120.0,
                          child: VerticalDivider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).accent4,
                          ),
                        ),
                        if (_model.courseASValue == 'Single')
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '8rk3fhsy' /* EMI Type */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily),
                                        ),
                                  ),
                                ),
                                FlutterFlowRadioButton(
                                  options: [
                                    FFLocalizations.of(context).getText(
                                      '5gt1hmaz' /* Second */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '9wgwn5lr' /* Third */,
                                    )
                                  ].toList(),
                                  onChanged: (val) => safeSetState(() {}),
                                  controller: _model.emiTypeValueController ??=
                                      FormFieldController<String>(
                                          FFLocalizations.of(context).getText(
                                    'xvq2qhri' /* Second */,
                                  )),
                                  optionHeight: 32.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  selectedTextStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveRadioButtonColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                              ],
                            ),
                          ),
                      ].divide(SizedBox(width: 4.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    _model.uploadedFileUrl,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/academy-backend-uubu81/assets/fnk8usux3q1j/Placeholder.png',
                                  ),
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 165.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            allowPhoto: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();

                                              downloadUrls = (await Future.wait(
                                                selectedMedia.map(
                                                  (m) async => await uploadData(
                                                      m.storagePath, m.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'buschq9y' /* Add Photo */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 100.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
                                                        .containsKey(
                                                            'Lexend Deca'),
                                              ),
                                          elevation: 1.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_model.uploadedFileUrl != '')
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            safeSetState(() {
                                              _model.isDataUploading = false;
                                              _model.uploadedLocalFile =
                                                  FFUploadedFile(
                                                      bytes: Uint8List.fromList(
                                                          []));
                                              _model.uploadedFileUrl = '';
                                            });
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'e3mua2ek' /* Remove */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 100.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Lexend Deca'),
                                                ),
                                            elevation: 1.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 333.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: TextFormField(
                                    controller: _model.yourEmailTextController,
                                    focusNode: _model.yourEmailFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        '5giezcql' /* Title* */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 0.0, 24.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    maxLines: null,
                                    validator: _model
                                        .yourEmailTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Container(
                                width: 333.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: TextFormField(
                                    controller:
                                        _model.descriptionTextController,
                                    focusNode: _model.descriptionFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'mk2fixrb' /* Text* */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 0.0, 24.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    maxLines: 2,
                                    validator: _model
                                        .descriptionTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Container(
                                width: 333.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: StreamBuilder<List<TemplateRecord>>(
                                    stream: queryTemplateRecord(),
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
                                      List<TemplateRecord>
                                          mailDDTemplateRecordList =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .mailDDValueController ??=
                                            FormFieldController<String>(null),
                                        options: _model.courseASValue != 'All'
                                            ? _model.mailTemp
                                            : mailDDTemplateRecordList
                                                .map((e) => e.reference.id)
                                                .toList(),
                                        onChanged: (val) => safeSetState(
                                            () => _model.mailDDValue = val),
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'l98z03u2' /* Select Template...* */,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                    Wrap(
                      spacing: 0.0,
                      runSpacing: 0.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if (_model.courseASValue == null) {
                                  return;
                                }
                                if (_model.mailDDValue == null) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'Please select mail template.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  return;
                                }

                                var manualAlertSubscriberRecordReference =
                                    ManualAlertSubscriberRecord.collection
                                        .doc();
                                await manualAlertSubscriberRecordReference
                                    .set(createManualAlertSubscriberRecordData(
                                  title: _model.yourEmailTextController.text,
                                  description:
                                      _model.descriptionTextController.text,
                                  image: _model.uploadedFileUrl,
                                  mailTitle: _model.mailDDValue,
                                  type: _model.courseASValue,
                                  status: 'Pending',
                                  createdAt: getCurrentTimestamp,
                                ));
                                _model.manualAlert1 = ManualAlertSubscriberRecord
                                    .getDocumentFromData(
                                        createManualAlertSubscriberRecordData(
                                          title: _model
                                              .yourEmailTextController.text,
                                          description: _model
                                              .descriptionTextController.text,
                                          image: _model.uploadedFileUrl,
                                          mailTitle: _model.mailDDValue,
                                          type: _model.courseASValue,
                                          status: 'Pending',
                                          createdAt: getCurrentTimestamp,
                                        ),
                                        manualAlertSubscriberRecordReference);
                                if (_model.courseASValue == 'Single') {
                                  _model.courseSingRslt1 =
                                      await queryCourseRecordOnce(
                                    queryBuilder: (courseRecord) => courseRecord
                                        .where(
                                          'status',
                                          isEqualTo: 'Publish',
                                        )
                                        .where(
                                          'name',
                                          isEqualTo: _model.singleCourseValue,
                                        ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  if (_model.emiTypeValue == 'Second') {
                                    _model.subSecondRslt =
                                        await querySubscriptionRecordOnce(
                                      queryBuilder: (subscriptionRecord) =>
                                          subscriptionRecord
                                              .where(
                                                'courseRef',
                                                isEqualTo: _model
                                                    .courseSingRslt1?.reference,
                                              )
                                              .where(
                                                'batchesRef',
                                                isEqualTo: _model
                                                    .courseSingRslt1
                                                    ?.batchesRef,
                                              )
                                              .where(
                                                'status',
                                                isEqualTo: 'Ongoing',
                                              )
                                              .where(
                                                'firstPaymentStatus',
                                                isEqualTo: 'CAPTURED',
                                              )
                                              .where(
                                                'secondPaymentStatus',
                                                isEqualTo: null,
                                              ),
                                    );
                                    FFAppState().userSubRef = _model
                                        .subSecondRslt!
                                        .map((e) => e.userRef)
                                        .withoutNulls
                                        .toList()
                                        .cast<DocumentReference>();
                                    FFAppState().userSubTotal =
                                        _model.subSecondRslt!.length;
                                  } else {
                                    _model.subThirdRslt =
                                        await querySubscriptionRecordOnce(
                                      queryBuilder: (subscriptionRecord) =>
                                          subscriptionRecord
                                              .where(
                                                'courseRef',
                                                isEqualTo: _model
                                                    .courseSingRslt1?.reference,
                                              )
                                              .where(
                                                'batchesRef',
                                                isEqualTo: _model
                                                    .courseSingRslt1
                                                    ?.batchesRef,
                                              )
                                              .where(
                                                'status',
                                                isEqualTo: 'Ongoing',
                                              )
                                              .where(
                                                'firstPaymentStatus',
                                                isEqualTo: 'CAPTURED',
                                              )
                                              .where(
                                                'secondPaymentStatus',
                                                isEqualTo: 'CAPTURED',
                                              )
                                              .where(
                                                'thirdPaymentStatus',
                                                isEqualTo: null,
                                              ),
                                    );
                                    FFAppState().userSubRef = _model
                                        .subThirdRslt!
                                        .map((e) => e.userRef)
                                        .withoutNulls
                                        .toList()
                                        .cast<DocumentReference>();
                                    FFAppState().userSubTotal =
                                        _model.subThirdRslt!.length;
                                  }

                                  while (FFAppState().userSubTotal != 0) {
                                    _model.userSubRslt1 =
                                        await UsersRecord.getDocumentOnce(
                                            FFAppState().userSubRef[
                                                FFAppState().userSubTotal - 1]);
                                    FFAppState().mail =
                                        '${FFAppState().mail}${_model.userSubRslt1?.email},';
                                    FFAppState().userSubTotal =
                                        FFAppState().userSubTotal - 1;
                                    FFAppState().addToUserSubMail(
                                        _model.userSubRslt1!.email);
                                  }
                                  _model.batchRsltOne =
                                      await BatchesRecord.getDocumentOnce(
                                          _model.courseSingRslt1!.batchesRef!);

                                  await _model.manualAlert1!.reference.update({
                                    ...createManualAlertSubscriberRecordData(
                                      indCourseName:
                                          _model.courseSingRslt1?.name,
                                      indCourseImage:
                                          _model.courseSingRslt1?.image,
                                      indCourseReference:
                                          _model.courseSingRslt1?.reference,
                                      mail: FFAppState().mail,
                                      emiType: _model.emiTypeValue,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'user_reference':
                                            FFAppState().userSubRef,
                                        'subsriber_email':
                                            FFAppState().userSubMail,
                                        'subsriber_reference':
                                            _model.emiTypeValue == 'Second'
                                                ? _model.subSecondRslt
                                                    ?.map((e) => e.reference)
                                                    .toList()
                                                : _model.subThirdRslt
                                                    ?.map((e) => e.reference)
                                                    .toList(),
                                      },
                                    ),
                                  });

                                  await MailRecord.collection
                                      .doc()
                                      .set(createMailRecordData(
                                        to: FFAppState().mail,
                                        template: createTemplateMainStruct(
                                          data: createTemplateMessagePartStruct(
                                            title: _model.courseSingRslt1?.name,
                                            bio:
                                                '${_model.emiTypeValue == 'Second' ? _model.courseSingRslt1?.secondEMIprice?.toString() : _model.courseSingRslt1?.thirdEMIprice?.toString()} KWD',
                                            image: _model.uploadedFileUrl,
                                            date: _model.emiTypeValue ==
                                                    'Second'
                                                ? dateTimeFormat(
                                                    "yMMMd",
                                                    _model.courseSingRslt1
                                                        ?.dateSecondEMIEmail,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )
                                                : dateTimeFormat(
                                                    "yMMMd",
                                                    _model.courseSingRslt1
                                                        ?.dateThirdEMIEmail,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                            subtitle: _model.batchRsltOne?.name,
                                            imageCourse:
                                                _model.courseSingRslt1?.image,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          name: () {
                                            if (_model.emiTypeValue ==
                                                'Second') {
                                              return 'SecondEMI';
                                            } else if (_model.emiTypeValue ==
                                                'Third') {
                                              return 'ThirdEMI';
                                            } else {
                                              return _model.mailDDValue;
                                            }
                                          }(),
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                        createdAt: getCurrentTimestamp,
                                      ));
                                } else {
                                  _model.allUserRslt1 =
                                      await queryUsersRecordOnce(
                                    queryBuilder: (usersRecord) => usersRecord
                                        .where(
                                          'userRole',
                                          isEqualTo: 'Student',
                                        )
                                        .where(
                                          'status',
                                          isEqualTo: 'Approved',
                                        ),
                                  );
                                  FFAppState().userSubRef = _model.allUserRslt1!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  FFAppState().userSubTotal =
                                      _model.allUserRslt1!.length;
                                  FFAppState().userSubMail = _model
                                      .allUserRslt1!
                                      .map((e) => e.email)
                                      .toList()
                                      .cast<String>();
                                  while (FFAppState().userSubTotal != 0) {
                                    _model.userSubRslt2 =
                                        await UsersRecord.getDocumentOnce(
                                            FFAppState().userSubRef[
                                                FFAppState().userSubTotal - 1]);
                                    FFAppState().mail =
                                        '${FFAppState().mail}${_model.userSubRslt2?.email},';
                                    FFAppState().userSubTotal =
                                        FFAppState().userSubTotal - 1;
                                  }

                                  await _model.manualAlert1!.reference.update({
                                    ...createManualAlertSubscriberRecordData(
                                      mail: FFAppState().mail,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'user_reference': _model.allUserRslt1
                                            ?.map((e) => e.reference)
                                            .toList(),
                                        'subsriber_email': _model.allUserRslt1
                                            ?.map((e) => e.email)
                                            .toList(),
                                      },
                                    ),
                                  });

                                  await MailRecord.collection
                                      .doc()
                                      .set(createMailRecordData(
                                        to: FFAppState().mail,
                                        template: createTemplateMainStruct(
                                          data: createTemplateMessagePartStruct(
                                            title: _model
                                                .yourEmailTextController.text,
                                            bio: _model
                                                .descriptionTextController.text,
                                            image: _model.uploadedFileUrl,
                                            date: dateTimeFormat(
                                              "yMMMd",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          name: _model.mailDDValue,
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                        createdAt: getCurrentTimestamp,
                                      ));
                                }

                                await _model.manualAlert1!.reference.update(
                                    createManualAlertSubscriberRecordData(
                                  status: 'Success',
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Pushed Successfully',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                Navigator.pop(context);

                                context.goNamed('ManualNotification-List');

                                safeSetState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.addButtonModel,
                                updateCallback: () => safeSetState(() {}),
                                child: AddButtonWidget(
                                  text: FFLocalizations.of(context).getText(
                                    '5mmnbcym' /* Send */,
                                  ),
                                  icon: Icon(
                                    Icons.save_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 16.0,
                                  ),
                                  height: 45,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
