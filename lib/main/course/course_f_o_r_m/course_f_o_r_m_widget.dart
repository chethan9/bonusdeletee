import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/bonus_admin/batch/batch_change_batch_single_course_present_info/batch_change_batch_single_course_present_info_widget.dart';
import '/bonus_admin/batch/batch_password_single_course/batch_password_single_course_widget.dart';
import '/bonus_admin/media/video_list_for_selection/video_list_for_selection_widget.dart';
import '/bonus_admin/media/video_preview_title/video_preview_title_widget.dart';
import '/components/add_button/add_button_widget.dart';
import '/components/change_branch/change_branch_widget.dart';
import '/components/mobile/mobile_widget.dart';
import '/components/remove/remove_widget.dart';
import '/components/user/initial_user_status_check/initial_user_status_check_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/components/web_nav_horizontal/web_nav_horizontal_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'course_f_o_r_m_model.dart';
export 'course_f_o_r_m_model.dart';

class CourseFORMWidget extends StatefulWidget {
  const CourseFORMWidget({
    super.key,
    this.courseRef,
  });

  final CourseRecord? courseRef;

  @override
  State<CourseFORMWidget> createState() => _CourseFORMWidgetState();
}

class _CourseFORMWidgetState extends State<CourseFORMWidget> {
  late CourseFORMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseFORMModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().batchesRef = widget!.courseRef?.batchesRef;
      safeSetState(() {});
    });

    _model.inputFocusNode1 ??= FocusNode();

    _model.inputFocusNode2 ??= FocusNode();

    _model.inputFocusNode3 ??= FocusNode();

    _model.inputFocusNode4 ??= FocusNode();

    _model.inputFocusNode5 ??= FocusNode();

    _model.inputFocusNode6 ??= FocusNode();

    _model.inputFocusNode7 ??= FocusNode();

    _model.inputFocusNode8 ??= FocusNode();

    _model.fpTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.courseRef?.price?.toString(),
      '0',
    ));
    _model.fpFocusNode ??= FocusNode();

    _model.inputFocusNode9 ??= FocusNode();

    _model.inputFocusNode10 ??= FocusNode();

    _model.inputFocusNode11 ??= FocusNode();

    _model.inputFocusNode12 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'CourseFORM',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ) &&
                    !isWeb
                ? AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    automaticallyImplyLeading: false,
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '305n67mu' /* Customers */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).displaySmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .displaySmallFamily),
                          ),
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 0.0,
                  )
                : null,
            body: Stack(
              children: [
                if ((MediaQuery.sizeOf(context).width > 1070.0) &&
                    responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        wrapWithModel(
                          model: _model.webNavModel,
                          updateCallback: () => safeSetState(() {}),
                          child: WebNavWidget(
                            colorBgOne: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            colorBgTwo:
                                FlutterFlowTheme.of(context).primaryBackground,
                            colorBgThree: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            colorBgFour: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textOne: FlutterFlowTheme.of(context).secondaryText,
                            textTwo: FlutterFlowTheme.of(context).primaryText,
                            textThree:
                                FlutterFlowTheme.of(context).secondaryText,
                            textFour:
                                FlutterFlowTheme.of(context).secondaryText,
                            colorBgFive: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textFive:
                                FlutterFlowTheme.of(context).secondaryText,
                            colorBgSix: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            expand: false,
                            colorBgPrimarydropdown:
                                FlutterFlowTheme.of(context).accent4,
                          ),
                        ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
                                      icon: Icon(
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                          'Course',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget!.courseRef != null
                                            ? widget!.courseRef?.name
                                            : 'Add Course',
                                        'Add Course',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (widget!.courseRef?.batchesRef != null)
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 0.0),
                                  child: StreamBuilder<BatchesRecord>(
                                    stream: BatchesRecord.getDocument(
                                        widget!.courseRef!.batchesRef!),
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

                                      final containerBatchesRecord =
                                          snapshot.data!;

                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            Expanded(
                              child: Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: StreamBuilder<CourseRecord>(
                                  stream: CourseRecord.getDocument(
                                      widget!.courseRef!.reference),
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

                                    final columnCourseRecord = snapshot.data!;

                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          16.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                          .inputTextController1 ??=
                                                                      TextEditingController(
                                                                    text: columnCourseRecord
                                                                        .name,
                                                                  ),
                                                                  focusNode: _model
                                                                      .inputFocusNode1,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ixg06oy0' /* Title* */,
                                                                    ),
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            24.0,
                                                                            0.0,
                                                                            24.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                  validator: _model
                                                                      .inputTextController1Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                          .inputTextController2 ??=
                                                                      TextEditingController(
                                                                    text: columnCourseRecord
                                                                        .subtitle,
                                                                  ),
                                                                  focusNode: _model
                                                                      .inputFocusNode2,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'xtua7brb' /* Subtitle */,
                                                                    ),
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            24.0,
                                                                            0.0,
                                                                            24.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                  maxLines:
                                                                      null,
                                                                  validator: _model
                                                                      .inputTextController2Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      builder: (context) =>
                                                                          StreamBuilder<
                                                                              List<CountryRecord>>(
                                                                        stream:
                                                                            queryCountryRecord(),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<CountryRecord>
                                                                              coCountryRecordList =
                                                                              snapshot.data!;

                                                                          return FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.coValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.coValue ??= currentUserDocument?.courseLevel?.countryName,
                                                                            ),
                                                                            options:
                                                                                coCountryRecordList.map((e) => e.name).toList(),
                                                                            onChanged:
                                                                                (val) async {
                                                                              safeSetState(() => _model.coValue = val);
                                                                              _model.countryRslt = await queryCountryRecordOnce(
                                                                                queryBuilder: (countryRecord) => countryRecord.where(
                                                                                  'name',
                                                                                  isEqualTo: _model.coValue,
                                                                                ),
                                                                                singleRecord: true,
                                                                              ).then((s) => s.firstOrNull);

                                                                              await currentUserReference!.update(createUsersRecordData(
                                                                                courseLevel: createInstructorCourseLevelStruct(
                                                                                  countryName: _model.coValue,
                                                                                  coutryRef: _model.countryRslt?.reference,
                                                                                  universityName: 'Please select..',
                                                                                  branchName: 'Please select..',
                                                                                  categoryName: 'Please select..',
                                                                                  fieldValues: {
                                                                                    'universityRef': FieldValue.delete(),
                                                                                    'branchRef': FieldValue.delete(),
                                                                                    'categoryRef': FieldValue.delete(),
                                                                                  },
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                              safeSetState(() {
                                                                                _model.caValueController?.reset();
                                                                                _model.brValueController?.reset();
                                                                                _model.unValueController?.reset();
                                                                              });
                                                                              FFAppState().refresh = 1;
                                                                              safeSetState(() {});

                                                                              safeSetState(() {});
                                                                            },
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                50.0,
                                                                            maxHeight:
                                                                                250.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'g2c2ikjm' /* Select country... */,
                                                                            ),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                4.0,
                                                                                16.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                            isMultiSelect:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        if (currentUserDocument
                                                                    ?.courseLevel
                                                                    ?.coutryRef
                                                                    ?.id !=
                                                                null &&
                                                            currentUserDocument
                                                                    ?.courseLevel
                                                                    ?.coutryRef
                                                                    ?.id !=
                                                                '')
                                                          Expanded(
                                                            child:
                                                                AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: StreamBuilder<
                                                                            List<UniversityRecord>>(
                                                                          stream:
                                                                              queryUniversityRecord(
                                                                            queryBuilder: (universityRecord) =>
                                                                                universityRecord.where(
                                                                              'countryRef',
                                                                              isEqualTo: currentUserDocument?.courseLevel?.coutryRef,
                                                                            ),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<UniversityRecord>
                                                                                unUniversityRecordList =
                                                                                snapshot.data!;

                                                                            return FlutterFlowDropDown<String>(
                                                                              controller: _model.unValueController ??= FormFieldController<String>(
                                                                                _model.unValue ??= currentUserDocument?.courseLevel?.universityName,
                                                                              ),
                                                                              options: unUniversityRecordList.map((e) => e.name).toList(),
                                                                              onChanged: (val) async {
                                                                                safeSetState(() => _model.unValue = val);
                                                                                _model.universityRslt = await queryUniversityRecordOnce(
                                                                                  queryBuilder: (universityRecord) => universityRecord
                                                                                      .where(
                                                                                        'name',
                                                                                        isEqualTo: _model.unValue,
                                                                                      )
                                                                                      .where(
                                                                                        'countryRef',
                                                                                        isEqualTo: currentUserDocument?.courseLevel?.coutryRef,
                                                                                      ),
                                                                                  singleRecord: true,
                                                                                ).then((s) => s.firstOrNull);

                                                                                await currentUserReference!.update(createUsersRecordData(
                                                                                  courseLevel: createInstructorCourseLevelStruct(
                                                                                    universityName: _model.unValue,
                                                                                    universityRef: _model.universityRslt?.reference,
                                                                                    categoryName: 'Please select..',
                                                                                    branchName: 'Please select..',
                                                                                    fieldValues: {
                                                                                      'branchRef': FieldValue.delete(),
                                                                                      'categoryRef': FieldValue.delete(),
                                                                                    },
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                ));
                                                                                safeSetState(() {
                                                                                  _model.caValueController?.reset();
                                                                                  _model.brValueController?.reset();
                                                                                });
                                                                                FFAppState().refresh = 2;
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              width: 300.0,
                                                                              height: 50.0,
                                                                              maxHeight: 250.0,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                '2kz1ke6g' /* Select university... */,
                                                                              ),
                                                                              icon: Icon(
                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 2.0,
                                                                              borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderWidth: 2.0,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
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
                                                            ),
                                                          ),
                                                        if (currentUserDocument
                                                                    ?.courseLevel
                                                                    ?.universityRef
                                                                    ?.id !=
                                                                null &&
                                                            currentUserDocument
                                                                    ?.courseLevel
                                                                    ?.universityRef
                                                                    ?.id !=
                                                                '')
                                                          Expanded(
                                                            child:
                                                                AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: StreamBuilder<
                                                                            List<CategoryRecord>>(
                                                                          stream:
                                                                              queryCategoryRecord(
                                                                            queryBuilder: (categoryRecord) => categoryRecord
                                                                                .where(
                                                                                  'universityRef',
                                                                                  isEqualTo: currentUserDocument?.courseLevel?.universityRef,
                                                                                )
                                                                                .where(
                                                                                  'countryRef',
                                                                                  isEqualTo: currentUserDocument?.courseLevel?.coutryRef,
                                                                                ),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<CategoryRecord>
                                                                                caCategoryRecordList =
                                                                                snapshot.data!;

                                                                            return FlutterFlowDropDown<String>(
                                                                              controller: _model.caValueController ??= FormFieldController<String>(
                                                                                _model.caValue ??= currentUserDocument?.courseLevel?.categoryName,
                                                                              ),
                                                                              options: caCategoryRecordList.map((e) => e.name).toList(),
                                                                              onChanged: (val) async {
                                                                                safeSetState(() => _model.caValue = val);
                                                                                _model.categoryRslt = await queryCategoryRecordOnce(
                                                                                  queryBuilder: (categoryRecord) => categoryRecord
                                                                                      .where(
                                                                                        'name',
                                                                                        isEqualTo: _model.caValue,
                                                                                      )
                                                                                      .where(
                                                                                        'countryRef',
                                                                                        isEqualTo: currentUserDocument?.courseLevel?.coutryRef,
                                                                                      )
                                                                                      .where(
                                                                                        'universityRef',
                                                                                        isEqualTo: currentUserDocument?.courseLevel?.universityRef,
                                                                                      ),
                                                                                  singleRecord: true,
                                                                                ).then((s) => s.firstOrNull);

                                                                                await currentUserReference!.update(createUsersRecordData(
                                                                                  courseLevel: createInstructorCourseLevelStruct(
                                                                                    categoryName: _model.caValue,
                                                                                    categoryRef: _model.categoryRslt?.reference,
                                                                                    branchName: 'Please select..',
                                                                                    fieldValues: {
                                                                                      'branchRef': FieldValue.delete(),
                                                                                    },
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                ));
                                                                                safeSetState(() {
                                                                                  _model.brValueController?.reset();
                                                                                });
                                                                                FFAppState().refresh = 3;
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              width: 300.0,
                                                                              height: 50.0,
                                                                              maxHeight: 250.0,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'kkk7ctx4' /* Select category... */,
                                                                              ),
                                                                              icon: Icon(
                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 2.0,
                                                                              borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderWidth: 2.0,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
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
                                                            ),
                                                          ),
                                                        if (currentUserDocument
                                                                    ?.courseLevel
                                                                    ?.categoryRef
                                                                    ?.id !=
                                                                null &&
                                                            currentUserDocument
                                                                    ?.courseLevel
                                                                    ?.categoryRef
                                                                    ?.id !=
                                                                '')
                                                          Expanded(
                                                            child:
                                                                AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: StreamBuilder<
                                                                            List<BranchRecord>>(
                                                                          stream:
                                                                              queryBranchRecord(
                                                                            queryBuilder: (branchRecord) => branchRecord
                                                                                .where(
                                                                                  'categoryRef',
                                                                                  isEqualTo: currentUserDocument?.courseLevel?.categoryRef,
                                                                                )
                                                                                .where(
                                                                                  'universityRef',
                                                                                  isEqualTo: currentUserDocument?.courseLevel?.universityRef,
                                                                                ),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<BranchRecord>
                                                                                brBranchRecordList =
                                                                                snapshot.data!;

                                                                            return FlutterFlowDropDown<String>(
                                                                              controller: _model.brValueController ??= FormFieldController<String>(
                                                                                _model.brValue ??= currentUserDocument?.courseLevel?.branchName,
                                                                              ),
                                                                              options: brBranchRecordList.map((e) => e.name).toList(),
                                                                              onChanged: (val) async {
                                                                                safeSetState(() => _model.brValue = val);
                                                                                _model.branchRslt = await queryBranchRecordOnce(
                                                                                  queryBuilder: (branchRecord) => branchRecord
                                                                                      .where(
                                                                                        'name',
                                                                                        isEqualTo: _model.caValue,
                                                                                      )
                                                                                      .where(
                                                                                        'universityRef',
                                                                                        isEqualTo: currentUserDocument?.courseLevel?.universityRef,
                                                                                      )
                                                                                      .where(
                                                                                        'categoryRef',
                                                                                        isEqualTo: currentUserDocument?.courseLevel?.categoryRef,
                                                                                      ),
                                                                                  singleRecord: true,
                                                                                ).then((s) => s.firstOrNull);

                                                                                await currentUserReference!.update(createUsersRecordData(
                                                                                  courseLevel: createInstructorCourseLevelStruct(
                                                                                    branchName: _model.brValue,
                                                                                    branchRef: _model.branchRslt?.reference,
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                ));
                                                                                FFAppState().branchChange = 2;
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              width: 300.0,
                                                                              height: 50.0,
                                                                              maxHeight: 250.0,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                '9nxrfakl' /* Select branch... */,
                                                                              ),
                                                                              icon: Icon(
                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 2.0,
                                                                              borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderWidth: 2.0,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              isSearchable: false,
                                                                              isMultiSelect: false,
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (FFAppState()
                                                                            .branchChange ==
                                                                        2)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: StreamBuilder<
                                                                            List<BranchRecord>>(
                                                                          stream:
                                                                              queryBranchRecord(
                                                                            queryBuilder: (branchRecord) =>
                                                                                branchRecord.where(
                                                                              'name',
                                                                              isEqualTo: _model.brValue,
                                                                            ),
                                                                            singleRecord:
                                                                                true,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<BranchRecord>
                                                                                changeBranchBranchRecordList =
                                                                                snapshot.data!;
                                                                            final changeBranchBranchRecord = changeBranchBranchRecordList.isNotEmpty
                                                                                ? changeBranchBranchRecordList.first
                                                                                : null;

                                                                            return wrapWithModel(
                                                                              model: _model.changeBranchModel,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: ChangeBranchWidget(
                                                                                parameter1: changeBranchBranchRecord?.reference,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ]
                                                          .divide(SizedBox(
                                                              width: 15.0))
                                                          .addToStart(SizedBox(
                                                              width: 15.0))
                                                          .addToEnd(SizedBox(
                                                              width: 15.0)),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.6,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    16.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                    .inputTextController3 ??=
                                                                TextEditingController(
                                                              text: columnCourseRecord
                                                                  .description,
                                                            ),
                                                            focusNode: _model
                                                                .inputFocusNode3,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'ra9dus5c' /* Description */,
                                                              ),
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          24.0,
                                                                          0.0,
                                                                          24.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            maxLines: 3,
                                                            validator: _model
                                                                .inputTextController3Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.6,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    16.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                    .inputTextController4 ??=
                                                                TextEditingController(
                                                              text: columnCourseRecord
                                                                  .courseLearn,
                                                            ),
                                                            focusNode: _model
                                                                .inputFocusNode4,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'o4qs4otc' /* What you will learn */,
                                                              ),
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          24.0,
                                                                          0.0,
                                                                          24.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            maxLines: 3,
                                                            validator: _model
                                                                .inputTextController4Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.6,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    16.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                    .inputTextController5 ??=
                                                                TextEditingController(
                                                              text: columnCourseRecord
                                                                  .courseRequirement,
                                                            ),
                                                            focusNode: _model
                                                                .inputFocusNode5,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '1yvt18sm' /* Course Requirement(one per lin... */,
                                                              ),
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          24.0,
                                                                          0.0,
                                                                          24.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            maxLines: 3,
                                                            validator: _model
                                                                .inputTextController5Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.6,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          16.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                          .inputTextController6 ??=
                                                                      TextEditingController(
                                                                    text: columnCourseRecord
                                                                        .totalCourseHour
                                                                        .toString(),
                                                                  ),
                                                                  focusNode: _model
                                                                      .inputFocusNode6,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '3or8ztnn' /* Total Course Duration(hours) */,
                                                                    ),
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            24.0,
                                                                            0.0,
                                                                            24.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                  validator: _model
                                                                      .inputTextController6Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          16.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                          .inputTextController7 ??=
                                                                      TextEditingController(
                                                                    text: columnCourseRecord
                                                                        .numberLessons
                                                                        .toString(),
                                                                  ),
                                                                  focusNode: _model
                                                                      .inputFocusNode7,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '74i0oeum' /* Total Number of Lessons */,
                                                                    ),
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            24.0,
                                                                            0.0,
                                                                            24.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                  validator: _model
                                                                      .inputTextController7Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          16.0,
                                                                          15.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model.inputTextController8 ??=
                                                                              TextEditingController(
                                                                        text: columnCourseRecord
                                                                            .bookingLimit
                                                                            .toString(),
                                                                      ),
                                                                      focusNode:
                                                                          _model
                                                                              .inputFocusNode8,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'z2mg1kyx' /* Student Limit */,
                                                                        ),
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            24.0,
                                                                            0.0,
                                                                            24.0),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                      validator: _model
                                                                          .inputTextController8Validator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  Text(
                                                                    'remaining :${widget!.courseRef?.bookedCount?.toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.6,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'mjico8hh' /* Course Type */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                FlutterFlowRadioButton(
                                                                  options: [
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'm107k31w' /* Free */,
                                                                    ),
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'qkpekxb2' /* Paid */,
                                                                    )
                                                                  ].toList(),
                                                                  onChanged: (val) =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  controller: _model
                                                                      .radioButtonPaymentTypeValueController ??= FormFieldController<
                                                                          String>(
                                                                      columnCourseRecord
                                                                          .coursePaymentType),
                                                                  optionHeight:
                                                                      32.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                      ),
                                                                  selectedTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                  buttonPosition:
                                                                      RadioButtonPosition
                                                                          .left,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  radioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  inactiveRadioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  toggleable:
                                                                      false,
                                                                  horizontalAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (_model
                                                                  .radioButtonPaymentTypeValue ==
                                                              'Paid')
                                                            SizedBox(
                                                              height: 60.0,
                                                              child:
                                                                  VerticalDivider(
                                                                thickness: 2.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                          if (_model
                                                                  .radioButtonPaymentTypeValue ==
                                                              'Paid')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowRadioButton(
                                                                options: [
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'lxene8b5' /* Full Payment */,
                                                                  ),
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'nra22p9u' /* EMI Payment */,
                                                                  )
                                                                ].toList(),
                                                                onChanged: (val) =>
                                                                    safeSetState(
                                                                        () {}),
                                                                controller: _model
                                                                    .radioButtonValueController ??= FormFieldController<
                                                                        String>(
                                                                    widget!.courseRef?.emiPaymentStatus ==
                                                                            true
                                                                        ? 'EMI Payment'
                                                                        : 'Full Payment'),
                                                                optionHeight:
                                                                    32.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                                selectedTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                buttonPosition:
                                                                    RadioButtonPosition
                                                                        .left,
                                                                direction: Axis
                                                                    .vertical,
                                                                radioButtonColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                inactiveRadioButtonColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                toggleable:
                                                                    false,
                                                                horizontalAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (_model
                                                            .radioButtonPaymentTypeValue ==
                                                        'Paid')
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.6,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          16.0,
                                                                          15.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.fpTextController,
                                                                          focusNode:
                                                                              _model.fpFocusNode,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'xdvjnvxy' /* Full Price* */,
                                                                            ),
                                                                            labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                24.0,
                                                                                0.0,
                                                                                24.0),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          validator: _model
                                                                              .fpTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        if (_model.radioButtonValue ==
                                                                            'EMI Payment')
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 15.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.inputTextController9 ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          columnCourseRecord.firstEMIprice.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                      ),
                                                                                      focusNode: _model.inputFocusNode9,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                          '57zq4bpf' /* First EMI Price* */,
                                                                                        ),
                                                                                        labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                            ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 24.0),
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                      validator: _model.inputTextController9Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 16.0, 15.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.inputTextController10 ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          columnCourseRecord.secondEMIprice.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                      ),
                                                                                      focusNode: _model.inputFocusNode10,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                          '3bgx0psp' /* Second EMI Price* */,
                                                                                        ),
                                                                                        labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                            ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 24.0),
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                      validator: _model.inputTextController10Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 16.0, 15.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.inputTextController11 ??= TextEditingController(
                                                                                        text: valueOrDefault<String>(
                                                                                          columnCourseRecord.thirdEMIprice.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                      ),
                                                                                      focusNode: _model.inputFocusNode11,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                          'ea4tm1c2' /* Third EMI Price* */,
                                                                                        ),
                                                                                        labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                            ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 24.0),
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                      validator: _model.inputTextController11Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            if (_model
                                                                    .radioButtonValue ==
                                                                'EMI Payment')
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'kn35rvn0' /* EMI's Notification Date */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            if (_model
                                                                    .radioButtonValue ==
                                                                'EMI Payment')
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked1Date =
                                                                              await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                getCurrentTimestamp,
                                                                            firstDate:
                                                                                getCurrentTimestamp,
                                                                            lastDate:
                                                                                DateTime(2050),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialDatePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );

                                                                          if (_datePicked1Date !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked1 = DateTime(
                                                                                _datePicked1Date.year,
                                                                                _datePicked1Date.month,
                                                                                _datePicked1Date.day,
                                                                              );
                                                                            });
                                                                          }
                                                                        },
                                                                        text:
                                                                            () {
                                                                          if (_model.datePicked1 !=
                                                                              null) {
                                                                            return dateTimeFormat(
                                                                              "yMMMd",
                                                                              _model.datePicked1,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            );
                                                                          } else if (widget!.courseRef?.dateSecondEMIEmail !=
                                                                              null) {
                                                                            return dateTimeFormat(
                                                                              "yMMMd",
                                                                              widget!.courseRef!.dateSecondEMIEmail!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            );
                                                                          } else {
                                                                            return 'Second EMI Date';
                                                                          }
                                                                        }(),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .date_range_rounded,
                                                                          size:
                                                                              18.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              150.0,
                                                                          height:
                                                                              55.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Poppins'),
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked2Date =
                                                                              await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                getCurrentTimestamp,
                                                                            firstDate:
                                                                                getCurrentTimestamp,
                                                                            lastDate:
                                                                                DateTime(2050),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialDatePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );

                                                                          if (_datePicked2Date !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked2 = DateTime(
                                                                                _datePicked2Date.year,
                                                                                _datePicked2Date.month,
                                                                                _datePicked2Date.day,
                                                                              );
                                                                            });
                                                                          }
                                                                        },
                                                                        text:
                                                                            () {
                                                                          if (_model.datePicked2 !=
                                                                              null) {
                                                                            return dateTimeFormat(
                                                                              "yMMMd",
                                                                              _model.datePicked2,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            );
                                                                          } else if (widget!.courseRef?.dateThirdEMIEmail !=
                                                                              null) {
                                                                            return dateTimeFormat(
                                                                              "yMMMd",
                                                                              widget!.courseRef!.dateThirdEMIEmail!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            );
                                                                          } else {
                                                                            return 'Third EMI Date';
                                                                          }
                                                                        }(),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .date_range,
                                                                          size:
                                                                              18.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              150.0,
                                                                          height:
                                                                              55.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Poppins'),
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.6,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          16.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                          .inputTextController12 ??=
                                                                      TextEditingController(
                                                                    text: columnCourseRecord
                                                                        .whatsappGroupLink,
                                                                  ),
                                                                  focusNode: _model
                                                                      .inputFocusNode12,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'wuzsqtfs' /* Whatsapp Group Link */,
                                                                    ),
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            24.0,
                                                                            0.0,
                                                                            24.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                  validator: _model
                                                                      .inputTextController12Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.userRole,
                                                                  '') ==
                                                              'Admin')
                                                            Expanded(
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder: (context) =>
                                                                    StreamBuilder<
                                                                        UsersRecord>(
                                                                  stream: UsersRecord
                                                                      .getDocument(
                                                                          columnCourseRecord
                                                                              .authorRef!),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              10.0,
                                                                          height:
                                                                              10.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0x00DF473F),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }

                                                                    final wrapUsersRecord =
                                                                        snapshot
                                                                            .data!;

                                                                    return Wrap(
                                                                      spacing:
                                                                          0.0,
                                                                      runSpacing:
                                                                          0.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              16.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              StreamBuilder<List<UsersRecord>>(
                                                                            stream: queryUsersRecord(
                                                                              queryBuilder: (usersRecord) => usersRecord
                                                                                  .where(
                                                                                    'userRole',
                                                                                    isEqualTo: 'Instructor',
                                                                                  )
                                                                                  .where(
                                                                                    'instuctorStatus',
                                                                                    isEqualTo: 'Approved',
                                                                                  ),
                                                                            )..listen((snapshot) {
                                                                                List<UsersRecord> dropDownInstructorUsersRecordList = snapshot;
                                                                                if (_model.dropDownInstructorPreviousSnapshot != null && !const ListEquality(UsersRecordDocumentEquality()).equals(dropDownInstructorUsersRecordList, _model.dropDownInstructorPreviousSnapshot)) {
                                                                                  () async {
                                                                                    _model.autherRef12 = await queryUsersRecordOnce(
                                                                                      queryBuilder: (usersRecord) => usersRecord
                                                                                          .where(
                                                                                            'display_name',
                                                                                            isEqualTo: _model.dropDownInstructorValue,
                                                                                          )
                                                                                          .where(
                                                                                            'instuctorStatus',
                                                                                            isEqualTo: 'Approved',
                                                                                          )
                                                                                          .where(
                                                                                            'userRole',
                                                                                            isEqualTo: 'Instructor',
                                                                                          ),
                                                                                      singleRecord: true,
                                                                                    ).then((s) => s.firstOrNull);
                                                                                    _model.authrRef = _model.autherRef12?.reference;
                                                                                    safeSetState(() {});

                                                                                    safeSetState(() {});
                                                                                  }();
                                                                                }
                                                                                _model.dropDownInstructorPreviousSnapshot = snapshot;
                                                                              }),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<UsersRecord> dropDownInstructorUsersRecordList = snapshot.data!;

                                                                              return FlutterFlowDropDown<String>(
                                                                                controller: _model.dropDownInstructorValueController ??= FormFieldController<String>(
                                                                                  _model.dropDownInstructorValue ??= wrapUsersRecord.displayName,
                                                                                ),
                                                                                options: dropDownInstructorUsersRecordList.map((e) => e.displayName).toList(),
                                                                                onChanged: (val) async {
                                                                                  safeSetState(() => _model.dropDownInstructorValue = val);
                                                                                  _model.autherRef1 = await queryUsersRecordOnce(
                                                                                    queryBuilder: (usersRecord) => usersRecord
                                                                                        .where(
                                                                                          'display_name',
                                                                                          isEqualTo: _model.dropDownInstructorValue,
                                                                                        )
                                                                                        .where(
                                                                                          'instuctorStatus',
                                                                                          isEqualTo: 'Approved',
                                                                                        )
                                                                                        .where(
                                                                                          'userRole',
                                                                                          isEqualTo: 'Instructor',
                                                                                        ),
                                                                                    singleRecord: true,
                                                                                  ).then((s) => s.firstOrNull);
                                                                                  _model.authrRef = _model.autherRef1?.reference;
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                height: 50.0,
                                                                                maxHeight: 300.0,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  '49vrfwm4' /* Select instructor* */,
                                                                                ),
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                elevation: 2.0,
                                                                                borderColor: Colors.transparent,
                                                                                borderWidth: 0.0,
                                                                                borderRadius: 0.0,
                                                                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                hidesUnderline: true,
                                                                                isSearchable: false,
                                                                                isMultiSelect: false,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.22,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '4tee9iud' /* Add to LIst */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            controller: _model
                                                                    .dropDownValueController1 ??=
                                                                FormFieldController<
                                                                    String>(
                                                              _model.dropDownValue1 ??=
                                                                  widget!
                                                                      .courseRef
                                                                      ?.listView
                                                                      ?.first,
                                                            ),
                                                            options: [
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'v23odnvs' /* None */,
                                                              ),
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'c4afb5vp' /* Recommended */,
                                                              ),
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'rcbiqnbm' /* Featured */,
                                                              )
                                                            ],
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.dropDownValue1 =
                                                                        val),
                                                            width: 280.0,
                                                            height: 50.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 2.0,
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderWidth: 0.0,
                                                            borderRadius: 0.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        4.0,
                                                                        12.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'e7kuigm7' /* Batches */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                      StreamBuilder<
                                                                          BatchesRecord>(
                                                                        stream: BatchesRecord.getDocument(widget!
                                                                            .courseRef!
                                                                            .batchesRef!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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

                                                                          final containerBatchesRecord =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) => Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                child: StreamBuilder<List<BatchesRecord>>(
                                                                                  stream: queryBatchesRecord(
                                                                                    queryBuilder: (batchesRecord) => batchesRecord
                                                                                        .where(
                                                                                          'courseRef',
                                                                                          arrayContains: widget!.courseRef?.reference,
                                                                                        )
                                                                                        .where(
                                                                                          'status',
                                                                                          isEqualTo: 'Ongoing',
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
                                                                                    List<BatchesRecord> dropDownBatchesBatchesRecordList = snapshot.data!;

                                                                                    return FlutterFlowDropDown<String>(
                                                                                      controller: _model.dropDownBatchesValueController ??= FormFieldController<String>(
                                                                                        _model.dropDownBatchesValue ??= containerBatchesRecord.name,
                                                                                      ),
                                                                                      options: dropDownBatchesBatchesRecordList
                                                                                          .map((e) => valueOrDefault<String>(
                                                                                                e.name,
                                                                                                'No batch found',
                                                                                              ))
                                                                                          .toList(),
                                                                                      onChanged: (val) async {
                                                                                        safeSetState(() => _model.dropDownBatchesValue = val);
                                                                                        if (widget!.courseRef?.batchesRef == null) {
                                                                                          await showDialog(
                                                                                            barrierDismissible: false,
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: WebViewAware(
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                    child: Container(
                                                                                                      width: 400.0,
                                                                                                      child: BatchPasswordSingleCourseWidget(
                                                                                                        courseRef: widget!.courseRef!,
                                                                                                        newBatchesName: _model.dropDownBatchesValue!,
                                                                                                        prevBatchesStatus: 'Ongoing',
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          await showDialog(
                                                                                            barrierDismissible: false,
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: WebViewAware(
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                    child: Container(
                                                                                                      width: 400.0,
                                                                                                      child: BatchChangeBatchSingleCoursePresentInfoWidget(
                                                                                                        courseRef: widget!.courseRef!,
                                                                                                        prevBatchesRef: widget!.courseRef!.batchesRef!,
                                                                                                        newBatchesName: _model.dropDownBatchesValue!,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                      width: 300.0,
                                                                                      height: 50.0,
                                                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                        'g3w1s61i' /* Select batches... */,
                                                                                      ),
                                                                                      icon: Icon(
                                                                                        Icons.keyboard_arrow_down_rounded,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      elevation: 2.0,
                                                                                      borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      borderWidth: 2.0,
                                                                                      borderRadius: 8.0,
                                                                                      margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                      hidesUnderline: true,
                                                                                      isSearchable: false,
                                                                                      isMultiSelect: false,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (widget!
                                                                        .courseRef
                                                                        ?.batchesRef !=
                                                                    null)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '60mawn0z' /* Status */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FlutterFlowDropDown<String>(
                                                                              controller: _model.dropDownValueController2 ??= FormFieldController<String>(
                                                                                _model.dropDownValue2 ??= columnCourseRecord.status,
                                                                              ),
                                                                              options: [
                                                                                FFLocalizations.of(context).getText(
                                                                                  'fhg5jowq' /* Draft */,
                                                                                ),
                                                                                FFLocalizations.of(context).getText(
                                                                                  'rn58bh2d' /* Publish */,
                                                                                )
                                                                              ],
                                                                              onChanged: (val) => safeSetState(() => _model.dropDownValue2 = val),
                                                                              width: 300.0,
                                                                              height: 50.0,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                '64ove32m' /* Select branch... */,
                                                                              ),
                                                                              icon: Icon(
                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 2.0,
                                                                              borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderWidth: 2.0,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              isSearchable: false,
                                                                              isMultiSelect: false,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        if ((columnCourseRecord
                                                                    .image !=
                                                                '') ||
                                                            (_model.uploadedFileUrl !=
                                                                ''))
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: OctoImage(
                                                              placeholderBuilder:
                                                                  (_) => SizedBox
                                                                      .expand(
                                                                child: Image(
                                                                  image: BlurHashImage(
                                                                      columnCourseRecord
                                                                          .imageBlurhash),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              image:
                                                                  NetworkImage(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnCourseRecord
                                                                      .image,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/academy-backend-uubu81/assets/4jkvsr538si7/Placeholder_view_vector.svg.png',
                                                                ),
                                                              ),
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  final selectedMedia =
                                                                      await selectMediaWithSourceBottomSheet(
                                                                    context:
                                                                        context,
                                                                    maxWidth:
                                                                        1500.00,
                                                                    maxHeight:
                                                                        1500.00,
                                                                    allowPhoto:
                                                                        true,
                                                                    includeBlurHash:
                                                                        true,
                                                                  );
                                                                  if (selectedMedia !=
                                                                          null &&
                                                                      selectedMedia.every((m) => validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                    safeSetState(() =>
                                                                        _model.isDataUploading =
                                                                            true);
                                                                    var selectedUploadedFiles =
                                                                        <FFUploadedFile>[];

                                                                    var downloadUrls =
                                                                        <String>[];
                                                                    try {
                                                                      selectedUploadedFiles = selectedMedia
                                                                          .map((m) => FFUploadedFile(
                                                                                name: m.storagePath.split('/').last,
                                                                                bytes: m.bytes,
                                                                                height: m.dimensions?.height,
                                                                                width: m.dimensions?.width,
                                                                                blurHash: m.blurHash,
                                                                              ))
                                                                          .toList();

                                                                      downloadUrls = (await Future
                                                                              .wait(
                                                                        selectedMedia
                                                                            .map(
                                                                          (m) async => await uploadData(
                                                                              m.storagePath,
                                                                              m.bytes),
                                                                        ),
                                                                      ))
                                                                          .where((u) =>
                                                                              u !=
                                                                              null)
                                                                          .map((u) =>
                                                                              u!)
                                                                          .toList();
                                                                    } finally {
                                                                      _model.isDataUploading =
                                                                          false;
                                                                    }
                                                                    if (selectedUploadedFiles.length ==
                                                                            selectedMedia
                                                                                .length &&
                                                                        downloadUrls.length ==
                                                                            selectedMedia.length) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.uploadedLocalFile =
                                                                            selectedUploadedFiles.first;
                                                                        _model.uploadedFileUrl =
                                                                            downloadUrls.first;
                                                                      });
                                                                    } else {
                                                                      safeSetState(
                                                                          () {});
                                                                      return;
                                                                    }
                                                                  }

                                                                  FFAppState()
                                                                      .refresh = 1;
                                                                  FFAppState()
                                                                          .courseImgFeature =
                                                                      _model
                                                                          .uploadedFileUrl;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          content:
                                                                              Text('Photo is updated successfully'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'z84oludi' /* Add Photo */,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 100.0,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                      ),
                                                                  elevation:
                                                                      1.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                            if ((columnCourseRecord
                                                                        .image !=
                                                                    '') ||
                                                                (_model.uploadedFileUrl !=
                                                                    ''))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if (_model
                                                                            .uploadedFileUrl !=
                                                                        '') {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.isDataUploading =
                                                                            false;
                                                                        _model.uploadedLocalFile =
                                                                            FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                        _model.uploadedFileUrl =
                                                                            '';
                                                                      });
                                                                    } else {
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  content: Text('Do you want remove image..'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Confirm'),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                      if (confirmDialogResponse) {
                                                                        await widget!
                                                                            .courseRef!
                                                                            .reference
                                                                            .update(createCourseRecordData(
                                                                          image:
                                                                              '',
                                                                          imageBlurhash:
                                                                              '',
                                                                        ));
                                                                      }
                                                                    }
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '10g00qfm' /* Remove Photo */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                        ),
                                                                    elevation:
                                                                        1.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        Stack(
                                                          children: [
                                                            if ((FFAppState()
                                                                        .videoRef ==
                                                                    null) &&
                                                                (columnCourseRecord
                                                                        .videoRef !=
                                                                    null))
                                                              Wrap(
                                                                spacing: 0.0,
                                                                runSpacing: 0.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: [
                                                                  if (FFAppState()
                                                                          .videoRef ==
                                                                      null)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: StreamBuilder<
                                                                          VideosRecord>(
                                                                        stream:
                                                                            VideosRecord.getDocument(columnCourseRecord.videoRef!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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

                                                                          final containerVideosRecord =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                250.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(10.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.network(
                                                                                        containerVideosRecord.images,
                                                                                        width: 300.0,
                                                                                        height: 120.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                  child: Text(
                                                                                    containerVideosRecord.title,
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsets.all(10.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        _model.apiResultffl = await OTPAndPBICall.call(
                                                                                          videoId: containerVideosRecord.videoId,
                                                                                          userName: currentUserEmail,
                                                                                          userid: currentUserUid,
                                                                                        );

                                                                                        if ((_model.apiResultffl?.succeeded ?? true)) {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: WebViewAware(
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                    child: Container(
                                                                                                      width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                                      child: VideoPreviewTitleWidget(
                                                                                                        videoRef: containerVideosRecord,
                                                                                                        otp: OTPAndPBICall.otp(
                                                                                                          (_model.apiResultffl?.jsonBody ?? ''),
                                                                                                        )!,
                                                                                                        playbackinfo: OTPAndPBICall.playbackInfo(
                                                                                                          (_model.apiResultffl?.jsonBody ?? ''),
                                                                                                        )!,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'API Failed',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(6.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.remove_red_eye_outlined,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 14.0,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'iletrxd7' /* Preview */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            if (FFAppState()
                                                                    .videoRef !=
                                                                null)
                                                              Wrap(
                                                                spacing: 0.0,
                                                                runSpacing: 0.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: [
                                                                  if (FFAppState()
                                                                          .videoRef !=
                                                                      null)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: StreamBuilder<
                                                                          VideosRecord>(
                                                                        stream:
                                                                            VideosRecord.getDocument(FFAppState().videoRef!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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

                                                                          final containerVideosRecord =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                250.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(10.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.network(
                                                                                        containerVideosRecord.images,
                                                                                        width: 300.0,
                                                                                        height: 120.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                  child: Text(
                                                                                    containerVideosRecord.title,
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: EdgeInsets.all(10.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        _model.apiResultff12 = await OTPAndPBICall.call(
                                                                                          videoId: containerVideosRecord.videoId,
                                                                                          userName: currentUserEmail,
                                                                                          userid: currentUserUid,
                                                                                        );

                                                                                        if ((_model.apiResultff12?.succeeded ?? true)) {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: WebViewAware(
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                    child: Container(
                                                                                                      width: MediaQuery.sizeOf(context).width * 0.35,
                                                                                                      child: VideoPreviewTitleWidget(
                                                                                                        videoRef: containerVideosRecord,
                                                                                                        otp: OTPAndPBICall.otp(
                                                                                                          (_model.apiResultff12?.jsonBody ?? ''),
                                                                                                        )!,
                                                                                                        playbackinfo: OTPAndPBICall.playbackInfo(
                                                                                                          (_model.apiResultff12?.jsonBody ?? ''),
                                                                                                        )!,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'API Failed',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(6.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.remove_red_eye_outlined,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 14.0,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'bzxzdqtx' /* Preview */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) =>
                                                                      Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    FFAppState()
                                                                        .folderListNav = [];
                                                                    _model.mainFolderResult1 =
                                                                        await queryFolderRecordOnce(
                                                                      queryBuilder:
                                                                          (folderRecord) =>
                                                                              folderRecord.where(
                                                                        'folder_main_id',
                                                                        isEqualTo: FFAppState().currentUserRole ==
                                                                                'Instructor'
                                                                            ? valueOrDefault(currentUserDocument?.folderID,
                                                                                '')
                                                                            : 'BSFL1000',
                                                                      ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);
                                                                    FFAppState()
                                                                        .addToFolderListNav(
                                                                            FolderInfoStruct(
                                                                      folderId: _model
                                                                          .mainFolderResult1
                                                                          ?.folderMainId,
                                                                      folderName: _model
                                                                          .mainFolderResult1
                                                                          ?.folderName,
                                                                      folderRef: _model
                                                                          .mainFolderResult1
                                                                          ?.reference,
                                                                    ));
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                child: VideoListForSelectionWidget(),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '2pjjfjdq' /* Add Video */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                        ),
                                                                    elevation:
                                                                        1.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if ((FFAppState()
                                                                        .videoRef ==
                                                                    null) &&
                                                                (columnCourseRecord
                                                                        .videoRef !=
                                                                    null))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () =>
                                                                                FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: 200.0,
                                                                                child: RemoveWidget(
                                                                                  image: 2,
                                                                                  courseRef: widget!.courseRef?.reference,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'm2ezylky' /* Remove Video */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                        ),
                                                                    elevation:
                                                                        1.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (FFAppState()
                                                                    .videoRef !=
                                                                null)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    FFAppState()
                                                                            .videoRef =
                                                                        null;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'b6gvx4au' /* Remove Video */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Lexend Deca'),
                                                                        ),
                                                                    elevation:
                                                                        1.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
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
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            StreamBuilder<CourseRecord>(
                              stream: CourseRecord.getDocument(
                                  widget!.courseRef!.reference),
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

                                final wrapCourseRecord = snapshot.data!;

                                return Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    StreamBuilder<List<BatchesRecord>>(
                                      stream: queryBatchesRecord(
                                        queryBuilder: (batchesRecord) =>
                                            batchesRecord.where(
                                          'name',
                                          isEqualTo:
                                              _model.dropDownBatchesValue,
                                        ),
                                        singleRecord: true,
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
                                        List<BatchesRecord>
                                            wrapBatchesRecordList =
                                            snapshot.data!;
                                        final wrapBatchesRecord =
                                            wrapBatchesRecordList.isNotEmpty
                                                ? wrapBatchesRecordList.first
                                                : null;

                                        return Wrap(
                                          spacing: 0.0,
                                          runSpacing: 0.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            StreamBuilder<BatchesRecord>(
                                              stream: BatchesRecord.getDocument(
                                                  widget!
                                                      .courseRef!.batchesRef!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          Color(0x00DF473F),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                                final wrapBatchesRecord =
                                                    snapshot.data!;

                                                return Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 0.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding: EdgeInsets.all(
                                                            20.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            if (_model.formKey
                                                                        .currentState ==
                                                                    null ||
                                                                !_model.formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                              return;
                                                            }
                                                            if (_model
                                                                    .coValue ==
                                                                null) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          ' Please select \"Country\" and try again.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              return;
                                                            }
                                                            if (_model
                                                                    .unValue ==
                                                                null) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          ' Please select \"University\" and try again.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              return;
                                                            }
                                                            if (_model
                                                                    .caValue ==
                                                                null) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          ' Please select \"Category\" and try again.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              return;
                                                            }
                                                            if (_model
                                                                    .brValue ==
                                                                null) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          ' Please select \"Branch\" and try again.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              return;
                                                            }
                                                            if (_model
                                                                    .radioButtonPaymentTypeValue ==
                                                                null) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          ' Please select \"Course Price type\" and try again.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              return;
                                                            }
                                                            if (((_model
                                                                            .fpTextController
                                                                            .text ==
                                                                        '0') ||
                                                                    (_model.inputTextController9.text ==
                                                                        '0') ||
                                                                    (_model.inputTextController10
                                                                            .text ==
                                                                        '0') ||
                                                                    (_model
                                                                            .inputTextController11
                                                                            .text ==
                                                                        '0')) &&
                                                                (_model.radioButtonPaymentTypeValue ==
                                                                    'Paid') &&
                                                                (_model.radioButtonValue ==
                                                                    'EMI Payment')) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      content: Text(
                                                                          'Please enter all the prices.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            } else {
                                                              if ((_model.fpTextController
                                                                          .text ==
                                                                      '0') &&
                                                                  (_model.radioButtonPaymentTypeValue ==
                                                                      'Paid') &&
                                                                  (_model.radioButtonValue ==
                                                                      'Full Payment')) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        content:
                                                                            Text('Please enter all the prices.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              } else {
                                                                if ((functions.returnPriceBasedResult(
                                                                            valueOrDefault<double>(
                                                                              double.parse(valueOrDefault<String>(
                                                                                _model.fpTextController.text,
                                                                                '0',
                                                                              )),
                                                                              0.0,
                                                                            ),
                                                                            valueOrDefault<double>(
                                                                              double.parse(valueOrDefault<String>(
                                                                                _model.inputTextController9.text,
                                                                                '0',
                                                                              )),
                                                                              0.0,
                                                                            ),
                                                                            valueOrDefault<double>(
                                                                              double.parse(valueOrDefault<String>(
                                                                                _model.inputTextController10.text,
                                                                                '0',
                                                                              )),
                                                                              0.0,
                                                                            ),
                                                                            valueOrDefault<double>(
                                                                              double.parse(valueOrDefault<String>(
                                                                                _model.inputTextController11.text,
                                                                                '0',
                                                                              )),
                                                                              0.0,
                                                                            )) ==
                                                                        true) &&
                                                                    (_model.radioButtonValue == 'EMI Payment')) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          content:
                                                                              Text('The total EMI price must not be less than the full payment price.'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                } else {
                                                                  if ((currentUserDocument?.courseLevel?.coutryRef == null) ||
                                                                      (currentUserDocument
                                                                              ?.courseLevel
                                                                              ?.universityRef ==
                                                                          null) ||
                                                                      (currentUserDocument
                                                                              ?.courseLevel
                                                                              ?.branchRef ==
                                                                          null) ||
                                                                      (currentUserDocument
                                                                              ?.courseLevel
                                                                              ?.categoryRef ==
                                                                          null)) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            content:
                                                                                Text('Please select the required dropdown fields (Country, University, Category and Branch)'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  } else {
                                                                    if (widget!
                                                                            .courseRef
                                                                            ?.batchesRef ==
                                                                        wrapBatchesRecord
                                                                            ?.reference) {
                                                                      if ((wrapBatchesRecord.courseRef.contains(widget!.courseRef?.reference) ==
                                                                              true) &&
                                                                          (wrapBatchesRecord.status ==
                                                                              'Ongoing')) {
                                                                        await widget!
                                                                            .courseRef!
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'listView': FieldValue.delete(),
                                                                            },
                                                                          ),
                                                                        });

                                                                        await widget!
                                                                            .courseRef!
                                                                            .reference
                                                                            .update({
                                                                          ...createCourseRecordData(
                                                                            name:
                                                                                _model.inputTextController1.text,
                                                                            description:
                                                                                _model.inputTextController3.text,
                                                                            price:
                                                                                double.tryParse(_model.fpTextController.text),
                                                                            subtitle:
                                                                                _model.inputTextController2.text,
                                                                            firstEMIprice:
                                                                                double.tryParse(_model.inputTextController9.text),
                                                                            secondEMIprice:
                                                                                double.tryParse(_model.inputTextController10.text),
                                                                            thirdEMIprice:
                                                                                double.tryParse(_model.inputTextController11.text),
                                                                            universityRef:
                                                                                currentUserDocument?.courseLevel?.universityRef,
                                                                            countryRef:
                                                                                currentUserDocument?.courseLevel?.coutryRef,
                                                                            branchRef:
                                                                                currentUserDocument?.courseLevel?.branchRef,
                                                                            whatsappGroupLink:
                                                                                _model.inputTextController12.text,
                                                                            totalCourseHour:
                                                                                int.tryParse(_model.inputTextController6.text),
                                                                            courseLearn:
                                                                                _model.inputTextController4.text,
                                                                            courseRequirement:
                                                                                _model.inputTextController5.text,
                                                                            numberLessons:
                                                                                int.tryParse(_model.inputTextController7.text),
                                                                            coursePaymentType:
                                                                                _model.radioButtonPaymentTypeValue,
                                                                            status: wrapCourseRecord.batchesRef != null
                                                                                ? _model.dropDownValue2
                                                                                : 'Draft',
                                                                            videoRef: FFAppState().videoRef != null
                                                                                ? FFAppState().videoRef
                                                                                : widget!.courseRef?.videoRef,
                                                                            bookingLimit:
                                                                                int.tryParse(_model.inputTextController8.text),
                                                                            categoryRef:
                                                                                currentUserDocument?.courseLevel?.categoryRef,
                                                                            emiPaymentStatus: _model.radioButtonValue == 'EMI Payment'
                                                                                ? true
                                                                                : false,
                                                                            image: _model.uploadedFileUrl != ''
                                                                                ? _model.uploadedFileUrl
                                                                                : wrapCourseRecord.image,
                                                                            dateSecondEMIEmail: _model.datePicked1 != null
                                                                                ? _model.datePicked1
                                                                                : widget!.courseRef?.dateSecondEMIEmail,
                                                                            dateThirdEMIEmail: _model.datePicked2 != null
                                                                                ? _model.datePicked2
                                                                                : widget!.courseRef?.dateThirdEMIEmail,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'listView': FieldValue.arrayUnion([
                                                                                _model.dropDownValue1
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        if (FFAppState().currentUserRole ==
                                                                            'Admin') {
                                                                          _model.cursAuthRef1 = await UsersRecord.getDocumentOnce(widget!
                                                                              .courseRef!
                                                                              .authorRef!);
                                                                          _shouldSetState =
                                                                              true;
                                                                          if ((_model.authrRef != widget!.courseRef?.authorRef) &&
                                                                              (_model.dropDownInstructorValue != _model.cursAuthRef1?.displayName)) {
                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        content: Text('Do you want to change instructor for this course?'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: Text('Cancel'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: Text('Confirm'),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ) ??
                                                                                false;
                                                                            if (confirmDialogResponse) {
                                                                              await widget!.courseRef!.reference.update(createCourseRecordData(
                                                                                authorRef: FFAppState().currentUserRole == 'Admin' ? _model.authrRef : FFAppState().currentUserRef,
                                                                              ));
                                                                            }
                                                                          }
                                                                        } else {
                                                                          await widget!
                                                                              .courseRef!
                                                                              .reference
                                                                              .update(createCourseRecordData(
                                                                            authorRef: FFAppState().currentUserRole == 'Instructor'
                                                                                ? FFAppState().currentUserRef
                                                                                : FFAppState().currentUserRef,
                                                                          ));
                                                                        }

                                                                        _model.userIP1 =
                                                                            await actions.getUserIPaddress();
                                                                        _shouldSetState =
                                                                            true;
                                                                        _model.userSession1 =
                                                                            await actions.getUserSessionID(
                                                                          currentUserUid,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;

                                                                        await ActivityLogRecord
                                                                            .collection
                                                                            .doc()
                                                                            .set({
                                                                          ...createActivityLogRecordData(
                                                                            userRef:
                                                                                currentUserReference,
                                                                            userIP:
                                                                                _model.userIP1,
                                                                            userRole:
                                                                                valueOrDefault(currentUserDocument?.userRole, ''),
                                                                            createdAt:
                                                                                getCurrentTimestamp,
                                                                            eventType:
                                                                                'Modified',
                                                                            object:
                                                                                'Course',
                                                                            eventId:
                                                                                widget!.courseRef?.reference.id,
                                                                            eventTitle:
                                                                                _model.inputTextController1.text,
                                                                            userSessionID:
                                                                                _model.userSession1,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'eventStatus': [
                                                                                'Modify'
                                                                              ],
                                                                            },
                                                                          ),
                                                                        });

                                                                        context.goNamed(
                                                                            'Course');

                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Update Successful',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).success,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return WebViewAware(
                                                                              child: AlertDialog(
                                                                                content: Text('Please select  batch. (or) Selected batches are already archived.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
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
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                WebViewAware(
                                                                              child: GestureDetector(
                                                                                onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                child: Container(
                                                                                  width: 300.0,
                                                                                  child: BatchPasswordSingleCourseWidget(
                                                                                    courseRef: widget!.courseRef!,
                                                                                    newBatchesName: _model.dropDownBatchesValue!,
                                                                                    prevBatchesStatus: 'Archived',
                                                                                    prevBatchesRef: wrapCourseRecord.batchesRef,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .addButtonModel,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                AddButtonWidget(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'w28226cg' /* Update */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .save_outlined,
                                                                color: Colors
                                                                    .white,
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
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                wrapWithModel(
                  model: _model.mobileModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MobileWidget(),
                ),
                wrapWithModel(
                  model: _model.webNavHorizontalModel,
                  updateCallback: () => safeSetState(() {}),
                  child: WebNavHorizontalWidget(),
                ),
                wrapWithModel(
                  model: _model.initialUserStatusCheckModel,
                  updateCallback: () => safeSetState(() {}),
                  child: InitialUserStatusCheckWidget(),
                ),
              ],
            ),
          ),
        ));
  }
}
