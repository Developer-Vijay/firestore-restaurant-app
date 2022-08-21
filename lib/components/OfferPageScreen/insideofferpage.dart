import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_major_project/components/Bottomsheet/offerBottomsheet.dart';
import 'package:restaurant_major_project/screens/home/slider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../constants.dart';
import 'foodlistclass.dart';
import 'offerpage.dart';

class OfferListPage extends StatefulWidget {
  final data;
  OfferListPage({this.data});
  @override
  _OfferListPageState createState() => _OfferListPageState();
}

class _OfferListPageState extends State<OfferListPage> {
  var data;
  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  int _index1 = 0;
  final _containerDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
          blurRadius: 2,
          offset: Offset(1, 3),
          color: Colors.blue[50],
          spreadRadius: 2)
    ],
    borderRadius: BorderRadius.circular(5),
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                shadowColor: Colors.white,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 25,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OfferPageScreen()),
                      );
                    })),
            body: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(children: [
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                          top: size.height * 0.02, left: size.width * 0.036),
                      child: data['RestaurantName'] != null
                          ? Text(
                              "${data['RestaurantName']}",
                              style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )
                          : Text(
                              "Gupta Chart Bhandar",
                              style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 5, left: 15),
                      child: Text(
                        "Indian",
                        style: offerCommonStyle,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 5, left: 15),
                      child: data['About']['Address'] != null
                          ? Text(
                              data['About']['Address'],
                              style: offerCommonStyle,
                            )
                          : Text(
                              "Burari, Delhi ",
                              style: offerCommonStyle,
                            )),
                  SizedBox(
                    height: 24,
                  ),
                  DottedLine(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: SmoothStarRating(
                                    allowHalfRating: false,
                                    onRated: (v) {
                                      Text("23");
                                    },
                                    starCount: 1,
                                    rating: 3.0,
                                    size: 23.0,
                                    isReadOnly: false,
                                    defaultIconData: Icons.star_border_outlined,
                                    filledIconData: Icons.star,
                                    halfFilledIconData: Icons.star_border,
                                    color: Colors.black,
                                    borderColor: Colors.black,
                                    spacing: 0.0),
                              ),
                              Container(
                                  child: data['rating'] != null
                                      ? Text(
                                          "${data['rating']}",
                                          style: offerRowHeadingStyle,
                                        )
                                      : Text(
                                          "4.0",
                                          style: offerRowHeadingStyle,
                                        )),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(left: size.width * 0.04),
                              child: Text(
                                "Taste 80%",
                                style: offerCommonStyle,
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "39 minutes",
                            style: offerRowHeadingStyle,
                          ),
                          Text("Delivery Time")
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: size.width * 0.02),
                        child: Column(
                          children: [
                            Container(
                                child: data['priceperperson'] != null
                                    ? Text("${data['priceperperson']}",
                                        style: offerRowHeadingStyle)
                                    : Text("400 for 1",
                                        style: offerRowHeadingStyle))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DottedLine(),
                  SizedBox(
                    height: 15,
                  ),

                  // List of Discounts

                  Container(
                    height: size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) => OnOfferBottomSheet());
                              },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                height: size.height * 0.068,
                                width: size.width * 0.42,
                                decoration: _containerDecoration,
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: size.width * 0.02,
                                              top: size.height * 0.01),
                                          child: SvgPicture.asset(
                                            "assets/icons/offer.svg",
                                            width: 15,
                                          )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: size.width * 0.002,
                                            top: size.height * 0.01),
                                        child: Text(
                                          "50%OFFUPTO100",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          left: size.width * 0.08,
                                          top: size.height * 0.002),
                                      child: Text(
                                        "Use Welcome50",
                                        style: TextStyle(fontSize: 12),
                                      ))
                                ]),
                              ),
                            ),
                            // Second List
                            SizedBox(
                              width: 12,
                            ),

                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) => OnOfferBottomSheet());
                              },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                height: size.height * 0.068,
                                width: size.width * 0.42,
                                decoration: _containerDecoration,
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: size.width * 0.02,
                                              top: size.height * 0.01),
                                          child: SvgPicture.asset(
                                            "assets/icons/offer.svg",
                                            width: 15,
                                          )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: size.width * 0.002,
                                            top: size.height * 0.01),
                                        child: Text(
                                          "30%OFFUPTO100",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          left: size.width * 0.08,
                                          top: size.height * 0.002),
                                      child: Text(
                                        "Use Welcome50",
                                        style: TextStyle(fontSize: 12),
                                      ))
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),

                            // Third List
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) => OnOfferBottomSheet());
                              },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                height: size.height * 0.068,
                                width: size.width * 0.42,
                                decoration: _containerDecoration,
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: size.width * 0.02,
                                              top: size.height * 0.01),
                                          child: SvgPicture.asset(
                                            "assets/icons/offer.svg",
                                            width: 15,
                                          )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: size.width * 0.002,
                                            top: size.height * 0.01),
                                        child: Text(
                                          "20%OFFUPTO100",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          left: size.width * 0.08,
                                          top: size.height * 0.002),
                                      child: Text(
                                        "Use Welcome50",
                                        style: TextStyle(fontSize: 12),
                                      ))
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: size.width * 0.02),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://media.gettyimages.com/vectors/logo-of-two-green-leaves-in-a-yellow-background-vector-id186896873?k=6&m=186896873&s=612x612&w=0&h=nwQBGKYtsyeD4TlxoGtH6SSENQENlZGxmTXAwIWBJ5k=",
                            height: 30,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            left: size.width * 0.03,
                          ),
                          child: Text(
                            "PURE VEG",
                            style: offerRowHeadingStyle,
                          ))
                    ],
                  )),
                  SizedBox(
                    height: size.height * 0.055,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: size.width * 0.05),
                      child: Text("Recommended", style: offerRecommendStyle)),

                  SizedBox(
                    height: size.height * 0.022,
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodSlider()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    color: Colors.blue[50],
                                    offset: Offset(1, 3),
                                    spreadRadius: 2)
                              ]),
                          margin: EdgeInsets.only(
                            left: size.width * 0.02,
                            right: size.width * 0.02,
                          ),
                          height: size.height * 0.14,
                          child: Row(children: [
                            Expanded(
                                flex: 0,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  height: size.height * 0.2,
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 4, right: 4, top: 4),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: data['OfferImage'] != null
                                                ? data['OfferImage']
                                                : "https://media.gettyimages.com/photos/chole-bhature-picture-id487519767?k=6&m=487519767&s=612x612&w=0&h=D_xvdhbcquVrpX7CSIOSe6KOnCMAD2IQsj8gqLcwoSc=",
                                            height: size.height * 0.1,
                                            width: size.width * 0.24,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      // For Add Button
                                      Align(
                                          widthFactor: 1.42,
                                          alignment: Alignment.bottomCenter,
                                          heightFactor: 2.2,
                                          child: Container(
                                            child: MaterialButton(
                                              onPressed: () {
                                                getItemandNavigateToCart();
                                              },
                                              color: Colors.white,
                                              minWidth: size.width * 0.16,
                                              height: size.height * 0.033,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14)),
                                              textColor: Colors.white,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.add,
                                                    size: size.height * 0.02,
                                                    color: Colors.blueGrey,
                                                  ),
                                                  Text(
                                                    "ADD",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.blueGrey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 6,
                                child: Container(
                                  height: size.height * 0.2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 6),
                                        child: Row(
                                          children: [
                                            Container(
                                                child: data['About']
                                                            ['menuname'] !=
                                                        null
                                                    ? Text(
                                                        " ${data['About']['menuname']}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize: 16),
                                                      )
                                                    : Text(
                                                        "Chole Bhauture",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize: 16),
                                                      )),
                                            Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 12),
                                              child: CachedNetworkImage(
                                                imageUrl: data['About']
                                                            ['symbol'] !=
                                                        null
                                                    ? data['About']['symbol']
                                                    : "https://www.pngkey.com/png/full/261-2619381_chitr-veg-symbol-svg-veg-and-non-veg.png",
                                                height: size.height * 0.02,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Container(
                                          child:
                                              data['About']['subtitle'] != null
                                                  ? Text(
                                                      data['About']['subtitle'],
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  : Text("Snacks")),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            // Container(
                                            //   child: insideOfferPage[index]
                                            //       .starRating,
                                            // ),
                                            Container(
                                                child: data['About']
                                                            ['menuRating'] !=
                                                        null
                                                    ? Text(
                                                        "${data['About']['menuRating']}",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    : Text(
                                                        "3.0",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                            Spacer(),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    right: size.width * 0.1),
                                                child: data['About']
                                                            ['menuPrice'] !=
                                                        null
                                                    ? Text(
                                                        "₹ ${data['About']['menuPrice']}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    : Text(
                                                        "120",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ])),
                    ),
                  )
                ]);
              },
            )));
  }

  getItemandNavigateToCart() async {
    // print(index1);
    print("add item");
    add2.add(addto(
        isSelected: false,
        counter: 0,
        quantity: 0,
        // id: insideOfferPage[_index1].id,
        foodPrice: int.parse(data['About']['menuPrice']),
        title: data['About']['menuName'],
        // starRating: insideOfferPage[_index1].starRating,
        name:  data['About']['menuName'],
        // discountText: insideOfferPage[_index1].discountText,
        vegsymbol:  data['About']['menuName'],
        // discountImage: insideOfferPage[_index1].discountImage,
        foodImage: data['OfferImage']));

    Fluttertoast.showToast(msg: "Items Added TO the Cart ");
  }
}
