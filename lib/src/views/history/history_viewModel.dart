import 'package:calories_counter/src/global/repos/user_repository.dart';
import 'package:calories_counter/src/global/services/data_service/data_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HistoryViewModel extends BaseViewModel {
  List<Color> colors = [];
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

  Future<void> init() async {
    final DataService _dataService = DataService();
    colors = _dataService.catagoryColors;
    await getData(_dataService);
  }

  Future<void> getData(DataService dataService) async {
    final String? email = await UserRepository().getUserEmail();
    if (email != null) {
      dates = await dataService.getDates(email);
      data = await dataService.getHistory(dates);
    }
  }

  // int getTotalCount(int index, int catagoryIndex) {
  //   return DataService().getTotalCountsofCatagory(
  //     data[index],
  //     catagoryIndex,
  //   );
  // }
}
