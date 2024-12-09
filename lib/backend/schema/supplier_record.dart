import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupplierRecord extends FirestoreRecord {
  SupplierRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "supplierName" field.
  String? _supplierName;
  String get supplierName => _supplierName ?? '';
  bool hasSupplierName() => _supplierName != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _supplierName = snapshotData['supplierName'] as String?;
    _phoneNumber = snapshotData['phoneNumber'] as String?;
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _address = snapshotData['address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Supplier');

  static Stream<SupplierRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupplierRecord.fromSnapshot(s));

  static Future<SupplierRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupplierRecord.fromSnapshot(s));

  static SupplierRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupplierRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupplierRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupplierRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupplierRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupplierRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupplierRecordData({
  String? supplierName,
  String? phoneNumber,
  String? email,
  String? photoUrl,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'supplierName': supplierName,
      'phoneNumber': phoneNumber,
      'email': email,
      'photo_url': photoUrl,
      'address': address,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupplierRecordDocumentEquality implements Equality<SupplierRecord> {
  const SupplierRecordDocumentEquality();

  @override
  bool equals(SupplierRecord? e1, SupplierRecord? e2) {
    return e1?.supplierName == e2?.supplierName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.address == e2?.address;
  }

  @override
  int hash(SupplierRecord? e) => const ListEquality().hash(
      [e?.supplierName, e?.phoneNumber, e?.email, e?.photoUrl, e?.address]);

  @override
  bool isValidKey(Object? o) => o is SupplierRecord;
}
