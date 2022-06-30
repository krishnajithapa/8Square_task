import 'package:e_remit/ui/authentication/widgets/login_signup_button.dart';
import 'package:e_remit/ui/personal_details/widgets/welcomeScreenBody.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WelcomeBody(),
//widget for bottom buttons
        bottomNavigationBar: BottomButtons(),
      ),
    );
  }
}
