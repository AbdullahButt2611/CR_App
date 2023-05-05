import 'dart:math';

import 'package:cr_app/navigation_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatefulWidget{
  const SharedPreference({super.key});

  @override
  State<StatefulWidget> createState() => _SharedPreferenceState();

}

class _SharedPreferenceState extends State<SharedPreference>{

  String name='';
  int age=0;
  double lucky=0.0;
  bool isLogged=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    name = sp.getString('string') ?? '';
    age = sp.getInt('number') ?? 0;
    lucky = sp.getDouble('Lucky Number') ?? 0.0;
    isLogged = sp.getBool('isVerified') ?? false;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        foregroundColor: Colors.cyan.shade100,
        title: const Text("Shared Preferences"),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(name.toString()),
            Text(age.toString()),
            Text(lucky.toString()),
            Text(isLogged.toString()),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (() async{
          SharedPreferences sp = await SharedPreferences.getInstance();

          sp.setInt('number', int.parse((Random().nextInt(100) + 50).toString()));
          sp.setDouble('Lucky Number', double.parse((Random().nextDouble() * 256).toString()));
          sp.setString('string', 'Abdullah Butt');
          sp.setBool('isVerified', false);

          name = sp.getString('string').toString();

          setState(() {
            
          });
        }),
        child: Icon(Icons.add),
      ),

    );
  }
  
}