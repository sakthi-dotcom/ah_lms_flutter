import 'package:flutter/material.dart';
import 'package:ah_lms/sidebar.dart';
import 'package:ah_lms/constant.dart';

class AugustaHolidays extends StatefulWidget {
  const AugustaHolidays({Key? key}) : super(key: key);

  @override
  State<AugustaHolidays> createState() => _AugustaHolidaysState();
}

class _AugustaHolidaysState extends State<AugustaHolidays> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      drawer:  SideBar(),
      appBar: AppBar(
        title:  Text(
            appName
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Implemented soon....")
          ],
        ),
      ),
    );
  }
}
