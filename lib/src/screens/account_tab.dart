import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';

class AccountTab extends StatelessWidget {
  final color = const Color(0xFF50B154);
  void logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', null);
    print('logout success');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Account'),
          backgroundColor: color,
        ),
        body: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 20)),
            Expanded(
                flex: 1,
                child: RaisedButton(
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      logout();
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Alert Dialog'),
                              content: Text('Logout Success'),
                              actions: [
                                FlatButton(
                                  child: Text('Close'),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dashboard()),
                                    );
                                  },
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    splashColor: Colors.grey,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)))),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
          ],
        ));
  }
}
