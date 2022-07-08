import 'package:cat_api_task/ui/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

const String homeScreen = 'homeScreen';

Route<dynamic> getRoutes(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      return MaterialPageRoute(builder: (context) => const HomeScreen());

    default:
      throw ('invalid route,donest exist');
  }
}
