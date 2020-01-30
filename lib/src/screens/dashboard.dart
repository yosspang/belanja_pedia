import 'package:belanja_pedia/src/screens/account_tab.dart';
import 'package:belanja_pedia/src/screens/products_list_tab.dart';
import './cart.dart';
import 'package:flutter/material.dart';
import './home_page.dart';

class Dashboard extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomePage(), Cart(), AccountTab()];

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
            icon: new Icon(Icons.add_shopping_cart),
            title: new Text('Cart'),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person), title: new Text('Account')),
        ],
        selectedItemColor: Colors.green,
      ),
    );
  }
}
