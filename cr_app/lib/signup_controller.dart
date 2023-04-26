import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  
  //  SignUpController({this.section, this.semester});

  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final regdNo = TextEditingController();
  final email = TextEditingController();
  String? semester = "";
  final password = TextEditingController();
  final session = TextEditingController();
  String? section = "";

  // ignore: non_constant_identifier_names
  void RegisterUser(String email, String passwrord){
  }

}