import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_wise/Util/HexToColor.dart';

class RequestSent extends StatelessWidget {
  const RequestSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 130,
            decoration: BoxDecoration(
                color: HexColor("#637892"),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50))),
          ),
          Center(
            child: Container(
              height: 540,
              width: 305,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: HexColor("#637892")),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(30),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.asset(
                        "assets/Icons/tick.png",
                      ),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: HexColor("#FFEAD2")),
                  ),
                  Text(
                    "Request Sent",
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 200,
              height: 130,
              decoration: BoxDecoration(
                  color: HexColor("#637892"),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
            ),
          ),
        ],
      ),
    );
  }
}
