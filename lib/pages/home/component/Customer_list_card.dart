import 'package:assignment_fh_flutter_app/pages/detail/Customer_Detail.dart';
import 'package:assignment_fh_flutter_app/pages/home/model/CustomerModel.dart';
import 'package:assignment_fh_flutter_app/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerCard extends StatelessWidget {
  CustomerCard({this.customerList, this.index});

  final List<CustomerModel> customerList;
  final int index;

  Align _viewBtn(BuildContext context) {
    return Align(
      child: new RaisedButton(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          color: mWhiteTextColor,
          elevation: 4.0,
          child: Text(
            "View Detail",
            style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      CustomerDetail(customerList[index])
                ));},
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0))),
      alignment: AlignmentDirectional.bottomEnd,
    );
  }

  Widget _title(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: customerList[index].mCustomerName,
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          )),
    );
  }

  Widget _lastTransaction(BuildContext context) {
    return Align(
      child: RichText(
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
                text: customerList[index].mLastTransaction,
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
      ),
      alignment: AlignmentDirectional.bottomStart,
    );
  }

  Widget _titleLiabilities(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: "Balance : ",
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: mWhiteTextColor,
          ),
          children: [
            TextSpan(
              text: customerList[index].mLiabilityAmount,
              style: TextStyle(color: Colors.yellow, fontSize: 12),
            ),
          ]),
    );
  }

  Align _cardDetail(BuildContext context) {
    return Align(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title(context),
          SizedBox(
            height: 5.0,
          ),
          _titleLiabilities(context),
        ],
      ),
      alignment: AlignmentDirectional.bottomStart,
    );
  }

  Align _profileImage() {
    return Align(
      child: CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage(customerList[index].mAssetPath),
      ),
      alignment: AlignmentDirectional.topEnd,
    );
  }

  Widget _cardView(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        constraints: BoxConstraints.expand(height: 180.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/icons/card_payment_bg.jpg'),
          fit: BoxFit.fill,
        )),
        height: 180.0,
        child: Container(
          child: Stack(
            children: <Widget>[
              _viewBtn(context),
              _cardDetail(context),
              _profileImage(),
              _lastTransaction(context)
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

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: _cardView(context),
    );
  }
}
