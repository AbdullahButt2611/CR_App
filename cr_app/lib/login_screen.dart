// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, non_constant_identifier_names

import 'dart:convert';

import 'package:cr_app/forgot_password_screen.dart';
import 'package:cr_app/signup_screen.dart';
import 'package:cr_app/splash_screen.dart';
import 'package:cr_app/student_notification_screen.dart';
import 'package:cr_app/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Padding(

          padding: EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 0.0),
          child: Form(

            key: _formfield,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset(
                  "assets/images/logo_text.png",
                  height: 200,
                  width: 200,
                ),

                SizedBox(
                  height: 50.0,
                ),

                TextFormField(

                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,

                  decoration: InputDecoration(
                    labelText: "Official Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)
                  ),

                  validator: (value){

                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.toString());
                    
                    if(value!.isEmpty){
                      return "Enter Email";
                    }
                    else if(!emailValid){
                      return "Enter Valid Email";
                    }

                  },

                ),

                SizedBox(
                  height: 20.0,
                ),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passController,
                  obscureText: passToggle,                            // For Toggling the Hide Password
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),

                  validator: (value){

                    if(value!.isEmpty){
                      return "Enter Password";
                    }
                    else if(passController.text.length < 6){
                      return "Aleast 6 Characters Required";
                    }

                  },


                ),

                SizedBox(
                  height: 60.0,
                ),

                InkWell(
                  onTap: () async{
                    
                    if(emailController.text == "admin@uet" && passController.text == "admin12345")
                    {
                      Navigator.pop(context);
                      await storeActivity();
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(role: "Admin", id: "-1"),
                        )
                      );
                    }

                    if(_formfield.currentState!.validate()){
                      SignIn();
                      emailController.clear();
                      passController.clear();
                    }

                  },

                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.pink.shade500,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.cyan.shade900,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          )
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.pink.shade500,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                
                SizedBox(
                  height: 90.0,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Terms and Conditions",
                        style: TextStyle(
                            color: Colors.cyan.shade900,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          )
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.pink.shade500,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              
              ],

            ),
          ),
        ),
      ),
    );
  
  }
  
  Future SignIn() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passController.text.trim(),
      ).then((value) {
        storeActivity();
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => SplashScreen(),
          )
        );
      });

      
        
    }
    on FirebaseAuthException catch (e){
      Fluttertoast.showToast(
        msg: e.message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.shade900,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    };
  }
}


Future<void> storeActivity() async {
  // Asynchronous operations go here
  try {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listString = prefs.getString('activityList');
    DateTime now = DateTime.now();

    if (listString != null) {

      List<dynamic> decodedList = jsonDecode(listString);
      List<String> myList = List<String>.from(decodedList);
      myList.add(DateFormat('MMMM d, y hh:mm:ss a').format(now));
      String updatedListString = jsonEncode(myList);
      await prefs.setString('activityList', updatedListString);

    } else {

      List<String> newList = [DateFormat('MMMM d, y hh:mm:ss a').format(now)];
      String newListString = jsonEncode(newList);
      await prefs.setString('activityList', newListString);
    }
  } catch (e) {
    print("Failed to Load Shared Preferences");
  }
}
