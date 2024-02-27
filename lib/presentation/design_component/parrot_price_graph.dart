import 'package:flutter/material.dart';
import 'package:parot/extension/datetime_extension.dart';
import 'package:parot/extension/int_extension.dart';
import 'package:parot/presentation/design_component/parrot_chart_painter.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';

class ParrotPriceGraph extends StatefulWidget {
  const ParrotPriceGraph({Key? key, required this.priceList, required this.startDate, this.graphSize}) : super(key: key);
  final List<int> priceList;
  final DateTime startDate;
  final Size? graphSize;

  @override
  State<ParrotPriceGraph> createState() => _ParrotPriceGraphState();
}

class _ParrotPriceGraphState extends State<ParrotPriceGraph> {
  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.priceList.reduce((value, element) => value + element);
    int averagePrice = totalPrice ~/ widget.priceList.length;
    int highestPrice = widget.priceList.reduce((value, element) => value > element ? value : element);
    int lowestPrice = widget.priceList.reduce((value, element) => value < element ? value : element);
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "가격 변동 그래프",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "타이밍 BAD...",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ParrotColor.red500,
                ),
              ),
              const Text(
                "평균가보다 훨씬 비싸요. 지금 사면 안돼요",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: ParrotColor.red500,
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  CustomPaint(
                    size: widget.graphSize ?? const Size(300, 150),
                    foregroundPainter: ParrotChartPainter(
                      color: ParrotColor.red500,
                      priceList: widget.priceList,
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    child: SizedBox(
                      width: widget.graphSize == null ? 300 : widget.graphSize!.width,
                      child: Row(
                        children: [
                          Text(
                            widget.startDate.MMDD,
                            style: const TextStyle(
                              color: ParrotColor.gray400,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            "오늘",
                            style: TextStyle(
                              color: ParrotColor.gray400,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [],
              ),
            ],
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 90),
            Text(
              highestPrice.toCommaFormat,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 11,
                color: ParrotColor.red500,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              averagePrice.toCommaFormat,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 11,
                color: ParrotColor.gray800,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              lowestPrice.toCommaFormat,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 11,
                color: ParrotColor.blue500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
