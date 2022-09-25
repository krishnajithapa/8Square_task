import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:secure_application/secure_application.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool failedAuth = false;

  StreamSubscription<bool>? subLock;
  List<String> history = [];
  final TextEditingController _passController = TextEditingController();
  late SecureApplicationController _secureController;
  double blurr = 10;
  double opacity = 0.6;
  @override
  void initState() {
    _secureController =
        SecureApplicationController(SecureApplicationState(secured: true));
    _secureController.secure();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => SecureApplication(
        secureApplicationController: _secureController,
        nativeRemoveDelay: 1000,
        onNeedUnlock: (secure) async {
          return null;
        },
        onAuthenticationFailed: () async {
          // clean you data
          setState(() {
            failedAuth = true;
          });
          print('auth failed');
        },
        onAuthenticationSucceed: () async {
          // clean you data

          setState(() {
            failedAuth = false;
          });
          print('auth success');
        },
        child: Builder(builder: (context) {
          return SecureGate(
            blurr: blurr,
            opacity: opacity,
            lockedBuilder: (context, secureNotifier) => Center(
                child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      controller: _passController,
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('UNLOCK'),
                    onPressed: () {
                      if (_passController.text == '12345') {
                        secureNotifier?.authSuccess(unlock: true);
                      }
                    },
                  ),
                ],
              ),
            )),
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Secure Window Example'),
              ),
              body: Center(
                child: Builder(builder: (context) {
                  var valueNotifier = SecureApplicationProvider.of(context);
                  if (valueNotifier == null) {
                    throw Exception(
                        'Unable to find secure application context');
                  }
                  return ListView(
                    children: <Widget>[
                      ValueListenableBuilder<SecureApplicationState>(
                          valueListenable: valueNotifier,
                          builder: (context, state, _) => Column(
                                children: <Widget>[
                                  state.paused
                                      ? ElevatedButton(
                                          onPressed: () =>
                                              valueNotifier.unpause(),
                                          child: const Text('resume security'),
                                        )
                                      : ElevatedButton(
                                          onPressed: () =>
                                              valueNotifier.pause(),
                                          child: const Text('pause security'),
                                        ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        valueNotifier.lockIfSecured(),
                                    child: const Text('Lock app'),
                                  ),
                                  state.paused
                                      ? const Text("Security paused")
                                      : const Text('Security on'),
                                ],
                              )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            const Text('Blurr:'),
                            Expanded(
                              child: Slider(
                                  value: blurr,
                                  min: 0,
                                  max: 100,
                                  onChanged: (value) {
                                    setState(() => blurr = value);
                                    log(blurr.toString());
                                  }),
                            ),
                            Text(blurr.floor().toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            const Text('opacity:'),
                            Expanded(
                              child: Slider(
                                  value: opacity,
                                  min: 0,
                                  max: 1,
                                  onChanged: (value) {
                                    setState(() => opacity = value);
                                  }),
                            ),
                            Text("${(opacity * 100).floor()}%"),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          );
        }),
      ),
    );
  }
}
