import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_wise/Util/appBar.dart';

import '../Util/HexToColor.dart';
import '../Util/TextFieldAuth.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailID = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _authorize() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  TextFieldEmail(emailID),
                  const SizedBox(height: 20),
                  TextFieldPass(password),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      _authorize();
                    },
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 80),
                      decoration: BoxDecoration(
                          color: HexColor("#035357"),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                          indent: 28,
                          endIndent: 23,
                        ),
                      ),
                      Text("or continue with",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                          indent: 28,
                          endIndent: 23,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?  ",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 15),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/signup'),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
