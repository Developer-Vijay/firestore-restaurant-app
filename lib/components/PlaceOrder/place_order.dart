import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_major_project/components/AddressBook/newAddressPage.dart';
import 'package:restaurant_major_project/components/OfferPageScreen/foodlistclass.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:restaurant_major_project/components/PlaceOrder/order_confirm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../notifications.dart';

class PlaceOrder extends StatefulWidget {
  var totalprice;
  PlaceOrder({this.totalprice});
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  Notifications notifications = Notifications();
  Razorpay _razorpay;
  var phone;
  var emailid;
  @override
  void initState() {
    getLocation();
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  var latitude;
  var longitude;
  var fullAddress;
  getLocation() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      latitude = prefs.getString("latitude");
      longitude = prefs.getString("longitude");
      fullAddress = prefs.getString("fullAddress");
    });
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_4u6ueqd1OKhrIR',
      'amount': num.parse(widget.totalprice.toString()) * 100,
      'name': 'Vijay',
      'description': 'Food',
      'prefill': {'contact': "", 'email': ""},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(
    PaymentSuccessResponse response,
  ) {
    Fluttertoast.showToast(msg: "Payment Successfully Placed");
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderConfirmResturent(),
        ));
    add(0);
    notifications.scheduleNotification(
        "Congrats ", "Your Order Placed Successfully");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    setState(() {
      print("error");
      print(response.code);
      print(response.message);
      Navigator.pop(context, PlaceOrder());
      showDialog(
          context: context,
          child: new AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            title: new Text(
              "Payment Failed",
              style: TextStyle(
                  color: Colors.red[700], fontWeight: FontWeight.bold),
            ),
            content: new Text(
              "Something Went Wrong",
            ),
          ));
    });
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: ListView(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.topRight, child: Icon(Icons.clear)),
          ),
        ),
        Container(
          height: size.height * 0.06,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: size.height * 0.025,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Delivery at-",
                  style: TextStyle(fontSize: 13),
                ),
                Expanded(
                  flex: 9,
                  child: Text(
                    "data",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                    flex: 2,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down_rounded,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) =>
                                  Container(height: 650, child: AddressList()));
                        })),
              ],
            ),
          ),
        ),
        Divider(
          height: 7,
          color: Colors.grey,
        ),
        Container(
          height: size.height * 0.06,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Icon(
                  Icons.timer_rounded,
                  color: Colors.green,
                  size: size.height * 0.025,
                ),
                Text("Delivery in "),
                Text("50 mins."),
              ],
            ),
          ),
        ),
        Divider(
          height: 7,
          color: Colors.grey,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: placeorder.length,
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
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: size.height * 0.2,
                          child: Stack(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(left: 4, right: 4, top: 4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: placeorder[index].foodImage,
                                    height: size.height * 0.1,
                                    width: size.width * 0.24,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          height: size.height * 0.2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 6),
                                child: Row(
                                  children: [
                                    Text(
                                      placeorder[index].foodname,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: CachedNetworkImage(
                                        imageUrl: placeorder[index].vegsymbol,
                                        height: size.height * 0.014,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "${placeorder[index].type}",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: size.width * 0.1),
                                      child: Text(
                                        "₹${placeorder[index].foodPrice}",
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
                  ])),
            );
          },
        ),

        /// LIST IS TO ADDD

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: size.height * 0.15,
            color: Colors.blue[50],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Offers",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://st2.depositphotos.com/1435425/6338/v/950/depositphotos_63384005-stock-illustration-special-offer-icon-design.jpg',
                      height: size.height * 0.045,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Text("Select a promo code"),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 25,
                        width: 100,
                        child: Center(
                          child: Text(
                            "View offers",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(flex: 9, child: Text("Price")),
                  Expanded(flex: 5, child: SizedBox()),
                  Expanded(
                      flex: 3,
                      child: Text(
                        "₹00",
                        textDirection: TextDirection.rtl,
                      )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(flex: 9, child: Text("Discount Offer")),
                  Expanded(flex: 5, child: SizedBox()),
                  Expanded(
                      flex: 3,
                      child: Text(
                        "00.00",
                        textDirection: TextDirection.rtl,
                      )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(flex: 9, child: Text("Delivery Charges")),
                  Expanded(flex: 5, child: SizedBox()),
                  Expanded(
                      flex: 3,
                      child: Text(
                        "00.00",
                        textDirection: TextDirection.rtl,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 9,
                      child: Text(
                        "Grand Total",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.0276),
                      )),
                  Expanded(flex: 5, child: SizedBox()),
                  Expanded(
                      flex: 3,
                      child: Text(
                        "₹ ${widget.totalprice}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.0273),
                      )),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: Colors.amber[600],
            minWidth: 300,
            textColor: Colors.white,
            child: Text("Place Order"),
            onPressed: () {
              openCheckout();
            },
          ),
        )
      ],
    ));
  }

  void add(index) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('ordersplaced');

    Map<String, dynamic> demodata = {
      "name": "${placeorder[index].foodname}",
      "image": "${placeorder[index].foodImage}",
      "price": "${placeorder[index].foodPrice}",
      "rating": "${placeorder[index].rating}",
      "latitude": "$latitude",
      "longitude": "$longitude",
      "date": "${DateTime.now()}",
      "id": "${placeorder[index].id}",
      "address": fullAddress,
      "Accepted":null
    };
    collectionReference.add(demodata);
  }
}
