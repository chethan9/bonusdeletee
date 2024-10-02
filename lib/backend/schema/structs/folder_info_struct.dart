// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FolderInfoStruct extends FFFirebaseStruct {
  FolderInfoStruct({
    String? folderId,
    String? folderName,
    DocumentReference? folderRef,
    List<FolderInfoStruct>? folderSubfolderIdList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _folderId = folderId,
        _folderName = folderName,
        _folderRef = folderRef,
        _folderSubfolderIdList = folderSubfolderIdList,
        super(firestoreUtilData);

  // "folder_id" field.
  String? _folderId;
  String get folderId => _folderId ?? '';
  set folderId(String? val) => _folderId = val;

  bool hasFolderId() => _folderId != null;

  // "folder_name" field.
  String? _folderName;
  String get folderName => _folderName ?? '';
  set folderName(String? val) => _folderName = val;

  bool hasFolderName() => _folderName != null;

  // "folder_ref" field.
  DocumentReference? _folderRef;
  DocumentReference? get folderRef => _folderRef;
  set folderRef(DocumentReference? val) => _folderRef = val;

  bool hasFolderRef() => _folderRef != null;

  // "folder_subfolder_id_list" field.
  List<FolderInfoStruct>? _folderSubfolderIdList;
  List<FolderInfoStruct> get folderSubfolderIdList =>
      _folderSubfolderIdList ?? const [];
  set folderSubfolderIdList(List<FolderInfoStruct>? val) =>
      _folderSubfolderIdList = val;

  void updateFolderSubfolderIdList(Function(List<FolderInfoStruct>) updateFn) {
    updateFn(_folderSubfolderIdList ??= []);
  }

  bool hasFolderSubfolderIdList() => _folderSubfolderIdList != null;

  static FolderInfoStruct fromMap(Map<String, dynamic> data) =>
      FolderInfoStruct(
        folderId: data['folder_id'] as String?,
        folderName: data['folder_name'] as String?,
        folderRef: data['folder_ref'] as DocumentReference?,
        folderSubfolderIdList: getStructList(
          data['folder_subfolder_id_list'],
          FolderInfoStruct.fromMap,
        ),
      );

  static FolderInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? FolderInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'folder_id': _folderId,
        'folder_name': _folderName,
        'folder_ref': _folderRef,
        'folder_subfolder_id_list':
            _folderSubfolderIdList?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'folder_id': serializeParam(
          _folderId,
          ParamType.String,
        ),
        'folder_name': serializeParam(
          _folderName,
          ParamType.String,
        ),
        'folder_ref': serializeParam(
          _folderRef,
          ParamType.DocumentReference,
        ),
        'folder_subfolder_id_list': serializeParam(
          _folderSubfolderIdList,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static FolderInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      FolderInfoStruct(
        folderId: deserializeParam(
          data['folder_id'],
          ParamType.String,
          false,
        ),
        folderName: deserializeParam(
          data['folder_name'],
          ParamType.String,
          false,
        ),
        folderRef: deserializeParam(
          data['folder_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['folder'],
        ),
        folderSubfolderIdList: deserializeStructParam<FolderInfoStruct>(
          data['folder_subfolder_id_list'],
          ParamType.DataStruct,
          true,
          structBuilder: FolderInfoStruct.fromSerializableMap,
        ),
      );

  static FolderInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      FolderInfoStruct(
        folderId: convertAlgoliaParam(
          data['folder_id'],
          ParamType.String,
          false,
        ),
        folderName: convertAlgoliaParam(
          data['folder_name'],
          ParamType.String,
          false,
        ),
        folderRef: convertAlgoliaParam(
          data['folder_ref'],
          ParamType.DocumentReference,
          false,
        ),
        folderSubfolderIdList: convertAlgoliaParam<FolderInfoStruct>(
          data['folder_subfolder_id_list'],
          ParamType.DataStruct,
          true,
          structBuilder: FolderInfoStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FolderInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FolderInfoStruct &&
        folderId == other.folderId &&
        folderName == other.folderName &&
        folderRef == other.folderRef &&
        listEquality.equals(folderSubfolderIdList, other.folderSubfolderIdList);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([folderId, folderName, folderRef, folderSubfolderIdList]);
}

FolderInfoStruct createFolderInfoStruct({
  String? folderId,
  String? folderName,
  DocumentReference? folderRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FolderInfoStruct(
      folderId: folderId,
      folderName: folderName,
      folderRef: folderRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FolderInfoStruct? updateFolderInfoStruct(
  FolderInfoStruct? folderInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    folderInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFolderInfoStructData(
  Map<String, dynamic> firestoreData,
  FolderInfoStruct? folderInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (folderInfo == null) {
    return;
  }
  if (folderInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && folderInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final folderInfoData = getFolderInfoFirestoreData(folderInfo, forFieldValue);
  final nestedData = folderInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = folderInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFolderInfoFirestoreData(
  FolderInfoStruct? folderInfo, [
  bool forFieldValue = false,
]) {
  if (folderInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(folderInfo.toMap());

  // Add any Firestore field values
  folderInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFolderInfoListFirestoreData(
  List<FolderInfoStruct>? folderInfos,
) =>
    folderInfos?.map((e) => getFolderInfoFirestoreData(e, true)).toList() ?? [];
