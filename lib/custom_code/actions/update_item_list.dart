// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future updateItemList(
  DocumentReference productRef,
  int quantity,
  double subTotalPrice,
  DocumentReference orderRef,
) async {
  final firestore = FirebaseFirestore.instance;

  try {
    final querySnapshot = await firestore
        .collection('ItemList')
        .where('order_ref', isEqualTo: orderRef)
        .where('product_ref', isEqualTo: productRef)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Document exists, update it
      final docId = querySnapshot.docs.first.id;

      await firestore.collection('ItemList').doc(docId).update({
        'quantity': quantity,
        'subTotalPrice': subTotalPrice,
      });
    } else {
      // Document does not exist, create a new one
      await firestore.collection('ItemList').add({
        'order_ref': orderRef,
        'product_ref': productRef,
        'quantity': quantity,
        'subTotalPrice': subTotalPrice,
      });
    }
  } catch (e) {
    print('Error updating or creating itemList document: $e');
    rethrow; // Rethrow to ensure errors are properly handled upstream
  }
}
