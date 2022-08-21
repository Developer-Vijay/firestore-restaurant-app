import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_major_project/components/AddressBook/addAddress.dart';
import 'package:restaurant_major_project/constants.dart';
import 'package:restaurant_major_project/screens/profile/userProfile.dart';

class AddressList extends StatefulWidget {
  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Map data;
  List documents;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("addresses");
  fetchData() {
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        documents = snapshot.docs;
      });
    });
  }

  final textstyle = TextStyle(color: Colors.black, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.arrow_back_sharp),
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfilePage()),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "My Addresses",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  )),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: () {},
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddAdress()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: 20,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Add a new address",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 18,
                child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection("addresses").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 2, color: Colors.grey[500])
                                    ]),
                                width: size.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Address",
                                            style:
                                                TextStyle(color: Colors.blueGrey),
                                          ),
                                          Spacer(),

                                          PopupMenuButton(
                                            onSelected: (value) {},
                                            itemBuilder: (BuildContext) => [
                                             
                                              PopupMenuItem(
                                                child: Text("Remove"),
                                                enabled: true,
                                                value: temp,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            documents[index]['name'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(documents[index]['phone'],
                                          style: textstyle),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        documents[index]['postalcode'],
                                        style: textstyle,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        documents[index]['houseno'],
                                        style: textstyle,
                                      ),
                                      Text(
                                        documents[index]['roadname'],
                                        style: textstyle,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        documents[index]['landmark'],
                                        style: textstyle,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        documents[index]['citiesselected'],
                                        style: textstyle,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ))
          ]),
        ),
      ),
    );
  }
}
