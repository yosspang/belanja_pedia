import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  var color = const Color(0xFF50B154);

  Widget logo() {
    return Image.asset(
      'assets/belanja_pedia_transparant.png',
      scale: 2.5,
    );
  }

  Widget body() {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            logo(),
            SizedBox(
              height: 140,
            ),
            Text(
              'Belanja Pedia',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body());
  }
}
