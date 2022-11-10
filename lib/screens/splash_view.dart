import 'dart:async';

import 'package:flutter/material.dart';
import 'package:srmthon/global.dart';
import 'package:srmthon/main.dart';
import 'package:srmthon/screens/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Center(
        child: Image.asset('assets/srm_logo.png'),
      ),
    );
  }
}
