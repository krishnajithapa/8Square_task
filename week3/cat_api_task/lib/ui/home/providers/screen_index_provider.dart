import 'package:flutter/cupertino.dart';

class ScreenIndexProvider extends ChangeNotifier {
  int currentIndex = 0;
  changeIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}
