import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  SearchBarState createState() => SearchBarState();
}

class SearchBarState extends State<Search> {
  // Widget search() {
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Belanja Pedia',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
       Container(
            width: 175,
            margin: EdgeInsets.only(left: 20),
            child: TextField(
              onTap: () {
                print('search 2');
              },
              onChanged: (text) {},
              autofocus: false,
              cursorColor: Colors.green,
              decoration: InputDecoration(
                  hintText: "Search Here",
                  focusColor: Colors.green,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.green,
                  ))),
          ),
      ],
    );
  }
}
