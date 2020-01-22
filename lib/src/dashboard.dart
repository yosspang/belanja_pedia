import 'package:flutter/material.dart';
import './cart.dart';
import './search.dart';

class Dashboard extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard> {
  int _currentIndex = 0;
  final List<Widget> _children = [Search(), Search(), Chart()];

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
              icon: Icon(Icons.shopping_cart), title: Text('Cart'))
        ],
        selectedItemColor: Colors.green,
      ),
    );
  }
}
