import 'dart:ui' as ui;

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
    Paint linePaint = Paint()
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..color = color;
    Paint fillPaint = Paint()
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..color = color.withOpacity(.5);

    Paint pointPaint = Paint()
      ..strokeWidth = 12.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..color = color;

    Paint pointCenterPaint = Paint()
      ..strokeWidth = 7.0
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = Colors.white;

    Path path = Path();
    Path fillPath = Path();
    fillPath.lineTo(0, size.height);
    path.moveTo(0, size.height - ((size.height * priceList[0]) / highestPrice));
    Offset offset = const Offset(0, 0);
    for (int i = 1; i < priceList.length; i++) {
      offset = Offset((size.width * i) / priceList.length, size.height - ((size.height * priceList[i]) / highestPrice));
      path.lineTo(offset.dx, offset.dy);
      canvas.drawPath(path, linePaint);
    }
    canvas.drawPoints(ui.PointMode.points, [offset], pointPaint);
    canvas.drawPoints(ui.PointMode.points, [offset], pointCenterPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
