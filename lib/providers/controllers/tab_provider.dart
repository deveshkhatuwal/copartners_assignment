import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  TabController? _tabController;
  int _selectedIndex = 0;

  TabController? get tabController => _tabController;
  int get selectedIndex => _selectedIndex;

  void initializeTabController(TickerProvider vsync) {
    _tabController = TabController(length: 3, vsync: vsync);
    _tabController?.addListener(() {
      _selectedIndex = _tabController!.index;
      notifyListeners();
    });
  }

  void selectTab(int index) {
    _tabController?.animateTo(index);
    _selectedIndex = index;
    notifyListeners();
  }
}