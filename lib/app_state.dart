import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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

  dynamic _state = jsonDecode('{}');
  dynamic get state => _state;
  set state(dynamic value) {
    _state = value;
  }

  List<dynamic> _mealSuggestions = [];
  List<dynamic> get mealSuggestions => _mealSuggestions;
  set mealSuggestions(List<dynamic> value) {
    _mealSuggestions = value;
  }

  void addToMealSuggestions(dynamic value) {
    mealSuggestions.add(value);
  }

  void removeFromMealSuggestions(dynamic value) {
    mealSuggestions.remove(value);
  }

  void removeAtIndexFromMealSuggestions(int index) {
    mealSuggestions.removeAt(index);
  }

  void updateMealSuggestionsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    mealSuggestions[index] = updateFn(_mealSuggestions[index]);
  }

  void insertAtIndexInMealSuggestions(int index, dynamic value) {
    mealSuggestions.insert(index, value);
  }

  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
  }
}
