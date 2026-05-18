import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/presentation/screens/auth/bloc/auth_bloc.dart';
import 'package:shopping_app/presentation/screens/auth/bloc/auth_state.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_font_sizes.dart';
import '../../routes/routes.dart';
import 'bloc/auth_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(16),
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
                            backgroundColor: Colors.cyan.shade50,
                            radius: 30,
                            child: Icon(
                              Icons.shopping_bag,
                              color: AppColors.primaryColor,
                              size: 32,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Welcome Back",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Please enter your details",
                            style: TextStyle(fontSize: AppFontSizes.fontSize_16),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  // nav
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: _buildTabButton("Login", true)),
                        Expanded(child: _buildTabButton("Sign Up", false))
                      ],
                    ),
                  ),

                  SizedBox(height: 8),

                  // auth form
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField(
                        "Username",
                        "johndoe123",
                        _usernameController,
                        false
                      ),
                      _buildTextField(
                        "Password",
                        "••••••••",
                        _passwordController,
                        true
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: AppFontSizes.fontSize_16,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text(
                            "Use biometrics for faster login",
                            style: TextStyle(fontSize: AppFontSizes.fontSize_16),
                          ),
                        ],
                      ),

                      SizedBox(height: 8),

                      // sign in button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRouter.productRoute,
                                (route) => false
                              );
                            }

                            if (state is LoginLoading) {
                              Center(
                                child: CircularProgressIndicator(color: AppColors.primaryColor),
                              );
                            }

                            if (state is LoginFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Center(
                                  child: Text(state.errorMessage),
                                ))
                              );
                            }
                          },
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: (){
                                context.read<AuthBloc>().add(
                                  LoginSubmitted(
                                    username: _usernameController.text,
                                    password: _passwordController.text
                                  )
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: AppFontSizes.fontSize_18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 16),

                      // biometrics sign in button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.fingerprint,
                            size: 24,
                            color: AppColors.primaryColor,
                          ),
                          label: Text(
                            "Sign in with Biometrics",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: AppFontSizes.fontSize_18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: AppColors.primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
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
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(fontSize: AppFontSizes.fontSize_16),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                    ],
                  ),

                  SizedBox(height: 16),

                  Row(
                    spacing: 16,
                    children: [
                      _buildSocialButton("Google", Icon(Icons.g_mobiledata, size: 32)),
                      _buildSocialButton("Facebook", Icon(Icons.facebook, size: 22, color: Colors.black)),
                    ],
                  ),

                  SizedBox(height: 16),

                  // footer
                  Center(
                    child: Text(
                      "By continuing, you agree to our Terms of Service and Privacy Policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String label, Icon icon) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () {},
        label: Text(
          label,
          style: TextStyle(
            fontSize: AppFontSizes.fontSize_16,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        icon: icon,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String title, String hintText, TextEditingController controller, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(title, style: TextStyle(fontSize: AppFontSizes.fontSize_16)),
        ),
        TextField(
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(String label, bool isActive) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(4),
      child: Text(label, style: TextStyle(fontSize: AppFontSizes.fontSize_16)),
    );
  }
}
