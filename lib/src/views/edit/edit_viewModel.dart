import 'package:calories_counter/src/global/services/data_service/data_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditViewModel extends BaseViewModel {
  List<Color> colors = [];
  init() {
    final DataService _dataService = DataService();
    colors = _dataService.catagoryColors;
  }
}
