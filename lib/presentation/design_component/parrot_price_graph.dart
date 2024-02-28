import 'package:flutter/material.dart';
import 'package:parot/extension/datetime_extension.dart';
import 'package:parot/extension/int_extension.dart';
import 'package:parot/presentation/design_component/parrot_chart_clipper.dart';
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

    return Column(
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ParrotColor.red50,
            ),
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const Column(
              children: [
                Text(
                  "그래프 BAD...",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ParrotColor.red500,
                  ),
                ),
                Text(
                  "평균가보다 훨씬 비싸요! 지금 사면 손해예요",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ParrotColor.red500,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      ClipPath(
                        clipper: ParrotChartClipper(
                          color: ParrotColor.gray200,
                          priceList: widget.priceList,
                        ),
                        child: Container(
                          width: widget.graphSize == null ? 300 : widget.graphSize!.width,
                          height: widget.graphSize == null ? 150 : widget.graphSize!.height,
                          color: ParrotColor.red50,
                        ),
                      ),
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
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  highestPrice.toCommaFormat,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: ParrotColor.red500,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  averagePrice.toCommaFormat,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: ParrotColor.gray800,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  lowestPrice.toCommaFormat,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: ParrotColor.blue500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
