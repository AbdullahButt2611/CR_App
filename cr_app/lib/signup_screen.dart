// ignore_for_file: prefer_const_constructors, dead_code, prefer_const_literals_to_create_immutables

import 'package:cr_app/login_screen.dart';
import 'package:cr_app/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget{
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  // final semesters = ["1", "2", "3", "4", "5", "6", "7", "8"];
  var _value = "-1";
  var _section = "-1";
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    
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
          key: _formKey,
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
                      controller.semester = v.toString();
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
                      controller.section = v.toString();
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.pie_chart),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    
                    // if(emailController.text == "admin@uet" && passController.text == "admin12345")
                    // {
                    //   Navigator.pop(context);
                    //   Navigator.push(
                    //     context, 
                    //     MaterialPageRoute(
                    //       builder: (context) => const WelcomeScreen(role: "Admin", id: -1),
                    //     )
                    //   );
                    // }

                    if(_formKey.currentState!.validate()){
                      SignUpController.instance.RegisterUser(controller.email.text.trim(), controller.password.text.trim());
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