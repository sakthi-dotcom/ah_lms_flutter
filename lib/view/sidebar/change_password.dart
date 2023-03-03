import 'package:flutter/material.dart';
import 'package:ah_lms/sidebar.dart';
import 'package:ah_lms/constant.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool passwordVisible1 = false;
  bool passwordVisible2 = false;
  bool passwordVisible3 = false;

  @override
  void initState() {
    super.initState();
    passwordVisible1 = true;
    passwordVisible2 = true;
    passwordVisible3 = true;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final cnfPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    //clean up the controller when widget is disposed.
    currentPasswordController.dispose();
    newPasswordController.dispose();
    cnfPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return  WillPopScope(
    onWillPop: ()
    async {
      return false;
    },
    child:Scaffold(
      backgroundColor: Colors.white,
      drawer:  SideBar(),
      appBar: AppBar(
        title:  const Text(
            chg_password
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding:  const EdgeInsets.only(top: 150),
            child: Center(
              child: Column(
               children: [
                  const Text("Change Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.black)),
                 const SizedBox(height: 30.0),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 10.0),
                   child: TextFormField(
                     controller: currentPasswordController,
                     validator: (pass){
                       if( pass == null || pass.isEmpty){
                         return "Current password can't be empty";
                       }
                       return null;
                     },
                     obscureText: passwordVisible1,
                     obscuringCharacter: "*",
                     decoration:  InputDecoration(
                       border: const OutlineInputBorder(),
                       enabledBorder: const OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.grey)
                       ),
                       focusedBorder:const OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.blueAccent),
                       ),
                       suffixIcon: IconButton( icon: Icon(passwordVisible1
                           ? Icons.visibility
                           : Icons.visibility_off),
                         onPressed: () {
                           setState(() {
                             passwordVisible1 = !passwordVisible1;
                           });
                         },
                       ),
                       labelText: cur_password,
                       labelStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
                     ),
                   ),
                 ),
                 Padding(
                   padding:  EdgeInsets.only(top: 15.0,left: 10.0,right: 10.0),
                   child: TextFormField(
                     controller: newPasswordController,
                     validator: (newpass){
                       if( newpass == null || newpass.isEmpty){
                         return "New password can't be empty";
                       }
                       return null;
                     },
                     obscureText: passwordVisible2,
                     obscuringCharacter: "*",
                     decoration:  InputDecoration(
                       border: OutlineInputBorder(),
                       enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.grey)
                       ),
                       focusedBorder:OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.blueAccent),
                       ),
                       suffixIcon: IconButton(
                         icon: Icon(passwordVisible2
                         ?Icons.visibility
                             :Icons.visibility_off),
                         onPressed: (){
                           setState(() {
                             passwordVisible2 = !passwordVisible2;
                           });
                         },
                       ),
                       labelText: new_password,
                       labelStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
                       ),
                   ),
                   ),
                 Padding(
                   padding:  EdgeInsets.only(top: 15.0,left: 10.0,right: 10.0),
                   child: TextFormField(
                     controller: cnfPasswordController,
                     validator: (cnfPass){
                       if( cnfPass == null || cnfPass.isEmpty){
                         return "Confirm password can't be empty";
                       }
                       return null;
                     },
                     obscuringCharacter: "*",
                     obscureText: passwordVisible3,
                     decoration:  InputDecoration(
                       border: OutlineInputBorder(),
                       enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.grey)
                       ),
                       focusedBorder:OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.blueAccent),
                       ),
                       suffixIcon: IconButton(
                         icon: Icon(passwordVisible3
                             ?Icons.visibility
                             :Icons.visibility_off),
                         onPressed: (){
                           setState(() {
                             passwordVisible3 = !passwordVisible3;
                           });
                         },
                       ),
                       labelText: cnf_password,
                       labelStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
                     ),
                   ),
                 ),
                 SizedBox(height: 25.0),
                 Center(
                   child: SizedBox(
                     height: height * 0.08,
                     width: width - 20,
                     child: TextButton(
                       onPressed: () {
                         if(formKey.currentState!.validate()){

                         }
                       },
                       style: TextButton.styleFrom(
                           backgroundColor: Colors.blueAccent,
                           shadowColor: Colors.black,
                           elevation: 5,
                           shape: const RoundedRectangleBorder(
                               borderRadius: BorderRadius.all(Radius.circular(
                                   10)))),
                       child: const Text(
                         "Change Password",
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 20.0,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}
