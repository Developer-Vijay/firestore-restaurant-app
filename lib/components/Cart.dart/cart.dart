import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_major_project/components/OfferPageScreen/foodlistclass.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Map data;
  List documents;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("popular");
  fetchData() {
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        documents = snapshot.docs;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: ListView.builder(
      itemCount: cartadd.length,
      itemBuilder: (context, index) {
          return Container(child: Text(cartadd[index].name));
        },),
      
    );
  }
}