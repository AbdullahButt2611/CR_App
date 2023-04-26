// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:cr_app/login_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

  // Using Timer Class to Activate the Next Screen After Two seconds of the splash screen
    Timer(Duration(seconds: 4), ()=>{


      // Push Replacement is used because we dont want the splash screen to remain in the stack 
      // i.e: The back button shouldn't work to take us back to splash screen so the new entry shall 
      // be replaced with the previous entry
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()))


    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Container(
        color: Colors.cyan.shade100,
        child: Center(

          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image(image: AssetImage("assets/images/logo_text.png"), width: 200),

                SizedBox(
                  height: 50,
                ),

                SpinKitChasingDots(
                  color: Colors.cyan.shade300,
                  size: 30.0,
                ),

              ],
            ),
          )

        ),
      ),

    );
  }
}