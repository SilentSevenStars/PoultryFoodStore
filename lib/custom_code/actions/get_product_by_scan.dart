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

Future<bool> getProductByScan(String product) async {
  // Add your function code here!
  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection("Product");
  QuerySnapshot query =
      await collectionRef.where("ProductID", isEqualTo: product).get();
  if (query.docs.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
