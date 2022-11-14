// import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:srmthon/global.dart';
import 'package:srmthon/notificationservice/local_notification_service.dart';

import 'package:srmthon/screens/mess_view.dart';
import 'package:srmthon/screens/profile_view.dart';
import 'package:srmthon/screens/rest_view.dart';
import 'package:srmthon/screens/review_cart_view.dart';

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
    ReviewCartView(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("FirebaseMessaging.instance.getInitialMessage");
      if (message != null) {
        print("New Notification");
        // if (message.data['_id'] != null) {
        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (context) => DemoScreen(
        //         id: message.data['_id'],
        //       ),
        //     ),
        //   );
        // }
      }
    });

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

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
