// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cr_app/main.dart';
import 'package:flutter/material.dart';

class StudentNotificationScreen extends StatelessWidget{

  const StudentNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(

        foregroundColor: Colors.cyan.shade100,
        title: const Text("Application"),
        elevation: 10,
        backgroundColor: Colors.cyan.shade600,

        leading: Container(
          child: Image.asset('assets/images/logo.png'),
        ),

        shape: const RoundedRectangleBorder(

          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )

        ),

      ),

      body: Center(
        child: 
        ElevatedButton(

          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
              )
            );
          },

          child: Text("Touch Me"),

        ),
      ),

    );

  }


}