import 'package:flutter/material.dart';

//image list of carousal slider
final List<String> imgList = [
  'assets/images/banner_1.jpg',
  'assets/images/banner_2.jpg',
  'assets/images/banner_3.jpg',
  'assets/images/banner_4.jpg',
];
//mapping imagelist to widget list inorder to provide items to carousal slider
final List<Widget> imageSliders = imgList
    .map((item) => ClipRRect(
            child: Image.asset(
          item,
          fit: BoxFit.fill,
        )))
    .toList();

class Language {
  String name;
  String shortForm;
  String flagLogo;
  Language(this.name, this.shortForm, this.flagLogo);
}

List<Language> languageList = [
  Language(
    "English",
    "EN",
    "https://t4.ftcdn.net/jpg/01/71/57/89/360_F_171578974_eNhE6sEpc6jsK6Py7IxhTbIZZQ7878Wb.jpg",
  ),
  Language(
    "Nepal",
    "NP",
    "https://m.media-amazon.com/images/I/31YsfqymC1L.jpg",
  ),
  Language(
    "Bangladesh",
    "BD",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Flag_of_Bangladesh.svg/1200px-Flag_of_Bangladesh.svg.png",
  ),
];
List<String> countryList = [
  "Malaysia",
  "Cambodia",
  "China",
  "India",
  "Japan",
];
List<String> residentalStatusList = [
  "Malaysian",
  "Cambodian",
  "Chinese",
  "Indian",
  "Japanese",
];
List<String> genderList = [
  "Male",
  "Female",
  "Third",
];
