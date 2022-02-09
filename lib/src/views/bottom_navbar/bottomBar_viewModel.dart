import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomNavBarViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }

  PageController _pageController = PageController();
  PageController get pageController => _pageController;
  set pageController(PageController val) {
    _pageController = val;
    notifyListeners();
  }
}
