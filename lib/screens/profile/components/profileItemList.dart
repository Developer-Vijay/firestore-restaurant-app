import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:restaurant_major_project/SettingsPage/settings.dart';
import 'package:restaurant_major_project/components/AddressBook/newAddressPage.dart';
import 'package:restaurant_major_project/components/WalletScreen/walletscreen.dart';
import 'package:restaurant_major_project/components/auth/Forgotpassword/forgotpassword.dart';
import 'package:restaurant_major_project/components/auth/login/login.dart';
import 'package:restaurant_major_project/screens/profile/edit_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final index;
  final bool hasNavigation;
  const ProfileListItem(
      {Key key, this.icon, this.text, this.hasNavigation = true, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (index == 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditProfile()));
        } else if (index == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddressList()));
        } else if (index == 2) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Forgot()));
        } else if (index == 3) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WalletDesign()));
        } else if (index == 4) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SettingsScreen()));
        } else if (index == 6) {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Do you really want to logout"),
                    actions: [
                      FlatButton(
                        child: Text("Yes"),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.remove('name');
                          prefs.remove("SaveName");
                          prefs.remove("SaveEmail");
                          prefs.remove("authentication");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                      ),
                      FlatButton(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ));
        }
      },
      child: Container(
        height: kSpacingUnit * 5.5,
        margin: EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              this.icon,
              size: 20,
            ),
            SizedBox(width: 12),
            Text(
              this.text,
              style: kTitleTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            if (this.hasNavigation)
              Icon(
                LineAwesomeIcons.angle_right,
                size: 14,
              ),
          ],
        ),
      ),
    );
  }
}
