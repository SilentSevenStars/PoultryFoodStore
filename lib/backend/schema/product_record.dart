import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  bool hasStock() => _stock != null;

  // "category_ref" field.
  DocumentReference? _categoryRef;
  DocumentReference? get categoryRef => _categoryRef;
  bool hasCategoryRef() => _categoryRef != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "ProductID" field.
  String? _productID;
  String get productID => _productID ?? '';
  bool hasProductID() => _productID != null;

  // "cost" field.
  double? _cost;
  double get cost => _cost ?? 0.0;
  bool hasCost() => _cost != null;

  void _initializeFields() {
    _productName = snapshotData['productName'] as String?;
    _brand = snapshotData['brand'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _stock = castToType<int>(snapshotData['stock']);
    _categoryRef = snapshotData['category_ref'] as DocumentReference?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _productID = snapshotData['ProductID'] as String?;
    _cost = castToType<double>(snapshotData['cost']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  String? productName,
  String? brand,
  String? description,
  double? price,
  int? stock,
  DocumentReference? categoryRef,
  String? photoUrl,
  String? productID,
  double? cost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'productName': productName,
      'brand': brand,
      'description': description,
      'price': price,
      'stock': stock,
      'category_ref': categoryRef,
      'photo_url': photoUrl,
      'ProductID': productID,
      'cost': cost,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    return e1?.productName == e2?.productName &&
        e1?.brand == e2?.brand &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.stock == e2?.stock &&
        e1?.categoryRef == e2?.categoryRef &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.productID == e2?.productID &&
        e1?.cost == e2?.cost;
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.productName,
        e?.brand,
        e?.description,
        e?.price,
        e?.stock,
        e?.categoryRef,
        e?.photoUrl,
        e?.productID,
        e?.cost
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
