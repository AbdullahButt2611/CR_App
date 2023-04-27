// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cr_app/navigation_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{

  WelcomeScreen(
    {super.key, required this.role, required this.id}
  );

  final String role;
  final int id;

  var user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        foregroundColor: Colors.cyan.shade100,
        title: const Text("CR Application"),
        elevation: 10,
        backgroundColor: Colors.cyan.shade600, 

        shape: const RoundedRectangleBorder(

          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )

        ),

      ),

      body: Container(

        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(
              "assets/images/logo_text.png",
              width: 200.0,
              height: 200.0,
            ),

            SizedBox(height: 20.0,),

            Text(
              "$role Panel",
              style: TextStyle(
                color: Colors.pink.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            )

          ],
        ),

      ),

      drawer: NavigationDrawer(role: role, id: id),

      
    );
  }

}