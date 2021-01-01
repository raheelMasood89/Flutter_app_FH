import 'package:assignment_fh_flutter_app/pages/home/model/CustomerModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

enum LegendShape { Circle, Rectangle }

class ChartData extends StatefulWidget {
  CustomerModel mCustomerModel;

  ChartData(this.mCustomerModel);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ChartData> {
  CustomerModel nCustomerModel;
  ChartType _chartType = ChartType.disc;
  bool _showCenterText = true;
  double _ringStrokeWidth = 32;
  double _chartLegendSpacing = 32;
  bool _showLegendsInRow = false;
  bool _showLegends = true;
  bool _showChartValueBackground = true;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = true;
  bool _showChartValuesOutside = false;
  LegendShape _legendShape = LegendShape.Circle;
  LegendPosition _legendPosition = LegendPosition.right;
  int key = 0;

  @override
  void initState() {
    nCustomerModel = widget.mCustomerModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PieChart(
      key: ValueKey(key),
      dataMap: nCustomerModel.mDataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing,
      chartRadius: 600 /*MediaQuery.of(context).size.width / 3.2*/,
      colorList: nCustomerModel.colorList,
      initialAngleInDegree: 0,
      chartType: _chartType,
      centerText: _showCenterText ? "FH" : null,
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.Circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth,
    );
  }
}
