import 'package:belanja_pedia/src/account_tab.dart';
import 'package:belanja_pedia/src/products_list_tab.dart';
import 'package:belanja_pedia/src/search_tab.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard> {
  int _currentIndex = 0;
  final List<Widget> _children = [ProductListTab(), SearchTab(), AccountTab()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          onTabTapped(index);
        }, // new
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Products'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text('Search'),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person), title: new Text('Account')),
        ],
        selectedItemColor: Colors.green,
      ),
    );
  }
}
