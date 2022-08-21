import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_major_project/components/OfferPageScreen/foodlistclass.dart';

class Detail extends StatefulWidget {
  final data;
  Detail({this.data});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    super.initState();
    // fetchData();
    added = false;
  }

  int _index1 = 0;
  List documents;
  final ScrollController _scrollController = new ScrollController();

  final imageList = [
    "https://media.gettyimages.com/photos/lamb-greek-burger-picture-id637790866?k=6&m=637790866&s=612x612&w=0&h=-VCta3l64UbGq8kJ2Y5rSJJL7-3dSiy-F7wQ6qBKssk=",
    "https://media.gettyimages.com/photos/tasty-hamburger-with-french-fries-on-wooden-table-picture-id872841180?k=6&m=872841180&s=612x612&w=0&h=wQ5og6yidpAUqYq4__09lwh7311vLh2SGXuSG9UeYxQ=",
    "https://media.gettyimages.com/photos/cheeseburger-with-french-fries-picture-id922684138?k=6&m=922684138&s=612x612&w=0&h=-YJjzZ3M99r4luEeryvGXpJnS2VA5mgc4oayeN04Oys="
  ];
  var added = false;
  addData(index) {
    Map<String, dynamic> demodata = {
      "name": "${widget.data[index]['populardata']['name']}",
      "price": "${widget.data[index]['populardata']['price']}",
      "symbol": "${widget.data[index]['populardata']['symbol']}",
      "added": added
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("carts");

    collectionReference.add(demodata);
  }

  @override
  Widget build(BuildContext context) {
    var rating = 3.0;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.34,
            floating: true,
            snap: false,
            centerTitle: true,
            forceElevated: true,
            pinned: true,
            toolbarHeight: size.height * 0.06,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text(
                "",
                style: TextStyle(shadows: [
                  Shadow(
                      blurRadius: 2,
                      offset: Offset(1, 2),
                      color: Colors.blue[400])
                ]),
              ),
              titlePadding: EdgeInsets.only(
                  left: 60, right: 10.0, bottom: 10.0, top: 10.0),
              background: CachedNetworkImage(
                imageUrl: imageList[2],
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                child: ListView.builder(
              shrinkWrap: true,
              controller: _scrollController,
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
                                          imageUrl: widget.data[index]['image'],
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
                                                getItemandNavigateToCart(index);
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
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.01),
                                      padding: EdgeInsets.zero,
                                      child: Row(
                                        children: [
                                          Text(
                                            widget.data[index]['title'],
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
                                      widget.data[index]['title'],
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
                                  ],
                                ),
                              ))
                        ])));
              },
            ))
          ]))
        ]),
      ),
    );
  }

  getItemandNavigateToCart(index) async {
    // print(index1);
    print("add item");

    add2.add(addto(
        // isSelected: widget.data[index]['populardata']['selected'],
        counter: 0,
        // quantity: widget.data[index]['populardata']['quantity'],
        // id: widget.data[index]['populardata']['id'],
        subtitle: widget.data[index]['subtitle'],
        foodPrice: int.parse(widget.data[index]['price']),
        title: widget.data[index]['title'],
        name: widget.data[index]['title'],
        // discountText: widget.data[index]['populardata']['discount'],
        vegsymbol: widget.data[index]['vegSymbol'],
        // discountImage: widget.data[index]['populardata']['discountImage'],
        foodImage: widget.data[index]['image']));

    Fluttertoast.showToast(
        msg: "Items Added TO the Cart ${widget.data[index]}");
  }

  getItemandNavigateToFavourites(_index1) async {
    favourite.add(addto(
        isSelected: false,
        counter: 0,
        quantity: 0,
        id: burgerlist[_index1].id,
        subtitle: burgerlist[_index1].subtitle,
        foodPrice: burgerlist[_index1].foodPrice,
        title: burgerlist[_index1].title.toString(),
        // starRating: burgerlist[_index1].starRating,
        name: burgerlist[_index1].name.toString(),
        discountText: burgerlist[_index1].discountText,
        vegsymbol: burgerlist[_index1].vegsymbol,
        discountImage: burgerlist[_index1].discountImage,
        foodImage: burgerlist[_index1].foodImage));
  }

  removeItemFromFavourites(_index1) async {
    favourite.clear();
  }
}
