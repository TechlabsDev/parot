import 'package:flutter/material.dart';

class ParrotChartClipper extends CustomClipper<Path> {
  final Color color;
  final List<int> priceList;

  ParrotChartClipper({required this.color, required this.priceList});

  @override
  Path getClip(Size size) {
    int highestPrice = priceList.reduce((value, element) => value > element ? value : element);
    Path path = Path();
    path.lineTo(0, size.height - 35);
    path.lineTo(size.width - 15, size.height - 35);
    path.lineTo(size.width - 15, 0);

    Offset offset = const Offset(0, 0);
    for (int i = priceList.length - 1; i > 0; i--) {
      offset = Offset((size.width * i) / priceList.length, size.height - ((size.height * priceList[i]) / highestPrice));
      path.lineTo(offset.dx, offset.dy);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
