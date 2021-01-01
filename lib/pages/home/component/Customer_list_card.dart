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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
          color: kPrimaryColor,
          elevation: 4.0,
          child: Text(
            "View Detail",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      CustomerDetail(customerList[index])
                  /* ChartData()*/
                  ,
                ));
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0))),
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
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          )),
    );
  }

  Widget _titleLiabilities(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: "Liabilities ",
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: customerList[index].mLiabilityAmount,
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),
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
            height: 10.0,
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

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Card(
          elevation: 5,
          shape: Border(
            right: BorderSide(color: kPrimaryColor, width: 1),
            top: BorderSide(color: kPrimaryColor, width: 1),
            bottom: BorderSide(color: kPrimaryColor, width: 1),
            left: BorderSide(color: kPrimaryColor, width: 1),
          ),
          margin: new EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints.expand(height: 180.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [mCardColor, mCardLightColor])),
            height: 180.0,
            child: Container(
              child: Stack(
                clipBehavior: Clip.hardEdge,
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  _viewBtn(context),
                  _cardDetail(context),
                  _profileImage()
                ],
              ),
            ),
          ),
        ));
  }
}
