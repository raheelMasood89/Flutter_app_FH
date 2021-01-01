import 'package:assignment_fh_flutter_app/pages/detail/component/Body.dart';
import 'package:assignment_fh_flutter_app/pages/home/model/CustomerModel.dart';
import 'package:flutter/cupertino.dart';

class CustomerDetail extends StatelessWidget {
  final CustomerModel mCustomerModel;
  CustomerDetail(this.mCustomerModel);

  @override
  Widget build(BuildContext context) {
    return Body(mCustomerModel);
  }
}