import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_major_project/lists.dart';
import 'package:restaurant_major_project/screens/home/ViewAllPages/view_categories.dart';
import 'package:restaurant_major_project/screens/home/components/categories_menu.dart';
import '../../../constants.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    Key key,
  }) : super(key: key);

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  void initState() {
    super.initState();
    fetchBurgers();
    fetchChinese();
    fetchNorthIndian();
    fetchSouthIndian();
  }

  Map data;

  List documents;
  List document1;
  List document2;
  List document3;

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("burgerCategory");

      CollectionReference collectionReference1 =
      FirebaseFirestore.instance.collection("chineseCategory");

      CollectionReference collectionReference2 =
      FirebaseFirestore.instance.collection("southIndianCategory");

      CollectionReference collectionReference3 =
      FirebaseFirestore.instance.collection("northIndian");

  fetchBurgers() {
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        documents = snapshot.docs;
      });
    });
  }

  fetchChinese() {
    collectionReference1.snapshots().listen((snapshot) {
      setState(() {
        document1 = snapshot.docs;
      });
    });
  }

  fetchSouthIndian() {
    collectionReference2.snapshots().listen((snapshot) {
      setState(() {
        document2 = snapshot.docs;
      });
    });
  }

  fetchNorthIndian() {
    collectionReference3.snapshots().listen((snapshot) {
      setState(() {
        document3 = snapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(
            top: size.height * 0.01, bottom: size.height * 0.01),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: size.width * 0.05),
            child: Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
            ),
          ),
          Spacer(),
          Container(
              margin: EdgeInsets.only(left: 0),
              child: FlatButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewAllCategories(
                                categoryData: categoriesData,
                              ),
                            ))
                      },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
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
                  )))
        ],
      ),
      Container(
          height: size.height * 0.12,
          child:
              // final List<DocumentSnapshot> documents = snapshot.data.docs;
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesData.length,
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
                              margin: EdgeInsets.only(left: size.width * 0.011),
                              height: size.height * 0.08,
                              width: size.width * 0.24,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: FlatButton(
                                  onPressed: () {
                                    if (categoriesData[index].index == 0) {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return CatrgoriesRelatedMenues(
                                              data: documents);
                                        },
                                      ));
                                    }else   if (categoriesData[index].index == 1) {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return CatrgoriesRelatedMenues(
                                              data: document3);
                                        },
                                      ));
                                    }
                                    else   if (categoriesData[index].index == 2) {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return CatrgoriesRelatedMenues(
                                              data: document2);
                                        },
                                      ));
                                    } else   if (categoriesData[index].index == 3) {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return CatrgoriesRelatedMenues(
                                              data: document3);
                                        },
                                      ));
                                    }
                                  },
                                  child: ClipOval(
                                      child: CachedNetworkImage(
                                    imageUrl: categoriesData[index].image,
                                    fit: BoxFit.cover,
                                    width: size.width * 0.2,
                                    height: size.height * 0.2,
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  )),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          categoriesData[index].title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.014),
                        )
                      ],
                    );
                  }))
    ]);
  }
}
