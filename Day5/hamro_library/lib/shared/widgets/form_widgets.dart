import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(16),
          border: OutlineInputBorder(),
          labelText: "Email",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orangeAccent,
              width: 2.0,
            ),
          ),
        ),
        validator: (value) {
          RegExp regExp =
              RegExp("[A-Za-z0-9._]{1,}@[a-z]{3,}[.][A-Za-z.]{3,6}\$");
          if (value == null || value.isEmpty) {
            return 'Email field cant be empty';
          } else if (regExp.hasMatch(value) == false) {
            return 'Please enter a valid email address.';
          }

          return null;
        },
      ),
    );
  }
}

class PhoneField extends StatelessWidget {
  const PhoneField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextFormField(
        controller: controller,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(16),
          border: OutlineInputBorder(),
          labelText: "Phone Number",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
              width: 2.0,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.length != 10) {
            return 'Phone Number should be of 10 digits';
          }
          return null;
        },
      ),
    );
  }
}

class PassField extends StatefulWidget {
  const PassField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  bool _passwordInVisible = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _passwordInVisible,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordInVisible ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _passwordInVisible = !_passwordInVisible;
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
        },
      ),
    );
  }
}

class NameField extends StatefulWidget {
  final String title;
  final String errorMessage;
  final TextEditingController controller;
  const NameField(
      {Key? key,
      required this.title,
      required this.errorMessage,
      required this.controller})
      : super(key: key);

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          labelText: widget.title,
          border: const OutlineInputBorder(),
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
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.errorMessage;
          }

          return null;
        },
      ),
    );
  }
}

loginNameField(nameController) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 6, 0, 16),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: nameController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(16),
          labelText: 'Email',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orangeAccent,
              width: 2.0,
            ),
          ),
        ),
        validator: (value) {
          RegExp regExp =
              RegExp("[A-Za-z0-9._]{1,}@[a-z]{3,}[.][A-Za-z.]{3,6}\$");
          if (value == null || value.isEmpty) {
            return 'Email field cant be empty';
          } else if (regExp.hasMatch(value) == false) {
            return 'Please enter a valid email address.';
          }

          return null;
        },
      ),
    ),
  );
}
