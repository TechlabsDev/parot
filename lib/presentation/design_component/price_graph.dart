import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

class PriceGraph extends StatefulWidget {
  const PriceGraph({Key? key, required this.priceList}) : super(key: key);
  final List<double> priceList;

  @override
  State<PriceGraph> createState() => _PriceGraphState();
}

class _PriceGraphState extends State<PriceGraph> {
  @override
  Widget build(BuildContext context) {
    if (widget.priceList.isEmpty) {
      return const SizedBox.shrink();
    }
    double highestPrice = widget.priceList.reduce(max);
    double lowestPrice = widget.priceList.reduce(min);

    int highestPriceIndex = widget.priceList.indexOf(highestPrice);
    int lowestPriceIndex = widget.priceList.indexOf(lowestPrice);

    double widthBetweenPoint = MediaQuery.of(context).size.width / (widget.priceList.length);

    return SizedBox(
      width: 350,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Sparkline(
            useCubicSmoothing: true,
            data: widget.priceList,
            lineColor: Colors.indigoAccent,
            min: 0,
            lineWidth: 2.0,
            pointsMode: PointsMode.none,
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
          // Positioned(
          //   bottom: 100,
          //   left: widthBetweenPoint * (highestPriceIndex) - (highestPriceIndex == widget.priceList.length - 1 ? 20 : 0),
          //   child: Text(
          //     "최고 ${widget.priceList[highestPriceIndex].toInt().toCommaFormat}원",
          //   ),
          // ),
          // Positioned(
          //   bottom: -20,
          //   left: (widthBetweenPoint) * (lowestPriceIndex) - (lowestPriceIndex == widget.priceList.length - 1 ? 20 : 0),
          //   child: Text(
          //     "최저 ${widget.priceList[lowestPriceIndex].toInt().toCommaFormat}원",
          //   ),
          // )
        ],
      ),
    );
  }
}
