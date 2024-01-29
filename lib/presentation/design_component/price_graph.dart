import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

class PriceGraph extends StatefulWidget {
  const PriceGraph({Key? key}) : super(key: key);

  @override
  State<PriceGraph> createState() => _PriceGraphState();
}

class _PriceGraphState extends State<PriceGraph> {
  List<double> priceList = const [48000, 44000, 60000, 40000, 22500, 48000];
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
          pointSize: 5.0,
          averageLine: true,
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
          left: widthBetweenPoint * (highestPriceIndex),
          child: Text(
            "최고 ${priceList[highestPriceIndex]}원",
          ),
        ),
        Positioned(
          top: (highestPrice - lowestPrice) / 500,
          left: widthBetweenPoint * (lowestPriceIndex),
          child: Text(
            "최저 ${priceList[lowestPriceIndex]}원",
          ),
        )
      ],
    );
  }
}
