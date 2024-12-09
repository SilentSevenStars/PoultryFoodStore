import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

DocumentReference getDocRefbyRoleID(String docID) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String documentPath = "/Role/" + "$docID";
  DocumentReference documentReference = firestore.doc(documentPath);
  return documentReference;
}

DocumentReference getDocIDbyCategoryID(String docID) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String documentPath = "/Category/" + "$docID";
  DocumentReference documentReference = firestore.doc(documentPath);
  return documentReference;
}

int checkQuantity(int quantity) {
  return quantity;
}

double subTotal(
  double price,
  int quantity,
) {
  double finalPrice = price * quantity;
  return finalPrice;
}

double totalPrice(List<double> price) {
  double total = 0;
  for (int i = 0; i < price.length; i++) {
    total += price[i];
  }
  return total;
}

double convertStr(String payment) {
  return double.parse(payment);
}

String shortenEmail(String email) {
  final parts = email.split('@');
  if (parts.length != 2) {
    return email;
  }
  final username = parts[0];
  final domain = parts[1];

  if (username.length <= 2) {
    return email;
  }
  final shortenedUsername =
      '${username[0]}......${username[username.length - 1]}';
  return '$shortenedUsername@$domain';
}

int convertToInt(String quantity) {
  return int.parse(quantity);
}

DateTime convertDate(DateTime currentDate) {
  return DateTime(currentDate.year, currentDate.month, currentDate.day);
}

DocumentReference getDocIDbySupplier(String docID) {
  final firestore = FirebaseFirestore.instance;
  String documentPath = "/Supplier/" + "$docID";
  DocumentReference documentReference = firestore.doc(documentPath);
  return documentReference;
}

double subTotalCost(
  double cost,
  int quantity,
) {
  double total = cost * quantity;
  return total;
}

double totalCost(List<double> subTotalCost) {
  double total = 0;
  for (int i = 0; i < subTotalCost.length; i++) {
    total += subTotalCost[i];
  }
  return total;
}

DocumentReference getDocIDbyProduct(String product) {
  final firestore = FirebaseFirestore.instance;
  String documentPath = "/Product/" + "$product";
  DocumentReference documentReference = firestore.doc(documentPath);
  return documentReference;
}
