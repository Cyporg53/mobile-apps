import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nutrition_app/pages/favorites.dart';
import 'package:nutrition_app/pages/home.dart';
import 'package:nutrition_app/pages/search.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var selectedIndex = 0;

  final List<Widget> _pages = [HomePage(), FavoritesPage(), SearchPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SafeArea(
          child: GNav(
            color: Colors.black,
            tabBackgroundColor: Colors.green.shade100,
            activeColor: Colors.green.shade800,
            padding: EdgeInsets.all(18),
            gap: 10,
            duration: Duration(milliseconds: 300),
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.favorite, text: 'Favorites'),
              GButton(icon: Icons.add_circle_outlined, text: 'Foods'),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
