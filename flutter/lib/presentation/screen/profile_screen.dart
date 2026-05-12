import 'package:flutter/material.dart';
import 'package:shopping_app/presentation/config/app_colors.dart';
import 'package:shopping_app/presentation/config/app_font_sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: AppFontSizes.fontSize_20,
        ),
        title: Text("Profile Settings"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8),
            // Avatar section
            Center(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 8,
                  bottom: 8
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 32),
                          child: CircleAvatar(
                            backgroundColor: Colors.orange.shade100,
                            radius: 50,
                            child: Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.blueGrey,
                            )
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 16,
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "John Doe",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    ),
                    Text(
                      "@johndoe_offical",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 8,
                        bottom: 24,
                        left: 8,
                        right: 8
                      ),
                      padding: EdgeInsets.only(
                        top: 4,
                        bottom: 4,
                        left: 12,
                        right: 12
                      ),
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text(
                        "PREMIUM MEMBER",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSizes.fontSize_14
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Account Detail
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              "Account Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AppFontSizes.fontSize_20
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 8),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Edit Details",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: AppFontSizes.fontSize_16
                                ),
                              )
                            )
                          )
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, bottom: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "EMAIL ADDRESS",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: AppFontSizes.fontSize_14
                      ),
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600
                        ),
                        hintText: "john.doe@example.com",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, left: 16),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "FIRST NAME",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: AppFontSizes.fontSize_14
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, left: 32),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "John",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppFontSizes.fontSize_16
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, left: 16),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "LAST NAME",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: AppFontSizes.fontSize_14
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, left: 32),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Doe",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: AppFontSizes.fontSize_16
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, left: 16),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "AGE",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: AppFontSizes.fontSize_14
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, left: 32),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "28",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppFontSizes.fontSize_16
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
