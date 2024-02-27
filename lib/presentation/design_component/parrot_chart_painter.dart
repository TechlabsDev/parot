import 'dart:ui';

import 'package:flutter/material.dart';

class ParrotChartPainter extends CustomPainter {
  final Color color;
  final List<int> priceList;

  ParrotChartPainter({
    required this.color,
    required this.priceList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    int highestPrice = priceList.reduce((value, element) => value > element ? value : element);
    /*
      size.height : highestPrice = p : price
      p * highestPrice = size.height * price
      p = (size.height * price) / highestPrice

      size.width : priceList.length = x : i
      x * priceList.length = size.width * i
      x = (size.width * i) / priceList.length
    */
    Paint linePaint = Paint()
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..color = color;

    Paint pointPaint = Paint()
      ..strokeWidth = 12.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = color;

    Paint pointCenterPaint = Paint()
      ..strokeWidth = 7.0
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = Colors.white;

    Path path = Path();
    path.moveTo(0, size.height - ((size.height * priceList[0]) / highestPrice));
    Offset offset = const Offset(0, 0);
    for (int i = 1; i < priceList.length; i++) {
      offset = Offset((size.width * i) / priceList.length, size.height - ((size.height * priceList[i]) / highestPrice));
      path.lineTo(offset.dx, offset.dy);
      canvas.drawPath(path, linePaint);
    }
    canvas.drawPoints(PointMode.points, [offset], pointPaint);
    canvas.drawPoints(PointMode.points, [offset], pointCenterPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
