import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          // icon
                          CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.shopping_bag, color: Colors.teal,),
                          ),
                          SizedBox(height: 20),
                          // title
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "Please enter your details",
                            style: TextStyle(
                                fontSize: 16
                            ),)
                          // text
                        ],
                      )
                    ],
                  )
                  // nav
                  // auth form
                  // social auth
                  // footer
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
