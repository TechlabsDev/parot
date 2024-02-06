import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:parot/extension/int_extension.dart';

class PriceGraph extends StatefulWidget {
  const PriceGraph({Key? key}) : super(key: key);

  @override
  State<PriceGraph> createState() => _PriceGraphState();
}

class _PriceGraphState extends State<PriceGraph> {
  List<double> priceList = const [
    5600,
    14000,
    50000,
    40000,
    22500,
    8000,
    56000,
    17000,
    62000,
    43500,
    25500,
    8700,
    52600,
    13000,
    44000,
    43250,
    25500,
    32250,
  ];
  @override
  Widget build(BuildContext context) {
    double highestPrice = priceList.reduce(max);
    double lowestPrice = priceList.reduce(min);

    int highestPriceIndex = priceList.indexOf(highestPrice);
    int lowestPriceIndex = priceList.indexOf(lowestPrice);

    double widthBetweenPoint = MediaQuery.of(context).size.width / (priceList.length);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Sparkline(
          useCubicSmoothing: true,
          data: priceList,
          lineColor: Colors.indigoAccent,
          min: 0,
          lineWidth: 2.0,
          pointsMode: PointsMode.all,
          maxLabel: false,
          pointSize: 5.0,
          averageLine: true,
          maxLine: true,
          averageLabel: false,
          pointColor: Colors.indigo,
          fillMode: FillMode.below,
          fillGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.indigoAccent,
              Colors.white,
            ],
          ),
        ),
        Positioned(
          bottom: 100,
          left: widthBetweenPoint * (highestPriceIndex) - (highestPriceIndex == priceList.length - 1 ? 20 : 0),
          child: Text(
            "최고 ${priceList[highestPriceIndex].toInt().toCommaFormat}원",
          ),
        ),
        Positioned(
          bottom: -20,
          left: (widthBetweenPoint) * (lowestPriceIndex) - (lowestPriceIndex == priceList.length - 1 ? 20 : 0),
          child: Text(
            "최저 ${priceList[lowestPriceIndex].toInt().toCommaFormat}원",
          ),
        )
      ],
    );
  }
}
