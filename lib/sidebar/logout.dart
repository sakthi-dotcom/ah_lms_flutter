import 'package:flutter/material.dart';
import 'package:ah_lms/sidebar.dart';
import 'package:ah_lms/constant.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
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
          title: Text(appName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Implemented soon....")],
          ),
        ),
      ),
    );
  }
}
