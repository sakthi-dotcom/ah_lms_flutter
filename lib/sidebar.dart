import 'package:ah_lms/view/authentication/login.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'view/sidebar/apply_leave.dart';
import 'view/sidebar/aug_family.dart';
import 'view/sidebar/aug_holidays.dart';
import 'view/sidebar/change_password.dart';
import 'view/sidebar/leave_request.dart';
import 'view/sidebar/my_leave.dart';
import 'view/sidebar/profile.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool _isShown = true;

  void _delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text(
              'Are you sure want to logout ?',
              style: TextStyle(
                  color: Colors.grey
              ),
            ),
            actions: [

              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.blueAccent),
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 360.0,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: const [
                  Image(
                    image: AssetImage("assets/title.png"),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      "Sakthivel K",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.send),
            title: const Text(
              app_leave,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ApplyLeave()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month_outlined),
            title: const Text(my_leave),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyLeave(
                            title: "Sakthivel K",
                          )));
            },
          ),
          ListTile(
            leading: const Icon(Icons.alternate_email),
            title: const Text(lev_req),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LeaveRequest()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text(Aug_fam),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AugustaFamily()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.holiday_village_outlined),
            title: const Text(holidays),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AugustaHolidays()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(profile),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.key),
            title: const Text(
              chg_password,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePassword()));
            },
          ),
          ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                logout,
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                _delete(context);

              }
          ),
        ],
      ),
    );
  }
}
