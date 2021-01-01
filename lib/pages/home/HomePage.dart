import 'package:assignment_fh_flutter_app/pages/home/component/Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Customer List"),
          automaticallyImplyLeading: false,
        ),
      body: Body(),
    );
  }
}