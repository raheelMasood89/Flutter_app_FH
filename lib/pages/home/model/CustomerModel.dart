import 'dart:ui';
import 'package:flutter/material.dart';

class CustomerModel {
  final String mCustomerID;
  final String mCustomerName;
  final String mLiabilityAmount;
  final String mEMIAmount;
  final String mAssetPath;
  final String mOtherBankCreditCards;
  final Map<String, double> mDataMap;
  final String mLastTransaction;
  final String mNickName;

  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple
  ];

  CustomerModel(
      this.mCustomerID,
      this.mCustomerName,
      this.mLiabilityAmount,
      this.mEMIAmount,
      this.mOtherBankCreditCards,
      this.mAssetPath,
      this.mDataMap,
      this.mLastTransaction,
      this.mNickName);
}
