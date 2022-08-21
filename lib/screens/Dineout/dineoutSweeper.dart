import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:restaurant_major_project/screens/Dineout/dineoutlist.dart';

class Swipper extends StatefulWidget {
  @override
  _SwipperState createState() => _SwipperState();
}

class _SwipperState extends State<Swipper> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Map data;
  List documents;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("DineoutBanner");
  fetchData() {
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        documents = snapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRect(
      child: InkWell(
        onTap: () {},
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('DineoutBanner').snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              
            
            return ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: size.width * 0.03,
                    right: size.width * 0.03,
                  ),
                  height: size.height * 0.3,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: documents[index]['image'].isNotEmpty ?
                                CachedNetworkImageProvider(
                                    documents[index]['image']):Container(child:Image.asset("assets/images/dineoutofferbanner.png")),
                                fit: BoxFit.fitWidth)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                alignment: Alignment.bottomLeft,
                                margin: EdgeInsets.only(
                                    left: size.width * 0.01,
                                    top: size.height * 0.18),
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "${documents[index]['offer']} \n",
                                      style: TextStyle(
                                        fontSize: size.height * 0.023,
                                      ),
                                    ),
                                    TextSpan(
                                        text: "${documents[index]['events']}",
                                        style: TextStyle(
                                            fontSize: size.height * 0.023)),
                                  ]),
                                )),
                          ],
                        ),
                      );
                    },
                    pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.grey[300], size: 6, activeSize: 12),
                    ),
                    itemCount: imageList.length,
                    itemWidth: 300,
                    layout: SwiperLayout.DEFAULT,
                  ),
                );
              },
            );
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
