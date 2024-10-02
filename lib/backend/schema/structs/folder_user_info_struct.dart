// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FolderUserInfoStruct extends FFFirebaseStruct {
  FolderUserInfoStruct({
    DocumentReference? folderUserRef,
    String? folderUserUid,
    String? folderUserRole,
    String? folderUserImage,
    String? folderUserName,
    String? folderUserEmail,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _folderUserRef = folderUserRef,
        _folderUserUid = folderUserUid,
        _folderUserRole = folderUserRole,
        _folderUserImage = folderUserImage,
        _folderUserName = folderUserName,
        _folderUserEmail = folderUserEmail,
        super(firestoreUtilData);

  // "folder_user_ref" field.
  DocumentReference? _folderUserRef;
  DocumentReference? get folderUserRef => _folderUserRef;
  set folderUserRef(DocumentReference? val) => _folderUserRef = val;

  bool hasFolderUserRef() => _folderUserRef != null;

  // "folder_user_uid" field.
  String? _folderUserUid;
  String get folderUserUid => _folderUserUid ?? '';
  set folderUserUid(String? val) => _folderUserUid = val;

  bool hasFolderUserUid() => _folderUserUid != null;

  // "folder_user_role" field.
  String? _folderUserRole;
  String get folderUserRole => _folderUserRole ?? '';
  set folderUserRole(String? val) => _folderUserRole = val;

  bool hasFolderUserRole() => _folderUserRole != null;

  // "folder_user_image" field.
  String? _folderUserImage;
  String get folderUserImage => _folderUserImage ?? '';
  set folderUserImage(String? val) => _folderUserImage = val;

  bool hasFolderUserImage() => _folderUserImage != null;

  // "folder_user_name" field.
  String? _folderUserName;
  String get folderUserName => _folderUserName ?? '';
  set folderUserName(String? val) => _folderUserName = val;

  bool hasFolderUserName() => _folderUserName != null;

  // "folder_user_email" field.
  String? _folderUserEmail;
  String get folderUserEmail => _folderUserEmail ?? '';
  set folderUserEmail(String? val) => _folderUserEmail = val;

  bool hasFolderUserEmail() => _folderUserEmail != null;

  static FolderUserInfoStruct fromMap(Map<String, dynamic> data) =>
      FolderUserInfoStruct(
        folderUserRef: data['folder_user_ref'] as DocumentReference?,
        folderUserUid: data['folder_user_uid'] as String?,
        folderUserRole: data['folder_user_role'] as String?,
        folderUserImage: data['folder_user_image'] as String?,
        folderUserName: data['folder_user_name'] as String?,
        folderUserEmail: data['folder_user_email'] as String?,
      );

  static FolderUserInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? FolderUserInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'folder_user_ref': _folderUserRef,
        'folder_user_uid': _folderUserUid,
        'folder_user_role': _folderUserRole,
        'folder_user_image': _folderUserImage,
        'folder_user_name': _folderUserName,
        'folder_user_email': _folderUserEmail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'folder_user_ref': serializeParam(
          _folderUserRef,
          ParamType.DocumentReference,
        ),
        'folder_user_uid': serializeParam(
          _folderUserUid,
          ParamType.String,
        ),
        'folder_user_role': serializeParam(
          _folderUserRole,
          ParamType.String,
        ),
        'folder_user_image': serializeParam(
          _folderUserImage,
          ParamType.String,
        ),
        'folder_user_name': serializeParam(
          _folderUserName,
          ParamType.String,
        ),
        'folder_user_email': serializeParam(
          _folderUserEmail,
          ParamType.String,
        ),
      }.withoutNulls;

  static FolderUserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      FolderUserInfoStruct(
        folderUserRef: deserializeParam(
          data['folder_user_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        folderUserUid: deserializeParam(
          data['folder_user_uid'],
          ParamType.String,
          false,
        ),
        folderUserRole: deserializeParam(
          data['folder_user_role'],
          ParamType.String,
          false,
        ),
        folderUserImage: deserializeParam(
          data['folder_user_image'],
          ParamType.String,
          false,
        ),
        folderUserName: deserializeParam(
          data['folder_user_name'],
          ParamType.String,
          false,
        ),
        folderUserEmail: deserializeParam(
          data['folder_user_email'],
          ParamType.String,
          false,
        ),
      );

  static FolderUserInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      FolderUserInfoStruct(
        folderUserRef: convertAlgoliaParam(
          data['folder_user_ref'],
          ParamType.DocumentReference,
          false,
        ),
        folderUserUid: convertAlgoliaParam(
          data['folder_user_uid'],
          ParamType.String,
          false,
        ),
        folderUserRole: convertAlgoliaParam(
          data['folder_user_role'],
          ParamType.String,
          false,
        ),
        folderUserImage: convertAlgoliaParam(
          data['folder_user_image'],
          ParamType.String,
          false,
        ),
        folderUserName: convertAlgoliaParam(
          data['folder_user_name'],
          ParamType.String,
          false,
        ),
        folderUserEmail: convertAlgoliaParam(
          data['folder_user_email'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FolderUserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FolderUserInfoStruct &&
        folderUserRef == other.folderUserRef &&
        folderUserUid == other.folderUserUid &&
        folderUserRole == other.folderUserRole &&
        folderUserImage == other.folderUserImage &&
        folderUserName == other.folderUserName &&
        folderUserEmail == other.folderUserEmail;
  }

  @override
  int get hashCode => const ListEquality().hash([
        folderUserRef,
        folderUserUid,
        folderUserRole,
        folderUserImage,
        folderUserName,
        folderUserEmail
      ]);
}

FolderUserInfoStruct createFolderUserInfoStruct({
  DocumentReference? folderUserRef,
  String? folderUserUid,
  String? folderUserRole,
  String? folderUserImage,
  String? folderUserName,
  String? folderUserEmail,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FolderUserInfoStruct(
      folderUserRef: folderUserRef,
      folderUserUid: folderUserUid,
      folderUserRole: folderUserRole,
      folderUserImage: folderUserImage,
      folderUserName: folderUserName,
      folderUserEmail: folderUserEmail,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FolderUserInfoStruct? updateFolderUserInfoStruct(
  FolderUserInfoStruct? folderUserInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    folderUserInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFolderUserInfoStructData(
  Map<String, dynamic> firestoreData,
  FolderUserInfoStruct? folderUserInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (folderUserInfo == null) {
    return;
  }
  if (folderUserInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && folderUserInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final folderUserInfoData =
      getFolderUserInfoFirestoreData(folderUserInfo, forFieldValue);
  final nestedData =
      folderUserInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = folderUserInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFolderUserInfoFirestoreData(
  FolderUserInfoStruct? folderUserInfo, [
  bool forFieldValue = false,
]) {
  if (folderUserInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(folderUserInfo.toMap());

  // Add any Firestore field values
  folderUserInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFolderUserInfoListFirestoreData(
  List<FolderUserInfoStruct>? folderUserInfos,
) =>
    folderUserInfos
        ?.map((e) => getFolderUserInfoFirestoreData(e, true))
        .toList() ??
    [];
