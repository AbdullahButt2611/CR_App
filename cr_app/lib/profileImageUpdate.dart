// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileImageUpdate extends StatefulWidget{

  const ProfileImageUpdate({super.key, required this.role, required this.id});

  final String role;
  final String id;

  @override
  State<StatefulWidget> createState() => _ProfileImageUpdateState();
    
}

class _ProfileImageUpdateState  extends State<ProfileImageUpdate>{

  File? _image; 
  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  final refDatabase = FirebaseDatabase.instance.ref("Student");

  Future<String> fetchData() async {
    return widget.id;
  }


  Future getGalleryImage() async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    setState(() {
      // Iff user opens the gallery and do chose the image
      if(pickedFile != null){
        _image = File(pickedFile.path);
      }else{
        // If no image was chosen after opening the gallery
        Fluttertoast.showToast(
          msg: "No Image Selected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.shade900,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    });

    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        foregroundColor: Colors.cyan.shade100,
        title: const Text("Upload Profile Picture"),
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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            color: Colors.cyan.shade900,
            height: 420.0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  _image != null ?

                  SizedBox(
                    height: 200.0,
                    width: 200.0,
                    child: Image.file(_image!.absolute))
                  
                  
                  : Icon(
                    Icons.cloud_upload,
                    color: Colors.cyan.shade100,
                    size: 130.0,
                    
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      "Please select your",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Text(
                    "PROFILE PICTURE",
                    style: TextStyle(
                      color: Colors.cyan.shade100,
                      fontWeight: FontWeight.w900,
                      fontSize: 28.0,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 28.0, right: 28.0),
                    child: Text(
                      "Click on the link below and then select the image from the gallery and once confirmed, press the upload button to update the profile picture",
                      style: TextStyle(
                        color: Colors.grey.shade300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: InkWell(
              onTap: (){
                getGalleryImage();
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                height: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            
                    Icon(Icons.image_search, size: 38.0,),
            
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
            
                        Text(
                          "Select the document from the gallery",
                          style: TextStyle(
                            color: Colors.cyan.shade800,
                            fontWeight: FontWeight.w800,
                            fontSize: 13.0,
                          ),
                        ),
            
                        Text(
                          "png, jpg, jpeg",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.0,
                          ),
                        ),
            
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: InkWell(
              onTap: () async{
              
                firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/user_profiles' + '1234');
                firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);

                await Future.value(uploadTask).then((value) async {

                  var newURL = ref.getDownloadURL();

                  refDatabase.child(await fetchData()).update({
                    'profilePicture': newURL,
                  }).then((value){
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                      msg: "Profile Picture Updated",
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
                  
                });

                

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
                  "Upload",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )

        ],
      ),

    );
  }

}