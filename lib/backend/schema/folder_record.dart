import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FolderRecord extends FirestoreRecord {
  FolderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "folder_status" field.
  String? _folderStatus;
  String get folderStatus => _folderStatus ?? '';
  bool hasFolderStatus() => _folderStatus != null;

  // "folder_created_at" field.
  DateTime? _folderCreatedAt;
  DateTime? get folderCreatedAt => _folderCreatedAt;
  bool hasFolderCreatedAt() => _folderCreatedAt != null;

  // "folder_main_id" field.
  String? _folderMainId;
  String get folderMainId => _folderMainId ?? '';
  bool hasFolderMainId() => _folderMainId != null;

  // "folder_created_user_info" field.
  FolderUserInfoStruct? _folderCreatedUserInfo;
  FolderUserInfoStruct get folderCreatedUserInfo =>
      _folderCreatedUserInfo ?? FolderUserInfoStruct();
  bool hasFolderCreatedUserInfo() => _folderCreatedUserInfo != null;

  // "folder_created_user_ref" field.
  DocumentReference? _folderCreatedUserRef;
  DocumentReference? get folderCreatedUserRef => _folderCreatedUserRef;
  bool hasFolderCreatedUserRef() => _folderCreatedUserRef != null;

  // "folder_created_user_role" field.
  String? _folderCreatedUserRole;
  String get folderCreatedUserRole => _folderCreatedUserRole ?? '';
  bool hasFolderCreatedUserRole() => _folderCreatedUserRole != null;

  // "folder_name" field.
  String? _folderName;
  String get folderName => _folderName ?? '';
  bool hasFolderName() => _folderName != null;

  // "folder_subfolder_info" field.
  List<FolderInfoStruct>? _folderSubfolderInfo;
  List<FolderInfoStruct> get folderSubfolderInfo =>
      _folderSubfolderInfo ?? const [];
  bool hasFolderSubfolderInfo() => _folderSubfolderInfo != null;

  void _initializeFields() {
    _folderStatus = snapshotData['folder_status'] as String?;
    _folderCreatedAt = snapshotData['folder_created_at'] as DateTime?;
    _folderMainId = snapshotData['folder_main_id'] as String?;
    _folderCreatedUserInfo = FolderUserInfoStruct.maybeFromMap(
        snapshotData['folder_created_user_info']);
    _folderCreatedUserRef =
        snapshotData['folder_created_user_ref'] as DocumentReference?;
    _folderCreatedUserRole =
        snapshotData['folder_created_user_role'] as String?;
    _folderName = snapshotData['folder_name'] as String?;
    _folderSubfolderInfo = getStructList(
      snapshotData['folder_subfolder_info'],
      FolderInfoStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('folder');

  static Stream<FolderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FolderRecord.fromSnapshot(s));

  static Future<FolderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FolderRecord.fromSnapshot(s));

  static FolderRecord fromSnapshot(DocumentSnapshot snapshot) => FolderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FolderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FolderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FolderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FolderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFolderRecordData({
  String? folderStatus,
  DateTime? folderCreatedAt,
  String? folderMainId,
  FolderUserInfoStruct? folderCreatedUserInfo,
  DocumentReference? folderCreatedUserRef,
  String? folderCreatedUserRole,
  String? folderName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'folder_status': folderStatus,
      'folder_created_at': folderCreatedAt,
      'folder_main_id': folderMainId,
      'folder_created_user_info': FolderUserInfoStruct().toMap(),
      'folder_created_user_ref': folderCreatedUserRef,
      'folder_created_user_role': folderCreatedUserRole,
      'folder_name': folderName,
    }.withoutNulls,
  );

  // Handle nested data for "folder_created_user_info" field.
  addFolderUserInfoStructData(
      firestoreData, folderCreatedUserInfo, 'folder_created_user_info');

  return firestoreData;
}

class FolderRecordDocumentEquality implements Equality<FolderRecord> {
  const FolderRecordDocumentEquality();

  @override
  bool equals(FolderRecord? e1, FolderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.folderStatus == e2?.folderStatus &&
        e1?.folderCreatedAt == e2?.folderCreatedAt &&
        e1?.folderMainId == e2?.folderMainId &&
        e1?.folderCreatedUserInfo == e2?.folderCreatedUserInfo &&
        e1?.folderCreatedUserRef == e2?.folderCreatedUserRef &&
        e1?.folderCreatedUserRole == e2?.folderCreatedUserRole &&
        e1?.folderName == e2?.folderName &&
        listEquality.equals(e1?.folderSubfolderInfo, e2?.folderSubfolderInfo);
  }

  @override
  int hash(FolderRecord? e) => const ListEquality().hash([
        e?.folderStatus,
        e?.folderCreatedAt,
        e?.folderMainId,
        e?.folderCreatedUserInfo,
        e?.folderCreatedUserRef,
        e?.folderCreatedUserRole,
        e?.folderName,
        e?.folderSubfolderInfo
      ]);

  @override
  bool isValidKey(Object? o) => o is FolderRecord;
}
