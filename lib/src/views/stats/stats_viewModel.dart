import 'package:calories_counter/src/global/repos/user_repository.dart';
import 'package:calories_counter/src/global/services/data_service/data_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StatsViewModel extends BaseViewModel {
  List<Map<String, Map<String, int>>> _data = [];
  List<Map<String, Map<String, int>>> get data => _data;
  set data(List<Map<String, Map<String, int>>> val) {
    _data = val;
    notifyListeners();
  }

  List<String> _dates = [];
  List<String> get dates => _dates;
  set dates(List<String> val) {
    _dates = val;
    notifyListeners();
  }

  bool _noData = false;
  bool get noData => _noData;
  set noData(bool val) {
    _noData = val;
    notifyListeners();
  }

  Future<void> getData() async {
    final String? email = await UserRepository().getUserEmail();
    if (email != null) {
      dates = await DataService().getDates(email);
      if (dates.isNotEmpty) {
        data = await DataService().getHistory(dates);
        dataMap["Carbs"] = getTotalCount(0).toDouble();
        dataMap["Protien"] = getTotalCount(1).toDouble();
        dataMap["Fruits"] = getTotalCount(2).toDouble();
        dataMap["Dariy"] = getTotalCount(3).toDouble();
        dataMap["Fat"] = getTotalCount(4).toDouble();
        dataMap["Vegies"] = getTotalCount(5).toDouble();
      } else {
        noData = true;
      }
    }
  }

  int getTotalCount(int catagoryIndex) {
    return DataService().getTotalCountsofCatagory(
      data.last,
      catagoryIndex,
    );
  }

  Map<String, double> dataMap = {
    "Carbs": 0,
    "Protien": 0,
    "Fruits": 0,
    "Dariy": 0,
    "Fat": 0,
    "Vegies": 0,
  };
  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
}
