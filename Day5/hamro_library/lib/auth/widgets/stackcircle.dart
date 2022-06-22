import 'package:flutter/material.dart';

class StackCircle extends StatelessWidget {
  const StackCircle({Key? key, required this.child})
      : super(
          key: key,
        );
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          child,
          Positioned(
            top: -150 + 100,
            right: -150 + 93,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orangeAccent.withOpacity(0.2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
