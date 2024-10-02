import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlertSubscriberRecord extends FirestoreRecord {
  AlertSubscriberRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_reference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  bool hasUserReference() => _userReference != null;

  // "subsriber_reference" field.
  DocumentReference? _subsriberReference;
  DocumentReference? get subsriberReference => _subsriberReference;
  bool hasSubsriberReference() => _subsriberReference != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "second_emi_alert_date" field.
  DateTime? _secondEmiAlertDate;
  DateTime? get secondEmiAlertDate => _secondEmiAlertDate;
  bool hasSecondEmiAlertDate() => _secondEmiAlertDate != null;

  // "second_alert_status" field.
  String? _secondAlertStatus;
  String get secondAlertStatus => _secondAlertStatus ?? '';
  bool hasSecondAlertStatus() => _secondAlertStatus != null;

  // "third_emi_alert_date" field.
  DateTime? _thirdEmiAlertDate;
  DateTime? get thirdEmiAlertDate => _thirdEmiAlertDate;
  bool hasThirdEmiAlertDate() => _thirdEmiAlertDate != null;

  // "third_alert_status" field.
  String? _thirdAlertStatus;
  String get thirdAlertStatus => _thirdAlertStatus ?? '';
  bool hasThirdAlertStatus() => _thirdAlertStatus != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "course_name" field.
  String? _courseName;
  String get courseName => _courseName ?? '';
  bool hasCourseName() => _courseName != null;

  // "course_image" field.
  String? _courseImage;
  String get courseImage => _courseImage ?? '';
  bool hasCourseImage() => _courseImage != null;

  void _initializeFields() {
    _userReference = snapshotData['user_reference'] as DocumentReference?;
    _subsriberReference =
        snapshotData['subsriber_reference'] as DocumentReference?;
    _userName = snapshotData['user_name'] as String?;
    _email = snapshotData['email'] as String?;
    _secondEmiAlertDate = snapshotData['second_emi_alert_date'] as DateTime?;
    _secondAlertStatus = snapshotData['second_alert_status'] as String?;
    _thirdEmiAlertDate = snapshotData['third_emi_alert_date'] as DateTime?;
    _thirdAlertStatus = snapshotData['third_alert_status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _courseName = snapshotData['course_name'] as String?;
    _courseImage = snapshotData['course_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('alert_subscriber');

  static Stream<AlertSubscriberRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlertSubscriberRecord.fromSnapshot(s));

  static Future<AlertSubscriberRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlertSubscriberRecord.fromSnapshot(s));

  static AlertSubscriberRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AlertSubscriberRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlertSubscriberRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlertSubscriberRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlertSubscriberRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlertSubscriberRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlertSubscriberRecordData({
  DocumentReference? userReference,
  DocumentReference? subsriberReference,
  String? userName,
  String? email,
  DateTime? secondEmiAlertDate,
  String? secondAlertStatus,
  DateTime? thirdEmiAlertDate,
  String? thirdAlertStatus,
  DateTime? createdAt,
  String? courseName,
  String? courseImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_reference': userReference,
      'subsriber_reference': subsriberReference,
      'user_name': userName,
      'email': email,
      'second_emi_alert_date': secondEmiAlertDate,
      'second_alert_status': secondAlertStatus,
      'third_emi_alert_date': thirdEmiAlertDate,
      'third_alert_status': thirdAlertStatus,
      'created_at': createdAt,
      'course_name': courseName,
      'course_image': courseImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlertSubscriberRecordDocumentEquality
    implements Equality<AlertSubscriberRecord> {
  const AlertSubscriberRecordDocumentEquality();

  @override
  bool equals(AlertSubscriberRecord? e1, AlertSubscriberRecord? e2) {
    return e1?.userReference == e2?.userReference &&
        e1?.subsriberReference == e2?.subsriberReference &&
        e1?.userName == e2?.userName &&
        e1?.email == e2?.email &&
        e1?.secondEmiAlertDate == e2?.secondEmiAlertDate &&
        e1?.secondAlertStatus == e2?.secondAlertStatus &&
        e1?.thirdEmiAlertDate == e2?.thirdEmiAlertDate &&
        e1?.thirdAlertStatus == e2?.thirdAlertStatus &&
        e1?.createdAt == e2?.createdAt &&
        e1?.courseName == e2?.courseName &&
        e1?.courseImage == e2?.courseImage;
  }

  @override
  int hash(AlertSubscriberRecord? e) => const ListEquality().hash([
        e?.userReference,
        e?.subsriberReference,
        e?.userName,
        e?.email,
        e?.secondEmiAlertDate,
        e?.secondAlertStatus,
        e?.thirdEmiAlertDate,
        e?.thirdAlertStatus,
        e?.createdAt,
        e?.courseName,
        e?.courseImage
      ]);

  @override
  bool isValidKey(Object? o) => o is AlertSubscriberRecord;
}
