import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:restaurant_major_project/components/auth/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'components/profileItemList.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: kLightTheme,
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: ProfileScreen(),
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getSession();
    getUser();
  }

  String finalUser;
  int temp;
  var name;
  var emailid;

  getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("saveName");
      emailid = prefs.getString("saveEmail");
    });
  }

  Future getSession() async {
    print("hello");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var takeUser = prefs.getString('name');

    finalUser = takeUser;
    if (finalUser != null) {
      setState(() {
        temp = 0;
      });
    } else {
      setState(() {
        temp = 0;
      });
    }
  }

  Widget _buildloginCheck() {
    if (temp == 0) {
      return ListView(
        children: <Widget>[
          ProfileListItem(
              icon: LineAwesomeIcons.user_shield,
              text: 'Edit Profile',
              index: 0,
              hasNavigation: true),
          ProfileListItem(
            icon: LineAwesomeIcons.address_card,
            text: 'Addresses',
            index: 1,
            hasNavigation: true,
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.question_circle,
            text: 'Wallet',
            index: 3,
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.cog,
            text: 'Settings',
            index: 4,
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.alternate_sign_out,
            text: 'Logout',
            index: 6,
            hasNavigation: true,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            alignment: Alignment.topLeft,
            child: Text(
              "ACCOUNT",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "Login/Create Account",
                style: TextStyle(fontSize: 10),
              )),
          SizedBox(
            height: 15,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text("Login"),
            color: Colors.blue,
            textColor: Colors.white,
            minWidth: 345,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            height: 1,
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black,
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.cog,
            text: 'Settings',
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 0.2),
          Text(
            "$name",
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
          " $emailid",
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 2),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        profileInfo,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: kSpacingUnit.w * 5),
                header,
                Expanded(
                  child: Container(child: _buildloginCheck()),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
