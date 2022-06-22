import 'package:flutter/material.dart';
import 'package:hamro_library/auth/screens/login_screen.dart';
import 'package:hamro_library/auth/screens/signup_screen.dart';
import 'package:hamro_library/home/screens/catagory_detail_screen.dart';
import 'package:hamro_library/home/screens/homepage_screen.dart';
import 'package:hamro_library/home/screens/search_screen.dart';
import 'package:hamro_library/splash/screen/splash_screen.dart';

const String loginPage = 'login';

const String home = 'home';
const String forgetPassword = 'forgetpassword';

const String splashScreen = 'splashscreen';
const String catagoryDetail = 'catagoryDetail';
const String searchScreen = 'searchScreen';
const String signupScreen = "signupScreen";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case home:
      return MaterialPageRoute(builder: (context) => const HomePageScreen());
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case searchScreen:
      return MaterialPageRoute(builder: (context) => const SearchScreen());
    case signupScreen:
      return MaterialPageRoute(builder: (context) => const SignUpScreen());
    case splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case catagoryDetail:
      return MaterialPageRoute(
          builder: (context) => const CatagoryDetailScreen(
                catagoryName: '',
              ));

    default:
      throw ('invalid route,donest exist');
  }
}
