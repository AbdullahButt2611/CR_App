// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:cr_app/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Help extends StatefulWidget{
  Help({super.key, required this.role, required this.id});


  final String role;
  final String id;

  @override
  State<StatefulWidget> createState() => _HelpState();

}


class _HelpState extends State<Help>{

  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network("https://www.youtube.com/watch?v=ub-6Ica9aWg")..initialize().then((_){
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(

        foregroundColor: Colors.cyan.shade100,
        title: const Text("Help"),
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

      drawer: NavigationDrawer(role: widget.role, id: widget.id),

      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Need Some Help?",
              style: TextStyle(
                color: Colors.pink.shade600,
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
            ),

            SizedBox(height: 36.0,),

            Container(
              color: Colors.black,
              width: 350.0,
              height: 450.0,
              child: _controller.value.isInitialized?  VideoPlayer(_controller)
              :
              Center(child: Text("No Video Yet Provided"),)
              ,
            ),

            
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _controller.value.isPlaying? _controller.pause() : _controller.play();
          });
        },
      ),

    );
  }


}