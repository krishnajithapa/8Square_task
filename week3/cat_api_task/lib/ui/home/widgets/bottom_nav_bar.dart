import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {Key? key, required this.onTap, required this.currentIndex})
      : super(key: key);
  final Function onTap;
  final int currentIndex;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (index) {
        widget.onTap(index);
      },
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      items: [
        getNavbarItem(Icons.how_to_vote_outlined, "Vote"),
        getNavbarItem(Icons.category_outlined, "Breeds"),
        getNavbarItem(Icons.image_search_rounded, "Images/Search"),
        getNavbarItem(Icons.favorite_border, "Favourites"),
        getNavbarItem(Icons.cloud_upload_outlined, "Upload"),
      ],
    );
  }

  BottomNavigationBarItem getNavbarItem(icon, String label) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        icon,
      ),
    );
  }
}
