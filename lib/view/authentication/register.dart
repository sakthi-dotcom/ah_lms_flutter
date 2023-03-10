import 'package:ah_lms/view/authentication/login.dart';
import "package:flutter/material.dart";
import '../../constant.dart';

void main() => runApp(const MaterialApp(
      home: Register(),
    ));

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }
  //creating global key uniquely identify the form widget,form key allows validate the form
  final GlobalKey<FormState> _formKey =   GlobalKey<FormState>();

  //creating txt controller and use to retrieve current value of textfield.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    //clean up the controller when widget is disposed.
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250.0,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/title.png",
                      width: 350.0
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  reg_title.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: nameController,
                  validator: (name){
                    if(name == null || name.isEmpty){
                      return "Please enter your name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      labelText: name,
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0)),
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: emailController,
                  validator: (email){
                    if(email == null || email.isEmpty){
                      return "Email is not empty";
                    }
                    else if(!email.contains("@") || !email.contains(".")){
                      return "Invalid email";
                    }
                    else if(!email.contains("augustahitech")){
                      return "Note:Only augusta domain email id's are allowed";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "abc@augustahitech.com",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      labelText: mail,
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0)),
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: passwordController,
                  validator: (password){
                    if(password == null || password.isEmpty){
                      return "Please fill your password";
                    }
                    else if(password.length < 8 ){
                      return "Password must contain 8 Characters";
                    }
                    return null;
                  },
                  obscureText: passwordVisible,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    labelText: password,
                    labelStyle: const TextStyle(color: Colors.grey, fontSize: 15.0),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: height * 0.08,
                  width: width - 30,
                  child: TextButton(
                    onPressed: () {
                     if(_formKey.currentState!.validate()){
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const LoginScreen())
                       );
                     }
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shadowColor: Colors.black,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)))),
                    child: const Text(
                      reg_title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    routeSignin,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        log_title,
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
