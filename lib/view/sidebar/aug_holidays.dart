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
          title: const Text('Holidays List of 2023'),
        ),
        body: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text(
                  'Holiday',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Month',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Date',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Day',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ], rows: <DataRow>[

        ],
        )
      ),
    );
  }
}
