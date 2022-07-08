import 'package:cat_api_task/ui/home/models/random_image.dart';
import 'package:cat_api_task/ui/home/services/api_request.dart';
import 'package:flutter/cupertino.dart';

class VotingPRovider extends ChangeNotifier {
  VotingPRovider() {
    getRadomImage();
  }
  RandomCatImage? randomCat;
  bool isLoading = false;
  String errorMessage = '';

  setLoading(value) {
    isLoading = value;
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

  vote(imageId, voteType) async {
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
}
