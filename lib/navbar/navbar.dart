import 'package:dog_explorer/navbar/controller.dart';
import 'package:dog_explorer/screens/home_screen/home.dart';
import 'package:dog_explorer/screens/saved_dog_screen/saved_dog_screen.dart';
import 'package:dog_explorer/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavBarController());
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            Home(),
            SearchScreen(),
            SavedDogsScreen(),
          ],
        ),
        bottomNavigationBar: NavBarWidget(controller: controller),
      );
    });
  }
}

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
    required this.controller,
  });

  final NavBarController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: Container(
        color: Colors.blueGrey.shade300,
        child: GNav(
          gap: 8,
          activeColor: Colors.white70,
          backgroundColor: Colors.blueGrey.shade300,
          tabBackgroundColor: Colors.blueGrey.withOpacity(0.4),
          hoverColor: Colors.grey,
          color: Colors.grey[800],
          padding: EdgeInsets.all(15),
          selectedIndex: controller.tabIndex,
          onTabChange: controller.changeTabIndex,
          tabMargin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search_outlined,
              text: 'Search',
            ),
            GButton(
              icon: Icons.favorite_border_outlined,
              text: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
