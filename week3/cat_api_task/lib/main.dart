import 'package:cat_api_task/ui/home/providers/breeds_provider.dart';
import 'package:cat_api_task/ui/home/providers/screen_index_provider.dart';
import 'package:cat_api_task/ui/home/providers/voting_provider.dart';
import 'package:cat_api_task/ui/home/screens/home_screen.dart';
import 'package:cat_api_task/utils/colors.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/routes.dart' as route;

void main() {
  ChuckerFlutter.showOnRelease = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ScreenIndexProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BreedsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VotingPRovider(),
        ),
      ],
      child: MaterialApp(
        navigatorObservers: [ChuckerFlutter.navigatorObserver],
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.from(
            colorScheme: const ColorScheme.light(primary: primaryColor)),
        home: const HomeScreen(),
        onGenerateRoute: route.getRoutes,
      ),
    );
  }
}
