import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_major_project/components/auth/login/login.dart';
import 'package:restaurant_major_project/components/common/common.dart';
import 'package:restaurant_major_project/components/common/validator.dart';
import 'package:restaurant_major_project/database_helper.dart';
import 'package:restaurant_major_project/notifications.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../messageWrapper.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var isnameValidate;
  var isPasswordValidate;
  var isemailvalidate;
  var isphonevalidate;
  bool isValidate = false;

  String isLogIn = "isLoggin";
  static String saveEmail = "userEmail";
  static String saveName = "userName";
  static String saveMobileNumber = "userNumber";

  //Controllers
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  Notifications notifications = Notifications();

  // Databasefunction databasefunction = Databasefunction();
  // Databasefunction databasefunction = new Databasefunction();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        Center(
          child: Container(
            height: size.height * 0.4,
            child: Image.asset(
              "assets/images/Chef_Flatline.png",
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          // margin: EdgeInsets.only(left: 6 * SizeConfig.widthMultiplier),
          child: Text(
            "Proceed with your ",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          alignment: Alignment.center,
          // margin: EdgeInsets.only(left: 6 * SizeConfig.widthMultiplier),
          child: Text("SignUp",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 30,
        ),
        // Username

        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(1, 1),
                      color: Colors.white)
                ]),
            child: TextField(
              controller: _userNameController,
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  errorText: isnameValidate,
                  contentPadding: EdgeInsets.all(5),
                  suffixIcon: Icon(
                    Icons.person,
                    size: 18,
                  ),
                  labelText: "Username"),
            )),
        SizedBox(height: 30),
        // Password Validation
        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 3,
                    color: Colors.white,
                    offset: Offset(1, 1),
                  )
                ]),
            child: TextField(
              controller: _emailController,
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  errorText: isemailvalidate,
                  contentPadding: EdgeInsets.all(6),
                  suffixIcon: Icon(
                    Icons.email,
                    size: 16,
                  ),
                  labelText: "email"),
            )),
        SizedBox(
          height: 30,
        ),

        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 3,
                    color: Colors.white,
                    offset: Offset(1, 1),
                  )
                ]),
            child: TextField(
              controller: _passwordController,
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  errorText: isPasswordValidate,
                  contentPadding: EdgeInsets.all(6),
                  suffixIcon: Icon(
                    Icons.lock,
                    size: 16,
                  ),
                  labelText: "Password"),
            )),

        SizedBox(
          height: 30,
        ),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 3,
                    color: Colors.white,
                    offset: Offset(1, 1),
                  )
                ]),
            child: TextField(
              controller: _phoneNumberController,
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  errorText: isphonevalidate,
                  contentPadding: EdgeInsets.all(6),
                  suffixIcon: Icon(
                    Icons.phone,
                    size: 16,
                  ),
                  labelText: "Phone number"),
            )),

        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.only(left: 18, right: 18),
          child: MaterialButton(
            textColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            height: 40,
            color: Colors.orange,
            onPressed: () {
              signup();
            },
            child: Text(
              "SIGNUP",
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Already have an Account",
              style: TextStyle(color: Colors.black),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                child: FlatButton(
                  textColor: Colors.green,
                  child: Text("Login"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }

  Future signup() async {
// For Name Validateion

    if (_userNameController.text.isEmpty) {
      setState(() {
        isnameValidate = "username cannot be empty";
        isValidate = true;
      });
    } else {
      setState(() {
        isnameValidate = null;
        isValidate = false;
      });
    }

    // password Validation
    if (_passwordController.text.isEmpty) {
      setState(() {
        isPasswordValidate = "password cannot be empty";
        isValidate = true;
      });
    } else {
      setState(() {
        isPasswordValidate = null;
        isValidate = false;
      });
    }
// email
    if (_emailController.text.isEmpty) {
      setState(() {
        isemailvalidate = "password cannot be empty";
        isValidate = true;
      });
    } else {
      setState(() {
        isemailvalidate = null;
        isValidate = false;
      });
    }

    if (_phoneNumberController.text.isEmpty) {
      setState(() {
        isphonevalidate = "password cannot be empty";
        isValidate = true;
      });
    } else {
      setState(() {
        isphonevalidate = null;
        isValidate = false;
      });
    }

    if (isValidate = true) {
      Map<String, String> userMap = {
        "name": _userNameController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
        "phonenumber": _phoneNumberController.text,
      };
      try {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (_) => new AlertDialog(
                    content: Row(
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text("Loading"),
                    ),
                  ],
                )));

        User user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            // ignore: missing_return
            .then((result) {
          print(result.user.email);
        });

        Fluttertoast.showToast(msg: "Succesfully Register");
        notifications.scheduleNotification(
            "Success", "Congrats you are Succesfully Registered");
        final prefs = await SharedPreferences.getInstance();

        prefs.setString("saveName", _userNameController.text);
        prefs.setString("saveEmail", _emailController.text);
        prefs.setString("saveMobileNumber", _phoneNumberController.text);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      } catch (e) {
        switch (e.code) {
          case 'ERROR_INVALID_EMAIL':
            Navigator.pop(context);
            Fluttertoast.showToast(msg: e.code);
            break;
          case 'ERROR_USER_NOT_FOUND':
            Navigator.pop(context);
            Fluttertoast.showToast(msg: e.code);
            break;
          case 'EMAIL_ALREADY_EXISTS':
            Navigator.pop(context);
        }
      }
    }
  }
}
