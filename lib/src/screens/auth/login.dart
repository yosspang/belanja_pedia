import 'package:belanja_pedia/src/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import './register.dart';
import 'package:belanja_pedia/src/screens/dashboard.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _validate = false;
  bool _showPassword = false;

  void submit() async {
    String email = _email.text;
    String password = _password.text;

    if (_formKey.currentState.validate()) {
      UserBloc userBloc = UserBloc();
      final _response = await userBloc.loginUser(email, password);
      print(_response['message']);
      if (_response['message'] != 'Login success') {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Alert Dialog'),
                content: Text('${_response['message']}'),
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
        print('Login success');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      }
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  Widget buttonLogin(context) {
    return RaisedButton(
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: submit,
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
            validator: validateEmail,
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Enter Email',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
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
            ),
          ),
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
