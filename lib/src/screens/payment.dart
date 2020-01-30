import 'package:auto_size_text/auto_size_text.dart';
import 'package:belanja_pedia/src/model/user.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget{
  const Payment({this.user, this.sum, this.productId, this.items});

  final user;
  final sum;
  final productId;
  final items;

  @override
  PaymentState createState() {
    return new PaymentState();
  }
}

class PaymentState extends State<Payment> {
  Widget body() {
  String firstName = widget.user.firstName;
  String lastName = widget.user.lastName;
  String name = firstName + ' ' + lastName;
  String address = widget.user.address;
  String email = widget.user.email;
  int subTotal = widget.sum;

    return Column(
      children: <Widget>[
        Container(
          height: 250,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/map.png",
                        height: 35,
                      ),
                      const Padding(padding: EdgeInsets.only(left: 12)),
                      Column(
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: SizedBox(
                      width: 270,
                      height: 100,
                      child: AutoSizeText(
                        address,
                        style: TextStyle(fontSize: 18),
                        minFontSize: 10,
                        stepGranularity: 10,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/email.png",
                        height: 35,
                      ),
                      const Padding(padding: EdgeInsets.only(left: 12)),
                      Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 250,
                            child: Card(
                              color: Colors.grey[200],
                              elevation: 2,
                              child: Container(
                                margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                                child: Text(
                                  email,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 400,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: Container(
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '${widget.items} items',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 450,
                    decoration: BoxDecoration(
                      border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey[200]),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Shipping',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 170,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.green),
                          color: Colors.grey[200]
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/tick.png",
                                  height: 35,
                                ),
                                Text('Rp10000'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 35),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text('JNE'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text('Wait till 01 Feb'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text('Pay before 31 Jan'),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 100,
          margin: EdgeInsets.only(bottom: 20),
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'SubTotal',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        subTotal.toString(),
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Price Shipping',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Rp10000',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    print('id di payment ${widget.productId}');
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Checkout',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.grey[100],
        ),
        backgroundColor: Colors.grey[200],
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ListView(
                children: <Widget>[
                  body()
                ],
              ),
            )
          ],
        )
    );
  }
}