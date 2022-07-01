import 'package:e_remit/ui/authentication/screens/welcome_screen.dart';
import 'package:e_remit/ui/personal_details/models/user_data_model.dart';
import 'package:e_remit/ui/personal_details/screens/data_screen.dart';
import 'package:e_remit/ui/personal_details/screens/personal_details_screen.dart';
import 'package:flutter/material.dart';

const String welcomePage = 'welcomePage';
const String dataScreen = 'dataScreen';
const String personalDetailsScreen = 'personalDetailsScreen';

Route<dynamic> getRoutes(RouteSettings settings) {
  final Map? arguments = settings.arguments as Map?;
  switch (settings.name) {
    case welcomePage:
      return MaterialPageRoute(builder: (context) => const WelcomeScreen());
    case dataScreen:
      return MaterialPageRoute(
          builder: (context) => DataScreen(
                userDataModel: arguments!["userDataModel"] as UserDataModel,
              ));
    case personalDetailsScreen:
      return MaterialPageRoute(
          builder: (context) => const PersonalDetailsScreen());

    default:
      throw ('invalid route,donest exist');
  }
}
