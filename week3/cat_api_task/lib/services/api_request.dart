// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cat_api_task/models/breeds.dart';
import 'package:cat_api_task/models/favourite.dart';
import 'package:cat_api_task/models/random_image.dart';
import 'package:cat_api_task/models/vote.dart';
import 'package:cat_api_task/utils/const.dart';
import 'package:cat_api_task/utils/dio_error_handling.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  ApiService() {
    _dio.interceptors.add(ChuckerDioInterceptor());
  }
  Future<List<Breed>> getBreeds() async {
    const breedUrl = '$baseUrl/breeds';

    try {
      final response = await _dio.get(breedUrl);
      final jsonData = List<Map<String, dynamic>>.from(response.data);
      final listData = jsonData.map((e) => Breed.fromJson(e)).toList();
      return listData;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<RandomCatImage> getRandomCat() async {
    const breedUrl = '$baseUrl/images/search';

    try {
      final response = await _dio.get(breedUrl);
      final jsonData = List<Map<String, dynamic>>.from(response.data);
      final randomCat = RandomCatImage.fromJson(jsonData[0]);
      return randomCat;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  voteCat(imageId, int voteType) async {
    User user = User();
    const voteUrl = '$baseUrl/votes';

    try {
      await _dio.post(voteUrl,
          data: {
            "image_id": imageId,
            "sub_id": user.username,
            "value": voteType
          },
          options: Options(headers: {
            "Content-Type": "application/json",
            "x-api-key": "DEMO-API-KEY"
          }));
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Favourite> favouriteCat(imageId) async {
    User user = User();
    const favouriteUrl = '$baseUrl/favourites';

    try {
      final response = await _dio.post(
        favouriteUrl,
        data: {"image_id": imageId, "sub_id": user.username},
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "x-api-key": "e31f0bfb-879f-4b08-984f-a80d7c9303ba"
          },
        ),
      );
      return Favourite.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  removeCatFavourite(int favouriteId) async {
    final removeFavouriteUrl = '$baseUrl/favourites/$favouriteId';

    try {
      await _dio.delete(
        removeFavouriteUrl,
        options: Options(
          headers: {"x-api-key": "e31f0bfb-879f-4b08-984f-a80d7c9303ba"},
        ),
      );
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }
}
