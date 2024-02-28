import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:parot/extension/int_extension.dart';

class ParrotChartPainter extends CustomPainter {
  final Color color;
  final List<int> priceList;
  Offset? selectedOffset;
  List<Offset> offsetList = [];

  ParrotChartPainter({
    required this.color,
    required this.priceList,
    this.selectedOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    int highestPrice = priceList.reduce((value, element) => value > element ? value : element);
    Paint linePaint = Paint()
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..color = color;

    Paint pointPaint = Paint()
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..color = color;

    Paint pointCenterPaint = Paint()
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = Colors.white;

    Path path = Path();
    Path fillPath = Path();
    fillPath.lineTo(0, size.height);
    path.moveTo(0, size.height - ((size.height * priceList[0]) / highestPrice));
    Offset offset = const Offset(0, 0);
    for (int i = 0; i < priceList.length; i++) {
      offset = Offset((size.width * i) / priceList.length, size.height - ((size.height * priceList[i]) / highestPrice));
      offsetList.add(offset);
      path.lineTo(offset.dx, offset.dy);
      canvas.drawPath(path, linePaint);
    }
    canvas.drawPoints(ui.PointMode.points, [offset], pointPaint);
    canvas.drawPoints(ui.PointMode.points, [offset], pointCenterPaint);
    if (selectedOffset != null) {
      _drawLabel(canvas, selectedOffset!);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawLabel(Canvas canvas, Offset point) {
    int index = offsetList.indexWhere((element) => element.dx == point!.dx && element.dy == point!.dy);

    final textSpan = TextSpan(style: const TextStyle(color: Colors.black), text: '${priceList[index].toCommaFormat}원');
    final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout();

    // 라벨의 배경을 그립니다.
    final backgroundPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final backgroundRect = Rect.fromLTWH(point.dx + 10, point.dy - 10, textPainter.width + 10, textPainter.height + 5);
    canvas.drawRect(backgroundRect, backgroundPaint);

    // 라벨의 텍스트를 그립니다.
    textPainter.paint(canvas, point + const Offset(15, -5));
  }
}
