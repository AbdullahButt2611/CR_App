// ignore_for_file: prefer_const_constructors

// import 'dart:js';

import 'package:cr_app/add_teacher.dart';
import 'package:cr_app/navigation_drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final stuDatabaseReference = FirebaseDatabase.instance.ref("Student"); 

class CurrentSubjects extends StatefulWidget{

  const CurrentSubjects({super.key, required this.role, required this.id, required this.semester});

  final String role;
  final String id;
  final String semester;
  
  @override
  State<StatefulWidget> createState() => _CurrentSubjectsState();

}

class _CurrentSubjectsState  extends State<CurrentSubjects>{

  final ref = FirebaseDatabase.instance.ref("Subject");

  final searchFilter = TextEditingController();


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(

        foregroundColor: Colors.cyan.shade100,
        title: Text("Semester Subjects"),
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

      drawer: NavigationDrawer(role: widget.role, id: widget.id),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Center(
                child: Text(
                  "Semester Offered Subjects",
                  style: TextStyle(
                    color: Colors.pink.shade600,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchFilter,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    
                  });
                },
              ),
            ),

            SizedBox(
              height: 600.0,
              child: Padding(
                padding: const EdgeInsets.only(top:16.0, bottom: 58.0),
                child: FirebaseAnimatedList(
          
                  query: ref,
                  itemBuilder: ((context, snapshot, animation, index) {

                    final name = snapshot.child('name').value.toString();
                    final teacher = snapshot.child('teacher').value.toString();
                    final course_sem = snapshot.child('semester').value.toString();
                    final id = snapshot.child('id').value.toString();

                    if(course_sem == widget.semester){

                      if(searchFilter.text.isEmpty){

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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                            
                                        Text(
                                          snapshot.child('name').value.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24.0,
                                          ),
                                        ),
                            
                                        Text(
                                          snapshot.child('teacher').value.toString(),
                                          style: TextStyle(
                                            color: Colors.grey.shade100,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0,
                                          ),
                                        ),
                            
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );  

                      }
                      else if(name.toLowerCase().contains(searchFilter.text.toLowerCase())){

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
                                      snapshot.child('name').value.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.0,
                                      ),
                                    ),
                            
                                    Text(
                                      snapshot.child('teacher').value.toString(),
                                      style: TextStyle(
                                        color: Colors.grey.shade100,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0,
                                      ),
                                    ),
                            
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ); 

                      }else{
                        return Container();
                      }
                    }
                    else{
                      return Container();
                    }
                    
                    
                    
                  }),
                  
                ),
              ),
            ),
      
            
      
          ],
        ),
      ),

    );

  }


}


