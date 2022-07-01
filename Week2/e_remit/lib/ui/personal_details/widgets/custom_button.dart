import 'package:e_remit/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key, required this.label, required this.onNextPressed})
      : super(key: key);
  final String label;
  final Function() onNextPressed;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onNextPressed,
      style: ButtonStyle(
          backgroundColor: widget.label == 'Done'
              ? MaterialStateProperty.all(Colors.grey.shade600)
              : MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      child: Text(widget.label.toUpperCase()),
    );
  }
}
