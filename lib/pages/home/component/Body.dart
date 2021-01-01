import 'package:assignment_fh_flutter_app/pages/home/component/Customer_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: CustomerList()
    );
  }

}