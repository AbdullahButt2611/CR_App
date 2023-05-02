// ignore_for_file: prefer_const_constructors, dead_code, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cr_app/login_screen.dart';
import 'package:cr_app/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/scheduler.dart';

class SignUpScreen extends StatefulWidget{
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final controller = Get.put(SignUpController());
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  // final semesters = ["1", "2", "3", "4", "5", "6", "7", "8"];
  var _value = "-1";
  var _section = "-1";
  bool passToggle = true;

  final  databaseRef = FirebaseDatabase.instance.ref('Student');
  final bool loading = false;


  @override
  Widget build(BuildContext context) {

    Future SignUp() async{
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: controller.email.text.trim(), 
          password: controller.password.text.trim(),
        );

        if(FirebaseAuth.instance.currentUser!=null){
          final User user = FirebaseAuth.instance.currentUser as User;
          final uid = user.uid;

          // DateTime.now().millisecondsSinceEpoch.toString()
          databaseRef.child(uid).set({

            'fullName': controller.fullName.text.trim(), 
            'regNo': controller.regdNo.text.trim(), 
            'semester': int.parse(controller.semester.toString()), 
            'profilePicture': '', 
            'section': controller.section.toString(), 
            'session': controller.session.text.trim(),
            'id': uid, 
            
          }).then((value){

            Fluttertoast.showToast(
              msg: "User Added Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );

            // Removing all the text from inpt boxes and moving the user to login screen
            controller.fullName.clear();
            controller.regdNo.clear();
            controller.email.clear();
            controller.password.clear();
            controller.session.clear();
            Navigator.of(context).pop();

          }).onError((error, stackTrace){
            Fluttertoast.showToast(
              msg: error.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          });

        }
      }
      on FirebaseAuthException catch (e){
        print(e);

        // AwesomeDialog(
        //   context: context, 
        //   dialogType: DialogType.error,
        //   animType: AnimType.scale,
        //   showCloseIcon: true,
        //   title: e.code,
        //   desc: e.message,
        //   btnCancelOnPress: (){},
        //   btnOkOnPress: (){},

        // ).show();

        Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );

      };
    }
    
    return Scaffold(
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
            padding: EdgeInsets.only(top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
          
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Image.asset
                  (
                    "assets/images/logo_text.png",
                    width: 130.0,
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: controller.fullName,
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
                    controller: controller.regdNo,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text("Registration Number"),
                      prefixIcon: Icon(Icons.credit_card),
                      border: OutlineInputBorder(),
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool regValid = RegExp(r'^\d{4}-[A-Z]{2,3}-\d{1,3}$').hasMatch(value.toString());
                      
                      if(value!.isEmpty){
                        return "Enter Your Registration Number";
                      }
                      else if(!regValid){
                        return "Pattern: 2020-CS-00";
                      }

                    },
                  ),
                ),
          
                Padding(
                  
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: DropdownButtonFormField(
                    
                    style: TextStyle(color: Colors.black54, fontSize: 16.0),
                    icon: Icon(Icons.arrow_drop_down_circle),
                    iconEnabledColor: Colors.cyan.shade900,
                    value: _value,
                    items: [
          
                      DropdownMenuItem(
                        value: "-1",
                        child: Text("- Select Your Semester -"), 
                      ),
                      DropdownMenuItem(
                        value: "1",
                        child: Text("First"), 
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text("Second"), 
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Text("Third"), 
                      ),
                      DropdownMenuItem(
                        value: "4",
                        child: Text("Fourth"), 
                      ),
                      DropdownMenuItem(
                        value: "5",
                        child: Text("Fifth"), 
                      ),
                      DropdownMenuItem(
                        value: "6",
                        child: Text("Sixth"), 
                      ),
                      DropdownMenuItem(
                        value: "7",
                        child: Text("Seventh"), 
                      ),
                      DropdownMenuItem(
                        value: "8",
                        child: Text("Eighth"), 
                      ),
                      
                      
                    ],
                    onChanged: (v){
                      _value = v.toString();
                      if(_value == "-1")
                      {
                        Fluttertoast.showToast(
                          msg: "Please Choose A Valid Semester",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red.shade900,
                          textColor: Colors.white,
                          fontSize: 16.0,
                          
                        );
                      }
                      else{
                        controller.semester = v.toString();
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.cast_for_education),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
          
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.toString());
                      bool formatValid = RegExp(r'^\d{4}[a-zA-Z]{2}\d{1,3}@student\.uet\.edu\.pk$').hasMatch(value.toString());
                      
                      if(value!.isEmpty){
                        return "Enter Email";
                      }
                      else if(!emailValid){
                        return "Enter Valid Email";
                      }
                      else if(!formatValid){
                        return "Enter Official Email";
                      }

                    },

                    controller: controller.email,
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

                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){

                        if(value!.isEmpty){
                          return "Enter Password";
                        }
                        else if(controller.password.text.length < 6){
                          return "Aleast 6 Characters Required";
                        }

                      },

                      controller: controller.password,
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
                              passToggle ? Icons.visibility : Icons.visibility_off),
                        ),
                      ),
          
          
                    ),
                  ),

                  
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(

                    controller: controller.session,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Session"),
                      prefixIcon: Icon(Icons.numbers),
                      border: OutlineInputBorder(),
                    ),

                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (value){

                      bool sessionValid = RegExp(r'^\d{4}$').hasMatch(value.toString());
                      
                      if(value!.isEmpty){
                        return "Enter Session";
                      }
                      else if(!sessionValid){
                        return "Enter 4 Digit Session";
                      }

                    },
                  ),
                ),


                Padding(
                  
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: DropdownButtonFormField(
                    
                    style: TextStyle(color: Colors.black54, fontSize: 16.0),
                    icon: Icon(Icons.arrow_drop_down_circle),
                    iconEnabledColor: Colors.cyan.shade900,
                    value: _section,
                    items: [
          
                      DropdownMenuItem(
                        value: "-1",
                        child: Text("- Select Your Section -"), 
                      ),
                      DropdownMenuItem(
                        value: "A",
                        child: Text("A"), 
                      ),
                      DropdownMenuItem(
                        value: "B",
                        child: Text("B"), 
                      ),
                      DropdownMenuItem(
                        value: "C",
                        child: Text("C"), 
                      ),
                      DropdownMenuItem(
                        value: "D",
                        child: Text("D"), 
                      ),
                      
                    ],
                    onChanged: (v){
                      _section = v.toString();
                      if(_section == "-1")
                      {
                        Fluttertoast.showToast(
                          msg: "Please Choose A Valid Section",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red.shade900,
                          textColor: Colors.white,
                          fontSize: 16.0,
                          
                        );
                      }
                      else{
                        controller.section = v.toString();
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.pie_chart),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                  
                    if(_formfield.currentState!.validate() && _value != "-1" && _section != "-1"){
                      SignUp();
                    }
                    else{
                      Fluttertoast.showToast(
                        msg: "Check Your Inputs and Try Again",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.cyan.shade600,
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
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.cyan.shade900,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          )
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.pink.shade500,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
          
                
          
              ],
            ),
          ),
        ),
    
      ),
    );

    
    
    
  }
}