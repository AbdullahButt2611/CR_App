// ignore_for_file: prefer_const_constructors

import 'package:cr_app/add_teacher.dart';
import 'package:cr_app/navigation_drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ManageTeachers extends StatefulWidget{
  const ManageTeachers({super.key, required this.role, required this.id});

  final String role;
  final String id;
  
  @override
  State<StatefulWidget> createState() => _ManageTeachersState();

}

class _ManageTeachersState  extends State<ManageTeachers>{

  final ref = FirebaseDatabase.instance.ref("Teacher");

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(

        foregroundColor: Colors.cyan.shade100,
        title: const Text("Manage Teachers"),
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

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const AddTeacher(role: "Admin", id: "-1"),
            )
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan.shade700,
      ),

      drawer: NavigationDrawer(role: "Admin", id: "-1"),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Center(
                child: Text(
                  "Teachers Records",
                  style: TextStyle(
                    color: Colors.pink.shade600,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(
              height: 600.0,
              child: FirebaseAnimatedList(
          
                query: ref,
                itemBuilder: ((context, snapshot, animation, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      shadowColor: Colors.grey.shade300,
                      elevation: 2.0,
                      color: Colors.cyan.shade700,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                      
                              Text(
                                snapshot.child('fullName').value.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0,
                                ),
                              ),
                      
                              Text(
                                snapshot.child('designation').value.toString(),
                                style: TextStyle(
                                  color: Colors.grey.shade100,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                ),
                              ),
                      
                              Text(
                                snapshot.child('email').value.toString(),
                                style: TextStyle(
                                  color: Colors.cyan.shade100,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                      
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                
              ),
            ),
      
            
      
          ],
        ),
      ),

    );

  }

}