import 'package:flutter/material.dart';
import 'package:ah_lms/sidebar.dart';
import 'package:ah_lms/constant.dart';

import '../leave_detail.dart';

class MyLeave extends StatefulWidget {
  const MyLeave({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyLeave> createState() => _MyLeaveState();
}

class _MyLeaveState extends State<MyLeave> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const SideBar(),
        appBar: AppBar(
          title: const Text("Leave History"),
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin:const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    leading: Container(
                        padding: const EdgeInsets.only(right: 13.0),
                        child:
                            ClipOval(child: Image.asset("assets/avatar.png"))),
                    trailing: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: const [
                        Text("01/01/2023"),
                        SizedBox(height: 20.0),
                        Text("1d"),
                      ],
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                        MaterialPageRoute(builder:(context) => LeaveDetail())
                      );
                    },
                    title: const Text(
                      "Sakthivel K",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top:15.0),
                      child: Row(
                        children: const [
                          Text(
                            "Loss of pay",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
