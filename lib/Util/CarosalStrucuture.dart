import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HexToColor.dart';

class CarosalStructure extends StatelessWidget {
  CarosalStructure(this.imgURL, this.title, this.requestPageWidget);
  Widget requestPageWidget;
  String title;
  String imgURL;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            Container(height: 64),
            Container(
              padding: EdgeInsets.only(top: 100, left: 10, right: 10),
              height: 360,
              width: 250,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(10, 20),
                        blurRadius: 4,
                        color: Colors.grey.withOpacity(0.5))
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: HexColor("#637892").withOpacity(0.63)),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 30),
                  ),
                  SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => requestPageWidget,
                                )),
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    HexColor("#F7F7F7"))),
                            child: Text(
                              "Request",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  HexColor("#F7F7F7"))),
                          child: Text(
                            "History",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: HexColor("#FFEAD2")),
          height: 128,
          child: Image.asset(imgURL),
        )
      ],
    );
  }
}
