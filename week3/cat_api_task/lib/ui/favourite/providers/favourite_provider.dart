import 'package:cat_api_task/models/breeds.dart';
import 'package:flutter/cupertino.dart';

class FavouriteProvider extends ChangeNotifier {
  FavouriteProvider() {
    getAllFav();
  }
  bool isLoading = false;
  bool isButtonVisible = false;
  String errorMessage = '';
  List<Breed> breedList = [];
  Breed? selectedBreed;

  changeBreed(Breed breed) {
    selectedBreed = breed;
    notifyListeners();
  }

  setLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<List<Breed>?> getAllFav() async {
    setLoading(true);
    return null;
  }
}
