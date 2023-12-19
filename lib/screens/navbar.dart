// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:threadsfire/screens/activity/activity.dart';
import 'package:threadsfire/screens/home/home.dart';
import 'package:threadsfire/screens/post/post.dart';
import 'package:threadsfire/screens/profile/profile.dart';
import 'package:threadsfire/screens/search/search.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const PostScreen(),
    const ActivityScreen(),
    const ProfileScreen(),
  ];

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(builder: (context) {
          return _widgetOptions[_selectedIndex];
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
        elevation: 10.0,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/HomeOutline.svg',
              height: 20,
              width: 20,
              color: Colors.grey,
            ), // Provide icon
            activeIcon: SvgPicture.asset(
              'assets/icons/HomeBold.svg',
              color: Colors.black,
              height: 20,
              width: 20,
            ), // Provide activeIcon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/search-normal.svg',
              color: Colors.grey,
              height: 20,
              width: 20,
            ), // Provide icon
            activeIcon: SvgPicture.asset(
              'assets/icons/search-normal.svg',
              color: Colors.black,
              height: 20,
              width: 20,
            ), // Provide activeIcon
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Create.svg',
              color: Colors.grey,
              height: 20,
              width: 20,
            ), // Provide icon
            activeIcon: SvgPicture.asset(
              'assets/icons/Create.svg',
              color: Colors.black,
              height: 20,
              width: 20,
            ), // Provide activeIcon
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              color: Colors.grey,
              height: 22,
              width: 22,
            ), // Provide icon
            activeIcon: SvgPicture.asset(
              'assets/icons/heartbold.svg',
              color: Colors.black,
              height: 22,
              width: 22,
            ), // Provide activeIcon
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              color: Colors.grey,
              height: 22,
              width: 22,
            ), // Provide icon
            activeIcon: SvgPicture.asset(
              'assets/icons/userbold.svg',
              color: Colors.black,
              height: 22,
              width: 22,
            ), // Provide activeIcon
            label: 'Profile',
          ),
        ],
        selectedLabelStyle: (GoogleFonts.manrope(fontSize: 10)),
        unselectedLabelStyle: (GoogleFonts.manrope(fontSize: 10)),
      ),
    );
  }
}
