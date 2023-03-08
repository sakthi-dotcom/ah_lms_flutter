import 'package:flutter/material.dart';
import 'package:ah_lms/sidebar.dart';
import 'package:ah_lms/constant.dart';

import '../../networks/api_service.dart';
import '../../networks/model.dart';

class AugustaHolidays extends StatefulWidget {
  const AugustaHolidays({Key? key}) : super(key: key);

  @override
  State<AugustaHolidays> createState() => _AugustaHolidaysState();
}

class _AugustaHolidaysState extends State<AugustaHolidays> {

  ProductDataModel? _productModel;
  bool dataLoaded = false;

  @override
  void initState() {
    _getData();
    super.initState();

  }

  void _getData() async {
    _productModel = (await ApiService().getUsers())!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {dataLoaded = true;}));
  }

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
          title: const Text('REST API Example'),
        ),
        body: dataLoaded == false || _productModel!.products.isEmpty
          ? const Center(
          child: CircularProgressIndicator(),
        )
            :ListView.builder(
          itemCount: _productModel!.products.length,
          itemBuilder: (context, index){
            return Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(_productModel!.products[index].id.toString()),
                      Text(_productModel!.products[index].price.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(_productModel!.products[index].brand),
                      Text(_productModel!.products[index].title),
                    ],
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }
}
