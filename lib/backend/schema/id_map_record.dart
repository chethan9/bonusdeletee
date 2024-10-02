import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdMapRecord extends FirestoreRecord {
  IdMapRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "folder_id" field.
  int? _folderId;
  int get folderId => _folderId ?? 0;
  bool hasFolderId() => _folderId != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _folderId = castToType<int>(snapshotData['folder_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('id_map');

  static Stream<IdMapRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IdMapRecord.fromSnapshot(s));

  static Future<IdMapRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IdMapRecord.fromSnapshot(s));

  static IdMapRecord fromSnapshot(DocumentSnapshot snapshot) => IdMapRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IdMapRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IdMapRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IdMapRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IdMapRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIdMapRecordData({
  String? type,
  int? folderId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'folder_id': folderId,
    }.withoutNulls,
  );

  return firestoreData;
}

class IdMapRecordDocumentEquality implements Equality<IdMapRecord> {
  const IdMapRecordDocumentEquality();

  @override
  bool equals(IdMapRecord? e1, IdMapRecord? e2) {
    return e1?.type == e2?.type && e1?.folderId == e2?.folderId;
  }

  @override
  int hash(IdMapRecord? e) => const ListEquality().hash([e?.type, e?.folderId]);

  @override
  bool isValidKey(Object? o) => o is IdMapRecord;
}
