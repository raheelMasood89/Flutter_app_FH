import 'package:assignment_fh_flutter_app/pages/home/model/CustomerModel.dart';
import 'package:assignment_fh_flutter_app/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Customer_list_card.dart';

class CustomerList extends StatefulWidget {
  static Map<String, double> mCustomer1 = {
    "Food": 9,
    "Rent": 2,
    "Travelling": 2,
    "Liabilities": 1,
    "Investments": 1
  };

  static Map<String, double> mCustomer2 = {
    "Food": 4,
    "Rent": 3,
    "Travelling": 5,
    "Liabilities": 7,
    "Investments": 8,
  };

  static Map<String, double> mCustomer3 = {
    "Food": 8,
    "Rent": 7,
    "Travelling": 5,
    "Liabilities": 3,
    "Investments": 4,
  };

  static Map<String, double> mCustomer4 = {
    "Food": 1,
    "Rent": 1,
    "Travelling": 5,
    "Liabilities": 10,
    "Investments": 5,
  };

  static Map<String, double> mCustomer5 = {
    "Food": 2,
    "Rent": 4,
    "Travelling": 3,
    "Liabilities": 2,
    "Investments": 1,
  };

  static Map<String, double> mCustomer;

  List<CustomerModel> mCustomerList = [
    CustomerModel("1", "Robert", "20000 AED", "1000 AED", "2", "assets/p2.jpg",
        mCustomer1),
    CustomerModel(
        "1", "Alex", "27000 AED", "1200 AED", "1", "assets/p3.jpg", mCustomer2),
    CustomerModel("1", "Peter", "23000 AED", "1500 AED", "3", "assets/p4.jpg",
        mCustomer3),
    CustomerModel(
        "1", "Ali", "22000 AED", "1400 AED", "1", "assets/p5.jpg", mCustomer4),
    CustomerModel("1", "Akhbar", "29000 AED", "1000 AED", "2", "assets/p1.jpg",
        mCustomer5)
  ];

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  List<CustomerModel> customerList;
  List<CustomerModel> items = List<CustomerModel>();
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customerList = this.widget.mCustomerList;
    items.addAll(customerList);
  }

  void filterSearchResults(String query) {
    List<CustomerModel> dummySearchList = List<CustomerModel>();

    dummySearchList.addAll(customerList);

    if (query.isNotEmpty) {
      List<CustomerModel> dummyListData = List<CustomerModel>();

      dummySearchList.forEach((item) {
        if (item.mCustomerName.contains(query) ||
            item.mLiabilityAmount.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(customerList);
      });
    }
  }

  Widget _label() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Finance',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: kPrimaryColor,
          ),
          children: [
            TextSpan(
              text: 'House',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      SizedBox(
        height: 10,
      ),
      _label(),
      Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomerCard(customerList: items, index: index);
          },
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          onChanged: (value) {
            filterSearchResults(value);
          },
          controller: editingController,
          decoration: InputDecoration(
              labelText: "Search Customer",
              hintText: "Search Customer",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)))),
        ),
      ),
    ]));
  }
}
