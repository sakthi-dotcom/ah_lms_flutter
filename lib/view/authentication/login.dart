import "package:ah_lms/constant.dart";
import "package:ah_lms/dashboard.dart";
import "package:ah_lms/forgotpass.dart";
import "package:flutter/material.dart";
import 'register.dart';

void main() =>
    runApp(const MaterialApp(
      home: LoginScreen(),
    ));

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    //clean up the controller when widget is disposed.
    emailController.dispose();
    passwordController.dispose();
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                      width: 350.0,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      slogan,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text('Login',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: <Color>[
                              Colors.black,
                              Colors.blueAccent,
                            ],
                          ).createShader(
                              const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0)))),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: emailController,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return "Please enter Email";
                    }
                    else if (!email.contains("@") || !email.contains(".")) {
                      return "Please enter a valid email address";
                    }
                    else if (!email.contains("augustahitech")) {
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
                    prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                    labelText: mail,
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: passwordController,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return "Please enter your password";
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
                    prefixIcon: const Icon(Icons.lock_open, color: Colors.blueAccent),
                    labelText: password,
                    labelStyle: const TextStyle(color: Colors.grey, fontSize: 13.0),
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPass()));
                  },
                  child: const Text(
                    "Forgot your Password ?",
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline),
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
                      // if (formKey.currentState!.validate()) {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => const Dashboard()
                      //       )
                      //   );
                      // }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()
                          )
                      );
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shadowColor: Colors.black,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                10)))),
                    child: const Text(
                      "SIGN IN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Register())
                        );
                      },
                      child: const Text(
                        "Sign up",
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
