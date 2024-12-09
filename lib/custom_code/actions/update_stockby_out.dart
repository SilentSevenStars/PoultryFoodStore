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

Future updateStockbyOut(DocumentReference order) async {
  // Add your function code here!
  try {
    // Fetch the item list associated with the order
    QuerySnapshot itemListSnapshot = await FirebaseFirestore.instance
        .collection('Itemlist')
        .where('order_ref', isEqualTo: order)
        .get();

    // Loop through each item in the item list
    for (var itemDoc in itemListSnapshot.docs) {
      DocumentReference productRef = itemDoc['product_ref'];
      int quantity = itemDoc['quantity'];

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        // Fetch the current stock for the product
        DocumentSnapshot productSnapshot = await transaction.get(productRef);
        int currentStock = productSnapshot['stock'];

        print('Current stock for product ${productRef.id}: $currentStock');
        print('Quantity to reduce: $quantity');

        // Check if there is enough stock
        if (currentStock >= quantity) {
          int newStock = currentStock - quantity;
          transaction.update(productRef, {'stock': newStock});
          print('Updated stock for product ${productRef.id}: $newStock');
        } else {
          throw Exception('Insufficient stock for product: ${productRef.id}');
        }
      });
    }
  } catch (e) {
    print('Error updating stock: $e');
  }
}
