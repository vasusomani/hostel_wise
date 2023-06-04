import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Util/HexToColor.dart';
import 'RequestSent.dart';

class Historymaintenance extends StatefulWidget {
  Historymaintenance(this.secKey);
  final String secKey;

  @override
  _HistorymaintenanceState createState() => _HistorymaintenanceState();
}

class _HistorymaintenanceState extends State<Historymaintenance> {
  List<Map<String, dynamic>> maintenanceHistory = [];

  @override
  void initState() {
    super.initState();
    _fetchmaintenanceHistory();
  }

  Future<void> _fetchmaintenanceHistory() async {
    final url =
        "https://001b-136-233-9-98.ngrok-free.app/dashboard/${widget.secKey}/C/";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      setState(() {
        maintenanceHistory = List<Map<String, dynamic>>.from(responseBody);
      });
    } else {
      print("Failed to fetch maintenance history. ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.keyboard_backspace_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: HexColor("#637892"),
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: HexColor("#637892"),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: HexColor("#F7F7F7"),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100)),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: maintenanceHistory.length,
              itemBuilder: (context, index) {
                final history = maintenanceHistory[index];
                final dateAdded = history['date_added'] ?? '';
                final dateCompleted = history['date_completed'] ?? '';
                final isCompleted = history['is_completed'] ?? false;

                final trimmedDateAdded = dateAdded.substring(0, 10);
                final trimmedDateCompleted = dateCompleted.length >= 13
                    ? dateCompleted.substring(0, 13)
                    : "NOT COMPLETED";
                final serialNumber = (index + 1).toString().padLeft(2, '0');

                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  width: 360,
                  decoration: BoxDecoration(
                    color: HexColor("#D9D9D9"),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "S.No: $serialNumber",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Date Added: $trimmedDateAdded",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            isCompleted == false
                                ? "Date Completed: $trimmedDateCompleted"
                                : "Not Completed",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
