import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "OrderID" field.
  String? _orderID;
  String get orderID => _orderID ?? '';
  bool hasOrderID() => _orderID != null;

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "payment" field.
  double? _payment;
  double get payment => _payment ?? 0.0;
  bool hasPayment() => _payment != null;

  // "changed" field.
  double? _changed;
  double get changed => _changed ?? 0.0;
  bool hasChanged() => _changed != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _orderID = snapshotData['OrderID'] as String?;
    _totalPrice = castToType<double>(snapshotData['totalPrice']);
    _payment = castToType<double>(snapshotData['payment']);
    _changed = castToType<double>(snapshotData['changed']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  String? orderID,
  double? totalPrice,
  double? payment,
  double? changed,
  DateTime? createdAt,
  DocumentReference? userRef,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'OrderID': orderID,
      'totalPrice': totalPrice,
      'payment': payment,
      'changed': changed,
      'created_at': createdAt,
      'user_ref': userRef,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    return e1?.orderID == e2?.orderID &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.payment == e2?.payment &&
        e1?.changed == e2?.changed &&
        e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.status == e2?.status;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.orderID,
        e?.totalPrice,
        e?.payment,
        e?.changed,
        e?.createdAt,
        e?.userRef,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
