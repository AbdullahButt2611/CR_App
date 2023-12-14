// ignore_for_file: prefer_const_constructors

// import 'dart:js';

import 'package:cr_app/add_subject.dart';
import 'package:cr_app/add_teacher.dart';
import 'package:cr_app/navigation_drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ManageSubjects extends StatefulWidget{
  const ManageSubjects({super.key});
  
  @override
  State<StatefulWidget> createState() => _ManageSubjectsState();

}

class _ManageSubjectsState  extends State<ManageSubjects>{

  final ref = FirebaseDatabase.instance.ref("Subject");
  final searchFilter = TextEditingController();

  final nameController = TextEditingController();
  final teacherController = TextEditingController();
  final sessionController = TextEditingController();
  final sectionController = TextEditingController();
  final semesterController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    
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

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const AddSubject(role: "Admin", id: "-1"),
            )
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan.shade300,
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
                  "Subjects Records",
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
                    final session = snapshot.child('session').value.toString();
                    final teacher = snapshot.child('teacher').value.toString();
                    final semester = snapshot.child('semester').value.toString();
                    final section = snapshot.child('section').value.toString();
                    final id = snapshot.child('id').value.toString();
                    
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
                          
                                      Text(
                                        'Semester ' + snapshot.child('semester').value.toString() + '  -  ' + snapshot.child('session').value.toString() + ' (' + snapshot.child('section').value.toString() + ')',
                                        style: TextStyle(
                                          color: Colors.cyan.shade100,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                        ),
                                      ),
                          
                                    ],
                                  ),

                                  PopupMenuButton(
                                    icon: Icon(Icons.more_vert, color: Colors.white,),
                                    itemBuilder: (context) => [

                                      PopupMenuItem(
                                        value: 1,
                                        child: ListTile(
                                          onTap: (){
                                            Navigator.pop(context);
                                            showMyDialog(name, teacher,session, section, semester, id);
                                          },
                                          leading: Icon(Icons.edit),
                                          title: Text("Edit"),
                                        ),
                                      ),

                                      PopupMenuItem(
                                        value: 2,
                                        onTap: (){
                                          ref.child(id).remove();
                                        },
                                        child: ListTile(
                                          leading: Icon(Icons.delete_outline),
                                          title: Text("Delete"),
                                        ),
                                      ),

                                    ]
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
                          
                                      Text(
                                        'Semester ' + snapshot.child('semester').value.toString() + '  -  ' + snapshot.child('session').value.toString() + ' (' + snapshot.child('section').value.toString() + ')',
                                        style: TextStyle(
                                          color: Colors.cyan.shade100,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                        ),
                                      ),
                          
                                    ],
                                  ),

                                  PopupMenuButton(
                                    icon: Icon(Icons.more_vert, color: Colors.white,),
                                    itemBuilder: (context) => [

                                      PopupMenuItem(
                                        value: 1,
                                        child: ListTile(
                                          onTap: (){
                                            Navigator.pop(context);
                                            showMyDialog(name, teacher,session, section, semester, id);
                                          },
                                          leading: Icon(Icons.edit),
                                          title: Text("Edit"),
                                        ),
                                      ),

                                      PopupMenuItem(
                                        value: 2,
                                        onTap: (){
                                          ref.child(id).remove();
                                        },
                                        child: ListTile(
                                          leading: Icon(Icons.delete_outline),
                                          title: Text("Delete"),
                                        ),
                                      ),

                                    ]
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
                    
                    
                  }),
                  
                ),
              ),
            ),
      
            
      
          ],
        ),
      ),

    );

  }

  Future<void> showMyDialog(String name, String teacher, String session, String section, String semester ,String id) async{
    return showDialog(
      builder: (context){

        nameController.text = name;
        teacherController.text = teacher;
        sessionController.text = session;
        sectionController.text = section;
        semesterController.text = semester;

        return AlertDialog(
          // title: Text("Update"),
          content: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(bottom: 38.0),
                    child: Text(
                      "Update Subject",
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
                        prefixIcon: Icon(Icons.person_outline_rounded),
                        border: OutlineInputBorder(),
                      ),

                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      validator: (value){

                        bool nameValid = RegExp(r'^[a-zA-Z]+([ ][a-zA-Z]+)?([ ][a-zA-Z]+)?$').hasMatch(value.toString());
                        
                        if(value!.isEmpty){
                          return "Enter Proper Name of Subject";
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
                      controller: teacherController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: Text("Teacher Name"),
                        prefixIcon: Icon(Icons.personal_injury),
                        border: OutlineInputBorder(),
                      ),

                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      validator: (value){

                        bool nameValid = RegExp(r'^[a-zA-Z]+([ ][a-zA-Z]+)?([ ][a-zA-Z]+)?$').hasMatch(value.toString());
                        
                        if(value!.isEmpty){
                          return "Enter Teacher's Name";
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

                        bool nameValid = RegExp(r'^[1-8]$').hasMatch(value.toString());
                        
                        if(value!.isEmpty){
                          return "Enter Semester Number";
                        }
                        else if(!nameValid){
                          return "Only One Digit is Allowed";
                        }

                      },

                    ),
                  ),
            
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextFormField(
                      controller: sectionController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: Text("Section Assigned"),
                        prefixIcon: Icon(Icons.contact_phone_outlined),
                        border: OutlineInputBorder(),
                      ),

                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      validator: (value){

                        bool regValid = RegExp(r'^[a-zA-Z, ]+$').hasMatch(value.toString());
                        
                        if(value!.isEmpty){
                          return "Enter Sections Assigned";
                        }
                        else if(!regValid){
                          return "Only Single Characters and Commas are Allowed";
                        }

                      },
                    ),
                  ),

              ],
              ),
            ),
          ),
          actions: [
            
            InkWell(
                onTap: () {
                  ref.child(id).update({
                    'name': nameController.text.trim(),
                    'teacher': teacherController.text.trim(),
                    'semester': semesterController.text.trim(),
                    'session': sessionController.text.trim(),
                    'section': sectionController.text.trim(),
                  }).then((value){

                    Fluttertoast.showToast(
                      msg: "Updated Successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );

                  }).onError((error, stackTrace) {
                    Fluttertoast.showToast(
                      msg: error.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red.shade900,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  });
                  Navigator.pop(context);
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
                    "Update",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    
                  },

                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.cyan.shade700,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      "Canel",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ),
          ],
        );

      },
      context: this.context,
      

    );
  }



}