import 'package:flutter/material.dart';
import 'package:news_app_api/view/home_screen/home_screen.dart';
import 'package:news_app_api/view/profile/profilescreen.dart';
import 'package:news_app_api/view/savedscreen/savedscreen.dart';
import 'package:news_app_api/view/search_screen/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List screens = [MainScreen(), SearchScreen(), Savedscreen(), Profilescreen()];
  int selesctedIntex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selesctedIntex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selesctedIntex = value;
              screens[selesctedIntex] = screens[value];
            });
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontSize: 10),
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Saved'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
