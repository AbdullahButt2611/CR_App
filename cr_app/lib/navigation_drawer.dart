// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cr_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDrawer extends StatelessWidget{

  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30)),
      ),
      elevation: 10.0,
      backgroundColor: Colors.cyan.shade900,
      child: ListView(

        padding: EdgeInsets.zero,
        children: [

          UserAccountsDrawerHeader(

            decoration: BoxDecoration(

              color: Colors.cyan.shade600,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topRight: Radius.circular(30.0)
              ),

            ),
            accountName: Text("Abdullah Butt"), 
            accountEmail: Text("2020cs63@student.uet.edu.pk"),
            currentAccountPicture: CircleAvatar(

              backgroundColor: Colors.cyan.shade200,
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
            
            ),
          
          ),

          ListTile(
            focusColor: Colors.cyan.shade100,
            leading: Icon(Icons.notifications, color: Colors.white,),
            title: Text("Notifications", style: TextStyle(color: Colors.white),),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
                )
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.calendar_month, color: Colors.white,),
            title: Text("Attendance", style: TextStyle(color: Colors.white),),
          ),

          ListTile(
            leading: Icon(Icons.menu_book_sharp, color: Colors.white,),
            title: Text("Current Subjects", style: TextStyle(color: Colors.white),),
          ),

          ListTile(
            leading: Icon(Icons.history_edu_rounded, color: Colors.white,),
            title: Text("Subject History", style: TextStyle(color: Colors.white),),
          ),

          ListTile(
            leading: Icon(Icons.view_timeline_outlined, color: Colors.white,),
            title: Text("Time Table", style: TextStyle(color: Colors.white),),
          ),

          ListTile(
            leading: Icon(Icons.account_circle, color: Colors.white,),
            title: Text("Account Settings", style: TextStyle(color: Colors.white),),
          ),

          ListTile(
            leading: Icon(Icons.privacy_tip_outlined, color: Colors.white,),
            title: Text("Privacy Policy", style: TextStyle(color: Colors.white),),
          ),

          ListTile(
            leading: Icon(Icons.settings, color: Colors.white,),
            title: Text("App Settings", style: TextStyle(color: Colors.white),),
          ),

          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.white,),
            title: Text("Help", style: TextStyle(color: Colors.white),),
          ),

          ListTile(
            leading: Icon(Icons.logout_outlined, color: Colors.white,),
            title: Text("Log Out", style: TextStyle(color: Colors.white),),
          ),

        ],

      )

    );
  }

}