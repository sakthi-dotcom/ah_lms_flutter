import 'package:flutter/material.dart';
import 'constant.dart';
import 'sidebar/apply_leave.dart';
import 'sidebar/aug_family.dart';
import 'sidebar/aug_holidays.dart';
import 'sidebar/change_password.dart';
import 'sidebar/leave_request.dart';
import 'sidebar/logout.dart';
import 'sidebar/my_leave.dart';
import 'sidebar/profile.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // UserAccountsDrawerHeader(
          //   accountName: Text("Sakthivel K"),
          //   accountEmail: Text("sakthivel.karunanithi@augustahitech.com"),
          //   currentAccountPicture: CircleAvatar(
          //     child: ClipOval(
          //         child: Image.asset(
          //       "assets/avatar.png",
          //       width: 100.0,
          //       height: 100.0,
          //       fit: BoxFit.cover,
          //     )),
          //   ),
          // ),
          Container(
            height: 350.0,
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
                      style: TextStyle(
                        color: Colors.grey
                      ),
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
            leading: const Icon(Icons.leave_bags_at_home),
            title: const Text(my_leave),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyLeave()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.request_page),
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
            leading: const Icon(Icons.holiday_village),
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Logout()));
            },
          ),
        ],
      ),
    );
  }
}
