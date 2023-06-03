import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_wise/Util/HexToColor.dart';

class RegisterComplain extends StatelessWidget {
  const RegisterComplain({Key? key}) : super(key: key);

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
                    border: Border.all(color: HexColor("#637892"), width: 15),
                    borderRadius: BorderRadius.circular(50),
                    color: HexColor("#FFEAD2")),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Register Complaint",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: HexColor("#637892")),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      height: 278,
                      width: 255,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLines: 10,
                          decoration: const InputDecoration(
                            hintText: "Type your complaint...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: null,
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(HexColor("#637892"))),
                    )
                  ],
                )),
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
