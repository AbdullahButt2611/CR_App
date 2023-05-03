// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTeacher extends StatefulWidget{
  const AddTeacher({super.key, required this.role, required this.id});

  final String role;
  final String id;

  
  @override
  State<StatefulWidget> createState() => _AddTeacherState();

}

class _AddTeacherState  extends State<AddTeacher>{

  final _formfield = GlobalKey<FormState>();
  final databaseRef = FirebaseDatabase.instance.ref('Teacher');

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  final designController = TextEditingController();
  final domainController = TextEditingController();
  final contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    bool passToggle = true;

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
                    "Teacher Record",
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
                      label: Text("Full Name"),
                      prefixIcon: Icon(Icons.person_outline_rounded),
                      border: OutlineInputBorder(),
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool nameValid = RegExp(r'^[a-zA-Z]+([ ][a-zA-Z]+)?([ ][a-zA-Z]+)?$').hasMatch(value.toString());
                      
                      if(value!.isEmpty){
                        return "Enter Your Full Name";
                      }
                      else if(!nameValid){
                        return "Only alphabets and spaces are allowed";
                      }

                    },

                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: designController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text("Designation"),
                      prefixIcon: Icon(Icons.alternate_email_rounded),
                      border: OutlineInputBorder(),
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool nameValid = RegExp(r'^[a-zA-Z]+([ ][a-zA-Z]+)?([ ][a-zA-Z]+)?$').hasMatch(value.toString());
                      
                      if(value!.isEmpty){
                        return "Enter Your Designation";
                      }
                      else if(!nameValid){
                        return "Only alphabets and spaces are allowed";
                      }

                    },

                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: domainController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text("Domain"),
                      prefixIcon: Icon(Icons.domain),
                      border: OutlineInputBorder(),
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool nameValid = RegExp(r'^[a-zA-Z]+([ ][a-zA-Z]+)?([ ][a-zA-Z]+)?$').hasMatch(value.toString());
                      
                      if(value!.isEmpty){
                        return "Enter Your Domain of Concern";
                      }
                      else if(!nameValid){
                        return "Only alphabets and spaces are allowed";
                      }

                    },

                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: contactController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Contact Number"),
                      prefixIcon: Icon(Icons.contact_phone_outlined),
                      border: OutlineInputBorder(),
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool regValid = RegExp(r'^\d{11}$').hasMatch(value.toString());
                      
                      if(value!.isEmpty){
                        return "Enter Your Contact Number";
                      }
                      else if(!regValid){
                        return "Contact should be 11 Digits Long";
                      }

                    },
                  ),
                ),
                          
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool emailValid = RegExp(r"^\w+@uet\.com$").hasMatch(value.toString());
                      
                      if(value!.isEmpty){
                        return "Enter Email";
                      }
                      else if(!emailValid){
                        return "Patten: abc123@uet.com";
                      }

                    },

                    // controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text("Official Email"),
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(

                    controller: passController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){

                      if(value!.isEmpty){
                        return "Enter Password";
                      }
                      else if(passController.text.length < 6){
                        return "Aleast 6 Characters Required";
                      }

                    },

                    // controller: controller.password,
                    keyboardType: TextInputType.emailAddress,
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
                          passToggle ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
        
        
                  ),
                ),


                InkWell(
                  onTap: () {
                  
                    if(_formfield.currentState!.validate()){

                      String idAssigned = DateTime.now().millisecondsSinceEpoch.toString();
                      databaseRef.child(idAssigned).set({
                        'id': idAssigned,
                        'fullName': nameController.text.trim(),
                        'designation': designController.text.trim(),
                        'domain': domainController.text.trim(),
                        'contact': contactController.text.trim(),
                        'email': emailController.text.trim(),
                        'password': passController.text.trim(),
                      }).then((value){

                        Fluttertoast.showToast(
                          msg: "Teacher Added Successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.cyan.shade500,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        
                        nameController.clear();
                        designController.clear();
                        domainController.clear();
                        contactController.clear();
                        emailController.clear();
                        passController.clear();

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
                      "Add Teacher",
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