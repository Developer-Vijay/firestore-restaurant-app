import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_major_project/components/auth/signup/signup.dart';
import 'package:restaurant_major_project/screens/home/home-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isValidate = false;
  bool _isProcessing = false;
  var isnameValidate;
  var isPasswordValidate;
  String id;

  //Controllers
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  //       void _signInWithEmailAndPassword() async {
  //         // FirebaseAuth _auth;
  // final Firebase user   = ( FirebaseAuth.instance.signInWithEmailAndPassword(
  //   email: _userNameController.text,
  //   password: _passwordController.text,
  // )).user;
  Future<bool> _onbackPressed() async {
    return showDialog(
        context: context,
        builder: (contex) => AlertDialog(
              title: Text("Do you Really want to exit"),
              actions: [
                FlatButton(
                  child: Text("Yes"),
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                ),
                FlatButton(
                  child: Text("No"),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: WillPopScope(
            onWillPop: _onbackPressed,
            child: Container(
                child: ListView(
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
                  child: Text("LOGIN",
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
                          labelText: "Email"),
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
                  margin: EdgeInsets.only(left: 18, right: 18),
                  child: MaterialButton(
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    height: 40,
                    color: Colors.orange,
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      "LOGIN",
                    ),
                  ),
                ),

                Container(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an Account Signup",
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: FlatButton(
                          textColor: Colors.green,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupPage(),
                                ));
                          },
                          child: Text(
                            "Signup",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                )
              ],
            ))));
  }

  Future login() async {
    final prefs = await SharedPreferences.getInstance();
    // name Validation
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
    if (isValidate = true) {
      setState(() {
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
      });
      try {
        User user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _userNameController.text,
                password: _passwordController.text)
            // ignore: missing_return
            .then((result) {
          setState(() {
            prefs.setBool("authentication", true);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          });

          print(result.user.email);
        });
      } catch (e) {
        switch (e.code) {
          case 'ERROR_INVALID_EMAIL':
            Navigator.pop(context);
            Fluttertoast.showToast(msg: e.code);
            break;
          case 'ERROR_USER_NOT_FOUND':
            Navigator.pop(context);
            Fluttertoast.showToast(msg: e.code);
        }
      }
    }

    // FirebaseUser user = (await FirebaseAuth.instance
    //         .signInWithEmailAndPassword(
    //             email: _userNameController.text,
    //             password: _passwordController.text))
    //     .user;
    // id = user.uid;
    //     final prefs = await SharedPreferences.getInstance();
    //     prefs.setString('userId', id);

    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => HomeScreen()));
    //   } catch (e) {
    //     switch (e.code) {
    //       case 'ERROR_INVALID_EMAIL':
    //         // Fluttertoast.showToast(msg: e.code);
    //         break;
    //       case 'ERROR_USER_NOT_FOUND':
    //         // Fluttertoast.showToast(msg: e.code);
    //     }
    //   }
    // } else {
    //   // Fluttertoast.showToast(msg: "Invalid Id and Password");
    // }
  }
}
