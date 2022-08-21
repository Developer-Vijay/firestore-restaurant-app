import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_major_project/components/splashScreen/splashScreen.dart';
import 'package:restaurant_major_project/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging _messaging = FirebaseMessaging();

  @override
  void initState() {
    _messaging.getToken().then((token) {
      print("token is this ");
      print(token);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        //Add Route to the main Page.
       
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            body1: TextStyle(color: ksecondaryColor),
            body2: TextStyle(color: ksecondaryColor),
          ),
        ),
        home: SplashScreenApp());
  }
}
