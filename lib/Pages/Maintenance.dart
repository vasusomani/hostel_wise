import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_wise/Pages/MaintenanceRequest.dart';
import 'package:http/http.dart' as http;
import '../Util/HexToColor.dart';
import 'RequestSent.dart';

class MaintenancePage extends StatelessWidget {
  MaintenancePage(this.secKey);
  String secKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
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
              SafeArea(
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30,
                    )),
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
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Experience convenience at your fingertips by submitting online maintenance requests for any room-related issues. Get your concerns addressed promptly and enjoy a hassle-free living environment.",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(282, 46)),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
                  backgroundColor:
                      MaterialStatePropertyAll(HexColor("#D9D9D9"))),
              onPressed: null,
              child: const Text(
                "Select Date",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
          const SizedBox(height: 20),
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(282, 46)),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
                  backgroundColor:
                      MaterialStatePropertyAll(HexColor("#D9D9D9"))),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MaintenanceRequest(secKey),
                  )),
              child: const Text(
                "Request",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
