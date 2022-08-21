import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_major_project/components/OfferPageScreen/foodlistclass.dart';

class CatrgoriesRelatedMenues extends StatefulWidget {
  final data;
  CatrgoriesRelatedMenues({this.data});
  @override
  _CatrgoriesRelatedMenuesState createState() =>
      _CatrgoriesRelatedMenuesState();
}

int _index1 = 0;

class _CatrgoriesRelatedMenuesState extends State<CatrgoriesRelatedMenues> {
  String data1;
  @override
  void initState() {
    super.initState();
    
  }

 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return Padding(
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
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.data[index]
                                         ['image'],
                                      height: size.height * 0.1,
                                      width: size.width * 0.23,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                //For Add Button
                                Positioned(
                                  child: Align(
                                      widthFactor: 1.42,
                                      alignment: Alignment.bottomCenter,
                                      heightFactor: 2.2,
                                      child: Container(
                                        child: MaterialButton(
                                          onPressed: () {
                                            // print(widget.data[index]
                                            //     ['fooddetails']);

                                            // setState(() {
                                            //   add2 = widget.data[index]
                                            //       ['fooddetails'];
                                            // });

                                            getItemandNavigateToCart(index);
                                          },
                                          color: Colors.white,
                                          minWidth: size.width * 0.16,
                                          height: size.height * 0.033,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14)),
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
                                      )),
                                )
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
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.01),
                                  padding: EdgeInsets.zero,
                                  child: Row(
                                    children: [
                                      Text(
                                        widget.data[index]
                                            ['title'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 0),
                                        child: CachedNetworkImage(
                                          imageUrl: widget.data[index]
                                              ['vegSymbol'],
                                          height: size.height * 0.015,
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  widget.data[index]['subtitle'],
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
                                        widget.data[index]['rating'],
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
                                          "₹${widget.data[index]['price']}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ))
                    ])));
          },
        ));
  }

  getItemandNavigateToCart(index) async {
    // print(index1);
    print("add item");

    add2.add(addto(
      // isSelected: widget.data[index]['fooddetails']['isSelected'],
      counter: 0,
      foodImage: widget.data[index]['image'],
      name: widget.data[index]['title'],
      // id: widget.data[index]['fooddetails']['id'],
      foodPrice: int.parse(widget.data[index]['price']),
      vegsymbol: widget.data[index]['vegSymbol'],
      title: widget.data[index]['title'],
      subtitle: widget.data[index]['subtitle'],
      // ratingText: widget.data[index]['fooddetails']['rating']
    ));

    Fluttertoast.showToast(
        msg: "Items Added TO the Cart ${widget.data[index]}");
  }
}
