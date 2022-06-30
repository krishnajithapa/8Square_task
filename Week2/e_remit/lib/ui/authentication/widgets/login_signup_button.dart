import 'package:e_remit/utils/colors.dart';
import 'package:e_remit/utils/routes.dart' as route;
import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.07,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, route.personalDetailsScreen);
              },
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(buttonColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              child: Text(
                "Send Money".toUpperCase(),
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginSignupButton(
                label: "Register",
                onTap: () {},
              ),
              LoginSignupButton(
                label: "Log In",
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class LoginSignupButton extends StatelessWidget {
  const LoginSignupButton({Key? key, required this.label, required this.onTap})
      : super(key: key);
  final String label;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.07,
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              side: MaterialStateProperty.all(
                  const BorderSide(width: 2, color: Colors.red)),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ))),
          child: Text(
            label.toUpperCase(),
            style: const TextStyle(fontSize: 15, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
