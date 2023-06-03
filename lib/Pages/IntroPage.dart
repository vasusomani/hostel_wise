import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Util/HexToColor.dart';
import 'package:http/http.dart' as http;
import '../Util/TextFieldAuth.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.center,
          child: Expanded(
            child: Image.asset(
              "assets/Icons/HostelWise.png",
            ),
          ),
        ),
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: HexColor("F7F7F7"),
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(100))),
            height: 260,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/Icons/graffiti.png",
            ),
          ),
          Align(
            heightFactor: 0.4,
            alignment: Alignment.bottomRight,
            child: Stack(
              children: [
                Container(
                  color: HexColor("#637892"),
                  height: 107,
                  width: 115,
                ),
                Container(
                  height: 107,
                  width: 115,
                  decoration: BoxDecoration(
                      color: HexColor("F7F7F7"),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(200))),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: HexColor("#637892"),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100))),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        SizedBox(height: 45),
                        Text(
                          "Lets Help                Each Other",
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 40,
                              color: HexColor("#FFEAD2"),
                              fontWeight: FontWeight.w700,
                              shadows: [
                                Shadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    color: Color.fromRGBO(0, 0, 0, 25))
                              ]),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "\"Pioneering the future of hostelling, where convenience meets connection in                the digital era.\"",
                          style: GoogleFonts.workSans(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/signin'),
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStatePropertyAll(Size(150, 50)),
                              backgroundColor: MaterialStatePropertyAll(
                                  HexColor("#FFEAD2"))),
                          child: const Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
