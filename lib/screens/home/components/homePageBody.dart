import 'package:flutter/material.dart';
import 'package:restaurant_major_project/screens/home/components/category_list.dart';
import 'package:restaurant_major_project/screens/home/components/discount_card.dart';
import 'package:restaurant_major_project/screens/home/components/item_list.dart';
import 'package:restaurant_major_project/screens/home/components/offerrestaurant.dart';
import 'package:restaurant_major_project/screens/home/components/popular.dart';
import 'homeAppBar.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 2, child: HomeAppBar()),
        Expanded(
          flex: 18,
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DiscountCard(),
                CategoryList(),
                CategoriesList(),
                PopularList(),
                OfferRestaurant(),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
