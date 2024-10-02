import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ManualAlertSubscriberRecord extends FirestoreRecord {
  ManualAlertSubscriberRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "mail_title" field.
  String? _mailTitle;
  String get mailTitle => _mailTitle ?? '';
  bool hasMailTitle() => _mailTitle != null;

  // "mail_reference" field.
  DocumentReference? _mailReference;
  DocumentReference? get mailReference => _mailReference;
  bool hasMailReference() => _mailReference != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "user_reference" field.
  List<DocumentReference>? _userReference;
  List<DocumentReference> get userReference => _userReference ?? const [];
  bool hasUserReference() => _userReference != null;

  // "subsriber_reference" field.
  List<DocumentReference>? _subsriberReference;
  List<DocumentReference> get subsriberReference =>
      _subsriberReference ?? const [];
  bool hasSubsriberReference() => _subsriberReference != null;

  // "subsriber_email" field.
  List<String>? _subsriberEmail;
  List<String> get subsriberEmail => _subsriberEmail ?? const [];
  bool hasSubsriberEmail() => _subsriberEmail != null;

  // "emi_type" field.
  String? _emiType;
  String get emiType => _emiType ?? '';
  bool hasEmiType() => _emiType != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "ind_course_name" field.
  String? _indCourseName;
  String get indCourseName => _indCourseName ?? '';
  bool hasIndCourseName() => _indCourseName != null;

  // "ind_course_image" field.
  String? _indCourseImage;
  String get indCourseImage => _indCourseImage ?? '';
  bool hasIndCourseImage() => _indCourseImage != null;

  // "ind_course_reference" field.
  DocumentReference? _indCourseReference;
  DocumentReference? get indCourseReference => _indCourseReference;
  bool hasIndCourseReference() => _indCourseReference != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "mail" field.
  String? _mail;
  String get mail => _mail ?? '';
  bool hasMail() => _mail != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _mailTitle = snapshotData['mail_title'] as String?;
    _mailReference = snapshotData['mail_reference'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _userReference = getDataList(snapshotData['user_reference']);
    _subsriberReference = getDataList(snapshotData['subsriber_reference']);
    _subsriberEmail = getDataList(snapshotData['subsriber_email']);
    _emiType = snapshotData['emi_type'] as String?;
    _status = snapshotData['status'] as String?;
    _indCourseName = snapshotData['ind_course_name'] as String?;
    _indCourseImage = snapshotData['ind_course_image'] as String?;
    _indCourseReference =
        snapshotData['ind_course_reference'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _mail = snapshotData['mail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('manual_alert_subscriber');

  static Stream<ManualAlertSubscriberRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ManualAlertSubscriberRecord.fromSnapshot(s));

  static Future<ManualAlertSubscriberRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ManualAlertSubscriberRecord.fromSnapshot(s));

  static ManualAlertSubscriberRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ManualAlertSubscriberRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ManualAlertSubscriberRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ManualAlertSubscriberRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ManualAlertSubscriberRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ManualAlertSubscriberRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createManualAlertSubscriberRecordData({
  String? title,
  String? description,
  String? image,
  String? mailTitle,
  DocumentReference? mailReference,
  String? type,
  String? emiType,
  String? status,
  String? indCourseName,
  String? indCourseImage,
  DocumentReference? indCourseReference,
  DateTime? createdAt,
  String? mail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'mail_title': mailTitle,
      'mail_reference': mailReference,
      'type': type,
      'emi_type': emiType,
      'status': status,
      'ind_course_name': indCourseName,
      'ind_course_image': indCourseImage,
      'ind_course_reference': indCourseReference,
      'created_at': createdAt,
      'mail': mail,
    }.withoutNulls,
  );

  return firestoreData;
}

class ManualAlertSubscriberRecordDocumentEquality
    implements Equality<ManualAlertSubscriberRecord> {
  const ManualAlertSubscriberRecordDocumentEquality();

  @override
  bool equals(
      ManualAlertSubscriberRecord? e1, ManualAlertSubscriberRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.mailTitle == e2?.mailTitle &&
        e1?.mailReference == e2?.mailReference &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.userReference, e2?.userReference) &&
        listEquality.equals(e1?.subsriberReference, e2?.subsriberReference) &&
        listEquality.equals(e1?.subsriberEmail, e2?.subsriberEmail) &&
        e1?.emiType == e2?.emiType &&
        e1?.status == e2?.status &&
        e1?.indCourseName == e2?.indCourseName &&
        e1?.indCourseImage == e2?.indCourseImage &&
        e1?.indCourseReference == e2?.indCourseReference &&
        e1?.createdAt == e2?.createdAt &&
        e1?.mail == e2?.mail;
  }

  @override
  int hash(ManualAlertSubscriberRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.image,
        e?.mailTitle,
        e?.mailReference,
        e?.type,
        e?.userReference,
        e?.subsriberReference,
        e?.subsriberEmail,
        e?.emiType,
        e?.status,
        e?.indCourseName,
        e?.indCourseImage,
        e?.indCourseReference,
        e?.createdAt,
        e?.mail
      ]);

  @override
  bool isValidKey(Object? o) => o is ManualAlertSubscriberRecord;
}
