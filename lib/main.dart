import 'package:assignment_fh_flutter_app/pages/login/WelcomePage.dart';
import 'package:assignment_fh_flutter_app/utils/Constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Root widget of the application...
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance House - Assignment App',
      theme: ThemeData(
        primaryColor: PrimaryColor,
      ),
      home: WelcomePage(),
    );
  }
}
