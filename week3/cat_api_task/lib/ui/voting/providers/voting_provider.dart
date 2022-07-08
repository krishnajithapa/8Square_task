import 'package:cat_api_task/models/random_image.dart';
import 'package:cat_api_task/services/api_request.dart';
import 'package:flutter/cupertino.dart';

class VotingProvider extends ChangeNotifier {
  VotingProvider() {
    getRadomImage();
  }
  RandomCatImage? randomCat;
  bool isLoading = false;
  String errorMessage = '';
  bool isFavourite = false;
  int favId = 0;
  setLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  setFavourite(value) {
    isFavourite = value;
    notifyListeners();
  }

  Future<void> getRadomImage() async {
    setLoading(true);
    try {
      await ApiService().getRandomCat().then((value) {
        setLoading(false);
        randomCat = value;
        notifyListeners();
      });
    } catch (e) {
      setLoading(false);
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> vote(imageId, voteType) async {
    setLoading(true);
    try {
      await ApiService().voteCat(imageId, voteType).then((value) {
        setLoading(false);

        notifyListeners();
      });
    } catch (e) {
      setLoading(false);
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> makeFavourite(imageId) async {
    try {
      await ApiService().favouriteCat(imageId).then((value) {
        if (value.message == "SUCCESS") {
          isFavourite = true;
          favId = value.id!;
          notifyListeners();
        }
      });
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> removeFavourite(int favId) async {
    try {
      await ApiService().removeCatFavourite(favId).then((value) {
        isFavourite = false;
        notifyListeners();
      });
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
