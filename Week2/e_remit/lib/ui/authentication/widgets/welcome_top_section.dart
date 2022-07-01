import 'package:e_remit/ui/authentication/widgets/language_icon_button.dart';
import 'package:flutter/material.dart';

class WelcomeTopSection extends StatelessWidget {
  const WelcomeTopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.075),
      height: MediaQuery.of(context).size.height * 0.12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LanguageIconButton(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset("assets/images/eremitlogo.png"),
          ),
        ],
      ),
    );
  }
}
