import 'package:flutter/material.dart';

class AppBar1 extends StatelessWidget {
  const AppBar1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        alignment: Alignment.center,
        height: 50,
        child: Image.asset(
          "assets/Icons/HostelWise.png",
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
