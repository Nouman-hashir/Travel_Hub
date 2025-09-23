import 'package:flutter/material.dart';

class BottomNavbarVm extends ChangeNotifier{
  int currentIndex = 0;

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
  
}