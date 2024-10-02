import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'batch_change_batch_status_subscriber_model.dart';
export 'batch_change_batch_status_subscriber_model.dart';

class BatchChangeBatchStatusSubscriberWidget extends StatefulWidget {
  const BatchChangeBatchStatusSubscriberWidget({
    super.key,
    this.parameter1,
    required this.status,
  });

  final DocumentReference? parameter1;
  final String? status;

  @override
  State<BatchChangeBatchStatusSubscriberWidget> createState() =>
      _BatchChangeBatchStatusSubscriberWidgetState();
}

class _BatchChangeBatchStatusSubscriberWidgetState
    extends State<BatchChangeBatchStatusSubscriberWidget> {
  late BatchChangeBatchStatusSubscriberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => BatchChangeBatchStatusSubscriberModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget!.parameter1!.update(createSubscriptionRecordData(
        status: widget!.status,
      ));
      _model.subRslt1 =
          await SubscriptionRecord.getDocumentOnce(widget!.parameter1!);
      _model.userRslt1 =
          await UsersRecord.getDocumentOnce(_model.subRslt1!.userRef!);
      _model.coursRslt1 =
          await CourseRecord.getDocumentOnce(_model.subRslt1!.courseRef!);
      _model.batchRslt1 =
          await BatchesRecord.getDocumentOnce(_model.subRslt1!.batchesRef!);
      if (widget!.status == 'Ongoing') {
        await MailRecord.collection.doc().set(createMailRecordData(
              to: _model.userRslt1?.email,
              template: createTemplateMainStruct(
                data: createTemplateMessagePartStruct(
                  userName: _model.userRslt1?.displayName,
                  title: _model.coursRslt1?.name,
                  subtitle: _model.batchRslt1?.name,
                  image: _model.coursRslt1?.imageBlurhash,
                  date: dateTimeFormat(
                    "d/M h:mm a",
                    getCurrentTimestamp,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  clearUnsetFields: false,
                  create: true,
                ),
                name: 'CourseEnroll',
                clearUnsetFields: false,
                create: true,
              ),
              createdAt: getCurrentTimestamp,
            ));
      } else {
        await MailRecord.collection.doc().set(createMailRecordData(
              to: _model.userRslt1?.email,
              template: createTemplateMainStruct(
                data: createTemplateMessagePartStruct(
                  userName: _model.userRslt1?.displayName,
                  title: _model.coursRslt1?.name,
                  subtitle: _model.batchRslt1?.name,
                  bio: _model.subRslt1?.status,
                  image: _model.coursRslt1?.imageBlurhash,
                  date: dateTimeFormat(
                    "d/M h:mm a",
                    getCurrentTimestamp,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  clearUnsetFields: false,
                  create: true,
                ),
                name: 'BatchEnd',
                clearUnsetFields: false,
                create: true,
              ),
              createdAt: getCurrentTimestamp,
            ));
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
