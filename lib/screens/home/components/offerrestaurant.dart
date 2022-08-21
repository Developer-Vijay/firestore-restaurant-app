import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_major_project/components/OfferPageScreen/insideofferpage.dart';

class OfferRestaurant extends StatefulWidget {
  @override
  _OfferRestaurantState createState() => _OfferRestaurantState();
}

class _OfferRestaurantState extends State<OfferRestaurant> {
  @override
  void initState() {
    super.initState();
    fetchOfferRestaurant();
  }

  Map data;
  List documents;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("offersrestaurant");
  fetchOfferRestaurant() {
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        documents = snapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("offersrestaurant")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                // print(foodlist[index].discountText);
                return InkWell(
                  onTap: () {
                    if (documents[index]['RestaurantName'] ==
                        "Samrat Restaurant") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OfferListPage(
                                    data: documents[0],
                                  )));
                    } else if (documents[index]['RestaurantName'] ==
                        "The Pizza Palace") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OfferListPage(
                                    data: documents[1],
                                  )));
                    }
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
                                  color: Colors.grey[200],
                                  offset: Offset(0, 3),
                                  spreadRadius: 2)
                            ]),
                        margin: EdgeInsets.only(
                          left: size.width * 0.02,
                          right: size.width * 0.02,
                        ),
                        height: size.height * 0.14,
                        child: Row(children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.topCenter,
                                height: size.height * 0.2,
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 4, right: 4, top: 4),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: documents[index]
                                              ['OfferImage'],
                                          height: size.height * 0.2,
                                          width: size.width * 0.3,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Container(
                                height: size.height * 0.2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 6),
                                      child: Row(
                                        children: [
                                          Text(
                                            "${documents[index]['RestaurantName']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12),
                                            child: CachedNetworkImage(
                                                imageUrl: documents[index]
                                                    ['About']['symbol'],
                                                height: size.height * 0.016),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "${documents[index]['type']}",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            "${documents[index]['rating']}",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  right: size.width * 0.1),
                                              child: Text(
                                                "${documents[index]['priceperperson']}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ])),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
