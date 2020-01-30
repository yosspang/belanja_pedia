import 'package:belanja_pedia/src/model/user.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget{
  const Payment({this.user, this.sum, this.productId});

  final user;
  final sum;
  final productId;

  @override
  PaymentState createState() {
    return new PaymentState();
  }
}

class PaymentState extends State<Payment> {
  Widget body() {
  String firstName = widget.user.firstName;
  String lastName = widget.user.lastName;
  String name = firstName + lastName;
  String address = widget.user.address;
  String email = widget.user.email;

    return Column(
      children: <Widget>[
        Container(
          height: 400,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/map.png",
                      height: 35,
                    ),
                    Column(
                      children: <Widget>[
                        
                        Text(
                          name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(address)
                      ],
                    )
                  ],
                )
              ],
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