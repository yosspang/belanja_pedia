import 'package:flutter/material.dart';
import './register.dart';
import './dashboard.dart';

class Login extends StatelessWidget {
  Widget buttonLogin(context) {
    return RaisedButton(
        child: Text(
          "Login",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
        color: Colors.green,
        textColor: Colors.white,
        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
        splashColor: Colors.grey,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)));
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(top: 70),
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Enter Email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32))),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Enter Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32))),
          )
        ],
      ),
    );
  }

  Widget body(context) {
    return Form(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24, right: 24),
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Image.asset(
            'assets/belanja_pedia_transparant1.png',
            height: 150,
          ),
          form(),
          SizedBox(
            height: 40,
          ),
          buttonLogin(context),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 40, right: 25, left: 25),
              child: Row(
                children: <Widget>[
                  Text(
                    'Dont have an account yet? ',
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    child: Text('Register',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body(context));
  }
}
