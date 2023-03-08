import 'package:flutter/material.dart';
import 'constant.dart';
import 'view/authentication/login.dart';


void main(){
  runApp(const InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      title: appName,
    );
  }
}
