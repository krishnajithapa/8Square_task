import 'package:e_remit/ui/authentication/screens/welcome_screen.dart';
import 'package:e_remit/ui/personal_details/screens/personal_details_screen1.dart';
import 'package:flutter/material.dart';

const String welcomePage = 'welcomePage';
const String signUpPage = 'signup';
const String personalDetailsScreen = 'personalDetailsScreen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case welcomePage:
      return MaterialPageRoute(builder: (context) => const WelcomeScreen());
    // case signUpPage:
    //   return MaterialPageRoute(builder: (context) => const SignUpScreen());
    case personalDetailsScreen:
      return MaterialPageRoute(
          builder: (context) => const PersonalDetailsScreen());

    default:
      throw ('invalid route,donest exist');
  }
}
