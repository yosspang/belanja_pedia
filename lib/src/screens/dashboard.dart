import 'package:belanja_pedia/src/bloc/user_bloc.dart';
import 'package:belanja_pedia/src/screens/account_tab.dart';
import 'package:belanja_pedia/src/screens/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String user;
  List<Widget> _children;
  void checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    user = prefs.getString('email');
    // prefs.setString('email', null);
    print('sharedprefs $user');
    if (user != null) {
      print("autoLogIn success");
    }
  }

  cart() {
    if (user == null) {
      _children = [HomePage(), Login(), Login()];
    } else if (user != null) {
      _children = [HomePage(user: user), Cart(user: user), AccountTab()];
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkLogin();
    cart();
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
