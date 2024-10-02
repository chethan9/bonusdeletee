// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderProductStruct extends FFFirebaseStruct {
  OrderProductStruct({
    DocumentReference? courseRef,
    DateTime? createdAt,
    double? price,
    double? salesPrice,
    int? quantity,
    double? subTotal,
    String? paymentType,
    String? emiType,
    DocumentReference? batchRef,
    DocumentReference? couponRef,
    String? couponAppliedStatus,
    String? couponCode,
    double? firstEmiPrice,
    double? secondEmiPrice,
    double? thirdEmiPrice,
    String? userSubscriptionStatus,
    String? userSubscriptionLastEmiPaymentType,
    String? courseName,
    String? courseImage,
    bool? courseEmiStatus,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _courseRef = courseRef,
        _createdAt = createdAt,
        _price = price,
        _salesPrice = salesPrice,
        _quantity = quantity,
        _subTotal = subTotal,
        _paymentType = paymentType,
        _emiType = emiType,
        _batchRef = batchRef,
        _couponRef = couponRef,
        _couponAppliedStatus = couponAppliedStatus,
        _couponCode = couponCode,
        _firstEmiPrice = firstEmiPrice,
        _secondEmiPrice = secondEmiPrice,
        _thirdEmiPrice = thirdEmiPrice,
        _userSubscriptionStatus = userSubscriptionStatus,
        _userSubscriptionLastEmiPaymentType =
            userSubscriptionLastEmiPaymentType,
        _courseName = courseName,
        _courseImage = courseImage,
        _courseEmiStatus = courseEmiStatus,
        super(firestoreUtilData);

  // "courseRef" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  set courseRef(DocumentReference? val) => _courseRef = val;

  bool hasCourseRef() => _courseRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "sales_price" field.
  double? _salesPrice;
  double get salesPrice => _salesPrice ?? 0.0;
  set salesPrice(double? val) => _salesPrice = val;

  void incrementSalesPrice(double amount) => salesPrice = salesPrice + amount;

  bool hasSalesPrice() => _salesPrice != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "sub_total" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  set subTotal(double? val) => _subTotal = val;

  void incrementSubTotal(double amount) => subTotal = subTotal + amount;

  bool hasSubTotal() => _subTotal != null;

  // "payment_type" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  set paymentType(String? val) => _paymentType = val;

  bool hasPaymentType() => _paymentType != null;

  // "emi_type" field.
  String? _emiType;
  String get emiType => _emiType ?? '';
  set emiType(String? val) => _emiType = val;

  bool hasEmiType() => _emiType != null;

  // "batchRef" field.
  DocumentReference? _batchRef;
  DocumentReference? get batchRef => _batchRef;
  set batchRef(DocumentReference? val) => _batchRef = val;

  bool hasBatchRef() => _batchRef != null;

  // "couponRef" field.
  DocumentReference? _couponRef;
  DocumentReference? get couponRef => _couponRef;
  set couponRef(DocumentReference? val) => _couponRef = val;

  bool hasCouponRef() => _couponRef != null;

  // "couponAppliedStatus" field.
  String? _couponAppliedStatus;
  String get couponAppliedStatus => _couponAppliedStatus ?? '';
  set couponAppliedStatus(String? val) => _couponAppliedStatus = val;

  bool hasCouponAppliedStatus() => _couponAppliedStatus != null;

  // "coupon_code" field.
  String? _couponCode;
  String get couponCode => _couponCode ?? '';
  set couponCode(String? val) => _couponCode = val;

  bool hasCouponCode() => _couponCode != null;

  // "firstEmiPrice" field.
  double? _firstEmiPrice;
  double get firstEmiPrice => _firstEmiPrice ?? 0.0;
  set firstEmiPrice(double? val) => _firstEmiPrice = val;

  void incrementFirstEmiPrice(double amount) =>
      firstEmiPrice = firstEmiPrice + amount;

  bool hasFirstEmiPrice() => _firstEmiPrice != null;

  // "secondEmiPrice" field.
  double? _secondEmiPrice;
  double get secondEmiPrice => _secondEmiPrice ?? 0.0;
  set secondEmiPrice(double? val) => _secondEmiPrice = val;

  void incrementSecondEmiPrice(double amount) =>
      secondEmiPrice = secondEmiPrice + amount;

  bool hasSecondEmiPrice() => _secondEmiPrice != null;

  // "thirdEmiPrice" field.
  double? _thirdEmiPrice;
  double get thirdEmiPrice => _thirdEmiPrice ?? 0.0;
  set thirdEmiPrice(double? val) => _thirdEmiPrice = val;

  void incrementThirdEmiPrice(double amount) =>
      thirdEmiPrice = thirdEmiPrice + amount;

  bool hasThirdEmiPrice() => _thirdEmiPrice != null;

  // "user_subscription_status" field.
  String? _userSubscriptionStatus;
  String get userSubscriptionStatus => _userSubscriptionStatus ?? '';
  set userSubscriptionStatus(String? val) => _userSubscriptionStatus = val;

  bool hasUserSubscriptionStatus() => _userSubscriptionStatus != null;

  // "user_subscription_last_emi_payment_type" field.
  String? _userSubscriptionLastEmiPaymentType;
  String get userSubscriptionLastEmiPaymentType =>
      _userSubscriptionLastEmiPaymentType ?? '';
  set userSubscriptionLastEmiPaymentType(String? val) =>
      _userSubscriptionLastEmiPaymentType = val;

  bool hasUserSubscriptionLastEmiPaymentType() =>
      _userSubscriptionLastEmiPaymentType != null;

  // "course_name" field.
  String? _courseName;
  String get courseName => _courseName ?? '';
  set courseName(String? val) => _courseName = val;

  bool hasCourseName() => _courseName != null;

  // "course_image" field.
  String? _courseImage;
  String get courseImage => _courseImage ?? '';
  set courseImage(String? val) => _courseImage = val;

  bool hasCourseImage() => _courseImage != null;

  // "course_emi_status" field.
  bool? _courseEmiStatus;
  bool get courseEmiStatus => _courseEmiStatus ?? false;
  set courseEmiStatus(bool? val) => _courseEmiStatus = val;

  bool hasCourseEmiStatus() => _courseEmiStatus != null;

  static OrderProductStruct fromMap(Map<String, dynamic> data) =>
      OrderProductStruct(
        courseRef: data['courseRef'] as DocumentReference?,
        createdAt: data['createdAt'] as DateTime?,
        price: castToType<double>(data['price']),
        salesPrice: castToType<double>(data['sales_price']),
        quantity: castToType<int>(data['quantity']),
        subTotal: castToType<double>(data['sub_total']),
        paymentType: data['payment_type'] as String?,
        emiType: data['emi_type'] as String?,
        batchRef: data['batchRef'] as DocumentReference?,
        couponRef: data['couponRef'] as DocumentReference?,
        couponAppliedStatus: data['couponAppliedStatus'] as String?,
        couponCode: data['coupon_code'] as String?,
        firstEmiPrice: castToType<double>(data['firstEmiPrice']),
        secondEmiPrice: castToType<double>(data['secondEmiPrice']),
        thirdEmiPrice: castToType<double>(data['thirdEmiPrice']),
        userSubscriptionStatus: data['user_subscription_status'] as String?,
        userSubscriptionLastEmiPaymentType:
            data['user_subscription_last_emi_payment_type'] as String?,
        courseName: data['course_name'] as String?,
        courseImage: data['course_image'] as String?,
        courseEmiStatus: data['course_emi_status'] as bool?,
      );

  static OrderProductStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'courseRef': _courseRef,
        'createdAt': _createdAt,
        'price': _price,
        'sales_price': _salesPrice,
        'quantity': _quantity,
        'sub_total': _subTotal,
        'payment_type': _paymentType,
        'emi_type': _emiType,
        'batchRef': _batchRef,
        'couponRef': _couponRef,
        'couponAppliedStatus': _couponAppliedStatus,
        'coupon_code': _couponCode,
        'firstEmiPrice': _firstEmiPrice,
        'secondEmiPrice': _secondEmiPrice,
        'thirdEmiPrice': _thirdEmiPrice,
        'user_subscription_status': _userSubscriptionStatus,
        'user_subscription_last_emi_payment_type':
            _userSubscriptionLastEmiPaymentType,
        'course_name': _courseName,
        'course_image': _courseImage,
        'course_emi_status': _courseEmiStatus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'courseRef': serializeParam(
          _courseRef,
          ParamType.DocumentReference,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'sales_price': serializeParam(
          _salesPrice,
          ParamType.double,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'sub_total': serializeParam(
          _subTotal,
          ParamType.double,
        ),
        'payment_type': serializeParam(
          _paymentType,
          ParamType.String,
        ),
        'emi_type': serializeParam(
          _emiType,
          ParamType.String,
        ),
        'batchRef': serializeParam(
          _batchRef,
          ParamType.DocumentReference,
        ),
        'couponRef': serializeParam(
          _couponRef,
          ParamType.DocumentReference,
        ),
        'couponAppliedStatus': serializeParam(
          _couponAppliedStatus,
          ParamType.String,
        ),
        'coupon_code': serializeParam(
          _couponCode,
          ParamType.String,
        ),
        'firstEmiPrice': serializeParam(
          _firstEmiPrice,
          ParamType.double,
        ),
        'secondEmiPrice': serializeParam(
          _secondEmiPrice,
          ParamType.double,
        ),
        'thirdEmiPrice': serializeParam(
          _thirdEmiPrice,
          ParamType.double,
        ),
        'user_subscription_status': serializeParam(
          _userSubscriptionStatus,
          ParamType.String,
        ),
        'user_subscription_last_emi_payment_type': serializeParam(
          _userSubscriptionLastEmiPaymentType,
          ParamType.String,
        ),
        'course_name': serializeParam(
          _courseName,
          ParamType.String,
        ),
        'course_image': serializeParam(
          _courseImage,
          ParamType.String,
        ),
        'course_emi_status': serializeParam(
          _courseEmiStatus,
          ParamType.bool,
        ),
      }.withoutNulls;

  static OrderProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderProductStruct(
        courseRef: deserializeParam(
          data['courseRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['course'],
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        salesPrice: deserializeParam(
          data['sales_price'],
          ParamType.double,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        subTotal: deserializeParam(
          data['sub_total'],
          ParamType.double,
          false,
        ),
        paymentType: deserializeParam(
          data['payment_type'],
          ParamType.String,
          false,
        ),
        emiType: deserializeParam(
          data['emi_type'],
          ParamType.String,
          false,
        ),
        batchRef: deserializeParam(
          data['batchRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['batches'],
        ),
        couponRef: deserializeParam(
          data['couponRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['coupon'],
        ),
        couponAppliedStatus: deserializeParam(
          data['couponAppliedStatus'],
          ParamType.String,
          false,
        ),
        couponCode: deserializeParam(
          data['coupon_code'],
          ParamType.String,
          false,
        ),
        firstEmiPrice: deserializeParam(
          data['firstEmiPrice'],
          ParamType.double,
          false,
        ),
        secondEmiPrice: deserializeParam(
          data['secondEmiPrice'],
          ParamType.double,
          false,
        ),
        thirdEmiPrice: deserializeParam(
          data['thirdEmiPrice'],
          ParamType.double,
          false,
        ),
        userSubscriptionStatus: deserializeParam(
          data['user_subscription_status'],
          ParamType.String,
          false,
        ),
        userSubscriptionLastEmiPaymentType: deserializeParam(
          data['user_subscription_last_emi_payment_type'],
          ParamType.String,
          false,
        ),
        courseName: deserializeParam(
          data['course_name'],
          ParamType.String,
          false,
        ),
        courseImage: deserializeParam(
          data['course_image'],
          ParamType.String,
          false,
        ),
        courseEmiStatus: deserializeParam(
          data['course_emi_status'],
          ParamType.bool,
          false,
        ),
      );

  static OrderProductStruct fromAlgoliaData(Map<String, dynamic> data) =>
      OrderProductStruct(
        courseRef: convertAlgoliaParam(
          data['courseRef'],
          ParamType.DocumentReference,
          false,
        ),
        createdAt: convertAlgoliaParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        price: convertAlgoliaParam(
          data['price'],
          ParamType.double,
          false,
        ),
        salesPrice: convertAlgoliaParam(
          data['sales_price'],
          ParamType.double,
          false,
        ),
        quantity: convertAlgoliaParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        subTotal: convertAlgoliaParam(
          data['sub_total'],
          ParamType.double,
          false,
        ),
        paymentType: convertAlgoliaParam(
          data['payment_type'],
          ParamType.String,
          false,
        ),
        emiType: convertAlgoliaParam(
          data['emi_type'],
          ParamType.String,
          false,
        ),
        batchRef: convertAlgoliaParam(
          data['batchRef'],
          ParamType.DocumentReference,
          false,
        ),
        couponRef: convertAlgoliaParam(
          data['couponRef'],
          ParamType.DocumentReference,
          false,
        ),
        couponAppliedStatus: convertAlgoliaParam(
          data['couponAppliedStatus'],
          ParamType.String,
          false,
        ),
        couponCode: convertAlgoliaParam(
          data['coupon_code'],
          ParamType.String,
          false,
        ),
        firstEmiPrice: convertAlgoliaParam(
          data['firstEmiPrice'],
          ParamType.double,
          false,
        ),
        secondEmiPrice: convertAlgoliaParam(
          data['secondEmiPrice'],
          ParamType.double,
          false,
        ),
        thirdEmiPrice: convertAlgoliaParam(
          data['thirdEmiPrice'],
          ParamType.double,
          false,
        ),
        userSubscriptionStatus: convertAlgoliaParam(
          data['user_subscription_status'],
          ParamType.String,
          false,
        ),
        userSubscriptionLastEmiPaymentType: convertAlgoliaParam(
          data['user_subscription_last_emi_payment_type'],
          ParamType.String,
          false,
        ),
        courseName: convertAlgoliaParam(
          data['course_name'],
          ParamType.String,
          false,
        ),
        courseImage: convertAlgoliaParam(
          data['course_image'],
          ParamType.String,
          false,
        ),
        courseEmiStatus: convertAlgoliaParam(
          data['course_emi_status'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'OrderProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderProductStruct &&
        courseRef == other.courseRef &&
        createdAt == other.createdAt &&
        price == other.price &&
        salesPrice == other.salesPrice &&
        quantity == other.quantity &&
        subTotal == other.subTotal &&
        paymentType == other.paymentType &&
        emiType == other.emiType &&
        batchRef == other.batchRef &&
        couponRef == other.couponRef &&
        couponAppliedStatus == other.couponAppliedStatus &&
        couponCode == other.couponCode &&
        firstEmiPrice == other.firstEmiPrice &&
        secondEmiPrice == other.secondEmiPrice &&
        thirdEmiPrice == other.thirdEmiPrice &&
        userSubscriptionStatus == other.userSubscriptionStatus &&
        userSubscriptionLastEmiPaymentType ==
            other.userSubscriptionLastEmiPaymentType &&
        courseName == other.courseName &&
        courseImage == other.courseImage &&
        courseEmiStatus == other.courseEmiStatus;
  }

  @override
  int get hashCode => const ListEquality().hash([
        courseRef,
        createdAt,
        price,
        salesPrice,
        quantity,
        subTotal,
        paymentType,
        emiType,
        batchRef,
        couponRef,
        couponAppliedStatus,
        couponCode,
        firstEmiPrice,
        secondEmiPrice,
        thirdEmiPrice,
        userSubscriptionStatus,
        userSubscriptionLastEmiPaymentType,
        courseName,
        courseImage,
        courseEmiStatus
      ]);
}

OrderProductStruct createOrderProductStruct({
  DocumentReference? courseRef,
  DateTime? createdAt,
  double? price,
  double? salesPrice,
  int? quantity,
  double? subTotal,
  String? paymentType,
  String? emiType,
  DocumentReference? batchRef,
  DocumentReference? couponRef,
  String? couponAppliedStatus,
  String? couponCode,
  double? firstEmiPrice,
  double? secondEmiPrice,
  double? thirdEmiPrice,
  String? userSubscriptionStatus,
  String? userSubscriptionLastEmiPaymentType,
  String? courseName,
  String? courseImage,
  bool? courseEmiStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderProductStruct(
      courseRef: courseRef,
      createdAt: createdAt,
      price: price,
      salesPrice: salesPrice,
      quantity: quantity,
      subTotal: subTotal,
      paymentType: paymentType,
      emiType: emiType,
      batchRef: batchRef,
      couponRef: couponRef,
      couponAppliedStatus: couponAppliedStatus,
      couponCode: couponCode,
      firstEmiPrice: firstEmiPrice,
      secondEmiPrice: secondEmiPrice,
      thirdEmiPrice: thirdEmiPrice,
      userSubscriptionStatus: userSubscriptionStatus,
      userSubscriptionLastEmiPaymentType: userSubscriptionLastEmiPaymentType,
      courseName: courseName,
      courseImage: courseImage,
      courseEmiStatus: courseEmiStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderProductStruct? updateOrderProductStruct(
  OrderProductStruct? orderProduct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orderProduct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderProductStructData(
  Map<String, dynamic> firestoreData,
  OrderProductStruct? orderProduct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderProduct == null) {
    return;
  }
  if (orderProduct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orderProduct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderProductData =
      getOrderProductFirestoreData(orderProduct, forFieldValue);
  final nestedData =
      orderProductData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orderProduct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderProductFirestoreData(
  OrderProductStruct? orderProduct, [
  bool forFieldValue = false,
]) {
  if (orderProduct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderProduct.toMap());

  // Add any Firestore field values
  orderProduct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderProductListFirestoreData(
  List<OrderProductStruct>? orderProducts,
) =>
    orderProducts?.map((e) => getOrderProductFirestoreData(e, true)).toList() ??
    [];
