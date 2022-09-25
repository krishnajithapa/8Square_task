import 'package:flutter/material.dart';
import 'package:secure_application/secure_application.dart';

class MyConfedentialScreen extends StatelessWidget {
  // late SecureApplicationController _controller;

  const MyConfedentialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // _controller =
    //     SecureApplicationController(SecureApplicationState(secured: true));
    return SecureApplication(
// secureApplicationController: _controller,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Confidential page'),
        ),
        body: const Center(
          child: Text('This is confedential page'),
        ),
      ),
    );
  }
}
