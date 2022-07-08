import 'package:cat_api_task/ui/home/models/breeds.dart';
import 'package:cat_api_task/ui/home/services/home_api_request.dart';
import 'package:flutter/cupertino.dart';

class BreedsProvider extends ChangeNotifier {
  BreedsProvider() {
    getAllBreeds();
  }
  bool isLoading = false;
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

  Future<List<Breed>?> getAllBreeds() async {
    // setLoading(true);
    return await ApiService().getBreeds().then(
      (value) {
        selectedBreed = value[0];
        return value;
      },
    );
  }
}
