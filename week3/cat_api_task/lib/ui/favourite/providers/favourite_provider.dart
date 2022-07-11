import 'package:cat_api_task/models/favourite.dart';
import 'package:cat_api_task/services/api_request.dart';
import 'package:flutter/cupertino.dart';

class FavouriteProvider extends ChangeNotifier {
  FavouriteProvider();
  bool isLoading = false;
  bool isButtonVisible = false;
  String errorMessage = '';

  setLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<List<Favourite>?> getAllFavourites() async {
    setLoading(true);
    try {
      return await ApiService().getFavouriteCats().then(
        (value) {
          setLoading(false);
          return value;
        },
      );
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
    return null;
  }
}
