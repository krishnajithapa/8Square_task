import 'package:e_remit/utils/static_data.dart';
import 'package:flutter/cupertino.dart';

class DetailsProvider extends ChangeNotifier {
  String userNationlity = nationalityList[0];
  changeNationality(value) {
    userNationlity = value;
    notifyListeners();
  }
}
