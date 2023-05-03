// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatefulWidget{
  const ForgotPasswordScreen({super.key});
  
  @override
  State<StatefulWidget> createState() => _ForgotPasswordScreen();

}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen>{

  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();


  @override
  Widget build(BuildContext context)  {
    
     return Scaffold(
      body: SingleChildScrollView(

        child: Padding(

          padding: EdgeInsets.only(left: 30, right: 30, top: 150, bottom: 0.0),
          child: Form(

            key: _formfield,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset(
                  "assets/images/logo_text.png",
                  height: 200,
                  width: 200,
                ),

                SizedBox(
                  height: 50.0,
                ),

                TextFormField(

                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,

                  decoration: InputDecoration(
                    labelText: "Official Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)
                  ),

                  validator: (value){

                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.toString());
                    
                    if(value!.isEmpty){
                      return "Enter Email";
                    }
                    else if(!emailValid){
                      return "Enter Valid Email";
                    }

                  },

                ),

                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton.icon(

                    onPressed: (){
                      if(_formfield.currentState!.validate()){
                        resetPassword();
                        emailController.clear();
                        Navigator.of(context).pop();
                      }
                    }, 
                    icon: Icon(Icons.email_outlined), 
                    label: Text("Reset Password", style: TextStyle(fontSize: 18.0),),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50.0),
                      alignment: Alignment.center,
                      backgroundColor: Colors.pink.shade500,
                      // shape: OutlinedBorder() ,
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


  Future resetPassword() async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());

      Fluttertoast.showToast(
        msg: "Reset Password Email Sent",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.cyan.shade600,
        textColor: Colors.white,
        fontSize: 16.0,
      );

    } on FirebaseAuthException catch(e){
      Fluttertoast.showToast(
        msg: e.message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.shade900,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  } 

}