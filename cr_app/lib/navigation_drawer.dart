// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cr_app/help.dart';
import 'package:cr_app/login_screen.dart';
import 'package:cr_app/main.dart';
import 'package:cr_app/manage_teachers.dart';
import 'package:cr_app/profileImageUpdate.dart';
import 'package:cr_app/shared_preferences.dart';
import 'package:cr_app/student_notification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NavigationDrawer extends StatelessWidget{

  NavigationDrawer({super.key, required this.role, required this.id});

  final String role;
  final String id;

  var user = FirebaseAuth.instance.currentUser;

  final  databaseStuRef = FirebaseDatabase.instance.ref('Student');
  
  
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
          
          // ====================     For Students    ==============================

          (role == "Student") ? StreamBuilder(
            stream: databaseStuRef.child(id).onValue,
            builder: (context, AsyncSnapshot snapshot){
            try{
                if(!snapshot.hasData)
                {
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData){

                  
                  Map<dynamic, dynamic> map = snapshot.data.snapshot.value;

                  return UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
      
                      color: Colors.cyan.shade600,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(30.0)
                      ),
            
                    ),
                    accountName: Text(map['fullName']), 
                    accountEmail: Text((user != null ? user!.email : "No Email").toString(),),
                    currentAccountPicture: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => ProfileImageUpdate(role: this.role, id: this.id,),
                          )
                        );
                      },
                      child: CircleAvatar(
                                
                        backgroundColor: Colors.cyan.shade200,
                        backgroundImage: NetworkImage("https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
                      
                      ),
                    ),
                  );
                }
                else{
                  Fluttertoast.showToast(
                    msg: "Something Went Wrong",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red.shade900,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  
                }
                  

                  

              }
              catch(e){
                return Padding(
                  padding: const EdgeInsets.only(top: 36.0),
                  child: Image.asset(
                    "assets/images/logo_text.png",
                    width: 150.0,
                    height: 150.0,
                  ),
                );
              }
              throw("Hey");
                
            },
    
            
          
          ) : 
          
          Padding(
            padding: const EdgeInsets.only(
              top: 25.0,
              bottom: 17.0,
            ),
            child: Image.asset(
              "assets/images/logo_text.png",
              height: 180,
              width: 180,
              color: Colors.cyan.shade200,
              
            ),
          ),
          
    
          (role == "Student") ? ListTile(
            focusColor: Colors.cyan.shade100,
            leading: Icon(Icons.notifications, color: Colors.white,),
            title: Text("Notifications", style: TextStyle(color: Colors.white),),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const StudentNotificationScreen(),
                )
              );
            },
          ) :
          SizedBox(),
    
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



          // =======================    For Admin  ==================================

          (role == "Admin") ? ListTile(
            leading: Icon(Icons.manage_accounts, color: Colors.white,),
            title: Text("Manage Teachers", style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const ManageTeachers(role: "Admin", id: "-1"),
                )
              );
            },
          ) :
          SizedBox(),







          // =======================    Same For All  ==================================
    
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
            onTap: (){
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => SharedPreference(),
                )
              );
            },
          ),
    
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.white,),
            title: Text("Help", style: TextStyle(color: Colors.white),),
            onTap: (){
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Help(role: this.role, id: this.id),
                )
              );
            },
          ),
    
          ListTile(
            leading: Icon(Icons.logout_outlined, color: Colors.white,),
            title: Text("Log Out", style: TextStyle(color: Colors.white),),
            onTap: (){
              // Navigator.pop(context);
              // Navigator.push(
              //   context, 
              //   MaterialPageRoute(
              //     builder: (context) => const StudentNotificationScreen(),
              //   )
              // );
              
              if(role == "Student"){
                FirebaseAuth.instance.signOut();
              }
              else if(role == "Admin"){
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  )
                );
              }

            },
          ),
    
        ],
    
      ),

    );
  }

}