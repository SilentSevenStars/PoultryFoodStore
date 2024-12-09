import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StockItemListRecord extends FirestoreRecord {
  StockItemListRecord._(
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

  // "addStock_ref" field.
  DocumentReference? _addStockRef;
  DocumentReference? get addStockRef => _addStockRef;
  bool hasAddStockRef() => _addStockRef != null;

  // "subTotalCost" field.
  double? _subTotalCost;
  double get subTotalCost => _subTotalCost ?? 0.0;
  bool hasSubTotalCost() => _subTotalCost != null;

  void _initializeFields() {
    _productRef = snapshotData['product_ref'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _addStockRef = snapshotData['addStock_ref'] as DocumentReference?;
    _subTotalCost = castToType<double>(snapshotData['subTotalCost']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stockItemList');

  static Stream<StockItemListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StockItemListRecord.fromSnapshot(s));

  static Future<StockItemListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StockItemListRecord.fromSnapshot(s));

  static StockItemListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StockItemListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StockItemListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StockItemListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StockItemListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StockItemListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStockItemListRecordData({
  DocumentReference? productRef,
  int? quantity,
  DocumentReference? addStockRef,
  double? subTotalCost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_ref': productRef,
      'quantity': quantity,
      'addStock_ref': addStockRef,
      'subTotalCost': subTotalCost,
    }.withoutNulls,
  );

  return firestoreData;
}

class StockItemListRecordDocumentEquality
    implements Equality<StockItemListRecord> {
  const StockItemListRecordDocumentEquality();

  @override
  bool equals(StockItemListRecord? e1, StockItemListRecord? e2) {
    return e1?.productRef == e2?.productRef &&
        e1?.quantity == e2?.quantity &&
        e1?.addStockRef == e2?.addStockRef &&
        e1?.subTotalCost == e2?.subTotalCost;
  }

  @override
  int hash(StockItemListRecord? e) => const ListEquality()
      .hash([e?.productRef, e?.quantity, e?.addStockRef, e?.subTotalCost]);

  @override
  bool isValidKey(Object? o) => o is StockItemListRecord;
}
