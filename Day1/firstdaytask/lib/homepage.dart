import 'package:firstdaytask/widgets/formfields.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _fkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Day Task"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Form(
          key: _fkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const PhoneField(),
              ElevatedButton(
                  onPressed: () {
                    if (_fkey.currentState!.validate()) {
                      showSnackbar(context, "True!", Colors.black);
                    } else {
                      showSnackbar(context, "False!", Colors.red);
                    }
                  },
                  child: const Text("submit"))
            ],
          ),
        ),
      ),
    );
  }
}

showSnackbar(context, label, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 1),
    content: Text(label),
    backgroundColor: color,
  ));
}
