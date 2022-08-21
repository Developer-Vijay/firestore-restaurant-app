import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Fetch extends StatefulWidget {
  @override
  _FetchState createState() => _FetchState();
}

class _FetchState extends State<Fetch> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Map data;
  List documents;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("categories");
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
        appBar: AppBar(),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("categories").snapshots(),
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return Text(documents[index]['fooddetails']['foodname']);
                },
              );
            }
          },
        ));
  }
}
