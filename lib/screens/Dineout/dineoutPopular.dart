import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restaurant_major_project/screens/Dineout/dineoutdetailpage.dart';

class PopularDininingLists extends StatefulWidget {
  @override
  _PopularDininingListsState createState() => _PopularDininingListsState();
}

class _PopularDininingListsState extends State<PopularDininingLists> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Map data;
  List documents;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("PopularDineout");
  fetchData() {
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        documents = snapshot.docs;
      });
    });
  }

  final popularimageslist = [
    "https://media.gettyimages.com/photos/elegant-shopping-mall-picture-id182408547?s=2048x2048",
    "https://media.gettyimages.com/photos/cafebar-in-moscow-picture-id1158221681?s=2048x2048",
    "https://media.gettyimages.com/photos/family-in-a-cafe-picture-id1089596346?k=6&m=1089596346&s=612x612&w=0&h=w3lny9JWOUDIBTQbMVNVDBu48KMw316UANpAhPV0zdk=",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _textstyle = TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: size.height * 0.014);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Popular Dineout Areas",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.016,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
              height: size.height * 0.15,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('PopularDineout')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                  height: size.height * 0.11,
                                  width: size.width * 0.31,
                                  child: FlatButton(
                                    onPressed: () {
                                      if (documents[index]['name'] ==
                                          "The Great Indian Place") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DineoutDetailPage(
                                                data: documents[0],
                                              ),
                                            ));
                                      }else if (documents[index]['name'] ==
                                          "Barbeque Nation") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DineoutDetailPage(
                                                data: documents[1],
                                              ),
                                            ));
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: CachedNetworkImage(
                                        imageUrl: documents[index]['Image']
                                            ['image'],
                                        fit: BoxFit.cover,
                                        width: size.width * 0.31,
                                        height: size.height * 0.2,
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(documents[index]['name'], style: _textstyle)
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
        ],
      ),
    );
  }
}
