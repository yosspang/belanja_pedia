// import 'package:belanja_pedia/landing_page.dart';
import 'package:belanja_pedia/src/dashboard.dart';

import './src/login.dart';
import 'package:flutter/material.dart';
// import 'api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Dashboard());
  }
}
