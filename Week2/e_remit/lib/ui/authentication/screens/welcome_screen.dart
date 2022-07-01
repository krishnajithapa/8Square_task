import 'package:e_remit/ui/authentication/widgets/login_signup_button.dart';
import 'package:e_remit/ui/authentication/widgets/welcome_screen_body.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeBody(),
      bottomNavigationBar: BottomButtons(),
    );
  }
}
