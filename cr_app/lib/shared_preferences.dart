// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:math';

import 'package:cr_app/navigation_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class SharedPreference extends StatefulWidget{
  const SharedPreference({super.key});

  @override
  State<StatefulWidget> createState() => _SharedPreferenceState();

}

class _SharedPreferenceState extends State<SharedPreference>{

  List<String> myList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listString = prefs.getString('activityList');

    if (listString != null) {
      List<dynamic> decodedList = jsonDecode(listString);
      myList = List<String>.from(decodedList);
    } else {
      print('List not found in SharedPreferences');
    }
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        foregroundColor: Colors.cyan.shade100,
        title: const Text("Recent Login Activity"),
        elevation: 10,
        backgroundColor: Colors.cyan.shade600,

        actions: <Widget>[
          Container(
            child: Image.asset('assets/images/logo.png'),
          ),
        ], 

        shape: const RoundedRectangleBorder(

          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )

        ),

      ),

      drawer: NavigationDrawer(role: "Admin", id: "-1"),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: myList.length, 
                itemBuilder: (BuildContext context, int index){
                  final reversedList = myList.reversed.toList();
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 30.0),
                    decoration: BoxDecoration(
                      color: Colors.cyan.shade900,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      reversedList[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  );
                },
              ),
            ),
            // ...myList.map((text) => Text(text)).toList(),
            
          ],
        ),
      ),

    );
  }
  
}