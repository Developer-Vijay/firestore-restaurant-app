import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:restaurant_major_project/screens/Dineout/DIneoutTabs/DineoutReserveTable/dineout_add_guest.dart';
import 'package:restaurant_major_project/screens/Dineout/dineoutlist.dart';

class DineoutDateSelection extends StatefulWidget {
  final data1;
  const DineoutDateSelection({this.data1});
  @override
  _DineoutDateSelectionState createState() => _DineoutDateSelectionState();
}

DateTime selectedDate = DateTime.now();

final datetime = DateTime.now();

var date = DateTime.parse("$selectedDate");
var formattedDate = "${date.day}-${date.month}-${date.year}";
var myFormat = DateFormat('d-MM-yyyy');

final pageController = PageController(initialPage: 0);

class _DineoutDateSelectionState extends State<DineoutDateSelection> {
  int isSelect = 0;
  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  var time;
  @override
  void initState() {
    super.initState();
    isSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: [
                  Container(
                    child: CachedNetworkImage(
                      width: size.width * 0.2,
                      height: size.height * 0.1,
                      imageUrl:
                          "https://media.gettyimages.com/photos/nightclub-picture-id157532720?k=6&m=157532720&s=612x612&w=0&h=oan-SIIOcol4NRhRWpJ_Vd2k6FzFE24Ub4zmK4SjNzM=",
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Radioactive Cafe",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                        ),
                        Text(
                          "Hudson Lane | North Delhi",
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: MaterialButton(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.calendar_view_day),
                    tooltip: 'Select Date',
                    iconSize: 40,
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Text(selectedDate.format("\d-\M\-\Y"))
                ],
              ),
              onPressed: () {
                _selectDate(context);
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InputChip(
                  label: Text(
                    "Breakfast",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  selectedColor: Colors.blue,
                  disabledColor: Colors.grey[200],
                  elevation: 2,
                  isEnabled: true,
                  backgroundColor: Colors.blueGrey,
                  selected: isSelected1,
                  checkmarkColor: Colors.white,
                  showCheckmark: true,
                  onSelected: (value) {
                    setState(() {
                      isSelect = 1;
                    });
                    pageController.animateToPage(1,
                        duration: Duration(milliseconds: 12),
                        curve: Curves.bounceIn);

                    if (isSelected1 == false) {
                      setState(() {
                        isSelected1 = true;
                        isSelected = false;
                        isSelected2 = false;
                      });
                    } else {
                      setState(() {
                        isSelected1 = false;
                      });
                    }
                  },
                ),
                InputChip(
                  backgroundColor: Colors.blueGrey,
                  label: Text(
                    "Lunch",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  selectedColor: Colors.blue,
                  disabledColor: Colors.grey[200],
                  elevation: 2,
                  isEnabled: true,
                  selected: isSelected,
                  showCheckmark: false,
                  onSelected: (value) {
                    setState(() {
                      isSelect = 2;
                    });
                    pageController.animateToPage(0,
                        duration: Duration(milliseconds: 12),
                        curve: Curves.bounceIn);

                    if (isSelected == false) {
                      setState(() {
                        isSelected = true;
                        isSelected1 = false;
                        isSelected2 = false;
                      });
                    } else {
                      setState(() {
                        isSelected = false;
                      });
                    }
                  },
                ),
                InputChip(
                  backgroundColor: Colors.blueGrey,
                  label: Text(
                    "Dinner",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  selectedColor: Colors.blue,
                  disabledColor: Colors.grey[200],
                  elevation: 2,
                  isEnabled: true,
                  selected: isSelected2,
                  showCheckmark: false,
                  onSelected: (value) {
                    setState(() {
                      isSelect = 3;
                    });
                    pageController.animateToPage(3,
                        duration: Duration(milliseconds: 12),
                        curve: Curves.bounceIn);

                    if (isSelected2 == false) {
                      setState(() {
                        isSelected2 = true;
                        isSelected1 = false;
                        isSelected = false;
                      });
                    } else {
                      setState(() {
                        isSelected2 = false;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: PageView(
                pageSnapping: false,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                controller: pageController,
                children: [
                  // Breakfast

                  GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2.4,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0),
                    shrinkWrap: true,
                    itemCount: lunchlist.length,
                    itemBuilder: (context, index) {
                      return InputChip(
                        label: Text(
                          lunchlist[index].time,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        selectedColor: Colors.blue,
                        disabledColor: Colors.grey[200],
                        elevation: 2,
                        checkmarkColor: Colors.white,
                        isEnabled: true,
                        selected: lunchlist[index].isSelected,
                        showCheckmark: true,
                        onSelected: (value) {
                          int k = lunchlist.length - 1;
                          for (int i = 0; i <= k; i++) {
                            setState(() {
                              lunchlist[i].isSelected = false;
                            });
                          }
                          if (lunchlist[index].isSelected == true) {
                            setState(() {
                              lunchlist[index].isSelected = false;
                              time = "${lunchlist[index].time}";
                            });
                          } else {
                            setState(() {
                              lunchlist[index].isSelected = true;
                              time = "${lunchlist[index].time}";
                            });
                          }
                        },
                      );
                    },
                  ),
                  // breakfast
                  GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        childAspectRatio: 2.4,
                        crossAxisCount: 3),
                    shrinkWrap: true,
                    itemCount: breaskfastList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputChip(
                          label: Text(
                            breaskfastList[index].time,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          selectedColor: Colors.blue,
                          disabledColor: Colors.grey[200],
                          elevation: 2,
                          isEnabled: true,
                          checkmarkColor: Colors.white,
                          selected: breaskfastList[index].isSelected,
                          showCheckmark: true,
                          onSelected: (value) {
                            int k = breaskfastList.length - 1;
                            for (int i = 0; i <= k; i++) {
                              setState(() {
                                breaskfastList[i].isSelected = false;
                              });
                            }
                            if (breaskfastList[index].isSelected == true) {
                              setState(() {
                                breaskfastList[index].isSelected = false;
                                time = "${breaskfastList[index].time}";
                              });
                            } else {
                              setState(() {
                                breaskfastList[index].isSelected = true;
                                time = "${breaskfastList[index].time}";
                              });
                            }
                          },
                        ),
                      );
                    },
                  ),

                  // Dinner
                  GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 2.4),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 0),
                    scrollDirection: Axis.vertical,
                    itemCount: dinnerlist.length,
                    itemBuilder: (context, index) {
                      return InputChip(
                        label: Text(
                          dinnerlist[index].time,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        selectedColor: Colors.blue,
                        disabledColor: Colors.grey[200],
                        elevation: 2,
                        isEnabled: true,
                        selected: dinnerlist[index].isSelected,
                        showCheckmark: true,
                        checkmarkColor: Colors.white,
                        onSelected: (value) {
                          int k = dinnerlist.length - 1;
                          for (int i = 0; i <= k; i++) {
                            setState(() {
                              dinnerlist[i].isSelected = false;
                            });
                          }
                          if (dinnerlist[index].isSelected == true) {
                            setState(() {
                              dinnerlist[index].isSelected = false;
                              time = "${dinnerlist[index].time}";
                            });
                          } else {
                            setState(() {
                              dinnerlist[index].isSelected = true;
                              time = "${dinnerlist[index].time}";
                            });
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DineoutAddMembers(
                            data: widget.data1,
                            time: time,
                            senddate:
                                selectedDate.format("\d-\M-\Y").toString(),
                            date: selectedDate.format("\d-\M-\Y-\D").toString(),
                          )));
            },
            color: Colors.blue,
            minWidth: size.width * 0.8,
            textColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text("Continue"),
          )
        ],
      ),
    ));
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate, // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        helpText: "Select Booking Date",
        confirmText: "Confirm");
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
