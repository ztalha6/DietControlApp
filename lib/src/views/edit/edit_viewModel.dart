import 'package:calories_counter/src/app.dart';
import 'package:calories_counter/src/global/services/data_service/data_service.dart';
import 'package:calories_counter/src/global/services/snackbar_service/snackbar_manager.dart';
import 'package:calories_counter/src/model/response_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditViewModel extends BaseViewModel {
  List<Color> colors = [];
  init(Map<String, Map<String, int>> dietdata, String dietdate) {
    final DataService _dataService = DataService();
    data = dietdata;
    date = dietdate;
    colors = _dataService.catagoryColors;
  }

  bool _toggleEdit = false;
  bool get toggleEdit => _toggleEdit;
  set toggleEdit(bool val) {
    _toggleEdit = val;
    notifyListeners();
  }

  String _date = '';
  String get date => _date;
  set date(String val) {
    _date = val;
    notifyListeners();
  }

  Map<String, Map<String, int>> _data = {};
  Map<String, Map<String, int>> get data => _data;
  set data(Map<String, Map<String, int>> val) {
    _data = val;
    notifyListeners();
  }

  String getTabNameFromIndexs(
    int tabNumber,
  ) {
    return data.keys.elementAt(tabNumber);
  }

  String getCatagoryNameFromIndexs(
    int tabNumber,
    int catagoryIndex,
  ) {
    return data.values.elementAt(tabNumber).keys.elementAt(catagoryIndex);
  }

  int getcount(int tabNumber, int index) {
    return data[getTabNameFromIndexs(tabNumber)]![
        getCatagoryNameFromIndexs(tabNumber, index)]!;
  }

  void incrementItem(
    int tabNumber,
    int catagoryIndex,
  ) {
    final int f = 1 +
        data[getTabNameFromIndexs(tabNumber)]![
            getCatagoryNameFromIndexs(tabNumber, catagoryIndex)]!;

    data[getTabNameFromIndexs(tabNumber)]![
        getCatagoryNameFromIndexs(tabNumber, catagoryIndex)] = f;
    notifyListeners();
  }

  void decrementItem(int tabNumber, int catagoryIndex) {
    final int f = data[getTabNameFromIndexs(tabNumber)]![
            getCatagoryNameFromIndexs(tabNumber, catagoryIndex)]! -
        1;

    if (f >= 0) {
      data[getTabNameFromIndexs(tabNumber)]![
          getCatagoryNameFromIndexs(tabNumber, catagoryIndex)] = f;
    }
    notifyListeners();
  }

  Future<void> saveData(BuildContext context) async {
    if (toggleEdit) {
      final ResponseModel res = await DataService().saveUserData(date, data);
      if (res.sucess) {
        toggleEdit = false;
        rootScaffoldMessengerKey.currentState?.showSnackBar(
          SnackbarManager().getSuccessSnackbar(
            'Saved!',
            16,
            const Duration(
              milliseconds: 2500,
            ),
          ),
        );
      } else {
        rootScaffoldMessengerKey.currentState?.showSnackBar(
          SnackbarManager().showError(
            content: res.error,
            duration: const Duration(
              milliseconds: 2500,
            ),
          ),
        );
      }
    } else {
      toggleEdit = !toggleEdit;
    }
  }
}
