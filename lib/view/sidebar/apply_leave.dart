import 'package:flutter/material.dart';
import 'package:ah_lms/sidebar.dart';
import 'package:ah_lms/constant.dart';
import 'package:table_calendar/table_calendar.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({Key? key}) : super(key: key);

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {

  DateTime today = DateTime.now();
  String dropdownvalue = '';
  String dropdownvalue1 = '';
  var items = [
    'Earned Leave',
    'Loss of pay',
    'Maternity',
    'Paternity',
    'Medical Leave',
  ];
  var items1 = [
    'less than 1 day',
    'one or more than one day'
  ];


  void _onDaySelected(DateTime day, DateTime focusedDay,) {
    setState(() {
      today = day;
    });
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
          title: Text(app_leave),
        ),
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "To:",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10),
                  child: Text(
                    "cc:",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10),
                  child: Text(
                    "Leave type:",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ),
                 Padding(
                    padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                    ),
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      }
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10),
                  child: Text(
                    "Leave duration:",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items1.map((String _items) {
                        return DropdownMenuItem(
                          value: _items,
                          child: Text(_items),
                        );
                      }).toList(),
                      onChanged: (String? _newValue) {
                        setState(() {
                          dropdownvalue1 = _newValue!;
                        });
                      }
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10),
                  child: Text(
                    "Select date:",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10, right: 20.0),
                  child: TableCalendar(
                    locale: "en_US",
                    rowHeight: 45,
                    headerStyle: const HeaderStyle(
                        formatButtonVisible: false, titleCentered: true),
                    calendarStyle: const CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    onDaySelected: _onDaySelected,
                  ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
