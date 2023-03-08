import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ah_lms/sidebar.dart';
import 'package:ah_lms/constant.dart';
import '../../networks/api_service.dart';
import '../../networks/model.dart';
import '../leave_detail.dart';

class MyLeave extends StatefulWidget {
  const MyLeave({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyLeave> createState() => _MyLeaveState();
}

class _MyLeaveState extends State<MyLeave> {
  ProductDataModel? _productModel;
  bool dataLoaded = false;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    _productModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          dataLoaded = true;
        }));
  }

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
        body: dataLoaded == false || _productModel!.products.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _productModel!.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
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
                            child: ClipOval(
                                child: Image.asset("assets/avatar.png"))),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_productModel!.products[index].price
                                .toString()),
                            const SizedBox(height: 20.0),
                            Text(
                              _productModel!.products[index].discountPercentage
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LeaveDetail()));
                        },
                        title: Text(
                          _productModel!.products[index].title.toString(),
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              Text(
                                  _productModel!.products[index].brand
                                      .toString(),
                                  style: TextStyle(color: Colors.black),
                                  overflow: TextOverflow.ellipsis)
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
