// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonFileListStruct extends FFFirebaseStruct {
  LessonFileListStruct({
    DateTime? lessonCreatedAt,
    String? lessonStatus,
    int? lessonOrder,
    bool? lessonDownloadStatus,
    String? lessonFileLink,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lessonCreatedAt = lessonCreatedAt,
        _lessonStatus = lessonStatus,
        _lessonOrder = lessonOrder,
        _lessonDownloadStatus = lessonDownloadStatus,
        _lessonFileLink = lessonFileLink,
        super(firestoreUtilData);

  // "lesson_created_at" field.
  DateTime? _lessonCreatedAt;
  DateTime? get lessonCreatedAt => _lessonCreatedAt;
  set lessonCreatedAt(DateTime? val) => _lessonCreatedAt = val;

  bool hasLessonCreatedAt() => _lessonCreatedAt != null;

  // "lesson_status" field.
  String? _lessonStatus;
  String get lessonStatus => _lessonStatus ?? '';
  set lessonStatus(String? val) => _lessonStatus = val;

  bool hasLessonStatus() => _lessonStatus != null;

  // "lesson_order" field.
  int? _lessonOrder;
  int get lessonOrder => _lessonOrder ?? 0;
  set lessonOrder(int? val) => _lessonOrder = val;

  void incrementLessonOrder(int amount) => lessonOrder = lessonOrder + amount;

  bool hasLessonOrder() => _lessonOrder != null;

  // "lesson_download_status" field.
  bool? _lessonDownloadStatus;
  bool get lessonDownloadStatus => _lessonDownloadStatus ?? false;
  set lessonDownloadStatus(bool? val) => _lessonDownloadStatus = val;

  bool hasLessonDownloadStatus() => _lessonDownloadStatus != null;

  // "lesson_file_link" field.
  String? _lessonFileLink;
  String get lessonFileLink => _lessonFileLink ?? '';
  set lessonFileLink(String? val) => _lessonFileLink = val;

  bool hasLessonFileLink() => _lessonFileLink != null;

  static LessonFileListStruct fromMap(Map<String, dynamic> data) =>
      LessonFileListStruct(
        lessonCreatedAt: data['lesson_created_at'] as DateTime?,
        lessonStatus: data['lesson_status'] as String?,
        lessonOrder: castToType<int>(data['lesson_order']),
        lessonDownloadStatus: data['lesson_download_status'] as bool?,
        lessonFileLink: data['lesson_file_link'] as String?,
      );

  static LessonFileListStruct? maybeFromMap(dynamic data) => data is Map
      ? LessonFileListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lesson_created_at': _lessonCreatedAt,
        'lesson_status': _lessonStatus,
        'lesson_order': _lessonOrder,
        'lesson_download_status': _lessonDownloadStatus,
        'lesson_file_link': _lessonFileLink,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lesson_created_at': serializeParam(
          _lessonCreatedAt,
          ParamType.DateTime,
        ),
        'lesson_status': serializeParam(
          _lessonStatus,
          ParamType.String,
        ),
        'lesson_order': serializeParam(
          _lessonOrder,
          ParamType.int,
        ),
        'lesson_download_status': serializeParam(
          _lessonDownloadStatus,
          ParamType.bool,
        ),
        'lesson_file_link': serializeParam(
          _lessonFileLink,
          ParamType.String,
        ),
      }.withoutNulls;

  static LessonFileListStruct fromSerializableMap(Map<String, dynamic> data) =>
      LessonFileListStruct(
        lessonCreatedAt: deserializeParam(
          data['lesson_created_at'],
          ParamType.DateTime,
          false,
        ),
        lessonStatus: deserializeParam(
          data['lesson_status'],
          ParamType.String,
          false,
        ),
        lessonOrder: deserializeParam(
          data['lesson_order'],
          ParamType.int,
          false,
        ),
        lessonDownloadStatus: deserializeParam(
          data['lesson_download_status'],
          ParamType.bool,
          false,
        ),
        lessonFileLink: deserializeParam(
          data['lesson_file_link'],
          ParamType.String,
          false,
        ),
      );

  static LessonFileListStruct fromAlgoliaData(Map<String, dynamic> data) =>
      LessonFileListStruct(
        lessonCreatedAt: convertAlgoliaParam(
          data['lesson_created_at'],
          ParamType.DateTime,
          false,
        ),
        lessonStatus: convertAlgoliaParam(
          data['lesson_status'],
          ParamType.String,
          false,
        ),
        lessonOrder: convertAlgoliaParam(
          data['lesson_order'],
          ParamType.int,
          false,
        ),
        lessonDownloadStatus: convertAlgoliaParam(
          data['lesson_download_status'],
          ParamType.bool,
          false,
        ),
        lessonFileLink: convertAlgoliaParam(
          data['lesson_file_link'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LessonFileListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LessonFileListStruct &&
        lessonCreatedAt == other.lessonCreatedAt &&
        lessonStatus == other.lessonStatus &&
        lessonOrder == other.lessonOrder &&
        lessonDownloadStatus == other.lessonDownloadStatus &&
        lessonFileLink == other.lessonFileLink;
  }

  @override
  int get hashCode => const ListEquality().hash([
        lessonCreatedAt,
        lessonStatus,
        lessonOrder,
        lessonDownloadStatus,
        lessonFileLink
      ]);
}

LessonFileListStruct createLessonFileListStruct({
  DateTime? lessonCreatedAt,
  String? lessonStatus,
  int? lessonOrder,
  bool? lessonDownloadStatus,
  String? lessonFileLink,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LessonFileListStruct(
      lessonCreatedAt: lessonCreatedAt,
      lessonStatus: lessonStatus,
      lessonOrder: lessonOrder,
      lessonDownloadStatus: lessonDownloadStatus,
      lessonFileLink: lessonFileLink,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LessonFileListStruct? updateLessonFileListStruct(
  LessonFileListStruct? lessonFileList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lessonFileList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLessonFileListStructData(
  Map<String, dynamic> firestoreData,
  LessonFileListStruct? lessonFileList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lessonFileList == null) {
    return;
  }
  if (lessonFileList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lessonFileList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lessonFileListData =
      getLessonFileListFirestoreData(lessonFileList, forFieldValue);
  final nestedData =
      lessonFileListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lessonFileList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLessonFileListFirestoreData(
  LessonFileListStruct? lessonFileList, [
  bool forFieldValue = false,
]) {
  if (lessonFileList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lessonFileList.toMap());

  // Add any Firestore field values
  lessonFileList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLessonFileListListFirestoreData(
  List<LessonFileListStruct>? lessonFileLists,
) =>
    lessonFileLists
        ?.map((e) => getLessonFileListFirestoreData(e, true))
        .toList() ??
    [];
