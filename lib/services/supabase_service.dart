import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SupabaseManager {
  Future<void> signUpUser(BuildContext context, {required String email, required String password}) async {
    final url = Uri.parse(' http://localhost:3000/api/auth/register');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        showToastMessage('Registration Success', isError: false);
        Navigator.pushReplacementNamed(context, 'login');
      } else {
        showToastMessage('Error: Failed to Sign Up', isError: true);
      }
    } catch (error) {
      showToastMessage('Error: $error', isError: true);
    }
  }

  Future<void> signInUser(BuildContext context, {required String email, required String password}) async {
    final url = Uri.parse(' http://localhost:3000/api/auth/login');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        showToastMessage('Login Success', isError: false);
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        showToastMessage('Error: Failed to signIn', isError: true);
      }
    } catch (error) {
      showToastMessage('Error: $error', isError: true);
    }
  }

  Future<void> logout(BuildContext context) async {
    // Implement logout logic if needed for your backend
  }

  void showToastMessage(String message, {required bool isError}) {
    // Implement your toast message handling here
    print(message);
  }
}
