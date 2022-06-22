import 'package:flutter/material.dart';
import 'package:hamro_library/shared/utils/routes.dart' as route;

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      // required GlobalKey<FormState> formKey,
      required this.title,
      required this.onTap})
      : super(key: key);
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.1,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0),
        onPressed: () {
          onTap();
        },
        child: Text(
          title,
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.fontsize})
      : super(key: key);
  final String title;
  final double fontsize;

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(colors: [Colors.red, Colors.yellow]),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,

            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          )
        ],
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.1,
      // height: 36,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0),
        onPressed: onPressed!,
        child: Text(
          title,
          style: TextStyle(fontSize: fontsize),
        ),
      ),
    );
  }
}

class TextButtons extends StatelessWidget {
  const TextButtons({
    Key? key,
    required this.title,
    required this.buttonText,
  }) : super(key: key);
  final String title;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        TextButton(
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.green, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            Navigator.pushNamed(context, route.signupScreen);
          },
        )
      ],
    );
  }
}

//error in following code

class TextButtonSignup extends StatelessWidget {
  const TextButtonSignup({
    Key? key,
    required this.title,
    required this.buttonText,
  }) : super(key: key);
  final String title;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        TextButton(
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.green, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
