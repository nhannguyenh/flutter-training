import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static const Color primaryColor = Color(0xFF00E5FF);

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
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                          CircleAvatar(
                            backgroundColor: Colors.cyan[50],
                            radius: 30,
                            child: Icon(
                              Icons.shopping_bag,
                              color: primaryColor,
                              size: 32,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Please enter your details",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  // nav
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: EdgeInsets.all(4),
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // auth form
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 8
                        ),
                        child: Text("Username", style: TextStyle(fontSize: 16)),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "johndoe123",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 8
                        ),
                        child: Text("Password", style: TextStyle(fontSize: 16)),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "••••••••",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            bottom: 16
                          ),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text(
                            "Use biometrics for faster login",
                            style: TextStyle(
                              fontSize: 16
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 8),
                      
                      // sign in button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),
                      
                      // biometrics sign in button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: OutlinedButton.icon(
                          onPressed: (){},
                          icon: Icon(
                            Icons.fingerprint,
                            size: 24,
                            color: primaryColor
                          ),
                          label: Text(
                            "Sign in with Biometrics",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 24),

                  // social auth
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8
                        ),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade300))
                    ],
                  ),

                  SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: (){},
                          label: Text(
                            "Google",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.normal
                            ),
                          ),
                          icon: Icon(
                            Icons.g_mobiledata,
                            size: 32
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: (){},
                          label: Text(
                            "Facebook",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.normal
                            ),
                          ),
                          icon: Icon(
                            Icons.facebook,
                            size: 22,
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                        ),
                      ),
                    ],
                  )
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
