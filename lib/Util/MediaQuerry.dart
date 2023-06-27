import 'package:flutter/material.dart';

double Height(double height, BuildContext context) {
  double usedHeight = 915;
  double screenHeight = MediaQuery.of(context).size.height;
  double adaptiveHeight = screenHeight * (height / usedHeight);
  return adaptiveHeight;
}

double Width(double width, BuildContext context) {
  double usedWidth = 412;
  double screenWidth = MediaQuery.of(context).size.width;
  double adaptiveWidth = screenWidth * (width / usedWidth);
  return adaptiveWidth;
}
