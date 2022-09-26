import 'package:flutter/material.dart';

class MerubahWarna with ChangeNotifier {
  bool isColor = false;

  bool get isWarna => isColor;

  set isWarna(bool ubahWarna) {
    isColor = ubahWarna;
    notifyListeners();
  }

  Color get appWarna => isColor ? Colors.green : Colors.blue;

  Color get backWarna => isColor ? Colors.black : Colors.white;

  Color get teksWarna => isColor ? Colors.white : Colors.black;
}
