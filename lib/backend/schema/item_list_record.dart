import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemListRecord extends FirestoreRecord {
  ItemListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "subTotalPrice" field.
  double? _subTotalPrice;
  double get subTotalPrice => _subTotalPrice ?? 0.0;
  bool hasSubTotalPrice() => _subTotalPrice != null;

  // "order_ref" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  void _initializeFields() {
    _productRef = snapshotData['product_ref'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _subTotalPrice = castToType<double>(snapshotData['subTotalPrice']);
    _orderRef = snapshotData['order_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ItemList');

  static Stream<ItemListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemListRecord.fromSnapshot(s));

  static Future<ItemListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemListRecord.fromSnapshot(s));

  static ItemListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItemListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemListRecordData({
  DocumentReference? productRef,
  int? quantity,
  double? subTotalPrice,
  DocumentReference? orderRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_ref': productRef,
      'quantity': quantity,
      'subTotalPrice': subTotalPrice,
      'order_ref': orderRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemListRecordDocumentEquality implements Equality<ItemListRecord> {
  const ItemListRecordDocumentEquality();

  @override
  bool equals(ItemListRecord? e1, ItemListRecord? e2) {
    return e1?.productRef == e2?.productRef &&
        e1?.quantity == e2?.quantity &&
        e1?.subTotalPrice == e2?.subTotalPrice &&
        e1?.orderRef == e2?.orderRef;
  }

  @override
  int hash(ItemListRecord? e) => const ListEquality()
      .hash([e?.productRef, e?.quantity, e?.subTotalPrice, e?.orderRef]);

  @override
  bool isValidKey(Object? o) => o is ItemListRecord;
}
