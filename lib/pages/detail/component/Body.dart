import 'package:assignment_fh_flutter_app/pages/detail/ChartData.dart';
import 'package:assignment_fh_flutter_app/pages/home/model/CustomerModel.dart';
import 'package:assignment_fh_flutter_app/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'DetailCard.dart';

class Body extends StatelessWidget {
  final CustomerModel mCustomerModel;

  Body(this.mCustomerModel);

  Widget _title(BuildContext context, String mTitle, String mValue) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: mTitle,
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: kPrimaryColor,
          ),
          children: [
            TextSpan(
              text: mValue,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(mCustomerModel.mCustomerName,
              style: TextStyle(color: Colors.white)),
          backgroundColor: kPrimaryColor),
      body: Column(
        children: <Widget>[
          Expanded(
            // child: ChartPage(customer),
            child: ChartData(mCustomerModel),
          ),

          detailCard(
              context: context,
              mCustomerModel: mCustomerModel),
          /*_title(context, 'Balance ', mCustomerModel.mLiabilityAmount),
          SizedBox(
            height: 20.0,
          ),
          _title(context, 'Customer ID ', mCustomerModel.mCustomerID),
          SizedBox(
            height: 20.0,
          ),
          _title(context, 'EMI Amount ', mCustomerModel.mEMIAmount),
          SizedBox(
            height: 20.0,
          ),
          _title(context, 'Other Cards ', mCustomerModel.mOtherBankCreditCards),
          SizedBox(
            height: 20.0,
          ),*/
        ],
      ),
    );
  }
}
