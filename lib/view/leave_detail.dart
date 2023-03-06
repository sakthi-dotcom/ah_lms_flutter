import 'package:flutter/material.dart';

class LeaveDetail extends StatefulWidget {
  const LeaveDetail({Key? key}) : super(key: key);

  @override
  State<LeaveDetail> createState() => _LeaveDetailState();
}

class _LeaveDetailState extends State<LeaveDetail> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
            icon:Icon(Icons.arrow_back_ios),
      ),
        title: Text("Leave history"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: screenWidth * 0.7,
          height: screenHeight * 0.5,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children:  const [
                  Text("Type of leave",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.grey),textAlign: TextAlign.center,),
                  SizedBox(height: 45.0),
                  Text("No of days",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.grey),textAlign: TextAlign.start),
                  SizedBox(height: 45.0),
                  Text("Reason",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.grey),textAlign: TextAlign.start),
                  SizedBox(height: 45.0),
                  Text("Approver Name",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.grey),textAlign: TextAlign.start),
                  SizedBox(height: 45.0),
                ],
              ),
              const SizedBox(width: 35),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  const [
                    Text ("Loss of pay",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.black)),
                    SizedBox(height: 45.0),
                    Text(" 1d",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.black),textAlign: TextAlign.center),
                    SizedBox(height: 45.0),
                    Text("Unplanned Leave",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.black),textAlign: TextAlign.center),
                    SizedBox(height: 45.0),
                    Text("Giridharan V",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.black),textAlign: TextAlign.center),
                    SizedBox(height: 45.0),
                  ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
