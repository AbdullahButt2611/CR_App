// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cr_app/main.dart';
import 'package:cr_app/navigation_drawer.dart';
import 'package:flutter/material.dart';

class StudentNotificationScreen extends StatelessWidget{

  const StudentNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(

        foregroundColor: Colors.cyan.shade100,
        title: const Text("CR Application"),
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

      body: SingleChildScrollView(

        padding: EdgeInsets.only(
          top: 20.0,
          left: 15.0,
          right: 15.0
        ),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Due Today",
              style: TextStyle(
                color: Colors.pink.shade500,
                fontWeight: FontWeight.w800,
                fontSize: 18.0,
              ),
            ),
            
            SizedBox(height: 20.0,),

            Container(
              decoration: BoxDecoration(
                border: Border(

                  bottom: BorderSide(

                    color: Colors.pink.shade200,
                    width: 4.0,

                  ),

                ),
              ),

              child: SizedBox(
                width: double.infinity,
                height: 350,
                child: SingleChildScrollView(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Container(

                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),

                        child: Row(
                          
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(
                              width: 60.0,
                              height: 60.0,
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: Colors.cyan.shade500,
                                ),
                                child: Icon(
                                  Icons.today,
                                  color: Colors.white,
                                ),

                              ),
                            ),
                            
                            SizedBox(

                              width: 5.0,

                            ),

                            Container(
                              child: Expanded(

                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                      
                                      "Watch the Introduction to Algebra and do questions that have been assigned",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600
                                      ),

                                    ),

                                    SizedBox(
                                      height: 5.0,
                                    ),

                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(
                                      
                                          "Linear Algebra",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0,
                                          ),

                                        ),

                                        Text(
                                      
                                          "Due: Dec 16, 2023",
                                          style: TextStyle(
                                            color: Colors.pink.shade400,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),

                                        ),

                                      ],

                                    )


                                  ],
                                )
                              
                              ),

                            )

                          ],

                        ),
                      ),
                      
                      Container(

                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Row(
                          
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(
                              width: 60.0,
                              height: 60.0,
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: Colors.cyan.shade500,
                                ),
                                child: Icon(
                                  Icons.today,
                                  color: Colors.white,
                                ),

                              ),
                            ),
                            
                            SizedBox(

                              width: 5.0,

                            ),

                            Container(
                              child: Expanded(

                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                      
                                      "Watch the Introduction to Algebra and do questions that have been assigned",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600
                                      ),

                                    ),

                                    SizedBox(
                                      height: 5.0,
                                    ),

                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(
                                      
                                          "Linear Algebra",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0,
                                          ),

                                        ),

                                        Text(
                                      
                                          "Due: Dec 16, 2023",
                                          style: TextStyle(
                                            color: Colors.pink.shade400,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),

                                        ),

                                      ],

                                    )


                                  ],
                                )
                              
                              ),

                            )

                          ],

                        ),
                      ),
                      
                      Container(

                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Row(
                          
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(
                              width: 60.0,
                              height: 60.0,
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: Colors.cyan.shade500,
                                ),
                                child: Icon(
                                  Icons.today,
                                  color: Colors.white,
                                ),

                              ),
                            ),
                            
                            SizedBox(

                              width: 5.0,

                            ),

                            Container(
                              child: Expanded(

                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                      
                                      "Watch the Introduction to Algebra and do questions that have been assigned",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600
                                      ),

                                    ),

                                    SizedBox(
                                      height: 5.0,
                                    ),

                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(
                                      
                                          "Linear Algebra",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0,
                                          ),

                                        ),

                                        Text(
                                      
                                          "Due: Dec 16, 2023",
                                          style: TextStyle(
                                            color: Colors.pink.shade400,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),

                                        ),

                                      ],

                                    )


                                  ],
                                )
                              
                              ),

                            )

                          ],

                        ),
                      ),
                      
                      Container(

                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Row(
                          
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(
                              width: 60.0,
                              height: 60.0,
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: Colors.cyan.shade500,
                                ),
                                child: Icon(
                                  Icons.today,
                                  color: Colors.white,
                                ),

                              ),
                            ),
                            
                            SizedBox(

                              width: 5.0,

                            ),

                            Container(
                              child: Expanded(

                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                      
                                      "Watch the Introduction to Algebra and do questions that have been assigned",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600
                                      ),

                                    ),

                                    SizedBox(
                                      height: 5.0,
                                    ),

                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(
                                      
                                          "Linear Algebra",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0,
                                          ),

                                        ),

                                        Text(
                                      
                                          "Due: Dec 16, 2023",
                                          style: TextStyle(
                                            color: Colors.pink.shade400,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),

                                        ),

                                      ],

                                    )


                                  ],
                                )
                              
                              ),

                            )

                          ],

                        ),
                      ),
                      
                      Container(

                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Row(
                          
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(
                              width: 60.0,
                              height: 60.0,
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: Colors.cyan.shade500,
                                ),
                                child: Icon(
                                  Icons.today,
                                  color: Colors.white,
                                ),

                              ),
                            ),
                            
                            SizedBox(

                              width: 5.0,

                            ),

                            Container(
                              child: Expanded(

                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                      
                                      "Watch the Introduction to Algebra and do questions that have been assigned",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600
                                      ),

                                    ),

                                    SizedBox(
                                      height: 5.0,
                                    ),

                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(
                                      
                                          "Linear Algebra",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0,
                                          ),

                                        ),

                                        Text(
                                      
                                          "Due: Dec 16, 2023",
                                          style: TextStyle(
                                            color: Colors.pink.shade400,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),

                                        ),

                                      ],

                                    )


                                  ],
                                )
                              
                              ),

                            )

                          ],

                        ),
                      ),
                      
                      Container(

                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Row(
                          
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(
                              width: 60.0,
                              height: 60.0,
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: Colors.cyan.shade500,
                                ),
                                child: Icon(
                                  Icons.today,
                                  color: Colors.white,
                                ),

                              ),
                            ),
                            
                            SizedBox(

                              width: 5.0,

                            ),

                            Container(
                              child: Expanded(

                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                      
                                      "Watch the Introduction to Algebra and do questions that have been assigned",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600
                                      ),

                                    ),

                                    SizedBox(
                                      height: 5.0,
                                    ),

                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(
                                      
                                          "Linear Algebra",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0,
                                          ),

                                        ),

                                        Text(
                                      
                                          "Due: Dec 16, 2023",
                                          style: TextStyle(
                                            color: Colors.pink.shade400,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),

                                        ),

                                      ],

                                    )


                                  ],
                                )
                              
                              ),

                            )

                          ],

                        ),
                      ),

                    ],
                  ),

                ),
                
              ),
            ),

            Padding(

              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),

              child: Text(
                "Notifications",
                style: TextStyle(
                  color: Colors.pink.shade500,
                  fontWeight: FontWeight.w800,
                  fontSize: 18.0,
                ),
              ),

            ),

            SingleChildScrollView(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Container(

                    padding: EdgeInsets.only(
                      bottom: 10.0,
                    ),

                    child: Row(
                      
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(
                          width: 60.0,
                          height: 60.0,
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: Colors.cyan.shade500,
                            ),
                            child: Icon(
                              Icons.today,
                              color: Colors.white,
                            ),

                          ),
                        ),
                        
                        SizedBox(

                          width: 5.0,

                        ),

                        Container(
                          child: Expanded(

                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text(
                                  
                                  "Watch the Introduction to Algebra and do questions that have been assigned",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600
                                  ),

                                ),

                                SizedBox(
                                  height: 5.0,
                                ),

                                Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                  
                                      "Linear Algebra",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                      ),

                                    ),

                                    Text(
                                  
                                      "Due: Dec 16, 2023",
                                      style: TextStyle(
                                        color: Colors.pink.shade400,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),

                                    ),

                                  ],

                                )


                              ],
                            )
                          
                          ),

                        )

                      ],

                    ),
                  ),
                  
                  Container(

                    padding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Row(
                      
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(
                          width: 60.0,
                          height: 60.0,
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: Colors.cyan.shade500,
                            ),
                            child: Icon(
                              Icons.today,
                              color: Colors.white,
                            ),

                          ),
                        ),
                        
                        SizedBox(

                          width: 5.0,

                        ),

                        Container(
                          child: Expanded(

                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text(
                                  
                                  "Watch the Introduction to Algebra and do questions that have been assigned",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600
                                  ),

                                ),

                                SizedBox(
                                  height: 5.0,
                                ),

                                Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                  
                                      "Linear Algebra",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                      ),

                                    ),

                                    Text(
                                  
                                      "Due: Dec 16, 2023",
                                      style: TextStyle(
                                        color: Colors.pink.shade400,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),

                                    ),

                                  ],

                                )


                              ],
                            )
                          
                          ),

                        )

                      ],

                    ),
                  ),
                  
                  Container(

                    padding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Row(
                      
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(
                          width: 60.0,
                          height: 60.0,
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: Colors.cyan.shade500,
                            ),
                            child: Icon(
                              Icons.today,
                              color: Colors.white,
                            ),

                          ),
                        ),
                        
                        SizedBox(

                          width: 5.0,

                        ),

                        Container(
                          child: Expanded(

                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text(
                                  
                                  "Watch the Introduction to Algebra and do questions that have been assigned",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600
                                  ),

                                ),

                                SizedBox(
                                  height: 5.0,
                                ),

                                Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                  
                                      "Linear Algebra",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                      ),

                                    ),

                                    Text(
                                  
                                      "Due: Dec 16, 2023",
                                      style: TextStyle(
                                        color: Colors.pink.shade400,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),

                                    ),

                                  ],

                                )


                              ],
                            )
                          
                          ),

                        )

                      ],

                    ),
                  ),
                  
                  Container(

                    padding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Row(
                      
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(
                          width: 60.0,
                          height: 60.0,
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: Colors.cyan.shade500,
                            ),
                            child: Icon(
                              Icons.today,
                              color: Colors.white,
                            ),

                          ),
                        ),
                        
                        SizedBox(

                          width: 5.0,

                        ),

                        Container(
                          child: Expanded(

                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text(
                                  
                                  "Watch the Introduction to Algebra and do questions that have been assigned",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600
                                  ),

                                ),

                                SizedBox(
                                  height: 5.0,
                                ),

                                Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                  
                                      "Linear Algebra",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                      ),

                                    ),

                                    Text(
                                  
                                      "Due: Dec 16, 2023",
                                      style: TextStyle(
                                        color: Colors.pink.shade400,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),

                                    ),

                                  ],

                                )


                              ],
                            )
                          
                          ),

                        )

                      ],

                    ),
                  ),
                  
                  Container(

                    padding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Row(
                      
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(
                          width: 60.0,
                          height: 60.0,
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: Colors.cyan.shade500,
                            ),
                            child: Icon(
                              Icons.today,
                              color: Colors.white,
                            ),

                          ),
                        ),
                        
                        SizedBox(

                          width: 5.0,

                        ),

                        Container(
                          child: Expanded(

                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text(
                                  
                                  "Watch the Introduction to Algebra and do questions that have been assigned",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600
                                  ),

                                ),

                                SizedBox(
                                  height: 5.0,
                                ),

                                Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                  
                                      "Linear Algebra",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                      ),

                                    ),

                                    Text(
                                  
                                      "Due: Dec 16, 2023",
                                      style: TextStyle(
                                        color: Colors.pink.shade400,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),

                                    ),

                                  ],

                                )


                              ],
                            )
                          
                          ),

                        )

                      ],

                    ),
                  ),
                  
                  Container(

                    padding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Row(
                      
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(
                          width: 60.0,
                          height: 60.0,
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: Colors.cyan.shade500,
                            ),
                            child: Icon(
                              Icons.today,
                              color: Colors.white,
                            ),

                          ),
                        ),
                        
                        SizedBox(

                          width: 5.0,

                        ),

                        Container(
                          child: Expanded(

                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text(
                                  
                                  "Watch the Introduction to Algebra and do questions that have been assigned",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600
                                  ),

                                ),

                                SizedBox(
                                  height: 5.0,
                                ),

                                Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text(
                                  
                                      "Linear Algebra",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                      ),

                                    ),

                                    Text(
                                  
                                      "Due: Dec 16, 2023",
                                      style: TextStyle(
                                        color: Colors.pink.shade400,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),

                                    ),

                                  ],

                                )


                              ],
                            )
                          
                          ),

                        )

                      ],

                    ),
                  ),

                ],
              ),

            ),

          ],

        )
        

      ),

      drawer: NavigationDrawer(),

    );

  }


}