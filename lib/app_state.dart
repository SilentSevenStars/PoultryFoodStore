import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _searchIsActive = false;
  bool get searchIsActive => _searchIsActive;
  set searchIsActive(bool value) {
    _searchIsActive = value;
  }

  int _quantityValue = 1;
  int get quantityValue => _quantityValue;
  set quantityValue(int value) {
    _quantityValue = value;
  }

  String _stackOut = 'Stack Out';
  String get stackOut => _stackOut;
  set stackOut(String value) {
    _stackOut = value;
  }

  int _stockOutValidation = 0;
  int get stockOutValidation => _stockOutValidation;
  set stockOutValidation(int value) {
    _stockOutValidation = value;
  }

  List<DateTime> _createdAt = [];
  List<DateTime> get createdAt => _createdAt;
  set createdAt(List<DateTime> value) {
    _createdAt = value;
  }

  void addToCreatedAt(DateTime value) {
    createdAt.add(value);
  }

  void removeFromCreatedAt(DateTime value) {
    createdAt.remove(value);
  }

  void removeAtIndexFromCreatedAt(int index) {
    createdAt.removeAt(index);
  }

  void updateCreatedAtAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    createdAt[index] = updateFn(_createdAt[index]);
  }

  void insertAtIndexInCreatedAt(int index, DateTime value) {
    createdAt.insert(index, value);
  }

  List<double> _lineIncome = [];
  List<double> get lineIncome => _lineIncome;
  set lineIncome(List<double> value) {
    _lineIncome = value;
  }

  void addToLineIncome(double value) {
    lineIncome.add(value);
  }

  void removeFromLineIncome(double value) {
    lineIncome.remove(value);
  }

  void removeAtIndexFromLineIncome(int index) {
    lineIncome.removeAt(index);
  }

  void updateLineIncomeAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    lineIncome[index] = updateFn(_lineIncome[index]);
  }

  void insertAtIndexInLineIncome(int index, double value) {
    lineIncome.insert(index, value);
  }

  DateTime? _birthday = DateTime.fromMillisecondsSinceEpoch(1733294400000);
  DateTime? get birthday => _birthday;
  set birthday(DateTime? value) {
    _birthday = value;
  }

  int _stockZero = 0;
  int get stockZero => _stockZero;
  set stockZero(int value) {
    _stockZero = value;
  }

  int _currentPage = 1;
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
  }
}
