import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCartRecord extends FirestoreRecord {
  UserCartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userCart');

  static Stream<UserCartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCartRecord.fromSnapshot(s));

  static Future<UserCartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserCartRecord.fromSnapshot(s));

  static UserCartRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCartRecordData({
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCartRecordDocumentEquality implements Equality<UserCartRecord> {
  const UserCartRecordDocumentEquality();

  @override
  bool equals(UserCartRecord? e1, UserCartRecord? e2) {
    return e1?.userRef == e2?.userRef;
  }

  @override
  int hash(UserCartRecord? e) => const ListEquality().hash([e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is UserCartRecord;
}
