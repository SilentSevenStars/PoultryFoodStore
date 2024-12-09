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
import 'dart:math';

Future<String> createSKU() async {
  // Add your function code here!
  final firestore = FirebaseFirestore.instance;
  final random = Random();

  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  String sku;

  while (true) {
    sku =
        List.generate(8, (index) => chars[random.nextInt(chars.length)]).join();

    final querySnapshot = await firestore
        .collection("Product")
        .where('sku', isEqualTo: sku)
        .get();

    if (querySnapshot.docs.isEmpty) {
      return sku;
    }
  }
}
