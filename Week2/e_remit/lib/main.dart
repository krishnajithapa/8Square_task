import 'package:e_remit/ui/authentication/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'utils/routes.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ).copyWith(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white, foregroundColor: Colors.red)),
      home: const WelcomeScreen(),
      onGenerateRoute: route.getRoutes,
    );
  }
}
