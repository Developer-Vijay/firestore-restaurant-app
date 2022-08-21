
import 'package:flutter/material.dart';
import 'package:restaurant_major_project/components/auth/login/login.dart';
import 'package:restaurant_major_project/screens/home/home-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> UserAuthenticate(context) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('_isAuthenticate')) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ),
    );
  } else {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ),
    );
  }
}
