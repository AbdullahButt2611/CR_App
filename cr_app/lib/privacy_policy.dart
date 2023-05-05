// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:cr_app/database_helper.dart';
import 'package:cr_app/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PrivacyPoicy extends StatefulWidget{
  const PrivacyPoicy({super.key});

  @override
  State<StatefulWidget> createState() => _PrivacyPolicyState();

}

class _PrivacyPolicyState extends State<PrivacyPoicy> with TickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

   @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        foregroundColor: Colors.cyan.shade100,
        title: const Text("Privacy Policy"),
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

      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 24, right: 24),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Privacy Policy",
              style: TextStyle(
                color: Colors.pink.shade500,
                fontWeight: FontWeight.w700,
                fontSize: 24.0
              ),
            ),

            SizedBox(height: 15.0,),

            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  labelPadding: EdgeInsets.only(left: 20, right: 20),
                  indicator: CircleTabIndicator(color: Colors.cyan.shade500, radius: 4),
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "System Policy",),
                    Tab(text: "Personal Information",),
                    Tab(text: "SQFLite",),
                  ],
                ),
              ),
            ),

            Container(
              width: double.maxFinite,
              height: 550,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Text(
                            "The System Policy section of Privacy is an essential component of any app or software that collects and processes user data. This section outlines the rules and regulations governing how user data is handled and processed within the app, ensuring that user privacy is respected and maintained. The System Policy section generally contains detailed information about the type of data that is collected, how it is collected, and how it is used. It may also include information on any third-party services or data processors that are involved in the collection and processing of user data.",
                            textAlign: TextAlign.justify,
                          ),
                        ),
          
                        Text(
                          "To be effective, a System Policy should be clear, concise, and easy to understand, so that users can make informed decisions about whether or not to use the app or software. It should also be transparent about how data is stored and secured, and what measures are in place to prevent unauthorized access or misuse of user data. Additionally, it should provide users with the ability to opt-out of data collection and processing, as well as the ability to delete their data at any time.",
                          textAlign: TextAlign.justify,
                        ),

                        Text(
                          "One of the key elements of a robust System Policy is user consent. The policy should clearly state that user data is only collected and processed with explicit user consent, and that consent can be revoked at any time..",
                          textAlign: TextAlign.justify,
                        ),
    
                        
                      ],
                    ),
                  ),

                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Text(
                            "The System Policy section of Privacy is an essential component of any app or software that collects and processes user data. This section outlines the rules and regulations governing how user data is handled and processed within the app, ensuring that user privacy is respected and maintained. The System Policy section generally contains detailed information about the type of data that is collected, how it is collected, and how it is used. It may also include information on any third-party services or data processors that are involved in the collection and processing of user data.",
                            textAlign: TextAlign.justify,
                          ),
                        ),
          
                        Text(
                          "To be effective, a System Policy should be clear, concise, and easy to understand, so that users can make informed decisions about whether or not to use the app or software. It should also be transparent about how data is stored and secured, and what measures are in place to prevent unauthorized access or misuse of user data. Additionally, it should provide users with the ability to opt-out of data collection and processing, as well as the ability to delete their data at any time.",
                          textAlign: TextAlign.justify,
                        ),

                        Text(
                          "One of the key elements of a robust System Policy is user consent. The policy should clearly state that user data is only collected and processed with explicit user consent, and that consent can be revoked at any time. The policy should also outline the steps that are taken to ensure user data is secure and protected, such as encryption or anonymization of data where appropriate.",
                          textAlign: TextAlign.justify,
                        ),
    
                        
                      ],
                    ),
                  ),
                
                  AssignmentScreen(),
                ],
              ),
            ),
           

          ],
        ),
      ),
    );
  }

}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }

  
}

class _CirclePainter extends BoxPainter{

  late Color color;
  final double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color =color;
    _paint = Paint()..isAntiAlias =true;
    final Offset circleOffset = offset + Offset(cfg.size!.width/2, cfg.size!.height-radius);
     canvas.drawCircle(circleOffset, radius, _paint);
  }

}