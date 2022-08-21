import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_major_project/components/Bottomsheet/addbar.dart';
import 'package:restaurant_major_project/screens/profile/components/rating.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodSlider extends StatefulWidget {
  @override
  _FoodSliderState createState() => _FoodSliderState();
}

class _FoodSliderState extends State<FoodSlider> {
  bool isSelected = false;
  final imageList = [
    "https://media.gettyimages.com/photos/lamb-greek-burger-picture-id637790866?k=6&m=637790866&s=612x612&w=0&h=-VCta3l64UbGq8kJ2Y5rSJJL7-3dSiy-F7wQ6qBKssk=",
    "https://media.gettyimages.com/photos/tasty-hamburger-with-french-fries-on-wooden-table-picture-id872841180?k=6&m=872841180&s=612x612&w=0&h=wQ5og6yidpAUqYq4__09lwh7311vLh2SGXuSG9UeYxQ=",
    "https://media.gettyimages.com/photos/cheeseburger-with-french-fries-picture-id922684138?k=6&m=922684138&s=612x612&w=0&h=-YJjzZ3M99r4luEeryvGXpJnS2VA5mgc4oayeN04Oys="
  ];
  var rating = 3.0;
  int _current = 0;
  int selectedRadioTile;

  var pad = 34;

  void initeState() {
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.5,
                  child: Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.094),
                    child: Stack(
                      children: [
                        Swiper(
                          itemCount: imageList.length,
                          itemBuilder: (context, index) => CachedNetworkImage(
                            imageUrl: imageList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            color: Colors.white,
                            iconSize: 25,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.favorite),
                              color: (isSelected) ? Colors.red : Colors.white,
                              onPressed: () {
                                if (isSelected == false) {
                                  setState(() {
                                    isSelected = true;
                                    Fluttertoast.showToast(
                                        msg: "Item Added to favourites");
                                  });
                                } else if (isSelected == true) {
                                  setState(() {
                                    isSelected = false;
                                    Fluttertoast.showToast(
                                        msg: "Item removed from Favourites");
                                  });
                                }
                              },
                            ))
                      ],
                    ),
                  ),
                ),
                // Main Container which Overlaps
                Align(
                  alignment: Alignment.center,
                  heightFactor: size.height * 0.0025,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.2, right: 0.2),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      height: size.height * 0.7,
                      width: size.width * 0.999,
                      child: Column(children: [
                        Container(
                            child: Row(
                          children: [
                            // Location
                            Padding(
                              padding: const EdgeInsets.only(left: 34, top: 20),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12, top: 21),
                              child: Text(
                                "Mc Donalds",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 24, top: 24),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://www.pngkey.com/png/full/261-2619381_chitr-veg-symbol-svg-veg-and-non-veg.png",
                                height: 18,
                              ),
                            ),
                          ],
                        )),

                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                //color: Colors.red,

                                child: Text(
                                  '''Veg Cheese Burger''',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Text(
                                "15 min prep",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ]),
                        ),

                        // Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30, top: 2),
                              child: SmoothStarRating(
                                  allowHalfRating: false,
                                  onRated: (v) {
                                    Text("23");
                                  },
                                  starCount: 5,
                                  rating: rating,
                                  size: 23.0,
                                  isReadOnly: true,
                                  defaultIconData: Icons.star_border_outlined,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_border,
                                  color: Colors.amber,
                                  borderColor: Colors.amber,
                                  spacing: 0.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RatingPage()),
                                  );
                                },
                                child: Text("24 Views"),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Text(
                                "₹ 250",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, top: 30, right: 20),
                          child: Container(
                            child: Text(
                              "Nowadays,making printed materials have become fast, easy and simple.if you want your promotional material to be an eye catching object you should make it colored by way of using inkjet printer this is not hard to make . we will Provise the Edges of all The Content and anything which is their to here listen each and everthing this food is very tasty and healthy in eating",
                              style: TextStyle(wordSpacing: 2, fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.only(
                              left: size.width * 0.11,
                              right: size.width * 0.11),
                          child: MaterialButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Sheet());
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            height: 60,
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: Icon(
                                    Icons.shopping_bag,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Order Now",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MaterialButtonWidget extends StatefulWidget {
  @override
  _MaterialButtonWidgetState createState() => _MaterialButtonWidgetState();
}

class _MaterialButtonWidgetState extends State<MaterialButtonWidget> {
  bool _show = true;
  @override
  Widget build(BuildContext context) {
    return _show
        ? MaterialButton(
            onPressed: () {
              var sheetController = showBottomSheet(
                  context: context, builder: (context) => Sheet());
              _showButton(false);
              sheetController.closed.then((value) {
                _showButton(true);
              });
            },
          )
        : Container();
  }

  void _showButton(bool value) {
    setState(() {
      _show = value;
    });
  }
}
