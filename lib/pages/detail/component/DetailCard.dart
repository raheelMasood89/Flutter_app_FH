import 'package:assignment_fh_flutter_app/pages/home/model/CustomerModel.dart';
import 'package:assignment_fh_flutter_app/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget detailCard({BuildContext context, CustomerModel mCustomerModel}) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        constraints: BoxConstraints.expand(height: 350.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/card_payment_bg.jpg'),
              fit: BoxFit.fill,
            )),
        height: 350.0,
        child: Container(
          child: Stack(
            children: <Widget>[
              _cardDetail(context, mCustomerModel),
              _profileImage(mCustomerModel),
            ],
          ),
        ),
      ),
      /* shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),*/
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }

  Widget _title(BuildContext context, CustomerModel mCustomerModel) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: mCustomerModel.mCustomerName,
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          )),
    );
  }

  Widget _lastTransaction(BuildContext context, CustomerModel mCustomerModel) {
    return  RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
            text: "Last Transaction : ",
            style: GoogleFonts.portLligatSans(
              textStyle: Theme.of(context).textTheme.bodyText1,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: mCustomerModel.mLastTransaction,
                style: TextStyle(color: Colors.yellow, fontSize: 12),
              ),
              WidgetSpan(
                child: Image.asset(
                  'assets/icons/arrow.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ]),
      );
  }

  Widget _titleAndValue(BuildContext context, String mTitle, String mValue) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: mTitle+" : ",
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.bodyText1,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: mWhiteTextColor,
          ),
          children: [
            TextSpan(
              text: mValue,
              style: TextStyle(color: Colors.yellow, fontSize: 14),
            ),
          ]),
    );
  }

  Align _cardDetail(BuildContext context, CustomerModel mCustomerModel) {
    return Align(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title(context, mCustomerModel),
          SizedBox(
            height: 5.0,
          ),
          _titleAndValue(context, "Customer Id", mCustomerModel.mCustomerID),
          SizedBox(
            height: 5.0,
          ),
          _titleAndValue(context, "Liabilities", mCustomerModel.mLiabilityAmount),
          SizedBox(
            height: 5.0,
          ),
          _titleAndValue(context, "EMI Amount", mCustomerModel.mEMIAmount),
          SizedBox(
            height: 5.0,
          ),
          _titleAndValue(context, "Other Bank Cards", mCustomerModel.mOtherBankCreditCards),
          SizedBox(
            height: 5.0,
          ),
          _titleAndValue(context, "Nick Name", mCustomerModel.mNickName),
          SizedBox(
            height: 5.0,
          ),
          _lastTransaction(context, mCustomerModel)
        ],
      ),
      alignment: AlignmentDirectional.bottomStart,
    );
  }

  Align _profileImage(CustomerModel mCustomerModel) {
    return Align(
      child: CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage(mCustomerModel.mAssetPath),
      ),
      alignment: AlignmentDirectional.topEnd,
    );
  }
