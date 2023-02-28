import "package:ah_lms/login.dart";
import "package:flutter/material.dart";
import "constant.dart";

void main() => runApp(const MaterialApp(
      home: ForgotPass(),
    ));

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {

  GlobalKey <FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                decoration: const BoxDecoration(color: Colors.blueAccent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/title.png",
                      width: 350.0,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Center(
                child: Text(
                  forgot_pass.toUpperCase(),
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
                  controller: emailController,
                  validator: (email){
                    if(email == null || email.isEmpty){
                      return "Email can't be empty";
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
                      labelStyle:
                          TextStyle(color: Colors.grey, fontSize: 15.0)),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: SizedBox(
                  height: height *0.08,
                  width: width - 30,
                  child: TextButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()){
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
                        forgot_pass,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
