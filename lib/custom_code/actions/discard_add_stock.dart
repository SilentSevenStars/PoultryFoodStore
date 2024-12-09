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

Future discardAddStock(DocumentReference addStock) async {
  // Add your function code here!
  try {
    // Delete the order document
    await addStock.delete();

    // Delete itemlist documents where 'order_ref' matches the provided orderRef
    final itemListQuery = await FirebaseFirestore.instance
        .collection('stockItemList')
        .where('addStock_ref', isEqualTo: addStock)
        .get();

    for (var itemDoc in itemListQuery.docs) {
      await FirebaseFirestore.instance
          .collection('stockItemList')
          .doc(itemDoc.id)
          .delete();
    }
  } catch (e) {
    print('Error deleting addStock and stockItemList: $e');
  }
}
