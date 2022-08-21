import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_major_project/screens/Dineout/dineoutdetailpage.dart';

class Collections extends StatefulWidget {
  @override
  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Map data;
  List documents;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("dineoutcollections");
  fetchData() {
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        documents = snapshot.docs;
      });
    });
  }

  final _textstyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14);
  List collectionImage = [
    "https://media.gettyimages.com/photos/closeup-of-sommelier-serving-red-wine-at-fine-dining-restaurant-picture-id991732782?k=6&m=991732782&s=612x612&w=0&h=HZ1ke5DJK571Tj2-mEf0P7wV6eq589k6uKvwOIUSBrY=",
    "https://media.gettyimages.com/photos/enjoying-lunch-with-friends-picture-id1171787426?k=6&m=1171787426&s=612x612&w=0&h=cvdOLV4T-QGC60hZT4p8u7FHPHsUKA12FnswVCL2WB4=",
    "https://media.gettyimages.com/photos/heres-to-tonight-picture-id868935172?k=6&m=868935172&s=612x612&w=0&h=MjBYXm7f229lyNXsWqcSnmlouGWrfsNDYhQCiPJ0V6g=",
    "https://media.gettyimages.com/photos/closeup-of-sommelier-serving-red-wine-at-fine-dining-restaurant-picture-id991732782?k=6&m=991732782&s=612x612&w=0&h=HZ1ke5DJK571Tj2-mEf0P7wV6eq589k6uKvwOIUSBrY=",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Best Collections",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.018,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              height: size.height * 0.22,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("dineoutcollections")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DineoutDetailPage(
                                            data: documents[0],
                                          )));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                left: size.width * 0.04,
                              ),
                              height: size.height * 0.2,
                              width: size.width * 0.34,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      documents[index]['Image']['image'],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: size.height * 0.143),
                                    alignment: Alignment.bottomLeft,
                                    child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  "${documents[index]['name']}",
                                              style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                        color: Colors.black,
                                                        offset: Offset(2, 6),
                                                        blurRadius: 3)
                                                  ],
                                                  fontSize: size.height * 0.02,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
            )
          ]),
        ));
  }
}
