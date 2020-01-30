import 'package:belanja_pedia/src/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import './login.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _address = TextEditingController();
  bool _showPassword = false;
  bool _validate = false;

  void submit() async {
    if (_formKey.currentState.validate()) {
      String email = _email.text;
      String password = _password.text;
      String firstname = _firstname.text;
      String lastname = _lastname.text;
      String address = _address.text;
      UserBloc userBloc = UserBloc();
      var register = await userBloc.registerUser(
          email, password, firstname, lastname, address);

      if (await register['message'] == 'Email already taken') {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Alert Dialog'),
                content: Text('Email already taken'),
                actions: [
                  FlatButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      }
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  Widget buttonLogin() {
    return RaisedButton(
        child: Text(
          'Register',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          submit();
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
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          Container(
            // height: 60,
            child: TextFormField(
              validator: validateEmail,
              keyboardType: TextInputType.emailAddress,
              controller: _email,
              decoration: InputDecoration(
                  hintText: 'Enter Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // height: 60,
            child: TextFormField(
              validator: validatePassword,
              obscureText: !this._showPassword,
              controller: _password,
              decoration: InputDecoration(
                  hintText: 'Enter Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this._showPassword ? Colors.green : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => this._showPassword = !this._showPassword);
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // height: 60,
            child: TextFormField(
              validator: validateName,
              controller: _firstname,
              decoration: InputDecoration(
                  hintText: 'Enter First Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // height: 60,
            child: TextFormField(
              validator: validateName,
              controller: _lastname,
              decoration: InputDecoration(
                  hintText: 'Enter Last Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // height: 60,
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Address must not be empty';
                }
                return null;
              },
              controller: _address,
              decoration: InputDecoration(
                  hintText: 'Enter Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32))),
            ),
          )
        ],
      ),
    );
  }

  Widget body(context) {
    return Form(
      key: _formKey,
      autovalidate: _validate,
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
          buttonLogin(),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 40, right: 25, left: 35),
              child: Row(
                children: <Widget>[
                  Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new Login()),
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
    return Scaffold(
      body: body(context),
    );
  }
}

String validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty) {
    return 'Email is required';
  } else if (!regex.hasMatch(value)) {
    return 'Invalid Email';
  } else {
    return null;
  }
}

String validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password is required';
  } else if (value.length < 6) {
    return 'Password must be 6 character minimum';
  } else {
    return null;
  }
}

String validateName(String value) {
  if (value.isEmpty) {
    return 'Field is required';
  } else if (value.length < 5) {
    return 'Input must be 5 characters minimum';
  } else {
    return null;
  }
}
