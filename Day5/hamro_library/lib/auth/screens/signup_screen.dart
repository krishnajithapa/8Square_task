import 'package:flutter/material.dart';
import 'package:hamro_library/auth/services/auth.dart';
import 'package:hamro_library/auth/widgets/stackcircle.dart';
import 'package:hamro_library/home/widgets/button.dart';
import 'package:hamro_library/shared/utils/routes.dart' as route;
import 'package:hamro_library/shared/widgets/form_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return StackCircle(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Sign Up',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          toolbarHeight: screenHeight * 0.204433,
        ),
        body: const SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  //to show loading dialog box
  var isLoading = false;

  AuthMethods authMethods = AuthMethods();
  //initialization of register parameters
  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';
  String phone = '';

  signUp() {
    if (_formKey.currentState?.validate() == true) {
      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then(
        (value) async {
          if (value != null) {
            final pref = await SharedPreferences.getInstance();
            pref.setString('name', usernameController.text);
            pref.setString('email', emailController.text);
            pref.setString('password', passwordController.text);

            // ignore: use_build_context_synchronously
            _snackBar(context, 'SignUp successful');
          }
        },
      );
      Navigator.pushNamed(context, route.loginPage);
    }
  }

  //textcontrollers
  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //instantiating global key
  final _formKey = GlobalKey<FormState>();

  //instantiating sign up store

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            color: Colors.white,
            child: const Center(child: CircularProgressIndicator()),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //for firstname
                      NameField(
                        title: 'Username',
                        errorMessage: 'Username cant be empty',
                        controller: usernameController,
                      ),
                      //for lastname

                      //for email field
                      EmailField(
                        controller: emailController,
                      ),
                      //for phone field

                      PassField(
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      const TextButtonSignup(
                        title: 'Already have an Account?',
                        buttonText: 'Login',
                      ),
                      ElevatedButton(
                          onPressed: () {
                            signUp();
                          },
                          child: const Text('SignUp'))
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  //custom snack bar
  _snackBar(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(label)));
  }
}
