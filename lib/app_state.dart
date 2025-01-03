import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:intl/intl.dart';

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

  String _CurrentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String get CurrentDate => _CurrentDate;
  set CurrentDate(String value) {
    _CurrentDate = value;
  }

    
  String? updateDate(
    String? currentDate,
    int? daysToAdd,
  ) {
    // null-safe 처리: currentDate와 daysToAdd가 null일 경우 기본값 설정
    if (currentDate == null || daysToAdd == null) {
      return null; // 둘 중 하나라도 null이면 null 반환
    }
  
    // currentDate를 DateTime으로 변환
    final parsedDate = DateTime.parse(currentDate);

    // 날짜 계산
    final updatedDate = parsedDate.add(Duration(days: daysToAdd));

    // yyyy-MM-dd 형식으로 반환
    return "${updatedDate.year}-${updatedDate.month.toString().padLeft(2, '0')}-${updatedDate.day.toString().padLeft(2, '0')}";
  }


  String _displayDate = 'AppState.CurrentDate';
  String get displayDate => _displayDate;
  set displayDate(String value) {
    _displayDate = value;
  }
}