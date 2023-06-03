import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Util/HexToColor.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50)),
                        color: HexColor("#637892")),
                  ),
                  Container(
                    height: 70,
                  )
                ],
              ),
              Container(
                height: 220,
                child: Image.asset(
                  "assets/Icons/Maintenance.png",
                  scale: 0.7,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: HexColor("#FFEAD2")),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Maintenance                Request",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#637892")),
            ),
          )
        ],
      ),
    );
  }
}
