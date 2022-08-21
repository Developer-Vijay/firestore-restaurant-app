import 'package:flutter/material.dart';
import 'package:restaurant_major_project/screens/Dineout/dineoutlist.dart';
import 'DineoutReserveTable/dineout_date_select.dart';

class PortfolioGallerySubPage extends StatelessWidget {
  const PortfolioGallerySubPage({Key key, this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    var data1;
    Size size = MediaQuery.of(context).size;
    return Container(
        child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 30, top: 10, bottom: 20),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 3,
                              color: Colors.blue[50])
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: data['name'] != null
                                  ? Text(
                                      data['name'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  : Text(
                                      "Raising The Bar",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                              child: data['address'] != null
                                  ? Text(
                                      data['address'],
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    )
                                  : Text(
                                      "Model Town North Delhi",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    )),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                              child: data['Price'] != null
                                  ? Text(
                                      "₹${data['Price']}",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    )
                                  : Text(
                                      "₹750",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    )),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Container(
                                  child: data['openorclosed'] != null
                                      ? Text(
                                          data['openorclosed'],
                                          style: TextStyle(
                                              color: Colors.red[700],
                                              fontSize: 12),
                                        )
                                      : Text(
                                          "Now Closed",
                                          style: TextStyle(
                                              color: Colors.red[700],
                                              fontSize: 12),
                                        )),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  child: data['timing'] != null
                                      ? Text(
                                          data['timing'],
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        )
                                      : Text(
                                          "Opens at 12:00 PM",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        )),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                              child: data['offer'] != null
                                  ? Text(
                                      data['offer'],
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    )
                                  : Text(
                                      "No offer",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    )),
                        ],
                      ),
                    )),
              );
            },
          ),
          Container(
              child: ListView.builder(
            itemCount: dineoutlist.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 2,
                            color: Colors.blue[50])
                      ],
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    onTap: () {
                      if (dineoutlist[index].index == 0) {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => Container(
                                height: size.height * 0.6,
                                child: DineoutDateSelection(
                                  data1: data1,
                                )));
                      }
                    },
                    leading: Container(child: dineoutlist[index].icon),
                    title: Text(dineoutlist[index].title),
                    subtitle: Text(dineoutlist[index].subtitle),
                  ),
                ),
              );
            },
          )),
        ]));
  }
}
