import 'package:e_remit/utils/static_data.dart';
import 'package:flutter/cupertino.dart';

class DetailsProvider extends ChangeNotifier {
  String userNationlity = nationalityList[0];
  String userGender = 'Male';
  bool userResidentalStatus = false;
  changeNationality(value) {
    userNationlity = value;
    notifyListeners();
  }

  setUserGender(value) {
    userGender = value;
    notifyListeners();
  }

  setResStatus(value) {
    userResidentalStatus = value;
    notifyListeners();
  }
}
