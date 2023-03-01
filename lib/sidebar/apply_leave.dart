import 'package:flutter/material.dart';
import 'package:ah_lms/sidebar.dart';
import 'package:ah_lms/constant.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({Key? key}) : super(key: key);

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: SideBar(),
        appBar: AppBar(
          title: Text(app_leave),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Apply Your leave here..")],
          ),
        ),
      ),
    );
  }
}
