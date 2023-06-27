import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hostel_wise/Pages/HomePage.dart';
import 'package:hostel_wise/Pages/HostoryCleaning.dart';
import 'package:hostel_wise/Pages/IntroPage.dart';
import 'package:http/http.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IntroPage(),
          ));
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/Icons/LandingPageLogo.png",
          ),
          SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            height: 50,
            child: Image.asset(
              "assets/Icons/HostelWise.png",
              fit: BoxFit.fitHeight,
            ),
          )
        ],
      ),
    );
  }
}
