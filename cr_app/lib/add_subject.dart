// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddSubject extends StatefulWidget{
  const AddSubject({super.key, required this.role, required this.id});

  final String role;
  final String id;

  
  @override
  State<StatefulWidget> createState() => _AddSubjectState();

}

class _AddSubjectState  extends State<AddSubject>{

  final _formfield = GlobalKey<FormState>();
  final databaseRef = FirebaseDatabase.instance.ref('Subject');

  final nameController = TextEditingController();
  final teacherController = TextEditingController();
  final sessionController = TextEditingController();
  final sectionController = TextEditingController();
  final semesterController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    bool passToggle = true;

    return Scaffold(

      appBar: AppBar(

        foregroundColor: Colors.cyan.shade100,
        title: const Text("Manage Subjects"),
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

      body: Container(
        
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 30.0,
          bottom: 10.0,
          left: 15.0,
          right: 15.0,
        ),
    
        child: Form(
          key: _formfield,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.only(bottom: 38.0),
                  child: Text(
                    "Subject Record",
                    style: TextStyle(
                      color: Colors.pink.shade600,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                    ),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text("Subject Name"),
                      prefixIcon: Icon(Icons.subject_rounded),
                      border: OutlineInputBorder(),
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool nameValid = RegExp(r'^[a-zA-Z0-9\s\-,]+$').hasMatch(value.toString());
                      
                      if(value!.isEmpty){
                        return "Enter Course Name";
                      }
                      else if(!nameValid){
                        return "Allowed: Alphabets, Numbers, Hyphen and Comma";
                      }

                    },

                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: teacherController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text("Tutor's Name"),
                      prefixIcon: Icon(Icons.personal_injury_sharp),
                      border: OutlineInputBorder(),
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool nameValid = RegExp(r"^[a-zA-Z\s\-']+").hasMatch(value.toString());
                      
                      if(value!.isEmpty){
                        return "Enter Teacher's Name";
                      }
                      else if(!nameValid){
                        return "Alphabets and Spaces Allowed";
                      }

                    },

                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: sessionController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text("Session"),
                      prefixIcon: Icon(Icons.numbers),
                      border: OutlineInputBorder(),
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool nameValid = RegExp(r'^\d{4}$').hasMatch(value.toString());
                        
                        if(value!.isEmpty){
                          return "Enter Offered Session";
                        }
                        else if(!nameValid){
                          return "Only 4 Digits Allowed";
                        }

                    },

                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: semesterController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Semester"),
                      prefixIcon: Icon(Icons.book_online_outlined),
                      border: OutlineInputBorder(),
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool regValid = RegExp(r'^[1-8]$').hasMatch(value.toString());
                      
                      if(value!.isEmpty){
                          return "Enter Semester Number";
                        }
                        else if(!regValid){
                          return "Only One Digit is Allowed";
                        }

                    },
                  ),
                ),
                          
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: sectionController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool emailValid = RegExp(r'^[a-zA-Z, ]+$').hasMatch(value.toString());
                      
                      if(value!.isEmpty){
                          return "Enter Sections Assigned";
                        }
                        else if(!emailValid){
                          return "Only Single Characters and Commas are Allowed";
                        }

                    },

                    // controller: controller.email,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text("Section Assigned"),
                      prefixIcon: Icon(Icons.pie_chart),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
               
                InkWell(
                  onTap: () {
                  
                    if(_formfield.currentState!.validate()){

                      String idAssigned = DateTime.now().millisecondsSinceEpoch.toString();
                      databaseRef.child(idAssigned).set({
                        'id': idAssigned,
                        'name': nameController.text.trim(),
                        'session': sessionController.text.trim(),
                        'teacher': teacherController.text.trim(),
                        'section': sectionController.text.trim(),
                        'semester': semesterController.text.trim(),
                      }).then((value){

                        Fluttertoast.showToast(
                          msg: "Subject Added Successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.cyan.shade500,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        
                        nameController.clear();
                        teacherController.clear();
                        sectionController.clear();
                        semesterController.clear();
                        sessionController.clear();

                        Navigator.of(context).pop();

                      }).onError((error, stackTrace){
                        Fluttertoast.showToast(
                          msg: error.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red.shade900,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      });
                    }
                    else{
                      Fluttertoast.showToast(
                        msg: "Check Your Inputs and Try Again",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red.shade900,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
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
                      "Add Subject",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

            ],
            ),
          ),
        ),
    
      ),

    
    );
  }

}