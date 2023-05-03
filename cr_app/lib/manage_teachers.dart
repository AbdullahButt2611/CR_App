import 'package:cr_app/add_teacher.dart';
import 'package:cr_app/navigation_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageTeachers extends StatefulWidget{
  const ManageTeachers({super.key, required this.role, required this.id});

  final String role;
  final String id;
  
  @override
  State<StatefulWidget> createState() => _ManageTeachersState();

}

class _ManageTeachersState  extends State<ManageTeachers>{

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

    
    );

  }

}