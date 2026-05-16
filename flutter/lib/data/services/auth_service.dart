import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../presentation/routes/routes.dart';

class AuthService {
  static Future<void> login(BuildContext context, String username, String password) async {
    final url = Uri.parse("http://10.0.2.2:3000/login");

    try {
      final res = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': username,
            'password': password,
          })
      );

      if (res.statusCode == 200) {
        final data = jsonEncode(res.body);
        Navigator.pushReplacementNamed(context, AppRouter.productRoute);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid credentials!')),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}