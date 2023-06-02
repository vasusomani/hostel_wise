import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Util/HexToColor.dart';
import '../Util/TextFieldAuth.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final name = TextEditingController();
  final emailID = TextEditingController();
  final password = TextEditingController();
  final confirm_password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _submitData() async {
    final body = {
      "s_Name": name,
      "s_Gender": "Male",
      "s_Email": emailID,
      "s_password": password,
      "s_Registration_Number": "22BCE6969",
      "s_Room_Number": "1013",
      "s_Block": "M"
    };
    const url = "https://2013-136-233-9-98.ngrok-free.app/studentregister/";
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: body);
    print("FINAL SUBMITED");
  }

  void validate() {
    if (_formKey.currentState!.validate()) {
      print("SUBMITED");
      _submitData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: HexColor("#FBFBFD"),
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
                    TextFieldName(name),
                    const SizedBox(height: 20),
                    TextFieldEmail(emailID),
                    const SizedBox(height: 20),
                    TextFieldPass(password),
                    const SizedBox(height: 20),
                    TextFieldConfirmPass(confirm_password, password),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Sign Up as Employee",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        print("SUBMITED");
                        validate();
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                            vertical: 17, horizontal: 80),
                        decoration: BoxDecoration(
                            color: HexColor("#035357"),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Text(
                          "Sign Up",
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
                          "Already have an account?  ",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 15),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, '/signin'),
                          child: const Text(
                            "Log in",
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
      ),
    );
  }
}
