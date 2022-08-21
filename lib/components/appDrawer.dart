import 'package:flutter/material.dart';
import 'package:restaurant_major_project/SettingsPage/settings.dart';
import 'package:restaurant_major_project/components/Cart.dart/addtoCart.dart';
import 'package:restaurant_major_project/components/PlaceOrder/my_orders.dart';
import 'package:restaurant_major_project/components/WalletScreen/walletscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Cart.dart/wishlist.dart';
import 'auth/login/login.dart';

class AppDrawer extends StatefulWidget {
  final String cName;
  final String cProfile;
  final String cEmail;
  const AppDrawer({Key key, this.cName, this.cProfile, this.cEmail})
      : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  bool isenabled = false;
  _launchURL() async {
    const url = 'http:/feasturent.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  var named;
  getdata() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      named = prefs.getString("saveName");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              padding: EdgeInsets.only(bottom: 5, top: 3),
              decoration: BoxDecoration(
                color: Color(0xFF3498E5),
              ),
              child: Container(
                margin: EdgeInsets.only(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 0,
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Color(0xffF8F9FE),
                        child: CircleAvatar(
                          radius: 48,
                          backgroundImage: widget.cProfile == null
                              ? NetworkImage(widget.cProfile)
                              : AssetImage('assets/images/avatar.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Column(
                        children: [
                          Text(
                            "$named",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            dense: true,
            selected: true,
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Orders'),
            dense: true,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyOrders()));
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Wishlist'),
            dense: true,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wishlist()));
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            dense: true,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Wallet'),
            dense: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WalletDesign()),
              );
              // Update the state of the app.
              // ...
            },
          ),
          Divider(
            color: Colors.blue,
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            dense: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.help_center),
            title: Text('Help & Support'),
            dense: true,
            onTap: () {
              // Update the state of the app.
              // ...
              _launchURL();
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            dense: true,
            onTap: () {
              // Update the state of the app.
              // ...
              _launchURL();
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
            dense: true,
            onTap: () {
              // Update the state of the app.
              _launchURL();
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            dense: true,
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('SaveName');
                prefs.setBool("authentication", false);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
