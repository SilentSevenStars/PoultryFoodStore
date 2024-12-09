// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future updateStockItemList(
  DocumentReference addStockRef,
  DocumentReference productRef,
  int quantity,
  double subTotalCost,
) async {
  // Add your function code here!
  final collectionRef = FirebaseFirestore.instance.collection('stockItemList');

  final querySnapshot = await collectionRef
      .where('addStock_ref', isEqualTo: addStockRef)
      .where('product_ref', isEqualTo: productRef)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    final docRef = querySnapshot.docs.first.reference;

    await docRef.update({
      'quantity': quantity,
    });
  } else {
    await collectionRef.add({
      'addStock_ref': addStockRef,
      'product_ref': productRef,
      'quantity': quantity,
      'subTotalCost': subTotalCost,
    });
  }
}
