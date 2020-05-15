import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final TextStyle bottomNavBarStyle = TextStyle(fontSize: 16, color: Colors.black);
  final List<BottomNavigationBarItem> bottomNavBarItems = [];
  CustomAppBar() {
    bottomNavBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Text(
          "Explore",
          style: bottomNavBarStyle,
        )));
    bottomNavBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        title: Text(
          "WishList",
          style: bottomNavBarStyle,
        )));
    bottomNavBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.local_offer,
          color: Colors.black,
        ),
        title: Text(
          "New Deals",
          style: bottomNavBarStyle,
        )));
    bottomNavBarItems.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text(
          "Notifications",
          style: bottomNavBarStyle,
        )));
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomNavBarItems,
      type: BottomNavigationBarType.fixed,
    );
  }
}
