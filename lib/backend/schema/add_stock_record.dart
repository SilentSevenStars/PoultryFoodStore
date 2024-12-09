import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddStockRecord extends FirestoreRecord {
  AddStockRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "addStockID" field.
  String? _addStockID;
  String get addStockID => _addStockID ?? '';
  bool hasAddStockID() => _addStockID != null;

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

  // "totalCost" field.
  double? _totalCost;
  double get totalCost => _totalCost ?? 0.0;
  bool hasTotalCost() => _totalCost != null;

  // "supplier_ref" field.
  DocumentReference? _supplierRef;
  DocumentReference? get supplierRef => _supplierRef;
  bool hasSupplierRef() => _supplierRef != null;

  void _initializeFields() {
    _addStockID = snapshotData['addStockID'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _totalCost = castToType<double>(snapshotData['totalCost']);
    _supplierRef = snapshotData['supplier_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AddStock');

  static Stream<AddStockRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AddStockRecord.fromSnapshot(s));

  static Future<AddStockRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AddStockRecord.fromSnapshot(s));

  static AddStockRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AddStockRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AddStockRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AddStockRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AddStockRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AddStockRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAddStockRecordData({
  String? addStockID,
  DateTime? createdAt,
  DocumentReference? userRef,
  String? status,
  double? totalCost,
  DocumentReference? supplierRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'addStockID': addStockID,
      'created_at': createdAt,
      'user_ref': userRef,
      'status': status,
      'totalCost': totalCost,
      'supplier_ref': supplierRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class AddStockRecordDocumentEquality implements Equality<AddStockRecord> {
  const AddStockRecordDocumentEquality();

  @override
  bool equals(AddStockRecord? e1, AddStockRecord? e2) {
    return e1?.addStockID == e2?.addStockID &&
        e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.status == e2?.status &&
        e1?.totalCost == e2?.totalCost &&
        e1?.supplierRef == e2?.supplierRef;
  }

  @override
  int hash(AddStockRecord? e) => const ListEquality().hash([
        e?.addStockID,
        e?.createdAt,
        e?.userRef,
        e?.status,
        e?.totalCost,
        e?.supplierRef
      ]);

  @override
  bool isValidKey(Object? o) => o is AddStockRecord;
}
