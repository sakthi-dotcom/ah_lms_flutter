import 'package:flutter/material.dart';
import 'package:ah_lms/sidebar.dart';
import 'package:ah_lms/constant.dart';

class LeaveRequest extends StatefulWidget {
  const LeaveRequest({Key? key}) : super(key: key);

  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
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
          title: const Text(lev_req),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text("Leave Request")],
          ),
        ),
      ),
    );
  }
}
