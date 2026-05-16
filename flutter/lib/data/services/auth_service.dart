import 'package:flutter/material.dart';
import 'package:shopping_app/networking/network_client.dart';

class AuthService {
  static Future<bool> login(BuildContext context, String username, String password) async {
    try {
      if (username.isEmpty || password.isEmpty) {
        return false;
      }
      final res = await NetworkClient.instance.post(
        "/login",
        data: {
          "username": username,
          "password": password,
        }
      );

      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}