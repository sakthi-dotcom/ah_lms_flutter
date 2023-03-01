import 'package:flutter/material.dart';
import 'package:ah_lms/sidebar.dart';
import 'package:ah_lms/constant.dart';

class AugustaFamily extends StatefulWidget {
  const AugustaFamily({Key? key}) : super(key: key);

  @override
  State<AugustaFamily> createState() => _AugustaFamilyState();
}

class _AugustaFamilyState extends State<AugustaFamily> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      drawer:  SideBar(),
      appBar: AppBar(
        title:  const Text(
            Aug_fam
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Augusta Family")
          ],
        ),
      ),
    );
  }
}
