import 'package:flutter/material.dart';
import 'package:restaurant_major_project/components/auth/login/login.dart';
import 'package:restaurant_major_project/components/onBoarding/appOnBoarding.dart';
import 'package:restaurant_major_project/screens/home/home-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

int initScreen;

class SplashScreenApp extends StatefulWidget {
  @override
  _SplashScreenAppState createState() => _SplashScreenAppState();
}

class _SplashScreenAppState extends State<SplashScreenApp> {
  bool _isOnboadingSeen = false;

  @override
  void initState() {
    super.initState();
    getSession();
  }

  getSession() async {
    final prefs = await SharedPreferences.getInstance();
    var auth=prefs.getBool("authentication");
    initScreen=prefs.getInt("init");
    if (initScreen == null) {
      setState(() {
        prefs.setInt("init", 1);
        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OnboardingScreen()));
        });
      });
    } else if (auth == true) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      });
    }

    //Local Session
    // final prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   try {
    //     prefs.getBool('isOnboadingSeen')
    //         ? _isOnboadingSeen = true
    //         : _isOnboadingSeen = false;
    //   } catch (error) {
    //     print(error);
    //   }
    // });
  }

  // getDetails() async {
  //   final prefs = await SharedPreferences.getInstance();
  //  if()
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: Image.asset("assets/images/Chef_Flatline.png"),
        ),

        Container(child: Center(child: CircularProgressIndicator(),),)
      ],
    ));
  }
}
