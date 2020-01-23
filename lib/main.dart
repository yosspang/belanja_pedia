// import 'package:belanja_pedia/landing_page.dart';
import 'package:belanja_pedia/src/dashboard.dart';
import 'package:belanja_pedia/src/model/app_state_model.dart';
import 'package:provider/provider.dart';
import './src/login.dart';
import 'package:flutter/material.dart';
// import 'api_service.dart';

void main() {
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: (context) => AppStateModel()..loadProducts(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Dashboard());
  }
}
