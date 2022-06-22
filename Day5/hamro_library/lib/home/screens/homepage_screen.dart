import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hamro_library/auth/services/auth.dart';
import 'package:hamro_library/auth/services/database_helper.dart';
import 'package:hamro_library/home/widgets/catagorycard.dart';
import 'package:hamro_library/shared/utils/routes.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<String> catagoryName = ['math', 'nobel', 'science', 'economic'];
  final AuthMethods _authMethods = AuthMethods();
  User? user = FirebaseAuth.instance.currentUser;
  final dbHelper = DatabaseHelper.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context),
        body: getHomeBody(),
        drawer: getDrawer(user, _authMethods, context));
  }

  ListView getHomeBody() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: catagoryName.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            title: catagoryName[index],
          );
        });
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Store'),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, route.searchScreen);
            },
            icon: const Icon(Icons.search),
          ),
        )
      ],
    );
  }
}

getDrawer(user, _authMethods, context) {
  return SafeArea(
    child: Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: CircleAvatar(
                  child: Text(
                      user!.email!.toUpperCase().toString().substring(0, 1))),
              accountEmail: Text(user!.email.toString())),
          GestureDetector(
            onTap: (() async {
              _authMethods.signOut();
              final pref = await SharedPreferences.getInstance();
              await pref.setBool('isLoggedIn', false);

              Navigator.pushReplacementNamed(context, route.loginPage);
            }),
            child: ListTile(
              leading: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.logout)),
              title: const Text("Logout"),
            ),
          )
        ],
      ),
    ),
  );
}
