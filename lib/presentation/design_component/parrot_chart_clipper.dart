import 'dart:math';

import 'package:flutter/material.dart';

class ParrotChartClipper extends CustomClipper<Path> {
  final Color color;
  final List<int> priceList;

  ParrotChartClipper({required this.color, required this.priceList});

  @override
  Path getClip(Size size) {
    int highestPrice = priceList.reduce((value, element) => value > element ? value : element);
    /*
      size.height : highestPrice = p : price
      p * highestPrice = size.height * price
      p = (size.height * price) / highestPrice

      size.width : priceList.length = x : i
      x * priceList.length = size.width * i
      x = (size.width * i) / priceList.length
    */
    Path path = Path();
    path.moveTo(0, size.height - ((size.height * priceList[0]) / highestPrice));
    Offset offset = const Offset(0, 0);
    for (int i = 1; i < priceList.length; i++) {
      offset = Offset((size.width * i) / priceList.length, size.height - ((size.height * priceList[i]) / highestPrice));
      path.lineTo(offset.dx, offset.dy);
    }
    path.close();
    // return path;
    final m = Matrix4.identity()
      ..translate(size.width)
      ..rotateY(pi);

    return path.transform(m.storage);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
