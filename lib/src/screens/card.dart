import 'package:flutter/material.dart';

class CardEx extends StatefulWidget {
  @override
  CardState createState() => CardState();
}

class CardState extends State<CardEx> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,10,10,0),
      height: 100,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
      ),
    );
  }
}