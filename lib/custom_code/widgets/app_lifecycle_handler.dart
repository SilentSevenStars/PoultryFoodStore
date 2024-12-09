// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/backend.dart'; // Firebase backend imports
import '/flutter_flow/flutter_flow_util.dart'; // FlutterFlow utilities
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore imports
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth

class AppLifecycleHandler extends StatefulWidget {
  const AppLifecycleHandler({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<AppLifecycleHandler> createState() => _AppLifecycleHandlerState();
}

class _AppLifecycleHandlerState extends State<AppLifecycleHandler>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached ||
        state == AppLifecycleState.inactive) {
      cleanUpIncompleteOrders();
    }
  }

  Future<void> cleanUpIncompleteOrders() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId != null) {
        final firestore = FirebaseFirestore.instance;
        final querySnapshot = await firestore
            .collection('orders')
            .where('userId', isEqualTo: userId)
            .get();

        for (final orderDoc in querySnapshot.docs) {
          // Get the orderRef of the incomplete order
          final orderRef = orderDoc.reference;

          // Delete related documents in the ItemList collection
          final itemListSnapshot = await firestore
              .collection('itemList')
              .where('order_ref', isEqualTo: orderRef)
              .get();

          for (final itemDoc in itemListSnapshot.docs) {
            await itemDoc.reference.delete(); // Delete item from ItemList
          }

          // Optionally, delete the order document itself if needed
          await orderDoc.reference.delete();
        }
      }
    } catch (e) {
      debugPrint('Error cleaning up orders and itemList: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      // Add child widgets or leave empty if not needed
    );
  }
}
