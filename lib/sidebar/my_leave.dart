import 'package:flutter/material.dart';


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
