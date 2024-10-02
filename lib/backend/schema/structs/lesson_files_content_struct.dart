// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonFilesContentStruct extends FFFirebaseStruct {
  LessonFilesContentStruct({
    String? fileURL,
    bool? permissions,
    DateTime? createdAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fileURL = fileURL,
        _permissions = permissions,
        _createdAt = createdAt,
        super(firestoreUtilData);

  // "fileURL" field.
  String? _fileURL;
  String get fileURL => _fileURL ?? '';
  set fileURL(String? val) => _fileURL = val;

  bool hasFileURL() => _fileURL != null;

  // "permissions" field.
  bool? _permissions;
  bool get permissions => _permissions ?? false;
  set permissions(bool? val) => _permissions = val;

  bool hasPermissions() => _permissions != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static LessonFilesContentStruct fromMap(Map<String, dynamic> data) =>
      LessonFilesContentStruct(
        fileURL: data['fileURL'] as String?,
        permissions: data['permissions'] as bool?,
        createdAt: data['createdAt'] as DateTime?,
      );

  static LessonFilesContentStruct? maybeFromMap(dynamic data) => data is Map
      ? LessonFilesContentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fileURL': _fileURL,
        'permissions': _permissions,
        'createdAt': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fileURL': serializeParam(
          _fileURL,
          ParamType.String,
        ),
        'permissions': serializeParam(
          _permissions,
          ParamType.bool,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static LessonFilesContentStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LessonFilesContentStruct(
        fileURL: deserializeParam(
          data['fileURL'],
          ParamType.String,
          false,
        ),
        permissions: deserializeParam(
          data['permissions'],
          ParamType.bool,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
      );

  static LessonFilesContentStruct fromAlgoliaData(Map<String, dynamic> data) =>
      LessonFilesContentStruct(
        fileURL: convertAlgoliaParam(
          data['fileURL'],
          ParamType.String,
          false,
        ),
        permissions: convertAlgoliaParam(
          data['permissions'],
          ParamType.bool,
          false,
        ),
        createdAt: convertAlgoliaParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LessonFilesContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LessonFilesContentStruct &&
        fileURL == other.fileURL &&
        permissions == other.permissions &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([fileURL, permissions, createdAt]);
}

LessonFilesContentStruct createLessonFilesContentStruct({
  String? fileURL,
  bool? permissions,
  DateTime? createdAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LessonFilesContentStruct(
      fileURL: fileURL,
      permissions: permissions,
      createdAt: createdAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LessonFilesContentStruct? updateLessonFilesContentStruct(
  LessonFilesContentStruct? lessonFilesContent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lessonFilesContent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLessonFilesContentStructData(
  Map<String, dynamic> firestoreData,
  LessonFilesContentStruct? lessonFilesContent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lessonFilesContent == null) {
    return;
  }
  if (lessonFilesContent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lessonFilesContent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lessonFilesContentData =
      getLessonFilesContentFirestoreData(lessonFilesContent, forFieldValue);
  final nestedData =
      lessonFilesContentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      lessonFilesContent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLessonFilesContentFirestoreData(
  LessonFilesContentStruct? lessonFilesContent, [
  bool forFieldValue = false,
]) {
  if (lessonFilesContent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lessonFilesContent.toMap());

  // Add any Firestore field values
  lessonFilesContent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLessonFilesContentListFirestoreData(
  List<LessonFilesContentStruct>? lessonFilesContents,
) =>
    lessonFilesContents
        ?.map((e) => getLessonFilesContentFirestoreData(e, true))
        .toList() ??
    [];
