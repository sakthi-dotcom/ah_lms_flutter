import 'package:flutter/material.dart';
import 'package:ah_lms/sidebar.dart';
import 'package:ah_lms/constant.dart';

class MyLeave extends StatefulWidget {
  const MyLeave({Key? key}) : super(key: key);

  @override
  State<MyLeave> createState() => _MyLeaveState();
}

class _MyLeaveState extends State<MyLeave> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      drawer:  SideBar(),
      appBar: AppBar(
        title:  const Text(
            my_leave
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("My Leave")
          ],
        ),
      ),
    );
  }
}
