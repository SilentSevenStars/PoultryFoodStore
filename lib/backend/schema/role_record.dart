import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoleRecord extends FirestoreRecord {
  RoleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Role');

  static Stream<RoleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoleRecord.fromSnapshot(s));

  static Future<RoleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoleRecord.fromSnapshot(s));

  static RoleRecord fromSnapshot(DocumentSnapshot snapshot) => RoleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoleRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoleRecordDocumentEquality implements Equality<RoleRecord> {
  const RoleRecordDocumentEquality();

  @override
  bool equals(RoleRecord? e1, RoleRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(RoleRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is RoleRecord;
}
