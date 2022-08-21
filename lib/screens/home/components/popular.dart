import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_major_project/components/OfferPageScreen/foodlistclass.dart';
import 'package:restaurant_major_project/components/OfferPageScreen/insideofferpage.dart';
import 'package:restaurant_major_project/lists.dart';
import 'package:restaurant_major_project/screens/home/ViewAllPages/viewpopular.dart';
import '../../../constants.dart';
import 'ItemCategories.dart';

class PopularList extends StatefulWidget {
  const PopularList({
    Key key,
  }) : super(key: key);

  @override
  _PopularListState createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  @override
  void initState() {
    super.initState();
    fetchData();
    fetchCholebhature();
  }

  Map data;
  List documents;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("popularBurgers");
  fetchData() {
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        documents = snapshot.docs;
      });
    });
  }

  List documents1;
  CollectionReference collectionReference1 =
      FirebaseFirestore.instance.collection("popularChole");
  fetchCholebhature() {
    collectionReference1.snapshots().listen((snapshot) {
      setState(() {
        documents1 = snapshot.docs;
      });
    });
  }

  Map data1;
  List documented;
  CollectionReference collectionReferences =
      FirebaseFirestore.instance.collection("offersrestaurant");
  fetchOfferRestaurant() {
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        documented = snapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
              top: size.height * 0.01, bottom: size.height * 0.01),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: size.width * 0.04),
              child: Text(
                "Popular on Reasturent",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
              ),
            ),
            Spacer(),
            Container(
                alignment: Alignment.topRight,
                child: FlatButton(
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewAllPopular(
                            categoryData: popularData,
                          ),
                        ))
                  },
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "View All",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.zero,
                          child: Icon(
                            Icons.arrow_right_rounded,
                            color: kSecondaryTextColor,
                          )),
                    ],
                  ),
                ))
          ],
        ),
        Container(
            height: size.height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: popularData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.blueGrey,
                                  spreadRadius: 1)
                            ],
                          ),
                          margin: EdgeInsets.only(left: 4),
                          height: size.height * 0.08,
                          width: size.width * 0.24,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            child: FlatButton(
                              onPressed: () {
                                if (popularData[index].index == 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(
                                              data: documents,
                                            )),
                                  );
                                } else if (popularData[index].index == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(
                                              data: documents1,
                                            )),
                                  );
                                }
                              },
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: popularData[index].image,
                                  fit: BoxFit.cover,
                                  width: size.width * 0.16,
                                  height: size.height * 0.2,
                                ),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      popularData[index].title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    )
                  ],
                );
              },
            )),
      ],
    );
  }
}
