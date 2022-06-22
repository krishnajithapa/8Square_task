import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hamro_library/auth/services/auth.dart';
import 'package:hamro_library/auth/widgets/stackcircle.dart';
import 'package:hamro_library/home/widgets/button.dart';
import 'package:hamro_library/shared/utils/routes.dart' as route;
import 'package:hamro_library/shared/widgets/form_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  final _fKey = GlobalKey<FormState>();
  bool _passwordInVisible = true;
  QuerySnapshot<Map<String, dynamic>>? snapshotUserInfo;
  bool logginIn = false;
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  logMeIn() async {
    if (_fKey.currentState?.validate() == true) {
      setState(() {
        logginIn = true;
      });

      final pref = await SharedPreferences.getInstance();

      pref.setString('email', emailController.text);
      pref.setString('password', passController.text);
      _authMethods
          .signInWithEmailAndPassword(
              emailController.text, passController.text.trim())
          .then((value) {
        if (value != null) {
          pref.setBool('isLoggedIn', true).then((value) {
            Navigator.pushReplacementNamed(context, route.home);
          });
        } else {
          AlertDialog alert = AlertDialog(
            title: const Text("Credential don't Match"),
            content: const Text("Try logging in again.. "),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text('Ok')),
            ],
          );

          // show the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return logginIn
        ? Container(
            color: Colors.white,
            child: const Center(child: CircularProgressIndicator()),
          )
        : StackCircle(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Form(
                          key: _fKey,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              loginNameField(emailController),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TextFormField(
                                    controller: passController,
                                    obscureText: _passwordInVisible,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(16),
                                      border: const OutlineInputBorder(),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _passwordInVisible
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _passwordInVisible =
                                                !_passwordInVisible;
                                          });
                                        },
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.green,
                                        ),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.orangeAccent,
                                          width: 2.0,
                                        ),
                                      ),
                                      labelText: "Password",
                                    ),
                                    validator: (value) {
                                      RegExp regex = RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$',
                                      );
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter password';
                                      } else {
                                        if (!regex.hasMatch(value)) {
                                          return 'Enter valid password';
                                        } else {
                                          return null;
                                        }
                                      }
                                    }),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const TextButtons(
                                title: 'Dont have an account.',
                                buttonText: 'Sign Up',
                              ),
                              SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                    onPressed: () {
                                      logMeIn();
                                    },
                                    child: const Text(
                                      "Login",
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
