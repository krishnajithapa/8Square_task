import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
            label: Text("Phone"),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.green),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blue),
            ),
            hintText: "Enter Phone Number"),
        validator: (value) {
          RegExp regExp = RegExp(r'^(60)[0-9]{8,9}$');
          if (regExp.hasMatch(value!)) {
            return null;
          } else {
            return "enter valid phone number";
          }
        },
      ),
    );
  }
}
