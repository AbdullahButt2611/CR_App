// ignore_for_file: prefer_const_constructors

// import 'dart:js';

import 'package:cr_app/add_teacher.dart';
import 'package:cr_app/navigation_drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ManageTeachers extends StatefulWidget{
  const ManageTeachers({super.key, required this.role, required this.id});

  final String role;
  final String id;
  
  @override
  State<StatefulWidget> createState() => _ManageTeachersState();

}

class _ManageTeachersState  extends State<ManageTeachers>{

  final ref = FirebaseDatabase.instance.ref("Teacher");
  final searchFilter = TextEditingController();

  final nameController = TextEditingController();
  final designController = TextEditingController();
  final domainController = TextEditingController();
  final contactController = TextEditingController();


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
              child: FirebaseAnimatedList(
          
                query: ref,
                itemBuilder: ((context, snapshot, animation, index) {

                  final name = snapshot.child('fullName').value.toString();
                  final designation = snapshot.child('designation').value.toString();
                  final domain = snapshot.child('domain').value.toString();
                  final contact = snapshot.child('contact').value.toString();
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

                                PopupMenuButton(
                                  icon: Icon(Icons.more_vert, color: Colors.white,),
                                  itemBuilder: (context) => [

                                    PopupMenuItem(
                                      value: 1,
                                      child: ListTile(
                                        onTap: (){
                                          Navigator.pop(context);
                                          showMyDialog(name, designation, domain,contact, id);
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

                  }else{
                    return Container();
                  }
                  
                  
                }),
                
              ),
            ),
      
            
      
          ],
        ),
      ),

    );

  }

  Future<void> showMyDialog(String name, String designation, String domain, String contact, String id) async{
    return showDialog(
      builder: (context){

        nameController.text = name;
        designController.text = designation;
        domainController.text = domain;
        contactController.text = contact;

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
                      "Update Teacher",
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

              ],
              ),
            ),
          ),
          actions: [
            
            InkWell(
                onTap: () {
                  ref.child(id).update({
                    'fullName': nameController.text.trim(),
                    'designation': designController.text.trim(),
                    'domain': domainController.text.trim(),
                    'contact': contactController.text.trim(),
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