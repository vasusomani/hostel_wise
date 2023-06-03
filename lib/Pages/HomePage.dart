import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_wise/Util/HexToColor.dart';
import 'package:hostel_wise/Util/HomeCarosal.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#637892"),
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))),
      ),
      body: Stack(children: [
        Container(
          color: HexColor("#637892"),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: HexColor("#F7F7F7"),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100))),
          child: Column(
            children: [
              SizedBox(height: 27),
              Text(
                "Notice Board",
                style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#637892")),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: HexColor("#DBDFEA")),
              ),
              HomeCarosal()
            ],
          ),
        ),
      ]),
    );
  }
}
