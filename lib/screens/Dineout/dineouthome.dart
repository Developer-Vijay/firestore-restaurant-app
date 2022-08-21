import 'package:flutter/material.dart';
import 'package:restaurant_major_project/screens/Dineout/dineoutSlideList.dart';
import 'package:restaurant_major_project/screens/Dineout/dineoutSweeper.dart';
import 'package:restaurant_major_project/screens/Dineout/dineoutcollection.dart';
import 'package:restaurant_major_project/screens/home/components/homeAppBar.dart';
import 'dineoutPopular.dart';

class DineoutHomePage extends StatefulWidget {
  @override
  _DineoutHomePageState createState() => _DineoutHomePageState();
}

class _DineoutHomePageState extends State<DineoutHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: HomeAppBar(),
            ),
            Expanded(
              flex: 18,
              child: ListView(shrinkWrap: true, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Swipper(),
                    DineoutList(),
                    SizedBox(
                      height: 12,
                    ),
                    PopularDininingLists(),
                    SizedBox(
                      height: 12,
                    ),
                    Collections(),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
