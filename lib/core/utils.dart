import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/app_colors.dart';
import 'models/first.dart';

bool onboarding = true;
String firstType = '';
String firstCount = '';
String firstCondition = '';

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboarding');
  onboarding = prefs.getBool('onboarding') ?? true;
  firstType = prefs.getString('firstType') ?? '';
  firstCount = prefs.getString('firstCount') ?? '';
  firstCondition = prefs.getString('firstCondition') ?? '';
  log('firstType = $firstType');
  log('firstCount = $firstCount');
  log('firstCondition = $firstCondition');
}

Future<void> saveFirsts(First first) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('firstType', first.type);
  prefs.setString('firstCount', first.count);
  prefs.setString('firstCondition', first.condition);
  prefs.setBool('onboarding', false);
  firstType = first.type;
  firstCount = first.count;
  firstCondition = first.condition;
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

Color getColor(String condition) {
  if (condition == 'Perfect') return AppColors.green;
  if (condition == 'It\'s good') return AppColors.orange;
  if (condition == 'Old') return AppColors.red;
  return Colors.white;
}
