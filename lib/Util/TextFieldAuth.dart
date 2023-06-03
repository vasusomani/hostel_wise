import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HexToColor.dart';

OutlineInputBorder EnabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: HexColor("#88035357")));

OutlineInputBorder FocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: HexColor("#035357")));

class TextFieldEmail extends StatelessWidget {
  TextFieldEmail(this.controller);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Email Address",
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        prefixIcon: Icon(
          Icons.alternate_email_rounded,
          color: HexColor("#035357"),
          size: 30,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: EnabledBorder,
        focusedBorder: FocusedBorder,
      ),
      validator: (value) {
        if (value == null ||
            value.trim() == "" ||
            value.trim().length < 3 ||
            !value.contains("@")) {
          return "Enter a valid email address";
        }
        return null;
      },
    );
  }
}

class TextFieldPass extends StatelessWidget {
  TextFieldPass(this.controller);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        prefixIcon: Icon(
          Icons.lock_rounded,
          color: HexColor("#035357"),
          size: 30,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: EnabledBorder,
        focusedBorder: FocusedBorder,
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.contains(" ")) {
          return "Password can't be empty";
        } else if (value.trim().length < 6) {
          return "Password should be atleast 6 characters long";
        } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*?[^\w\s]).*$')
            .hasMatch(value)) {
          return "Password should be a combination of capital, small, integer, and special characters";
        }

        return null;
      },
    );
  }
}

class TextFieldConfirmPass extends StatelessWidget {
  TextFieldConfirmPass(this.controller, this.password);
  final TextEditingController controller;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Confirm Password",
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        prefixIcon: Icon(
          Icons.lock_rounded,
          color: HexColor("#035357"),
          size: 30,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: EnabledBorder,
        focusedBorder: FocusedBorder,
      ),
      obscureText: true,
      validator: (value) {
        if (value != password.text) {
          print(password.text);
          return "Confirm Password must be same as Password";
        }

        return null;
      },
    );
  }
}

class TextFieldName extends StatelessWidget {
  TextFieldName(this.controller);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Name",
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        prefixIcon: Icon(
          Icons.person,
          color: HexColor("#035357"),
          size: 30,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: EnabledBorder,
        focusedBorder: FocusedBorder,
      ),
      validator: (value) {
        if (value == null || value.trim() == "" || value.trim().length < 2) {
          return "Enter a valid name";
        }
        return null;
      },
    );
  }
}

class TextFieldRegNo extends StatelessWidget {
  TextFieldRegNo(this.controller);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Reg Number",
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        prefixIcon: Icon(
          Icons.person,
          color: HexColor("#035357"),
          size: 30,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: EnabledBorder,
        focusedBorder: FocusedBorder,
      ),
      validator: (value) {
        if (value == null || value.trim() == "" || value.trim().length < 9) {
          return "Enter a valid name";
        }
        return null;
      },
    );
  }
}

class TextFieldRoom extends StatelessWidget {
  TextFieldRoom(this.controller);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Room No",
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        prefixIcon: Icon(
          Icons.person,
          color: HexColor("#035357"),
          size: 30,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: EnabledBorder,
        focusedBorder: FocusedBorder,
      ),
      validator: (value) {
        if (value == null || value.trim() == "") {
          return "Enter a valid name";
        }
        return null;
      },
    );
  }
}

List<String> BlocksList = [
  'A',
  'B',
  'B ANNEX',
  'C',
  'D',
  'D ANNEX',
  'E',
  'F',
  'G',
  'H',
  'J',
  'K',
  'L',
  'M',
  'M ANNEX',
  'N',
  'P',
  'Q',
  'R'
];

class TextFieldBlock extends StatelessWidget {
  TextFieldBlock(this.controller);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField(
          items: BlocksList.map(
            (String block) {
              return DropdownMenuItem<String>(value: block, child: Text(block));
            },
          ).toList(),
          validator: (value) {
            if (value == null) {
              return "Please select an option";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: "Block",
            prefixIcon: Icon(CupertinoIcons.building_2_fill,
                color: HexColor("#035357")),
            hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: EnabledBorder,
            focusedBorder: FocusedBorder,
            border: OutlineInputBorder(),
          ),
          onChanged: (String? selectedBlock) {}),
    );
  }
}
