import 'package:flutter/material.dart';
import 'package:hostel_wise/Pages/SignInPage.dart';
import 'package:http/http.dart' as http;
import '../Util/HexToColor.dart';
import '../Util/TextFieldAuth.dart';
import '../Util/httpCalls.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final name = TextEditingController();
  final regNo = TextEditingController();
  final emailID = TextEditingController();
  final block = TextEditingController();
  final room = TextEditingController();
  final password = TextEditingController();
  final confirm_password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _submitData() async {
    final body = {
      "s_Name": name.text,
      "s_Gender": "Male",
      "s_Email": emailID.text,
      "s_Password": password.text,
      "s_Registration_Number": regNo.text,
      "s_Room_Number": room.text,
      "s_Block": "M"
    };

    final url = "$httpUrl/studentregister/";
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: body);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInPage()));
    } else {
      print(response.statusCode);
    }
  }

  void validate() {
    if (_formKey.currentState!.validate()) {
      _submitData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Expanded(
              child: Image.asset(
                "assets/Icons/HostelWise.png",
              ),
            ),
          ),
        ),
        toolbarHeight: 40,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              Container(
                color: HexColor("#637892"),
                height: 80,
                width: 115,
              ),
              Container(
                height: 80,
                width: 115,
                decoration: BoxDecoration(
                  color: HexColor("F7F7F7"),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(200)),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 80),
              decoration: BoxDecoration(
                color: HexColor("#637892"),
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFieldName(name),
                            const SizedBox(height: 20),
                            TextFieldRegNo(regNo),
                            const SizedBox(height: 20),
                            TextFieldEmail(emailID),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: TextFieldBlock(block),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextFieldRoom(room),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TextFieldPass(password),
                            const SizedBox(height: 20),
                            TextFieldConfirmPass(confirm_password, password),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "Already have an accout?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pushNamed(context, '/signin'),
                                    child: const Text(
                                      "Login",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ],
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: validate,
                              style: ButtonStyle(
                                  minimumSize: const MaterialStatePropertyAll(
                                      Size(150, 50)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      HexColor("#FFEAD2"))),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                            SizedBox(height: 20)
                          ],
                        ),
                      ),
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
