import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  void changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }
}
