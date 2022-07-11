import 'package:cat_api_task/ui/breeds/screens/breeds_screen.dart';
import 'package:cat_api_task/ui/favourite/widgets/fav_cat_card.dart';
import 'package:cat_api_task/ui/home/providers/screen_index_provider.dart';
import 'package:cat_api_task/ui/home/widgets/bottom_nav_bar.dart';
import 'package:cat_api_task/ui/voting/screens/voting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenindexprovider = Provider.of<ScreenIndexProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/cat.png',
              height: kToolbarHeight * 0.8,
              color: Colors.white,
            ),
            const Text(" mandu"),
          ],
        ),
        elevation: 0,
      ),
      body: bodyList[screenindexprovider.currentIndex],
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          screenindexprovider.changeIndex(index);
        },
        currentIndex: screenindexprovider.currentIndex,
      ),
    );
  }
}

List<Widget> bodyList = [
  const VotingScreen(),
  const BreedsScreen(),
  const Text("how"),
  const FavCatCard(),
  const Text("you")
];
