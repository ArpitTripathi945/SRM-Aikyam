import 'package:flutter/material.dart';
import 'package:srmthon/global.dart';
import 'package:srmthon/screens/cart_view.dart';
import 'package:srmthon/screens/mess_view.dart';
import 'package:srmthon/screens/profile_view.dart';
import 'package:srmthon/screens/rest_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final List<Widget> screens = [
    MessView(),
    RestView(),
    ProfileView(),
    CartView(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MessView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      backgroundColor: whitecolor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 2, 4, 18),
        currentIndex: _currentIndex,
        iconSize: 22,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            backgroundColor: whitecolor,
            label: 'Mess',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            backgroundColor: whitecolor,
            label: 'Restaurant',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: whitecolor,
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            backgroundColor: whitecolor,
            label: 'Cart',
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 176, 190, 220),
        unselectedItemColor: whitecolor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
