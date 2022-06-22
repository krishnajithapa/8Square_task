import 'package:flutter/material.dart';
import 'package:hamro_library/auth/screens/login_screen.dart';
import 'package:hamro_library/home/screens/homepage_screen.dart';
import 'package:hamro_library/shared/utils/saved_data.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  @override
  void initState() {
    userLoggedIn();
    super.initState();
  }

  userLoggedIn() async {
    await SharedPrefData().getLoggedInStatus().then(
      (value) {
        setState(() {
          isLoggedIn = value;
          // ignore: avoid_print
          print(isLoggedIn);
        });
      },
    );
    if (isLoggedIn) {
      await Future.delayed(const Duration(seconds: 4));
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomePageScreen()));
    } else {
      await Future.delayed(const Duration(seconds: 4));
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Lottie.asset('assets/animations/splash_screen.json'),
      ),
    );
  }
}
