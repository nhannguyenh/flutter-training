import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/presentation/routes/routes.dart';
import 'package:shopping_app/presentation/screens/auth/bloc/auth_bloc.dart';
import 'package:shopping_app/presentation/screens/auth/bloc/auth_event.dart';
import 'package:shopping_app/presentation/screens/auth/bloc/auth_state.dart';
import 'package:shopping_app/presentation/screens/profile/bloc/user_profile_bloc.dart';
import 'package:shopping_app/presentation/screens/profile/bloc/user_profile_state.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_font_sizes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouter.initialRoute,
            (route) => false
          );
        }
      },
      child: Scaffold(
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          selectedItemColor: AppColors.primaryColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
        body: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            }

            if (state is UserProfileError) {
              // TODO
            }

            if (state is UserProfileLoaded) {
              final user = state.user;
              _emailController.text = user.email;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Avatar section
                    Center(
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
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
                                  padding: EdgeInsets.only(top: 16),
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
                              "${user.firstName} ${user.lastName}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24
                              ),
                            ),
                            Text(
                              "@${user.email}",
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
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                        bottom: 16
                      ),
                      padding: EdgeInsets.only(bottom: 16),
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
                              controller: _emailController,
                              enabled: false,
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
                          _buildPersonalInfoField("FIRST NAME", user.firstName),
                          _buildPersonalInfoField("LAST NAME", user.lastName),
                          _buildPersonalInfoField("AGE", "${user.age}"),
                        ],
                      ),
                    ),

                    // Order History
                    _buildActionList(
                      EdgeInsets.only(left: 16, right: 16),
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                      Text(
                        "Order History",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey
                      ),
                      () {
                        Navigator.pushNamed(context, AppRouter.orderHistoryRoute);
                      }
                    ),

                    // Logout
                    _buildActionList(
                      EdgeInsets.all(16),
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                        size: 20
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(color: Colors.red),
                      ),
                      null,
                      () {
                        context.read<AuthBloc>().add(LogoutRequested());
                      }
                    )
                  ],
                ),
              );
            }
            return Center();
          },
        ),
      ),
    );
  }

  Widget _buildActionList(EdgeInsets? margin, Icon leadingIcon, Text title,
      Icon? trailingIcon, VoidCallback opTapAction) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: leadingIcon,
        ),
        title: title,
        trailing: trailingIcon,
        onTap: opTapAction,
      ),
    );
  }

  Widget _buildPersonalInfoField(String label, String value) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 8, left: 16),
          alignment: Alignment.centerLeft,
          child: Text(
            label,
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
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: AppFontSizes.fontSize_16
            ),
          ),
        ),
      ],
    );
  }
}
