import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsRecord extends FirestoreRecord {
  SettingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "socialLog" field.
  bool? _socialLog;
  bool get socialLog => _socialLog ?? false;
  bool hasSocialLog() => _socialLog != null;

  // "phoneLog" field.
  bool? _phoneLog;
  bool get phoneLog => _phoneLog ?? false;
  bool hasPhoneLog() => _phoneLog != null;

  // "wishList" field.
  bool? _wishList;
  bool get wishList => _wishList ?? false;
  bool hasWishList() => _wishList != null;

  // "exploreCategory" field.
  bool? _exploreCategory;
  bool get exploreCategory => _exploreCategory ?? false;
  bool hasExploreCategory() => _exploreCategory != null;

  // "topCourse" field.
  bool? _topCourse;
  bool get topCourse => _topCourse ?? false;
  bool hasTopCourse() => _topCourse != null;

  // "recommendedSection" field.
  bool? _recommendedSection;
  bool get recommendedSection => _recommendedSection ?? false;
  bool hasRecommendedSection() => _recommendedSection != null;

  // "general" field.
  GeneralStruct? _general;
  GeneralStruct get general => _general ?? GeneralStruct();
  bool hasGeneral() => _general != null;

  // "onboard" field.
  OnBoardStruct? _onboard;
  OnBoardStruct get onboard => _onboard ?? OnBoardStruct();
  bool hasOnboard() => _onboard != null;

  // "homeSlider" field.
  HomeSliderStruct? _homeSlider;
  HomeSliderStruct get homeSlider => _homeSlider ?? HomeSliderStruct();
  bool hasHomeSlider() => _homeSlider != null;

  // "aboutSec1" field.
  AboutSec1Struct? _aboutSec1;
  AboutSec1Struct get aboutSec1 => _aboutSec1 ?? AboutSec1Struct();
  bool hasAboutSec1() => _aboutSec1 != null;

  // "faviicon" field.
  String? _faviicon;
  String get faviicon => _faviicon ?? '';
  bool hasFaviicon() => _faviicon != null;

  // "batches" field.
  BatchStruct? _batches;
  BatchStruct get batches => _batches ?? BatchStruct();
  bool hasBatches() => _batches != null;

  // "masterPassword" field.
  String? _masterPassword;
  String get masterPassword => _masterPassword ?? '';
  bool hasMasterPassword() => _masterPassword != null;

  // "termsConditions" field.
  String? _termsConditions;
  String get termsConditions => _termsConditions ?? '';
  bool hasTermsConditions() => _termsConditions != null;

  // "smsTextLimit" field.
  int? _smsTextLimit;
  int get smsTextLimit => _smsTextLimit ?? 0;
  bool hasSmsTextLimit() => _smsTextLimit != null;

  // "meetingRequestMailID" field.
  String? _meetingRequestMailID;
  String get meetingRequestMailID => _meetingRequestMailID ?? '';
  bool hasMeetingRequestMailID() => _meetingRequestMailID != null;

  // "productSKU" field.
  OrderUniqueStruct? _productSKU;
  OrderUniqueStruct get productSKU => _productSKU ?? OrderUniqueStruct();
  bool hasProductSKU() => _productSKU != null;

  // "video1" field.
  String? _video1;
  String get video1 => _video1 ?? '';
  bool hasVideo1() => _video1 != null;

  // "video2" field.
  String? _video2;
  String get video2 => _video2 ?? '';
  bool hasVideo2() => _video2 != null;

  // "video3" field.
  String? _video3;
  String get video3 => _video3 ?? '';
  bool hasVideo3() => _video3 != null;

  // "inAppPurchase" field.
  bool? _inAppPurchase;
  bool get inAppPurchase => _inAppPurchase ?? false;
  bool hasInAppPurchase() => _inAppPurchase != null;

  void _initializeFields() {
    _logo = snapshotData['logo'] as String?;
    _socialLog = snapshotData['socialLog'] as bool?;
    _phoneLog = snapshotData['phoneLog'] as bool?;
    _wishList = snapshotData['wishList'] as bool?;
    _exploreCategory = snapshotData['exploreCategory'] as bool?;
    _topCourse = snapshotData['topCourse'] as bool?;
    _recommendedSection = snapshotData['recommendedSection'] as bool?;
    _general = GeneralStruct.maybeFromMap(snapshotData['general']);
    _onboard = OnBoardStruct.maybeFromMap(snapshotData['onboard']);
    _homeSlider = HomeSliderStruct.maybeFromMap(snapshotData['homeSlider']);
    _aboutSec1 = AboutSec1Struct.maybeFromMap(snapshotData['aboutSec1']);
    _faviicon = snapshotData['faviicon'] as String?;
    _batches = BatchStruct.maybeFromMap(snapshotData['batches']);
    _masterPassword = snapshotData['masterPassword'] as String?;
    _termsConditions = snapshotData['termsConditions'] as String?;
    _smsTextLimit = castToType<int>(snapshotData['smsTextLimit']);
    _meetingRequestMailID = snapshotData['meetingRequestMailID'] as String?;
    _productSKU = OrderUniqueStruct.maybeFromMap(snapshotData['productSKU']);
    _video1 = snapshotData['video1'] as String?;
    _video2 = snapshotData['video2'] as String?;
    _video3 = snapshotData['video3'] as String?;
    _inAppPurchase = snapshotData['inAppPurchase'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('settings');

  static Stream<SettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SettingsRecord.fromSnapshot(s));

  static Future<SettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SettingsRecord.fromSnapshot(s));

  static SettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSettingsRecordData({
  String? logo,
  bool? socialLog,
  bool? phoneLog,
  bool? wishList,
  bool? exploreCategory,
  bool? topCourse,
  bool? recommendedSection,
  GeneralStruct? general,
  OnBoardStruct? onboard,
  HomeSliderStruct? homeSlider,
  AboutSec1Struct? aboutSec1,
  String? faviicon,
  BatchStruct? batches,
  String? masterPassword,
  String? termsConditions,
  int? smsTextLimit,
  String? meetingRequestMailID,
  OrderUniqueStruct? productSKU,
  String? video1,
  String? video2,
  String? video3,
  bool? inAppPurchase,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'logo': logo,
      'socialLog': socialLog,
      'phoneLog': phoneLog,
      'wishList': wishList,
      'exploreCategory': exploreCategory,
      'topCourse': topCourse,
      'recommendedSection': recommendedSection,
      'general': GeneralStruct().toMap(),
      'onboard': OnBoardStruct().toMap(),
      'homeSlider': HomeSliderStruct().toMap(),
      'aboutSec1': AboutSec1Struct().toMap(),
      'faviicon': faviicon,
      'batches': BatchStruct().toMap(),
      'masterPassword': masterPassword,
      'termsConditions': termsConditions,
      'smsTextLimit': smsTextLimit,
      'meetingRequestMailID': meetingRequestMailID,
      'productSKU': OrderUniqueStruct().toMap(),
      'video1': video1,
      'video2': video2,
      'video3': video3,
      'inAppPurchase': inAppPurchase,
    }.withoutNulls,
  );

  // Handle nested data for "general" field.
  addGeneralStructData(firestoreData, general, 'general');

  // Handle nested data for "onboard" field.
  addOnBoardStructData(firestoreData, onboard, 'onboard');

  // Handle nested data for "homeSlider" field.
  addHomeSliderStructData(firestoreData, homeSlider, 'homeSlider');

  // Handle nested data for "aboutSec1" field.
  addAboutSec1StructData(firestoreData, aboutSec1, 'aboutSec1');

  // Handle nested data for "batches" field.
  addBatchStructData(firestoreData, batches, 'batches');

  // Handle nested data for "productSKU" field.
  addOrderUniqueStructData(firestoreData, productSKU, 'productSKU');

  return firestoreData;
}

class SettingsRecordDocumentEquality implements Equality<SettingsRecord> {
  const SettingsRecordDocumentEquality();

  @override
  bool equals(SettingsRecord? e1, SettingsRecord? e2) {
    return e1?.logo == e2?.logo &&
        e1?.socialLog == e2?.socialLog &&
        e1?.phoneLog == e2?.phoneLog &&
        e1?.wishList == e2?.wishList &&
        e1?.exploreCategory == e2?.exploreCategory &&
        e1?.topCourse == e2?.topCourse &&
        e1?.recommendedSection == e2?.recommendedSection &&
        e1?.general == e2?.general &&
        e1?.onboard == e2?.onboard &&
        e1?.homeSlider == e2?.homeSlider &&
        e1?.aboutSec1 == e2?.aboutSec1 &&
        e1?.faviicon == e2?.faviicon &&
        e1?.batches == e2?.batches &&
        e1?.masterPassword == e2?.masterPassword &&
        e1?.termsConditions == e2?.termsConditions &&
        e1?.smsTextLimit == e2?.smsTextLimit &&
        e1?.meetingRequestMailID == e2?.meetingRequestMailID &&
        e1?.productSKU == e2?.productSKU &&
        e1?.video1 == e2?.video1 &&
        e1?.video2 == e2?.video2 &&
        e1?.video3 == e2?.video3 &&
        e1?.inAppPurchase == e2?.inAppPurchase;
  }

  @override
  int hash(SettingsRecord? e) => const ListEquality().hash([
        e?.logo,
        e?.socialLog,
        e?.phoneLog,
        e?.wishList,
        e?.exploreCategory,
        e?.topCourse,
        e?.recommendedSection,
        e?.general,
        e?.onboard,
        e?.homeSlider,
        e?.aboutSec1,
        e?.faviicon,
        e?.batches,
        e?.masterPassword,
        e?.termsConditions,
        e?.smsTextLimit,
        e?.meetingRequestMailID,
        e?.productSKU,
        e?.video1,
        e?.video2,
        e?.video3,
        e?.inAppPurchase
      ]);

  @override
  bool isValidKey(Object? o) => o is SettingsRecord;
}
