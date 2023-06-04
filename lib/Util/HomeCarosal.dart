import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hostel_wise/Pages/Cleaning.dart';
import 'package:hostel_wise/Pages/Complain.dart';
import 'package:hostel_wise/Pages/Food.dart';
import 'package:hostel_wise/Pages/HistoryComplain.dart';
import 'package:hostel_wise/Pages/HistoryMaintenance.dart';
import 'package:hostel_wise/Pages/HistoryMess.dart';
import 'package:hostel_wise/Pages/HostoryCleaning.dart';
import 'package:hostel_wise/Pages/Maintenance.dart';
import 'package:hostel_wise/Util/CarosalStrucuture.dart';

List<String> IconsList = [
  "assets/Icons/Cleaning.png",
  "assets/Icons/Food.png",
  "assets/Icons/Maintenance.png",
  "assets/Icons/Complain.png",
];

List<String> TitleList = [
  "Request Cleaning",
  "In-room Mess service",
  "Maintenance Request",
  "Register Complaint",
];

class HomeCarosal extends StatelessWidget {
  HomeCarosal(this.secKey);
  String secKey;
  @override
  Widget build(BuildContext context) {
    List<Widget> RequestList = [
      CleaningRequestPage(secKey),
      FoodRequestPage(secKey),
      MaintenancePage(secKey),
      ComplainPage(secKey)
    ];
    List<Widget> HistoryList = [
      HistoryCleaning(secKey),
      HistoryMess(secKey),
      Historymaintenance(secKey),
      HistoryComaplain(secKey)
    ];
    List<Widget> carouselItems = IconsList.asMap().entries.map((entry) {
      int index = entry.key;
      String iconUrl = entry.value;
      String title = TitleList[index];
      Widget requestPage = RequestList[index];
      Widget historyPage = HistoryList[index];
      return CarosalStructure(iconUrl, title, requestPage, secKey, historyPage);
    }).toList();

    return CarouselSlider(
      items: carouselItems,
      options: CarouselOptions(
        height: 424,
        animateToClosest: true,
      ),
    );
  }
}
