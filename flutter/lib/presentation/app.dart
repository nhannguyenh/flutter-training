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
                          const SizedBox(height: 8),
                          // text
                          Text(
                            "Please enter your details",
                            style: TextStyle(
                                fontSize: 16
                            ),)
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 24),

                  // nav
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            margin: EdgeInsets.all(4),
                            child: Text(
                              "Login"
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                child: Text("Sign Up")
                            )
                        )
                      ],
                    ),
                  )
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
