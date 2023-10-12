import 'package:flutter/cupertino.dart';

class BottomAppBArCon extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void Appbarfun(int value) {
    _index = value;
    notifyListeners();
  }
}
