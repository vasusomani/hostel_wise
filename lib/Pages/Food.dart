import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_wise/Pages/RequestSent.dart';

import '../Util/HexToColor.dart';
import '../Util/httpCalls.dart';

class FoodRequestPage extends StatelessWidget {
  FoodRequestPage(this.secKey);
  String secKey;
  @override
  Widget build(BuildContext context) {
    Future<void> _submitRequest() async {
      final body = {};
      final url = "$httpUrl/dashboard/$secKey/D/";
      final uri = Uri.parse(url);
      final response = await http.post(uri, body: body);
      if (response.statusCode == 200) {
        final ResponseBody = jsonDecode(response.body);
        print(response.body);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RequestSent(),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RequestSent(),
            ));
        print("${response.statusCode}");
      }
    }

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
                      "assets/Icons/Food.png",
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
              "In-room                Mess service",
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
              "Stay nourished without leaving your room during sickness. Submit a meal delivery request with dates, attach a medical certificate, and with warden approval, savor delicious meals delivered right to your doorstep.",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 60),
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(282, 46)),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
                  backgroundColor:
                      MaterialStatePropertyAll(HexColor("#D9D9D9"))),
              onPressed: null,
              child: const Text(
                "Upload Medical Caertificates",
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
              onPressed: _submitRequest,
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
