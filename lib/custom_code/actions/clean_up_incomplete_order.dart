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

Future cleanUpIncompleteOrder() async {
  // Add your function code here!
  try {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore
        .collection('orders')
        .where('status', isEqualTo: 'incomplete')
        .get();

    for (final orderDoc in querySnapshot.docs) {
      final orderRef = orderDoc.reference;
      final itemListSnapshot = await firestore
          .collection('ItemList')
          .where('order_ref', isEqualTo: orderRef)
          .get();

      for (final itemDoc in itemListSnapshot.docs) {
        await itemDoc.reference.delete(); // Delete item from ItemList
      }
      await orderDoc.reference.delete();
    }
  } catch (e) {
    print(e);
  }
}
