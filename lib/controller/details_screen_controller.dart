import 'package:flutter/material.dart';

class DetailsScreenController with ChangeNotifier {
  bool isSaved = false;

  void onSaved() {
    isSaved = !isSaved;

    notifyListeners();
  }
}
